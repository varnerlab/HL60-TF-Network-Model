#__author__ = 'Adithya Sagar'

include("Objective.jl")
#using Debug

function rand_gaussian(mean,stdev)

	u1 = rand()
    u2 = rand()
    r = sqrt( -2.0*log(u1) )
    theta = 2.0*pi*u2
    mean + stdev*r*sin(theta)

end

function findGlobalBestParticle(particle_array,number_of_parameters,NUMBER_OF_PARTICLES,list_of_designs)
	
	particle_error_exps = particle_array[1]["particle_error"]
	number_of_exps = size(particle_error_exps,1)
	Total_error_array = Float64[]
	position_array = zeros(number_of_parameters,NUMBER_OF_PARTICLES)
	num_designs = size(list_of_designs,1)
	total_particle_error_exps = zeros(number_of_exps*num_designs,NUMBER_OF_PARTICLES)
	count = 1

	for particle in particle_array

		error_array_total = particle["particle_error_total"]
		push!(Total_error_array,error_array_total)
		particle_error_exps = particle["particle_error"]
		current_position = particle["particle_position"]
		current_sim = particle["particle_simulation_total"]
	
		for i = 1:number_of_parameters
			position_array[i,count] = current_position[i]
		end	
		
		# Add error of each design to the end of the matrix
		for design in list_of_designs	
		
			for z = 1:number_of_exps
				total_particle_error_exps[z+number_of_exps*(design-1),count] = particle_error_exps[z,design]
				
			end
		end		
	
		count = count + 1
		
	end	
	
	best_error_value = minimum(Total_error_array)
	best_particle = findfirst(Total_error_array,best_error_value)	
	best_particle_position = position_array[:,best_particle]
	ensemble_rank = calculateParetoRank(total_particle_error_exps)
	
	return (best_particle_position,best_error_value,ensemble_rank,total_particle_error_exps,position_array,best_particle)
	
end	
	
function calculateParetoRank(f)

	# Number of objective functions -
	NObj = size(f,1)
	
	# Number of population -
	NPop = size(f,2)
	Rank = Float64[]
	
	for Indv = 1:NPop
	
		# Initial index for dominated individuals -
		Indv_dom = collect(1:1:NPop)
		
		for i = 1:NObj
		
			# Find the index for dominated individuals -
			Idom = Float64[]
			
			for index = 1:size(Indv_dom,1)

				if f[i,Indv_dom[index]] <= f[i,Indv]
					push!(Idom,index)
				end
			end		
			
			# Remove non-dominated individuals and update dominating index -
			# Indv_dom = Indv_dom(Idom);
			
			Indv_dom_new = Float64[]
			
			for value = 1:size(Idom,1)
			
				push!(Indv_dom_new,Indv_dom[Idom[value]])
			
			end	
			
			Indv_dom = Indv_dom_new
		end
			
		# Count dominated individuals. If Indv is pareto-optimal, Rank(Indv) = 0.
		push!(Rank,size(Indv_dom,1)-1)
		
	end
	
	return Rank
end

