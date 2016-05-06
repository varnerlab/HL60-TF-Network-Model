function [New_Nodes,Action_Matrix,Direction_Matrix,Deleted_Nodes] = Info_Updates_Model_Multi(cell_line,model_num,exclude_matrix)
	
	number_species = 18;
	Species_Labels = [  "RAR"
						"VDR"
						"PPAR" 
						"IRF1"
						"Oct1" 
						"AhR" 
						"CEBPa" 
						"Gfi1"
						"EGR1" 
						"PU1"
						"AP1" 
						"CD38" 
						"CD11b" 
						"CD14"
						"p21" 
						"E2F"
						"p47"
						"Oct4"];
						
		New_Nodes = [];
		Action_Matrix = ['        '];
		Direction_Matrix = [];	
		Repeat_Nodes = [];	
		Deleted_Nodes = [];		
						
		% Load original model
		cmd = ["load ./",cell_line,"/Model_1_1/Model_1.dat;"];
		eval(cmd);
		cmd = ["Model_original = Model_1;"];
		eval(cmd);
		
						
		cmd = ["load ./",cell_line,"/Model_",num2str(model_num),"_1/Model_",num2str(model_num),".dat;"];
		eval(cmd);
		cmd = ["Model = Model_",num2str(model_num),";"];
		eval(cmd);
		
		Model_add = ['Changes to Model'];
		
		% Check to see if interaction in model, new, or missing
		% Label edges 1:324 with 1 down column then across rows.
		
		count = 0;
		count_updates = 0;
		
		for j = 1:number_species
		
			for i = 1:number_species
				
				edge_original = Model_original(i,j);
				edge_new = Model(i,j);
				edge_num = (j-1)*18+i;
				
				if edge_original == edge_new
					% Don't do anything - nothing changed
					
				else
					% Edge changed
					if edge_original == 0
						% We added a node
						if edge_new == 1
							% positive transcription
							action = "added";
							direction = "upregulates";
						
						elseif edge_new == -1
							%negative transcription
							action = "added";
							direction = "represses";
						
						end
					
					elseif edge_original == 1
					
						if edge_new == 0
							% We deleted a node
							action = "deleted";
							direction = "upregulates";
						
						elseif edge_new == -1
							%switched to negative transcription
							action = "switched";
							direction = "represses";
						
						end
					
					elseif edge_original == -1
					
						if edge_new == 0
							% We deleted a node
							action = "deleted";
							direction = "represses";
						
						elseif edge_new == 1
							%switched to postive transcription
							action = "switched";
							direction = "upregulates";
						
						end
					
					end
					
					count = count+1;
					specie = strtrim(Species_Labels(j,:));
					target = strtrim(Species_Labels(i,:));
					Interaction = cstrcat(num2str(edge_num),":  ",action,"  ",specie,"  ",direction, "  ",target);
					num_char = size(Interaction,2);
					Model_add(count,1:num_char) = Interaction;
					
					if isempty(find(exclude_matrix == edge_num)) == 1 
						
						count_updates = count_updates + 1;
						num_char_Action = size(action,2);
						New_Nodes(count_updates,1) = edge_num;
						Action_Matrix(count_updates,1:num_char_Action) = strtrim(action);
					
						if edge_new != 0
							Direction_Matrix(count_updates,1) = edge_new;	
						else
							Direction_Matrix(count_updates,1) = edge_original;
						
						end	
					else
						
						Repeat_Node(end+1,:) = edge_num;
							
					end	
				
				end		
			
			end
		
		end 
		
		for b = 1:size(exclude_matrix,1)
			
			if isempty(find(Repeat_Node == exclude_matrix(b,1))) == 0
				% Do nothing
			else
				% This node was removed
				Deleted_Nodes(end+1,1) = exclude_matrix(b,1);
			end	
				
		end
		
		path_to_file = strcat("./",cell_line,"/Model_Updates/Model_",num2str(model_num),"_update.txt");

		fID = fopen(path_to_file,'w');
		nModelNew = size(Model_add,1);
		for ix = 1:nModelNew
			tmpStr = strtrim(Model_add(ix,:));
			fprintf(fID,'%s\n',tmpStr);
		end
		fclose(fID);

return;