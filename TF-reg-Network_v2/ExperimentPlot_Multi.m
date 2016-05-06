%==========================================================================%

% ExperimentPlot.m

% This function takes a DataFile structure and the experiment number 
% EXP_NUM, runs all the experimental designs required by that experiment, 
% scales the simulation output and plots the results against the data.
% TSTEP = timestep

%==========================================================================%

function ExperimentPlot(cell_line,model_num,EXP_NUM)
	
	% Load experimental data -
	cmd = ["load ./ExperimentData/",cell_line,"/DATA",num2str(EXP_NUM),".txt;"];
	eval(cmd);
	cmd = ["exp_vector = DATA",num2str(EXP_NUM),";"];
	eval(cmd);
	NUM_DATA = size(exp_vector,1);
	
	% Clear plot -
	clf;
	
	Specie_Labels = ['CEBPa Concentration (AU)'
					'PU1 Concentration (AU)'
					'EGR1 Concentration (AU)'
					'Gfi1 Concentration (AU)'
					'RARa Concentration (AU)'
					'VDR Concentration (AU)'
					'IRF1 Concentration (AU)'
					'Oct4 Concentration (AU)'
					'AhR Concentration (AU)'
					'CD38 Concentration (AU)'
					'CD11b Concentration (AU)'
					'CD14 Concentration (AU)'
					'G1/G0'];
	
	for DESIGN = 1:3
		% Load Simulations for necessary design -
	
		cmd = ["load ./results_limit/",cell_line,"/Model_",num2str(model_num),"_3/Simulation_best_",num2str(DESIGN),".dat;"];
		eval(cmd);
		cmd = ["Sim_Data = Simulation_best_",num2str(DESIGN),";"];
		eval(cmd);
	
	
		SPECIE = exp_vector(1,5);
		# System Size for Specified Design
		NUM_DATA = size(exp_vector,1);
		x = exp_vector(:,4);
		NUM_DESIGN_Occurs = size(find(x == DESIGN),1);
	
		# Check that time and input are sensible -

		# Collect data to calculate scaling factor and MSE -
		# First Collect Initial DATA From Design 0 (i.e. Time 0)
		# ALL_DATA 1 = Time, 2 = ExpValue, 3 = StdExpValue, 4 = SimValue
		ALL_DATA = zeros(NUM_DESIGN_Occurs+1,4);
		ALL_DATA(1,1) = exp_vector(1,1);
		ALL_DATA(1,2) = exp_vector(1,2);
		ALL_DATA(1,3) = exp_vector(1,3);
		ALL_DATA(1,4) = Sim_Data(1,SPECIE+1);
		Time_Vector = Sim_Data(:,1);
	
		# Add Other Simulation Values 
		if NUM_DESIGN_Occurs == 1
			# This means we only have one time point
			ALL_DATA(2,1) = exp_vector(DESIGN+1,1);
			ALL_DATA(2,2) = exp_vector(DESIGN+1,2);
			ALL_DATA(2,3) = exp_vector(DESIGN+1,3);
			# Calculate Time Point
			Time_Exp = exp_vector(DESIGN+1,1);
			Time_Point = (find(Time_Vector>=Time_Exp))(1);
			# Add Simulation Value to Array
			ALL_DATA(2,4) = Sim_Data(Time_Point,SPECIE+1);
		
		elseif NUM_DESIGN_Occurs > 1
			# Find location of all time points for design and fill in for all time points
		
			idx_des = find(exp_vector(:,4) == DESIGN);
		
			for num_occ = 2:(NUM_DESIGN_Occurs+1)
			
				ALL_DATA(num_occ,1) = exp_vector(idx_des(num_occ-1),1);
				ALL_DATA(num_occ,2) = exp_vector(idx_des(num_occ-1),2);
				ALL_DATA(num_occ,3) = exp_vector(idx_des(num_occ-1),3);
				# Calculate Time Point
				Time_Exp = exp_vector(idx_des(num_occ-1),1);
			
				Time_Point = (find(Time_Vector>=Time_Exp))(1);
				# Add Simulation Value to Array
				ALL_DATA(num_occ,4) = Sim_Data(Time_Point,SPECIE+1);
			end	
			
		else
			# Design not used
			ALL_DATA = zeros(NUM_DESIGN_Occurs+1,4)
		
		end		

		% Calculate scaling factor -
		SCALE = ScalingFactorBeta(ALL_DATA);
	
		% Scale simulated data -
		ALL_DATA(:,4) = SCALE*ALL_DATA(:,4);
		DATA = SCALE*Sim_Data(:,SPECIE+1);
		MSE = mean(((ALL_DATA(:,4)-ALL_DATA(:,2))./ALL_DATA(:,3)).^2);
	
		ymax = max(1.5*max(DATA),1.5*max(ALL_DATA(:,2)));
		xmax = Time_Vector(end);
	
		cmd = ["mkdir ./results_limit/",cell_line,"/Model_",num2str(model_num),"_3/plots ;"];
		eval(cmd)
		
		c = ['r','b','g'];
	
		% Plot Data
		plot(Time_Vector,DATA,c(DESIGN))
		axis([0, xmax, 0, ymax])
	
		% Plot Data Points
		hold on
		plot(ALL_DATA(:,1),ALL_DATA(:,2),'*',"color",c(DESIGN))
		for i = 1:size(ALL_DATA)
			h = errorbar(ALL_DATA(i,1),ALL_DATA(i,2),ALL_DATA(i,3));
			set(h,"color",c(DESIGN));
		end	
	
	end

	ylabel(Specie_Labels(EXP_NUM,:))
	xlabel('Time (AU)')
	
	cmd = ["print -dpdf ./results_limit/",cell_line,"/Model_",num2str(model_num),"_3/plots/Experiment_",num2str(EXP_NUM),".pdf;"];
	eval(cmd);
return;