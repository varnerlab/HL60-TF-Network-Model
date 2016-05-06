#__author__ = 'Kathy Rogers'

#using Debug

function ScalingFactorBeta(DATA)
	
	num_Data = size(DATA,1)
	SCALE_up = zeros(num_Data)
	SCALE_down = zeros(num_Data)
	
	for i = 1:num_Data
		# DATA form [Time, ExpValue, StdExpValue, SimValue]
		SCALE_up[i] = (DATA[i,4]*DATA[i,2])/(DATA[i,3]^2)
		SCALE_down[i] = (DATA[i,4]/DATA[i,3])^2
	end
	
	SCALE = sum(SCALE_up)/sum(SCALE_down)

	return SCALE
end	

function experimentError(TIME,STATE,DESIGN,Time_Vector,cell_line)
	# List only training exps
	training_vector = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
	num_Exps = size(training_vector,1)
	MSE_Error = zeros(num_Exps)
	
	# Load Each Exp Files
	for exp = 1:num_Exps
	
		# Load exps -
		path_to_exp_file = string("./ExperimentData/",cell_line,"/DATA",training_vector[exp],".txt")
		exp_vector = readdlm(path_to_exp_file)
		
		SPECIE = exp_vector[1,5]
		# System Size for Specified Design
		NUM_DATA = size(exp_vector,1)
		x = exp_vector[:,4]
		NUM_DESIGN_Occurs = size(find(x -> x == DESIGN,x),1)
		
		# Check that time and input are sensible -

		# Collect data to calculate scaling factor and MSE -
		# First Collect Initial DATA From Design 0 (i.e. Time 0)
		# ALL_DATA 1 = Time, 2 = ExpValue, 3 = StdExpValue, 4 = SimValue
		ALL_DATA = zeros(NUM_DESIGN_Occurs+1,4)
		ALL_DATA[1,1] = exp_vector[1,1]
		ALL_DATA[1,2] = exp_vector[1,2]
		ALL_DATA[1,3] = exp_vector[1,3]
		ALL_DATA[1,4] = STATE[1,SPECIE]
		
		
		# Add Other Simulation Values 
		if NUM_DESIGN_Occurs == 1
			# This means we only have one time point
			ALL_DATA[2,1] = exp_vector[DESIGN+1,1]
			ALL_DATA[2,2] = exp_vector[DESIGN+1,2]
			ALL_DATA[2,3] = exp_vector[DESIGN+1,3]
			# Calculate Time Point
			Time_Exp = exp_vector[DESIGN+1,1]
			Time_Point = findfirst((Time_Vector -> (Time_Vector>=Time_Exp)),Time_Vector)
			# Add Simulation Value to Array
			ALL_DATA[2,4] = STATE[Time_Point,SPECIE]
			
		elseif NUM_DESIGN_Occurs > 1
			# Find location of all time points for design and fill in for all time points
			idx_des = find(exp_vector[:,4] .== DESIGN)
			
			for num_occ = 2:(NUM_DESIGN_Occurs+1)
				
				ALL_DATA[num_occ,1] = exp_vector[idx_des[num_occ-1],1]
				ALL_DATA[num_occ,2] = exp_vector[idx_des[num_occ-1],2]
				ALL_DATA[num_occ,3] = exp_vector[idx_des[num_occ-1],3]
				# Calculate Time Point
				Time_Exp = exp_vector[idx_des[num_occ-1],1]
				
				Time_Point = findfirst((Time_Vector -> (Time_Vector>=Time_Exp)),Time_Vector)
				# Add Simulation Value to Array
				ALL_DATA[num_occ,4] = STATE[Time_Point,SPECIE]
			end	
				
		else
			# Design not used
			ALL_DATA = zeros(NUM_DESIGN_Occurs+1,4)
			
		end		
		
		if countnz(ALL_DATA)>0			
			# Calculate scaling factor -
			SCALE = ScalingFactorBeta(ALL_DATA)	
		
			# Scale Simulation Data
			ALL_DATA[:,4] = SCALE*ALL_DATA[:,4]
		
			# Calculate Mean Squared Error -
			MSE = mean(((ALL_DATA[:,4]-ALL_DATA[:,2])./ALL_DATA[:,3]).^2)
			
		else
			MSE = 0	
			
		end	
		
		if isnan(MSE)
			MSE = 1e6	
		end	

		MSE_Error[exp] = MSE
			
	
	end		

	return MSE_Error

end	