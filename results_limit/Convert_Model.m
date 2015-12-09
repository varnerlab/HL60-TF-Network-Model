function Convert_Model(cell_line,model_num)
	
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
						
		cmd = ["load ./results/",cell_line,"/Model_",num2str(model_num),"/Model_",num2str(model_num),".dat;"];
		eval(cmd);
		cmd = ["Model = Model_",num2str(model_num),";"];
		eval(cmd);
		
		% Check to see if interaction in model
		Model_new = ['TestEdgeAttributes1'];
		Model_new(2,1:15) = ['RA (pd) RAR = 1'];
		Model_new(3,1:15) = ['VD (pd) VDR = 1'];
		
		count = 3;
		
		for n = 1:number_species
			for i = 1:number_species
				num = Model(n,i);
				if Model(n,i) ~= 0 
					%This connection exists add to Model format
					count = count+1;
					specie = strtrim(Species_Labels(i,:));
					action = "(pp)";
					target = strtrim(Species_Labels(n,:));
					Interaction = strcat(specie," ",action, " ",target," = ",num2str(num));
					num_char = size(Interaction,2);
					Model_new(count,1:num_char) = Interaction;
					
				else
					%Do nothing
				end
		
			end
		end
		
		path_to_file = strcat("./results/",cell_line,"/Model_",num2str(model_num),"/Model_",num2str(model_num),"_new.sif");

		fID = fopen(path_to_file,'w');
		nModelNew = size(Model_new,1);
		for ix = 1:nModelNew
			tmpStr = strtrim(Model_new(ix,:));
			fprintf(fID,'%s\n',tmpStr);
		end
		fclose(fID);

return;