#__author__ = 'Kathy Rogers'

#using Debug
  
function PerturbStruc(Stoich_matrix)

	# List species which we know do not act as TF.
	# CD38, cd11b, and cd14 are surface proteins, p47
	species_notTF = [12, 13, 14, 17]
	# Select species which are always transcription factor repressors
	species_negative = [8]
	# Define max number of nodes that can be perturbed per simulation
	max_nodes = 3
	
	#Load Stoichiometric Matrix
	TF_stoich_Matrix = Stoich_matrix
	num_nodes_total = size(TF_stoich_Matrix,1)

	# Choose Number of nodes to change - up to max_nodes, nxn matrix
	randNum_nodes = rand()*max_nodes
	
	nodes_change = int(ceil(randNum_nodes))
	
	Total_matrix_pos = num_nodes_total*num_nodes_total
	
	# Column 1 = row, column 2 = column
	Positions_change = zeros(nodes_change,2)
	
	# initialize row and column
	row = 0
	column = 0
	
	TF_Stoich_Matrix_new = TF_stoich_Matrix
	
	for n = 1:nodes_change
		
		flag = 1
		
		while (flag == 1)
			
			# Randomly choose position to change
			randNum_pos = ceil(rand()*Total_matrix_pos) - 1
			row = int(floor(randNum_pos/num_nodes_total))+1
			column = int(floor(randNum_pos%num_nodes_total))+1 
			
			# check not in exclude list
			if column in species_notTF
				# This network perturbation is excluded, try another
				flag = 1
			# Also check that we have not already perturbed value
			elseif Positions_change[:,1] == row && Positions_change[:,2] == column
				flag = 1
			else
				Positions_change[n,1] = row
				Positions_change[n,2] = column
				flag = 0	
			end
		
		end
			
		# Change structure/First find what current value is
		current_value = TF_stoich_Matrix[row,column]
		
		# Calculate random number of which way to perturb species
		prob_up  = rand()
		
		if current_value == 0 && prob_up < 0.5 && (column in species_negative == false)
			# Change to 1
			new_value = 1
					
		elseif current_value == 0
			# Change to -1
			new_value = -1
			
		elseif prob_up < 0.5 || column in species_negative
			# Multiply number by 0 to make 0
			new_value = current_value*0
		else
			# Multiply number by -1 to make opposite	
			new_value = current_value*-1
		end	
		
		TF_Stoich_Matrix_new[row,column] = new_value	
	
	end
		
	# return -
	struc = TF_Stoich_Matrix_new
	return struc
    
end





