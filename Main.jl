#__author__ = 'Kathy Rogers'

#using Debug
#require("argparse")
using ArgParse
include("ProblemDictionary.jl")
include("BalanceEquations.jl")
include("SolveBalanceEquations.jl")
include("VLUtilities.jl")
include("ControlProgram.jl")
include("PerturbStructure.jl")
include("FindSteadyStateRel.jl") 
include("ExperimentError.jl")
include("ParticleSwarmOptimization.jl")
include("NetworkMatrix.jl")
include("Simulations.jl")

function randomizeParameterVector(parameter_vector,sigma,exclude_list)

	number_of_parameters = size(parameter_vector,1)
	new_parameter_vector = zeros(number_of_parameters,)

	for parameter_index = 1:number_of_parameters

		old_value = parameter_vector[parameter_index]
		
		if parameter_index in exclude_list == false
			new_value = rand_gaussian(old_value,sigma*old_value)
			new_parameter_vector[parameter_index] = abs(new_value)
		else
			new_parameter_vector[parameter_index] = old_value	
		end	
			
	end		

	return new_parameter_vector

end	

function rand_gaussian(mean,stdev)

	u1 = rand()
    u2 = rand()
    r = sqrt( -2.0*log(u1) )
    theta = 2.0*pi*u2
    mean + stdev*r*sin(theta)

end

function parse_commandline()
    s = ArgParseSettings()

    @add_arg_table s begin
        "--model_num", "-n"
            help = "another option with an argument"
            arg_type = Int
            default = 0
            required = true
         "--model_it", "-i"
            help = "another option with an argument"
            arg_type = Int
            default = 0
            required = true
    end

    return parse_args(s)
end

