#__author__ = 'Kathy Rogers'

using Sundials
include("ProblemDictionary.jl")
include("NetworkMatrix.jl")

#using Debug
include("Kinetics.jl")
include("Control.jl")

function BalanceEquations(t,x,dxdt,PROBLEM_DICTIONARY)
	
    # Get the pointer to the kinetics, control function -
    kinetics_function_pointer = PROBLEM_DICTIONARY["KINETICS_FUNCTION_POINTER"]
    control_function_pointer = PROBLEM_DICTIONARY["CONTROL_FUNCTION_POINTER"]
    
    # Get Structure
    model_struc = PROBLEM_DICTIONARY["CONTROL_STRUC"]
	
    # Construct the kinetics and control command -
    cmd_kinetics = string(kinetics_function_pointer,"(t,x,PROBLEM_DICTIONARY)")
    cmd_control = string(control_function_pointer,"(t,x,PROBLEM_DICTIONARY,model_struc)")
	
    # Evaluate my commands -
    #kinetics_vector = eval(parse(cmd_kinetics))
    #control_vector = eval(parse(cmd_control))
    kinetics_vector = calculateRateVector(t,x,PROBLEM_DICTIONARY)
    control_vector = calculateControlPolicyForAllModels(t,x,PROBLEM_DICTIONARY,model_struc)

    # modified rate vector -
    modified_rate_vector = kinetics_vector.*control_vector
    
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
    p_IRF1 = x[22]
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
 
    # Transcription resource allocation -
    number_of_TF = 18
    transcription_total = 0
    translation_total = 0
    
    for specie = 1:number_of_TF 
    	
    	transcription_total = transcription_total + kinetics_vector[specie]
    	translation_total = translation_total + kinetics_vector[specie+number_of_TF]
    
    end	
	
    if (translation_total<1e-6)
    
        translation_total = 1e-6

	end 
	
    if (transcription_total <1e-6)
        
        transcription_total = 1e-6
        
    end  
	
    u_term = ones(18)
    u_term[1] = kinetics_vector[1]/transcription_total
    u_term[2] = kinetics_vector[2]/transcription_total
    u_term[3] = kinetics_vector[3]/transcription_total
    u_term[4] = kinetics_vector[4]/transcription_total
    u_term[5] = kinetics_vector[5]/transcription_total
    u_term[6] = kinetics_vector[6]/transcription_total
    u_term[7] = kinetics_vector[7]/transcription_total
    u_term[8] = kinetics_vector[8]/transcription_total
    u_term[9] = kinetics_vector[9]/transcription_total
    u_term[10] = kinetics_vector[10]/transcription_total
    u_term[11] = kinetics_vector[11]/transcription_total
    u_term[12] = kinetics_vector[12]/transcription_total
    u_term[13] = kinetics_vector[13]/transcription_total
    u_term[14] = kinetics_vector[14]/transcription_total
    u_term[15] = kinetics_vector[15]/transcription_total
    u_term[16] = kinetics_vector[16]/transcription_total
    u_term[17] = kinetics_vector[17]/transcription_total
    u_term[18] = kinetics_vector[18]/transcription_total
    
    w_term = ones(18)
    w_term[1] = kinetics_vector[19]/translation_total
    w_term[2] = kinetics_vector[20]/translation_total
    w_term[3] = kinetics_vector[21]/translation_total
    w_term[4] = kinetics_vector[22]/translation_total
    w_term[5] = kinetics_vector[23]/translation_total
    w_term[6] = kinetics_vector[24]/translation_total
    w_term[7] = kinetics_vector[25]/translation_total
    w_term[8] = kinetics_vector[26]/translation_total
    w_term[9] = kinetics_vector[27]/translation_total
    w_term[10] = kinetics_vector[28]/translation_total
    w_term[11] = kinetics_vector[29]/translation_total
    w_term[12] = kinetics_vector[30]/translation_total
    w_term[13] = kinetics_vector[31]/translation_total
    w_term[14] = kinetics_vector[32]/translation_total
    w_term[15] = kinetics_vector[33]/translation_total
    w_term[16] = kinetics_vector[34]/translation_total
    w_term[17] = kinetics_vector[35]/translation_total
    w_term[18] = kinetics_vector[36]/translation_total
    
      
    num_species = size(x,1)
    
    ## Calculate dxdt -
    ##dxdt = zeros(num_species)

    # m_1 m_RAR balance -
    dxdt[1] = modified_rate_vector[1]*u_term[1] - modified_rate_vector[37] - GROWTH_RATE*m_RAR + modified_rate_vector[73]

    # m_2 m_VDR balance -
    dxdt[2] = modified_rate_vector[2]*u_term[2] - modified_rate_vector[38] - GROWTH_RATE*m_VDR + modified_rate_vector[74]

    # m_3 m_PPAR balance -
    dxdt[3] = modified_rate_vector[3]*u_term[3] - modified_rate_vector[39] - GROWTH_RATE*m_PPAR + modified_rate_vector[75]

    # m_4 m_IRF1 balance -
    dxdt[4] = modified_rate_vector[4]*u_term[4] - modified_rate_vector[40] - GROWTH_RATE*m_IRF1 + modified_rate_vector[76]

    # m_5 m_Oct1 balance -
    dxdt[5] = modified_rate_vector[5]*u_term[5] - modified_rate_vector[41] - GROWTH_RATE*m_Oct1 + modified_rate_vector[77]
    
    # m_6 m_AhR balance -
    dxdt[6] = modified_rate_vector[6]*u_term[6] - modified_rate_vector[42] - GROWTH_RATE*m_AhR + modified_rate_vector[78]

    # m_7 m_CEBPa balance -
    dxdt[7] = modified_rate_vector[7]*u_term[7] - modified_rate_vector[43] - GROWTH_RATE*m_CEBPa + modified_rate_vector[79]

    # m_8 m_Gfi1 balance -
    dxdt[8] = modified_rate_vector[8]*u_term[8] - modified_rate_vector[44] - GROWTH_RATE*m_Gfi1 + modified_rate_vector[80]
    
    # m_9 m_EGR1 balance -
    dxdt[9] = modified_rate_vector[9]*u_term[9] - modified_rate_vector[45] - GROWTH_RATE*m_EGR1 + modified_rate_vector[81]

    # m_10 m_PU1 balance -
    dxdt[10] = modified_rate_vector[10]*u_term[10] - modified_rate_vector[46] - GROWTH_RATE*m_PU1 + modified_rate_vector[82]
    
    # m_11 m_AP1 balance -
    dxdt[11] = modified_rate_vector[11]*u_term[11] - modified_rate_vector[47] - GROWTH_RATE*m_AP1 + modified_rate_vector[83]

    # m_12 m_CD38 balance -
    dxdt[12] = modified_rate_vector[12]*u_term[12] - modified_rate_vector[48] - GROWTH_RATE*m_CD38 + modified_rate_vector[84]
    
    # m_13 m_CD11b balance -
    dxdt[13] = modified_rate_vector[13]*u_term[13] - modified_rate_vector[49] - GROWTH_RATE*m_CD11b + modified_rate_vector[85]

    # m_14 m_CD14 balance -
    dxdt[14] = modified_rate_vector[14]*u_term[14] - modified_rate_vector[50] - GROWTH_RATE*m_CD14 + modified_rate_vector[86]

    # m_15 m_p21 balance -
    dxdt[15] = modified_rate_vector[15]*u_term[15] - modified_rate_vector[51] - GROWTH_RATE*m_p21 + modified_rate_vector[87]
    
    # m_16 m_E2F balance -
    dxdt[16] = modified_rate_vector[16]*u_term[16] - modified_rate_vector[52] - GROWTH_RATE*m_E2F + modified_rate_vector[88]

    # m_17 m_p47 balance -
    dxdt[17] = modified_rate_vector[17]*u_term[17] - modified_rate_vector[53] - GROWTH_RATE*m_p47 + modified_rate_vector[89]

    # m_18 m_Oct4 balance -
    dxdt[18] = modified_rate_vector[18]*u_term[18] - modified_rate_vector[54] - GROWTH_RATE*m_Oct4 + modified_rate_vector[90]
    
    # p_1 p_RAR balance -
    dxdt[19] = modified_rate_vector[19]*w_term[1] - modified_rate_vector[55] - GROWTH_RATE*p_RAR

    # p_2 p_VDR balance -
    dxdt[20] = modified_rate_vector[20]*w_term[2] - modified_rate_vector[56] - GROWTH_RATE*p_VDR
 
    # p_3 p_PPAR balance -
    dxdt[21] = modified_rate_vector[21]*w_term[3] - modified_rate_vector[57] - GROWTH_RATE*p_PPAR

    # p_4 p_IRF1 balance -
    dxdt[22] = modified_rate_vector[22]*w_term[4] - modified_rate_vector[58] - GROWTH_RATE*p_IRF1

    # p_5 p_Oct1 balance -
    dxdt[23] = modified_rate_vector[23]*w_term[5] - modified_rate_vector[59] - GROWTH_RATE*p_Oct1
    
    # p_6 p_AhR balance -
    dxdt[24] = modified_rate_vector[24]*w_term[6] - modified_rate_vector[60] - GROWTH_RATE*p_AhR

    # p_7 p_CEBPa balance -
    dxdt[25] = modified_rate_vector[25]*w_term[7] - modified_rate_vector[61] - GROWTH_RATE*p_CEBPa

    # p_8 p_Gfi1 balance -
    dxdt[26] = modified_rate_vector[26]*w_term[8] - modified_rate_vector[62] - GROWTH_RATE*p_Gfi1
    
    # p_9 p_EGR1 balance -
    dxdt[27] = modified_rate_vector[27]*w_term[9] - modified_rate_vector[63] - GROWTH_RATE*p_EGR1

    # p_10 p_PU1 balance -
    dxdt[28] = modified_rate_vector[28]*w_term[10] - modified_rate_vector[64] - GROWTH_RATE*p_PU1
    
    # p_11 p_AP1 balance -
    dxdt[29] = modified_rate_vector[29]*w_term[11] - modified_rate_vector[65] - GROWTH_RATE*p_AP1

    # p_12 p_CD38 balance -
    dxdt[30] = modified_rate_vector[30]*w_term[12] - modified_rate_vector[66] - GROWTH_RATE*p_CD38
    
    # p_13 p_CD11b balance -
    dxdt[31] = modified_rate_vector[31]*w_term[13] - modified_rate_vector[67] - GROWTH_RATE*p_CD11b

    # p_14 p_CD14 balance -
    dxdt[32] = modified_rate_vector[32]*w_term[14] - modified_rate_vector[68] - GROWTH_RATE*p_CD14

    # p_15 p_p21 balance -
    dxdt[33] = modified_rate_vector[33]*w_term[15] - modified_rate_vector[69] - GROWTH_RATE*p_p21
    
    # p_16 p_E2F balance -
    dxdt[34] = modified_rate_vector[34]*w_term[16] - modified_rate_vector[70] - GROWTH_RATE*p_E2F

    # p_17 p_p47 balance -
    dxdt[35] = modified_rate_vector[35]*w_term[17] - modified_rate_vector[71] - GROWTH_RATE*p_p47

    # p_18 p_Oct4 balance -
    dxdt[36] = modified_rate_vector[36]*w_term[18] - modified_rate_vector[72] - GROWTH_RATE*p_Oct4
    
    # RXR balance -
    dxdt[37] = (5.0 - RXR)*GROWTH_RATE

    # RNAP balance -
    dxdt[38] = (50.0 - RNAP)*GROWTH_RATE

    # RIBOSOME balance -
    dxdt[39] = (50.0 - RIBOSOME)*GROWTH_RATE
    
    # RA Inducer balance -
    dxdt[40] = -RA*GROWTH_RATE
    
    # VD3 Inducer balance -
    dxdt[41] = -VD3*GROWTH_RATE

    # Growth rate -
    dxdt[42] = 0
	
    # return -
	
    return dxdt 
   
end  