function ParticleSwarmOptimization(PROBLEM_DICTIONARY,config,MAX_NUMBER_OPERATIONS,initial_parameter_vector,model_it)

	# Algorithm parameters -
	NUMBER_OF_PARTICLES = 25
	#MAX_NUMBER_OPERATIONS = 2
	OMEGA = 1.0
	ALPHA = 0.05564
	BETA = 0.02886
	list_of_designs = [1, 2, 3]
	num_designs = size(list_of_designs,1)
	cell_line = PROBLEM_DICTIONARY["CELL_LINE_POINTER"]
	# Initialize parameter vector and simulation values for rank zero solutions
	number_of_parameters = size(initial_parameter_vector,1)
	initial_parameter_guess = zeros(number_of_parameters,1)
	EXCLUDE_LIST = Float64[]

	# Initialize a population of particles, each with a different parameter guess
	particle_array = Dict[]
	
	
	for particle_index = 1:NUMBER_OF_PARTICLES

		# Create new parameter vector -
		parameter_vector = Float64[]

		initial_parameter_guess = initial_parameter_vector[:,particle_index]
		
		velocity_vector = zeros(number_of_parameters)
		particle_dictionary = Dict()

		# Fill the parameter vector with randomized parameters
		for parameter_index = 1:number_of_parameters

			old_value = initial_parameter_guess[parameter_index]

			if (parameter_index in EXCLUDE_LIST)
				push!(parameter_vector,abs(old_value))
			else
				new_value = rand_gaussian(old_value,0.01*old_value)
				push!(parameter_vector,abs(new_value))
			end	
		end
		
		# Evaluate this vector -
		(particle_error,particle_error_total,sim_data) = calculateObjectiveFunction(parameter_vector,list_of_designs,PROBLEM_DICTIONARY)
		
		# Store these values in a particle dictionary -
		particle_dictionary["particle_position"] = parameter_vector
		particle_dictionary["particle_velocity"] = velocity_vector
		particle_dictionary["particle_error"] = particle_error
		particle_dictionary["particle_error_total"] = particle_error_total
		particle_dictionary["particle_index"] = particle_index
		particle_dictionary["particle_simulation_total"] = sim_data
		particle_dictionary["best_particle_position"] = parameter_vector
		particle_dictionary["best_particle_error_total"] = particle_error_total
		particle_dictionary["global_best_particle_position"] = parameter_vector
		particle_dictionary["global_best_particle_error_total"] = particle_error_total
		particle_dictionary["global_best_simulation_total"] = sim_data

		println(string("Initialize particle ",particle_index," has error:",particle_error_total))

		# Put this particle into our array -
	
		push!(particle_array,particle_dictionary)	
		
	end
	(best_particle_position,best_error_value,ensemble_rank_initial,error_array_initial,position_array_initial,best_particle) = findGlobalBestParticle(particle_array,number_of_parameters,NUMBER_OF_PARTICLES,list_of_designs)
	
	# Save initial error array and parameter array
	parameter_output_path1 = string("./results/",cell_line,"/Model_",config,"_",model_it,"/Parameters_",config,".dat") 
	writedlm(parameter_output_path1,position_array_initial)	
	
	error_output_path1 = string("./results/",cell_line,"/Model_",config,"_",model_it,"/MSE_Error_Array",config,".dat")
	writedlm(error_output_path1,error_array_initial)	

	#initialize best_sim_data
	best_sim_data = Float64[]

	for particle in particle_array
		
		if particle["global_best_particle_error_total"] == best_error_value
			# We found the particle with the best simulation
			best_sim_data = particle["global_best_simulation_total"]
		end
		
		particle["global_best_particle_position"] = best_particle_position
		particle["global_best_particle_error_total"] = best_error_value
		
	end	
		
	for particle in particle_array
		particle["global_best_simulation_total"] = best_sim_data
	end
		
	MSE_Error_Array = error_array_initial
	Position_array_total = position_array_initial
	
	for operation_index = 1:MAX_NUMBER_OPERATIONS

		for particle in particle_array

			# Get data for this particle -
			current_velocity = particle["particle_velocity"]
			current_position = particle["particle_position"]
			best_current_position = particle["best_particle_position"]
			global_best_particle_position =  particle["global_best_particle_position"]

			# Generate two random numbers -
			rP = rand()
			rG = rand()
		
			# Update the data for this particle -
			velocity = OMEGA*current_velocity + ALPHA*rP*(best_current_position - current_position) + BETA*rG*(global_best_particle_position - current_position)
			position = current_position + velocity
	
			# Fill the parameter vector with randomized parameters
			for parameter_index = 1:number_of_parameters

				old_value = initial_parameter_guess[parameter_index]

				if (parameter_index in EXCLUDE_LIST)
					position[parameter_index] = old_value
				else
					position[parameter_index] = position[parameter_index] + velocity[parameter_index]
					
					# Catch Numbers below threshold
					if position[parameter_index] < 1e-6
						position[parameter_index] = 1e-6
					end	
						
				end		
			end			

			particle["particle_velocity"] = velocity
			particle["particle_position"] = position
			parameter_vector = position
			# Evaluate the error for this particle -
			(new_particle_error,new_particle_error_total,new_sim_data) = calculateObjectiveFunction(parameter_vector,list_of_designs,PROBLEM_DICTIONARY)
			current_particle_error = particle["particle_error"]
			current_particle_error_total = particle["particle_error_total"]
			best_particle_error_total = particle["best_particle_error_total"]
			global_best_particle_error_total =  particle["global_best_particle_error_total"]
			
			number_of_exps = size(new_particle_error,1)
			new_particle_error_array = zeros(number_of_exps*num_designs)
			
			for design in list_of_designs	
		
				for z = 1:number_of_exps
					new_particle_error_array[z+number_of_exps*(design-1)] = new_particle_error[z,design]
				end	
			
			end
			
			# Add error of rank to error index then calculate rank
			MSE_Error_Array_temp = MSE_Error_Array
			size_error_array = size(MSE_Error_Array[1],1)
		
			MSE_Error_Array_temp = cat(2,MSE_Error_Array,new_particle_error_array)
			ensemble_rank_new = calculateParetoRank(MSE_Error_Array_temp)
			particle_rank = ensemble_rank_new[size_error_array]
			
			# Save simulation if Rank = 0 and add to MSE_error_array and position array
			if (particle_rank == 0)
				
				MSE_Error_Array = MSE_Error_Array_temp
				Position_array_total = cat(2,Position_array_total,parameter_vector)
				
				# Save initial error array and parameter array
				parameter_output_path1 = string("./results/",cell_line,"/Model_",config,"_",model_it,"/Parameters_",config,".dat") 
				writedlm(parameter_output_path1,Position_array_total)	
	
				error_output_path1 = string("./results/",cell_line,"/Model_",config,"_",model_it,"/MSE_Error_Array",config,".dat") 
				writedlm(error_output_path1,MSE_Error_Array)	
				
			end
			
			# Ok, is this error better than my *best* local error?
			if (new_particle_error_total < current_particle_error_total)

				# update the user -
				println(string("Found new local best error",new_particle_error_total,"(global_best:",global_best_particle_error_total,") from particle ",particle["particle_index"]," operation:",operation_index))

				# We found a better solution *at least* locally -
				particle["particle_error_total"] = new_particle_error_total
				particle["best_particle_position"] = position
				particle["best_particle_error_total"] = new_particle_error_total
				particle["global_best_simulation_total"] = new_sim_data

				# Is this solution better than our global best?
				if (new_particle_error_total<global_best_particle_error_total)

					# update the user -
					println(string("Found *new global best error* ",new_particle_error_total," from particle ",particle["particle_index"]," operation:",operation_index))

					# we found a new global best, update all particles
					for particle in particle_array
						particle["global_best_particle_position"] = position
						particle["global_best_particle_error_total"] = new_particle_error_total
					end	
				end
			end
		end
	end
	
	# return the best particle

	best_error = particle_array[end]["global_best_particle_error_total"]
	optimized_parameter_vector = particle_array[end]["global_best_particle_position"]
	optimized_sim_data = particle_array[end]["global_best_simulation_total"]
	
	return (optimized_parameter_vector,best_error,optimized_sim_data)

end