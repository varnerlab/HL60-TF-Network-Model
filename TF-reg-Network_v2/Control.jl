#__author__ = 'Kathy Rogers'

#using Debug

function calculateControlPolicyForAllModels(t,x,PROBLEM_DICTIONARY,struc)

	# initialize -
	number_of_rates = PROBLEM_DICTIONARY["NUMBER_OF_RATES"]
	control_parameter_vector = PROBLEM_DICTIONARY["CONTROL_PARAMETER_VECTOR"]
	control_vector = ones(number_of_rates,1)
	number_of_TF = 18
	
	# Alias the species -
	m_RAR = x[1]
	m_VDR = x[2]
	m_PPAR = x[3]
	m_IRF1= x[4]
	m_Oct1 = x[5]
	m_AhR = x[6]
	m_CEBPa = x[7]
	m_Gfi1 = x[8]
	m_EGR1 = x[9]
	m_PU1 = x[10]
	m_AP1 = x[11]
	m_CD38 = x[12]
	m_CD11b = x[13]
	m_CD14 = x[14]
	m_p21 = x[15]
	m_E2F = x[16]
	m_p47 = x[17]
	m_Oct4 = x[18]

	p_RAR = x[19]
	p_VDR = x[20]
	p_PPAR = x[21]
	p_IRF1= x[22]
	p_Oct1 = x[23]
	p_AhR = x[24]
	p_CEBPa = x[25]
	p_Gfi1 = x[26]
	p_EGR1 = x[27]
	p_PU1 = x[28]
	p_AP1 = x[29]
	p_CD38 = x[30]
	p_CD11b = x[31]
	p_CD14 = x[32]
	p_p21 = x[33]
	p_E2F = x[34]
	p_p47 = x[35]
	p_Oct4 = x[36]

	RXR = x[37]
	RNAP = x[38]
	RIBOSOME = x[39]
	RA = x[40]
	VD3 = x[41]
	GROWTH_RATE = x[42]


	#Consider Species with Inducers 1st
	for specie = 1:2 
		
		#Import struc as matrix
		mce = Float64[]
		k_species = Float64[]
		order = Float64[]
		temps=Float64[]
		INDUCER = Float64[]
		push!(INDUCER,RA)
		push!(INDUCER,VD3)	
		#add inducer
		push!(mce,1)
		# 1 for RA and 2 for VD
		push!(k_species,control_parameter_vector[(specie-1)*(2*(number_of_TF+1))+1])
		push!(order,control_parameter_vector[(specie-1)*(2*(number_of_TF+1))+2])
		push!(temps,(k_species[1]*INDUCER[specie])^order[1])

		for num = 1:number_of_TF
			push!(mce,struc[specie,num])
			push!(k_species,control_parameter_vector[2*((number_of_TF+1)*(specie-1) + num) + 1])
			push!(order,control_parameter_vector[2*((number_of_TF+1)*(specie-1) + num) + 2])
			push!(temps,(k_species[num+1]*abs(x[num+number_of_TF]))^order[num+1])
			
		end	
		
		tranfunct=Float64[]
		for y = 1:size(temps,1)
			
			if mce[y]==-1
				push!(tranfunct,1 - (temps[y]/(1+temps[y])))
			elseif mce[y]==1
				push!(tranfunct,(temps[y]/(1+temps[y])))
			end			
	
		end
		
		# Use mean transfer function  
		if countnz(mce) > 0 
			control_vector[specie] = mean(tranfunct)
		else
			control_vector[specie] = 0
		end	
		
	end
	
	#Consider Species with no Inducers 2nd
	for specie = 3:number_of_TF

		#Import struc as matrix
		mce = Float64[]
		k_species = Float64[]
		order = Float64[]
		temps=Float64[]
		
		for num = 1:number_of_TF
			
			push!(mce,struc[specie,num])
			push!(k_species,control_parameter_vector[2*(number_of_TF*(specie-1) + num)+3])
			push!(order,control_parameter_vector[2*(number_of_TF*(specie-1) + num)+4])
			push!(temps,(k_species[num]*abs(x[num+number_of_TF]))^order[num])
			
		end		

		tranfunct=Float64[]
		
		for y = 1:size(temps,1)
			
			if mce[y]==-1
				push!(tranfunct,1 - (temps[y]/(1+temps[y])))
			elseif mce[y]==1
				push!(tranfunct,(temps[y]/(1+temps[y])))
			
			end
			
		end
		
		# Use mean transfer function  
		if countnz(mce) > 0 
			control_vector[specie] = mean(tranfunct)
		else
			control_vector[specie] = 0
		end
		
	
	end
	
	return control_vector

end