function main()

	parsed_args = parse_commandline()
	model_num = parsed_args["model_num"]
	model_it = parsed_args["model_it"]
	
	# Pointer to mass balance, and other stuff for the solver -
	pBalanceEquations = BalanceEquations
	
	list_of_designs = [1, 2, 3]
	struc = []
	
	model_index = model_num
	
	cell_line = string("U937")
	
	# If model called for first time
		
	if model_it == 1
		# Get Best Model
		if model_index == 1
			#load initial model network
			struc = stoichMatrix()
		else
			# Calculate best current model
			path_to_best_model = string("./results/",cell_line,"/Model_best.dat")
			best_model = readdlm(path_to_best_model)
			best_model = best_model[1]
			best_model = convert(Int64,best_model)
			# Now Load Model Structure
			path_to_model = string("./results/",cell_line,"/Model_",best_model,"_1/Model_",best_model,".dat")
			Model_best = readdlm(path_to_model)
			struc = PerturbStruc(Model_best)
		end	
	else
		# Load model from file
		path_to_model = string("./results/",cell_line,"/Model_",model_index,"_1/Model_",model_index,".dat")
		struc = readdlm(path_to_model)
	end	
	
	# Build the initial model dictionary -
	PROBLEM_DICTIONARY = formulateModelDictionary(struc)
	number_of_parameters = PROBLEM_DICTIONARY["NUMBER_OF_RATES"]
	number_of_control_parameters = 652
	
	cell_line = PROBLEM_DICTIONARY["CELL_LINE_POINTER"]
	
	# Create New Folder for results
	path_to_results = string("./results")
	if isdir(path_to_results) == false
		 mkdir(path_to_results)
	end	
	
	path_to_cellline = string("./results/",cell_line,"")
	if isdir(path_to_cellline) == false
		 mkdir(path_to_cellline)
	end	
	
	#Create New Folder to store structure and data
	path_to_models_file = string("./results/",cell_line,"/Model_",model_index,"_",model_it,"")
	if isdir(path_to_models_file) == false
		 mkdir(path_to_models_file)
	end	
		
	# Save Model Structure
	model_output_path = string("./results/",cell_line,"/Model_",model_index,"_",model_it,"/Model_",model_index,".dat")
	writedlm(model_output_path,struc,'\t')

	NUMBER_OPERATIONS = 30
	
	# parameter_vector=Kinetic_Parameter_Array+Control_Parameter_Array;
	# Load parameters -
	initial_parameter_vector = []
	
	if model_it == 1
		if model_index == 1
			path_to_parameter_file = "./Initial_Parameters.txt"
			initial_parameter_vector = readdlm(path_to_parameter_file)
		else
			# Load best parameter set
			path_to_best_parameter = string("./results/",cell_line,"/parameter_best.dat")
			best_parameter = readdlm(path_to_best_parameter)
		
			NUMBER_OF_PARTICLES = 25
			initial_parameter_vector = zeros((number_of_parameters+number_of_control_parameters),NUMBER_OF_PARTICLES)
		
			# Create new initial condition vector based on best parameter
			for particle = 1:NUMBER_OF_PARTICLES
				initial_parameter_vector[:,particle] = randomizeParameterVector(best_parameter,0.1,[])
			end	
	
		end
	else
		
		# Load best parameter set
			path_to_best_parameter = string("./results/",cell_line,"/Model_",model_index,"_",(model_it-1),"/Parameter_best_",model_index,".dat")
			best_parameter = readdlm(path_to_best_parameter)
		
			NUMBER_OF_PARTICLES = 25
			initial_parameter_vector = zeros((number_of_parameters+number_of_control_parameters),NUMBER_OF_PARTICLES)
		
			# Create new initial condition vector based on best parameter
			for particle = 1:NUMBER_OF_PARTICLES
				initial_parameter_vector[:,particle] = randomizeParameterVector(best_parameter,0.1,[])
			end	
		
	end
	
	(optimized_parameter_vector,best_error,optimized_sim_data)=ParticleSwarmOptimization(PROBLEM_DICTIONARY,model_index,NUMBER_OPERATIONS,initial_parameter_vector,model_it)
	
	# Dump results to disk for each design -
	for design in list_of_designs

		simulation_output_path = string("./results/",cell_line,"/Model_",model_index,"_",model_it,"/Simulation_best_",design,".dat")  
		writedlm(simulation_output_path,optimized_sim_data[design])
		
	end	

	# Save initial error array and parameter array
	best_parameter_output_path = string("./results/",cell_line,"/Model_",model_index,"_",model_it,"/Parameter_best_",model_index,".dat")
	writedlm(best_parameter_output_path,optimized_parameter_vector)
	
	# Determine if best model
	if model_index == 1
		# Only model so best model
		Model_best = struc
		Model_best_num = [1]
		Error_best = best_error
		best_parameter = optimized_parameter_vector
		
		# Save best model number, error, and parameters
		best_model_output_path = string("./results/",cell_line,"/Model_best.dat") 
		writedlm(best_model_output_path,Model_best_num)
		best_total_parameter_path = string("./results/",cell_line,"/parameter_best.dat") 
		writedlm(best_total_parameter_path,best_parameter)
		best_total_error_path = string("./results/",cell_line,"/Model_best_total_error.dat") 
		writedlm(best_total_error_path,Error_best)
		
		
	else 
		# Determine if model is better then the best
		path_to_best_total_error = string("./results/",cell_line,"/Model_best_total_error.dat")
		best_total_error = readdlm(path_to_best_total_error)
		best_total_error = best_total_error[1]
		
		if best_error < best_total_error
			Model_best = struc
			Error_best = best_error
			Model_best_num = [model_index]
			best_parameter = optimized_parameter_vector
			
			# Save best model number, error, and parameters
			best_model_output_path = string("./results/",cell_line,"/Model_best.dat") 
			writedlm(best_model_output_path,Model_best_num)
			best_total_parameter_path = string("./results/",cell_line,"/parameter_best.dat") 
			writedlm(best_total_parameter_path,best_parameter)
			best_total_error_path = string("./results/",cell_line,"/Model_best_total_error.dat") 
			writedlm(best_total_error_path,Error_best)
			
		else
			#Don't do anything
		end
	
	end
	
end

main()
