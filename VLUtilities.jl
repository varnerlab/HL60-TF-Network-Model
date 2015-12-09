# === Helper methods =================================
#using Debug

function concatinateSimulationArrays(time_array_1,simulation_array_1,time_array_2,simulation_array_2)
	
    # initialize -
    (number_of_timesteps_1,number_of_species) = size(simulation_array_1)
    
    (number_of_timesteps_2,number_of_species) = size(simulation_array_2)

    # Create data array -
    data_array = zeros(number_of_timesteps_1+number_of_timesteps_2,number_of_species + 1)

    # grab the time -
    for time_index = 1:number_of_timesteps_1
        data_array[time_index,1] = time_array_1[time_index]
    end    

    for time_index = 1:number_of_timesteps_2
        data_array[number_of_timesteps_1+time_index,1] = time_array_2[time_index]
    end    

    for row_index = 1:number_of_timesteps_1

        for col_index = 2:(number_of_species + 1)
            data_array[row_index,col_index] = simulation_array_1[row_index,col_index - 1]
        end
        
    end  
    
    for row_index = 1:number_of_timesteps_2
		
        for col_index = 2:(number_of_species + 1)
            data_array[number_of_timesteps_1+row_index, col_index] = simulation_array_2[row_index,col_index - 1]
        end
        
    end       

    # return -
    return data_array
end    
    
function concatinateSimulationArray1(time_array_1,simulation_array_1)

    # initialize -
    (number_of_timesteps_1,number_of_species) = size(simulation_array_1)

    # Create data array -
    data_array = zeros(number_of_timesteps_1,number_of_species + 1)

    # grab the time -
    for time_index = 1:(number_of_timesteps_1)
        data_array[time_index,1] = time_array_1[time_index]
    end    

    for row_index = 1:(number_of_timesteps_1)

        for col_index = 2:(number_of_species + 1)
            data_array[row_index,col_index] = simulation_array_1[row_index,col_index - 1]
        end
        
    end        

    # return -
    return data_array

end

function updateInitialConditionVectorInProblemDictionaryWithSimulationArray(problem_dictionary,time_array,simulation_array)
	
    # initialize -
    (number_of_timesteps,number_of_species) = size(simulation_array)

    # Grab the last time step -
    data_array = zeros(number_of_species)

    for row_index = 1:number_of_species
        data_array[row_index] = simulation_array[number_of_timesteps,row_index]
	end
	
    # update the ic vector in the problem dictionary -
    problem_dictionary["INITIAL_CONDITION_VECTOR"] = data_array
   
end


