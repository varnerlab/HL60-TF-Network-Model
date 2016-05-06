#__author__ = 'Kathy Rogers'

#using Debug
include("VLUtilities.jl")
include("SolveBalanceEquations.jl")

function findSteadyState(PROBLEM_DICTIONARY,pBalanceEquations)

	data_array_0 = []
	TIME_2 = []
	STATE_2 = []

	# Set lower concentration threshold, exclude values below this -
	THRESHOLD = 10.0^-6

	# Initial settings for loop -
	TSTART_0 = 0
	TSTOP_0 = 1000
	NUMBER_STEPS_0 = 1000
	TSTEP_0 = (TSTOP_0 - TSTART_0)/NUMBER_STEPS_0
	time_vector_0 = collect(linspace(TSTART_0,TSTOP_0,NUMBER_STEPS_0))
	
	# Define relative tolerance -
	EPSILON = 0.0001
	
	# Maximum number of times through loop -
	MAX_LOOP = 25
	
	# Loop counter -
	COUNT_LOOP = 0
	
	SS_LOOP_FLAG = 1
	
	while (SS_LOOP_FLAG == 1)
		
		# Update counter -
		COUNT_LOOP = COUNT_LOOP + 1
		
		# Run solver for a bit -
		(TIME_1,STATE_1) = solveBalanceEquations(pBalanceEquations,time_vector_0,PROBLEM_DICTIONARY)
		
		# Update the initial condition-
		updateInitialConditionVectorInProblemDictionaryWithSimulationArray(PROBLEM_DICTIONARY,TIME_1,STATE_1)
		
		# Run solver for a bit longer -
		(TIME_2,STATE_2) = solveBalanceEquations(pBalanceEquations,time_vector_0,PROBLEM_DICTIONARY)
		
		# Concatenate -
		data_array_0 = concatinateSimulationArrays(TIME_1,STATE_1,TIME_2,STATE_2)
		
		num_specie = size(data_array_0,2) 
		ERR = zeros((num_specie-1, 1)) 
		
		# Run the simulation until change between time points is less than tolerance -
		for specie_index = 2:num_specie
		
			data_value_1 = data_array_0[NUMBER_STEPS_0,specie_index]
			data_value_2 = data_array_0[2*NUMBER_STEPS_0,specie_index]
			
			if (data_value_1 > 0)
				ERR[specie_index-1,1] = abs((data_value_2 - data_value_1)/data_value_1)
			else
				ERR[specie_index-1,1] = 0
			end	
				
		end	
		
		# Find the worst offender whos absolute value exceeds the threshold -
		TOL = maximum(ERR)
		
		if (TOL < EPSILON)
			# I have a steady state. Grab the value and kill loop -
			SS_LOOP_FLAG = 0
			updateInitialConditionVectorInProblemDictionaryWithSimulationArray(PROBLEM_DICTIONARY,TIME_2,STATE_2)
			
		else 
			
			# Set longer time scale -
			TSTOP = 5000	
			
			# New settings for loop -
			TSTART = 0
			NUMBER_STEPS = 1000
			TSTEP = (TSTOP - TSTART)/NUMBER_STEPS
			time_vector_0 = collect(linspace(TSTART,TSTOP,NUMBER_STEPS))
			
			# Reset IC -
			updateInitialConditionVectorInProblemDictionaryWithSimulationArray(PROBLEM_DICTIONARY,TIME_2,STATE_2)
			
				
			if COUNT_LOOP > MAX_LOOP
				data_array_0 = 0
				SS_LOOP_FLAG = 0
	
			end
		
		end	
		
	end
	
	return (data_array_0,TIME_2,STATE_2)	
	
end	