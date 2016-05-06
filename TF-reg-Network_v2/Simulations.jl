#using Debug
using Compat
include("BalanceEquations.jl")
include("SolveBalanceEquations.jl")
include("VLUtilities.jl")
include("FindSteadyStateRel.jl")

#Step up the inducer 
function model_Simulation(PROBLEM_DICTIONARY,design)

	# Pointer to mass balance, and other stuff for the solver -
	pBalanceEquations = BalanceEquations
	
	# Update to Original Initial Conditions -
	initial_condition_vector = PROBLEM_DICTIONARY["INITIAL_CONDITION_VECTOR_ORIGINAL"]
	PROBLEM_DICTIONARY["INITIAL_CONDITION_VECTOR"] = initial_condition_vector

	# Run to Steady State Before Running Design
	(data_array_0,TIME_0,STATE_0) = findSteadyState(PROBLEM_DICTIONARY,pBalanceEquations)
	
	# load design -
	path_to_design_file = string("./ExperimentDesign/STIM",design,".dat")
	design_vector = readdlm(path_to_design_file)

	# Change initial conditions required in Design
	num_vars = size(design_vector,1)
	
	for vars = 1:num_vars
	
		# Change Variable (i.e. inducer) -
		initial_condition_vector = PROBLEM_DICTIONARY["INITIAL_CONDITION_VECTOR"]

		if num_vars > 1
			inducer_index = design_vector[vars,3]
			inducer_index = round(Int,inducer_index)
			initial_condition_vector[inducer_index] = design_vector[vars,4]
		else 
			inducer_index = design_vector[3]
			inducer_index = round(Int,inducer_index)
			initial_condition_vector[inducer_index] = design_vector[4]
		
		end	
			
	end		
	
	PROBLEM_DICTIONARY["INITIAL_CONDITION_VECTOR"] = initial_condition_vector

	TSTART_1 = 0
	TSTOP_1 = 120
	NUMBER_STEPS_1 = 1000
	TSTEP_1 = (TSTOP_1 - TSTART_1)/NUMBER_STEPS_1
	time_vector_1 = collect(linspace(TSTART_1,TSTOP_1,NUMBER_STEPS_1))

	# Check to see if a Steady State Was Found
	
	if typeof(data_array_0) == Int64
		
		#No steady state
		data_array = "NaN"
		TIME_1 = TIME_0
		STATE_1 = STATE_0
	
	else
		# solve the model for stage one -
	
		(TIME_1,STATE_1) = solveBalanceEquations(pBalanceEquations,time_vector_1,PROBLEM_DICTIONARY)	
	
		# If numbers are less then 1e-6 this is zero
		cut_off = 1e-6
		num_species = size(STATE_1,2)
		
		for specie = 1:num_species
			for k = 1:NUMBER_STEPS_1
				if STATE_1[k,specie] < cut_off
					STATE_1[k,specie] = 0	
				end			
			end
		end	
		# Concatenate -
		data_array = concatinateSimulationArray1(TIME_1,STATE_1)
		
	end	

	return	(data_array,TIME_1,STATE_1,time_vector_1)
	
end



