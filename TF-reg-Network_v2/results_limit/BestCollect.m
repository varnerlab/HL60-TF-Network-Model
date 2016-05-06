%==========================================================================%

% Best_Collect.m

% Script collects the Error data for multiple models

%==========================================================================%

function [Best_Error_Matrix,Best_Paramater_Matrix,Best_Error_Indv_Matrix] = BestCollect(model_start,model_end,cell_line)

	%cell_line = 'U937'
	Best_Error_Matrix = [];
	Best_Paramater_Matrix = [];
	Best_Error_Indv_Matrix = [];
	% Number of exps in Error Array (10 since 3 are saved for validation)
	num_exps = 10;
	
	for i = model_start:model_end
	
		index = i - model_start + 1;
		
		% LOAD Total Error for Model -
		cmd=['load ./',cell_line,'/Model_',num2str(i),'/MSE_Error_Array',num2str(i),'.dat;'];
		eval(cmd);
		cmd = ['Error = MSE_Error_Array',num2str(i),';'];
		eval(cmd);	
		
		Error_Total = sum(Error);
		[x,y] = min(Error_Total);
		
		for j = 1:num_exps
			error_exp = Error(j,y) + Error(j+num_exps,y) + Error(j+2*num_exps,y);
			Best_Error_Indv_Matrix(index,j) = error_exp;
		end
		
		Best_Error_Matrix(index) = x;
		Best_Paramater_Matrix(index) = y;
	
	end
	
return;