#using Debug
include("Simulations.jl")
include("BalanceEquations.jl")
include("SolveBalanceEquations.jl")
include("VLUtilities.jl")
include("FindSteadyStateRel.jl")
include("ExperimentError.jl")


function calculateObjectiveFunction(parameter_guess,list_of_designs,PROBLEM_DICTIONARY)
	
	
	# Update the problem definition -
	number_kinetic_parameters = 90
	number_control_parameters = 652
	kinetic_parameter_vector = Float64[]
	total_error_value = 0
	
	for index = 1:number_kinetic_parameters
		push!(kinetic_parameter_vector,abs(parameter_guess[index]))
	end	
	
	control_parameter_vector = Float64[]
	total_length = size(parameter_guess,1)

	for index = (number_kinetic_parameters+1):(number_kinetic_parameters + number_control_parameters)
		push!(control_parameter_vector,abs(parameter_guess[index]))
	end

	PROBLEM_DICTIONARY["KINETIC_PARAMETER_VECTOR"] = kinetic_parameter_vector
	PROBLEM_DICTIONARY["CONTROL_PARAMETER_VECTOR"] = control_parameter_vector

	# Update to Original Initial Conditions -
	initial_condition_vector = PROBLEM_DICTIONARY["INITIAL_CONDITION_VECTOR_ORIGINAL"]
	PROBLEM_DICTIONARY["INITIAL_CONDITION_VECTOR"] = initial_condition_vector
	
	cell_line = PROBLEM_DICTIONARY["CELL_LINE_POINTER"]

	training_vector = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
	num_Exps = size(training_vector,1)
	# Initialize -
	num_designs = size(list_of_designs,1)
	error_array = zeros(num_Exps,num_designs)

	count = 1
	
	#initialize data_array_total
	data_array_total = zeros(1000,43)

	# Execute the list of simulations, compute error -
	for design in list_of_designs
	
		# Update to Original Initial Conditions -
		initial_condition_vector = PROBLEM_DICTIONARY["INITIAL_CONDITION_VECTOR_ORIGINAL"]
		PROBLEM_DICTIONARY["INITIAL_CONDITION_VECTOR"] = initial_condition_vector
		
		(data_array,TIME_1,STATE_1,time_vector_1) = model_Simulation(PROBLEM_DICTIONARY,design)
		
		if any(isnan,data_array) == false
		
			# Calculate Model Error
			MSE_Error = experimentError(TIME_1,STATE_1,design,time_vector_1,cell_line)
			error_array[:,design] = MSE_Error

			# Add data_arrays for each simulation so we can save the output
			if count == 1
				# Created nested list of data_arrays in case of multiple designs
				data_array_total = data_array
			elseif count == 2
				data_array_total = (data_array_total,data_array)
			elseif count == 3
				data_array_total = (data_array_total[1],data_array_total[2],data_array)	
			elseif count == 4
				data_array_total = (data_array_total[1],data_array_total[2],data_array_total[3],data_array)	
			end
			count = count + 1	
			
		else
			for r = 1:num_Exps
				error_array[r,design] = 1e6
			end
			
			data_array_total = fill(NaN,1000,43)
			
			if num_designs == 1
					data_array_total == data_array_total
			elseif num_designs == 2
					data_array_total = (data_array_total,data_array_total)
			elseif num_designs == 3	
					data_array_total = (data_array_total,data_array_total,data_array_total)		
			end
		end
	# Calculate total error of all designs
	total_error_value = sum(error_array)
	#print "Error - ",str(total_error_value)
	end
	
	return (error_array,total_error_value,data_array_total)
end