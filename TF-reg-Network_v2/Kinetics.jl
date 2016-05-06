#__author__ = 'jeffreyvarner'
#using Debug

function calculateRateVector(t,x,PROBLEM_DICTIONARY)

	# Initalize -
	kinetic_parameter_vector = PROBLEM_DICTIONARY["KINETIC_PARAMETER_VECTOR"]
	number_of_rates = PROBLEM_DICTIONARY["NUMBER_OF_RATES"]
	rate_vector = zeros(number_of_rates,1)

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
	RA = x[39]
	VD3 = x[41]
	GROWTH_RATE = x[42]

	# Construct the rates -

	# Rate of expression for mRNA 1:18 -
	rate_vector[1,1] = kinetic_parameter_vector[1]*RNAP
	rate_vector[2,1] = kinetic_parameter_vector[2]*RNAP
	rate_vector[3,1] = kinetic_parameter_vector[3]*RNAP
	rate_vector[4,1] = kinetic_parameter_vector[4]*RNAP
	rate_vector[5,1] = kinetic_parameter_vector[5]*RNAP
	rate_vector[6,1] = kinetic_parameter_vector[6]*RNAP
	rate_vector[7,1] = kinetic_parameter_vector[7]*RNAP
	rate_vector[8,1] = kinetic_parameter_vector[8]*RNAP
	rate_vector[9,1] = kinetic_parameter_vector[9]*RNAP
	rate_vector[10,1] = kinetic_parameter_vector[10]*RNAP
	rate_vector[11,1] = kinetic_parameter_vector[11]*RNAP
	rate_vector[12,1] = kinetic_parameter_vector[12]*RNAP
	rate_vector[13,1] = kinetic_parameter_vector[13]*RNAP
	rate_vector[14,1] = kinetic_parameter_vector[14]*RNAP
	rate_vector[15,1] = kinetic_parameter_vector[15]*RNAP
	rate_vector[16,1] = kinetic_parameter_vector[16]*RNAP
	rate_vector[17,1] = kinetic_parameter_vector[17]*RNAP
	rate_vector[18,1] = kinetic_parameter_vector[18]*RNAP

	# Rate of translation for mRNA 1:18 -
	rate_vector[19,1] = kinetic_parameter_vector[19]*RIBOSOME*m_RAR
	rate_vector[20,1] = kinetic_parameter_vector[20]*RIBOSOME*m_VDR
	rate_vector[21,1] = kinetic_parameter_vector[21]*RIBOSOME*m_PPAR
	rate_vector[22,1] = kinetic_parameter_vector[22]*RIBOSOME*m_IRF1
	rate_vector[23,1] = kinetic_parameter_vector[23]*RIBOSOME*m_Oct1
	rate_vector[24,1] = kinetic_parameter_vector[24]*RIBOSOME*m_AhR
	rate_vector[25,1] = kinetic_parameter_vector[25]*RIBOSOME*m_CEBPa
	rate_vector[26,1] = kinetic_parameter_vector[26]*RIBOSOME*m_Gfi1
	rate_vector[27,1] = kinetic_parameter_vector[27]*RIBOSOME*m_EGR1
	rate_vector[28,1] = kinetic_parameter_vector[28]*RIBOSOME*m_PU1
	rate_vector[29,1] = kinetic_parameter_vector[29]*RIBOSOME*m_AP1
	rate_vector[30,1] = kinetic_parameter_vector[30]*RIBOSOME*m_CD38
	rate_vector[31,1] = kinetic_parameter_vector[31]*RIBOSOME*m_CD11b
	rate_vector[32,1] = kinetic_parameter_vector[32]*RIBOSOME*m_CD14
	rate_vector[33,1] = kinetic_parameter_vector[33]*RIBOSOME*m_p21
	rate_vector[34,1] = kinetic_parameter_vector[34]*RIBOSOME*m_E2F
	rate_vector[35,1] = kinetic_parameter_vector[35]*RIBOSOME*m_p47
	rate_vector[36,1] = kinetic_parameter_vector[36]*RIBOSOME*m_Oct4

	# Rate of degradation for mRNA 1:18 -
	rate_vector[37,1] = kinetic_parameter_vector[37]*m_RAR
	rate_vector[38,1] = kinetic_parameter_vector[38]*m_VDR
	rate_vector[39,1] = kinetic_parameter_vector[39]*m_PPAR
	rate_vector[40,1] = kinetic_parameter_vector[40]*m_IRF1
	rate_vector[41,1] = kinetic_parameter_vector[41]*m_Oct1
	rate_vector[42,1] = kinetic_parameter_vector[42]*m_AhR
	rate_vector[43,1] = kinetic_parameter_vector[43]*m_CEBPa
	rate_vector[44,1] = kinetic_parameter_vector[44]*m_Gfi1
	rate_vector[45,1] = kinetic_parameter_vector[45]*m_EGR1
	rate_vector[46,1] = kinetic_parameter_vector[46]*m_PU1
	rate_vector[47,1] = kinetic_parameter_vector[47]*m_AP1
	rate_vector[48,1] = kinetic_parameter_vector[48]*m_CD38
	rate_vector[49,1] = kinetic_parameter_vector[49]*m_CD11b
	rate_vector[50,1] = kinetic_parameter_vector[50]*m_CD14
	rate_vector[51,1] = kinetic_parameter_vector[51]*m_p21
	rate_vector[52,1] = kinetic_parameter_vector[52]*m_E2F
	rate_vector[53,1] = kinetic_parameter_vector[53]*m_p47
	rate_vector[54,1] = kinetic_parameter_vector[54]*m_Oct4

	# Rate of degradation for proteins 1:18 -
	rate_vector[55,1] = kinetic_parameter_vector[55]*p_RAR
	rate_vector[56,1] = kinetic_parameter_vector[56]*p_VDR
	rate_vector[57,1] = kinetic_parameter_vector[57]*p_PPAR
	rate_vector[58,1] = kinetic_parameter_vector[58]*p_IRF1
	rate_vector[59,1] = kinetic_parameter_vector[59]*p_Oct1
	rate_vector[60,1] = kinetic_parameter_vector[60]*p_AhR
	rate_vector[61,1] = kinetic_parameter_vector[61]*p_CEBPa
	rate_vector[62,1] = kinetic_parameter_vector[62]*p_Gfi1
	rate_vector[63,1] = kinetic_parameter_vector[63]*p_EGR1
	rate_vector[64,1] = kinetic_parameter_vector[64]*p_PU1
	rate_vector[65,1] = kinetic_parameter_vector[65]*p_AP1
	rate_vector[66,1] = kinetic_parameter_vector[66]*p_CD38
	rate_vector[67,1] = kinetic_parameter_vector[67]*p_CD11b
	rate_vector[68,1] = kinetic_parameter_vector[68]*p_CD14
	rate_vector[69,1] = kinetic_parameter_vector[69]*p_p21
	rate_vector[70,1] = kinetic_parameter_vector[70]*p_E2F
	rate_vector[71,1] = kinetic_parameter_vector[71]*p_p47
	rate_vector[72,1] = kinetic_parameter_vector[72]*p_Oct4
	
	# Rate of basal expression for mRNA 1:18 -
	rate_vector[73,1] = kinetic_parameter_vector[73]*RNAP
	rate_vector[74,1] = kinetic_parameter_vector[74]*RNAP
	rate_vector[75,1] = kinetic_parameter_vector[75]*RNAP
	rate_vector[76,1] = kinetic_parameter_vector[76]*RNAP
	rate_vector[77,1] = kinetic_parameter_vector[77]*RNAP
	rate_vector[78,1] = kinetic_parameter_vector[78]*RNAP
	rate_vector[79,1] = kinetic_parameter_vector[79]*RNAP
	rate_vector[80,1] = kinetic_parameter_vector[80]*RNAP
	rate_vector[81,1] = kinetic_parameter_vector[81]*RNAP
	rate_vector[82,1] = kinetic_parameter_vector[82]*RNAP
	rate_vector[83,1] = kinetic_parameter_vector[83]*RNAP
	rate_vector[84,1] = kinetic_parameter_vector[84]*RNAP
	rate_vector[85,1] = kinetic_parameter_vector[85]*RNAP
	rate_vector[86,1] = kinetic_parameter_vector[86]*RNAP
	rate_vector[87,1] = kinetic_parameter_vector[87]*RNAP
	rate_vector[88,1] = kinetic_parameter_vector[88]*RNAP
	rate_vector[89,1] = kinetic_parameter_vector[89]*RNAP
	rate_vector[90,1] = kinetic_parameter_vector[90]*RNAP
	
	# return -
	return rate_vector

end
	