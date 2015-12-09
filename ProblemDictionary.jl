#__author__ = 'Kathy Rogers'

include("ControlProgram.jl")

function formulateModelDictionary(struc)

	# initialize -
	PROBLEM_DICTIONARY = Dict()

	# setup initial conditions -
	initial_condition_vector = Float64[]
	push!(initial_condition_vector,0.0)    # 1 m_1 RAR initial condition -
	push!(initial_condition_vector,0.0)    # 2 m_2 VDR initial condition -
	push!(initial_condition_vector,0.0)    # 3 m_3 PPAR initial condition -
	push!(initial_condition_vector,0.0)    # 4 m_4 IRF1 initial condition -
	push!(initial_condition_vector,0.0)    # 5 m_5 Oct1 initial condition -
	push!(initial_condition_vector,0.0)    # 6 m_6 AhR initial condition -
	push!(initial_condition_vector,0.0)    # 7 m_7 CEBPa initial condition -
	push!(initial_condition_vector,0.0)    # 8 m_8 Gfi1 initial condition -
	push!(initial_condition_vector,0.0)    # 9 m_9 EGR1 initial condition -
	push!(initial_condition_vector,0.0)    # 10 m_10 PU1 initial condition -
	push!(initial_condition_vector,0.0)    # 11 m_11 AP1 initial condition -
	push!(initial_condition_vector,0.0)    # 12 m_12 CD38 initial condition -
	push!(initial_condition_vector,0.0)    # 13 m_13 CD11b initial condition -
	push!(initial_condition_vector,0.0)    # 14 m_14 CD14 initial condition -
	push!(initial_condition_vector,0.0)    # 15 m_15 p21 initial condition -
	push!(initial_condition_vector,0.0)    # 16 m_16 E2F initial condition -
	push!(initial_condition_vector,0.0)    # 17 m_17 p47 initial condition -
	push!(initial_condition_vector,0.0)    # 18 m_18 Oct4 initial condition -

	push!(initial_condition_vector,0.0)    # 19 p_1 RAR initial condition -
	push!(initial_condition_vector,0.0)    # 20 p_2 VDR initial condition -
	push!(initial_condition_vector,0.0)    # 21 p_3 PPAR initial condition -
	push!(initial_condition_vector,0.0)    # 22 p_4 IRF1 initial condition -
	push!(initial_condition_vector,0.0)    # 23 p_5 Oct1 initial condition -
	push!(initial_condition_vector,0.0)    # 24 p_6 AhR initial condition -
	push!(initial_condition_vector,0.0)    # 25 p_7 CEBPa initial condition -
	push!(initial_condition_vector,0.0)    # 26 p_8 Gfi1 initial condition -
	push!(initial_condition_vector,0.0)    # 27 p_9 EGR1 initial condition -
	push!(initial_condition_vector,0.0)    # 28 p_10 PU1 initial condition -
	push!(initial_condition_vector,0.0)    # 29 p_11 AP1 initial condition -
	push!(initial_condition_vector,0.0)    # 30 p_12 CD38 initial condition -
	push!(initial_condition_vector,0.0)    # 31 p_13 CD11b initial condition -
	push!(initial_condition_vector,0.0)    # 32 p_14 CD14 initial condition -
	push!(initial_condition_vector,0.0)    # 33 p_15 p21 initial condition -
	push!(initial_condition_vector,0.0)    # 34 p_16 E2F initial condition -
	push!(initial_condition_vector,0.0)    # 35 p_17 p47 initial condition -
	push!(initial_condition_vector,0.0)    # 36 p_18 Oct4 initial condition -

	push!(initial_condition_vector,0.0)   # 37 RXR initial condition -
	push!(initial_condition_vector,100.0)   # 38 RNAP initial condition -
	push!(initial_condition_vector,100.0)   # 39 RIOBSOME initial condition -
	push!(initial_condition_vector,0.0)   	# 40 INDUCER RA initial condition -
	push!(initial_condition_vector,0.0)   	# 41 INDUCER VD initial condition -
	push!(initial_condition_vector,0.01)   # 42 GROWTH initial condition -

	PROBLEM_DICTIONARY["INITIAL_CONDITION_VECTOR"] = initial_condition_vector
	PROBLEM_DICTIONARY["INITIAL_CONDITION_VECTOR_ORIGINAL"] = initial_condition_vector

	# setup kinetic parameter vector -
	kinetic_parameter_vector = Float64[]
	push!(kinetic_parameter_vector,0.75)   # 1 m1 RAR transcription constant
	push!(kinetic_parameter_vector,0.70)   # 2 m2 VDR transcription constant
	push!(kinetic_parameter_vector,0.75)   # 3 m3 PPAR transcription constant
	push!(kinetic_parameter_vector,0.70)   # 4 m4 IRF1 transcription constant
	push!(kinetic_parameter_vector,0.85)   # 5 m5 Oct1 transcription constant
	push!(kinetic_parameter_vector,0.75)   # 6 m6 AhR transcription constant
	push!(kinetic_parameter_vector,0.70)   # 7 m7 CEBPa transcription constant
	push!(kinetic_parameter_vector,0.85)   # 8 m8 Gfi1 transcription constant
	push!(kinetic_parameter_vector,0.75)   # 9 m9 EGR1 transcription constant
	push!(kinetic_parameter_vector,0.70)   # 10 m10 PU1 transcription constant
	push!(kinetic_parameter_vector,0.85)   # 11 m11 AP1 transcription constant
	push!(kinetic_parameter_vector,0.85)   # 12 m12 CD38 transcription constant
	push!(kinetic_parameter_vector,0.75)   # 13 m13 CD11b transcription constant
	push!(kinetic_parameter_vector,0.70)   # 14 m14 CD14 transcription constant
	push!(kinetic_parameter_vector,0.85)   # 15 m15 p21 transcription constant
	push!(kinetic_parameter_vector,0.75)   # 16 m16 E2F transcription constant
	push!(kinetic_parameter_vector,0.70)   # 17 m17 p47 transcription constant
	push!(kinetic_parameter_vector,0.85)   # 18 m18 Oct4 transcription constant

	push!(kinetic_parameter_vector,0.50)   # 19 p1 RAR transcription constant
	push!(kinetic_parameter_vector,0.50)   # 20 p2 VDR transcription constant
	push!(kinetic_parameter_vector,0.50)   # 21 p3 PPAR transcription constant
	push!(kinetic_parameter_vector,0.50)   # 22 p4 IRF1 transcription constant
	push!(kinetic_parameter_vector,0.65)   # 23 p5 Oct1 transcription constant
	push!(kinetic_parameter_vector,0.50)   # 24 p6 AhR transcription constant
	push!(kinetic_parameter_vector,0.50)   # 25 p7 CEBPa transcription constant
	push!(kinetic_parameter_vector,0.65)   # 26 p8 Gfi1 transcription constant
	push!(kinetic_parameter_vector,0.50)   # 27 p9 EGR1 transcription constant
	push!(kinetic_parameter_vector,0.50)   # 28 p10 PU1 transcription constant
	push!(kinetic_parameter_vector,0.65)   # 29 p11 AP1 transcription constant
	push!(kinetic_parameter_vector,0.65)   # 30 p12 CD38 transcription constant
	push!(kinetic_parameter_vector,0.50)   # 31 p13 CD11b transcription constant
	push!(kinetic_parameter_vector,0.50)   # 32 p14 CD14 transcription constant
	push!(kinetic_parameter_vector,0.65)   # 33 p15 p21 transcription constant
	push!(kinetic_parameter_vector,0.50)   # 34 p16 E2F transcription constant
	push!(kinetic_parameter_vector,0.50)   # 35 p17 p47 transcription constant
	push!(kinetic_parameter_vector,0.65)   # 36 p18 Oct4 transcription constant

	push!(kinetic_parameter_vector,0.05)   # 37 m1 RAR degradation constant
	push!(kinetic_parameter_vector,0.05)   # 38 m2 VDR degradation constant
	push!(kinetic_parameter_vector,0.05)   # 39 m3 PPAR degradation constant
	push!(kinetic_parameter_vector,0.05)   # 40 m4 IRF1 degradation constant
	push!(kinetic_parameter_vector,0.05)   # 41 m5 Oct1 degradation constant
	push!(kinetic_parameter_vector,0.05)   # 42 m6 AhR degradation constant
	push!(kinetic_parameter_vector,0.05)   # 43 m7 CEBPa degradation constant
	push!(kinetic_parameter_vector,0.05)   # 44 m8 Gfi1 degradation constant
	push!(kinetic_parameter_vector,0.05)   # 45 m9 EGR1 degradation constant
	push!(kinetic_parameter_vector,0.05)   # 46 m10 PU1 degradation constant
	push!(kinetic_parameter_vector,0.05)   # 47 m11 AP1 degradation constant
	push!(kinetic_parameter_vector,0.05)   # 48 m12 CD38 degradation constant
	push!(kinetic_parameter_vector,0.05)   # 49 m13 CD11b degradation constant
	push!(kinetic_parameter_vector,0.05)   # 50 m14 CD14 degradation constant
	push!(kinetic_parameter_vector,0.05)   # 51 m15 p21 degradation constant
	push!(kinetic_parameter_vector,0.05)   # 52 m16 E2F degradation constant
	push!(kinetic_parameter_vector,0.05)   # 53 m17 p47 degradation constant
	push!(kinetic_parameter_vector,0.05)   # 54 m18 Oct4 degradation constant

	push!(kinetic_parameter_vector,0.05)   # 55 p1 RAR degradation constant
	push!(kinetic_parameter_vector,0.05)   # 56 p2 VDR degradation constant
	push!(kinetic_parameter_vector,0.05)   # 57 p3 PPAR degradation constant
	push!(kinetic_parameter_vector,0.05)   # 58 p4 IRF1 degradation constant
	push!(kinetic_parameter_vector,0.05)   # 59 p5 Oct1 degradation constant
	push!(kinetic_parameter_vector,0.05)   # 60 p6 AhR degradation constant
	push!(kinetic_parameter_vector,0.05)   # 61 p7 CEBPa degradation constant
	push!(kinetic_parameter_vector,0.05)   # 62 p8 Gfi1 degradation constant
	push!(kinetic_parameter_vector,0.05)   # 63 p9 EGR1 degradation constant
	push!(kinetic_parameter_vector,0.05)   # 64 p10 PU1 degradation constant
	push!(kinetic_parameter_vector,0.05)   # 65 p11 AP1 degradation constant
	push!(kinetic_parameter_vector,0.05)   # 66 p12 CD38 degradation constant
	push!(kinetic_parameter_vector,0.05)   # 67 p13 CD11b degradation constant
	push!(kinetic_parameter_vector,0.05)   # 68 p14 CD14 degradation constant
	push!(kinetic_parameter_vector,0.05)   # 69 p15 p21 degradation constant
	push!(kinetic_parameter_vector,0.05)   # 70 p16 E2F degradation constant
	push!(kinetic_parameter_vector,0.05)   # 71 p17 p47 degradation constant
	push!(kinetic_parameter_vector,0.05)   # 72 p18 Oct4 degradation constant
	
	#Add Basal mRNA production rate terms - 1st order k*RNAP
	push!(kinetic_parameter_vector,0.00001)   # 73 m1 RAR basal transcription constant
	push!(kinetic_parameter_vector,0.00001)   # 74 m2 VDR basal transcription constant
	push!(kinetic_parameter_vector,0.00001)   # 75 m3 PPAR basal transcription constant
	push!(kinetic_parameter_vector,0.00001)   # 76 m4 IRF1 basal transcription constant
	push!(kinetic_parameter_vector,0.00001)   # 77 m5 Oct1 basal transcription constant
	push!(kinetic_parameter_vector,0.00001)   # 78 m6 AhR basal transcription constant
	push!(kinetic_parameter_vector,0.00001)   # 79 m7 CEBPa basal transcription constant
	push!(kinetic_parameter_vector,0.00001)   # 80 m8 Gfi1 basal transcription constant
	push!(kinetic_parameter_vector,0.00001)   # 81 m9 EGR1 basal transcription constant
	push!(kinetic_parameter_vector,0.00001)   # 82 m10 PU1 basal transcription constant
	push!(kinetic_parameter_vector,0.00001)   # 83 m11 AP1 basal transcription constant
	push!(kinetic_parameter_vector,0.00001)   # 84 m12 CD38 basal transcription constant
	push!(kinetic_parameter_vector,0.00001)   # 85 m13 CD11b basal transcription constant
	push!(kinetic_parameter_vector,0.00001)   # 86 m14 CD14 basal transcription constant
	push!(kinetic_parameter_vector,0.00001)   # 87 m15 p21 basal transcription constant
	push!(kinetic_parameter_vector,0.00001)   # 88 m16 E2F basal transcription constant
	push!(kinetic_parameter_vector,0.00001)   # 89 m17 p47 basal transcription constant
	push!(kinetic_parameter_vector,0.00001)   # 90 m18 Oct4 basal transcription constant

	PROBLEM_DICTIONARY["KINETIC_PARAMETER_VECTOR"] = kinetic_parameter_vector
	control_parameter_vector = controlProgramForAllModels()
	
	# setup control program -
	PROBLEM_DICTIONARY["CONTROL_PARAMETER_VECTOR"] = controlProgramForAllModels()
	# setup structure
	PROBLEM_DICTIONARY["CONTROL_STRUC"] = struc

	# misc stuff -
	PROBLEM_DICTIONARY["NUMBER_OF_RATES"] = size(kinetic_parameter_vector,1)

	# Pointers -
	PROBLEM_DICTIONARY["KINETICS_FUNCTION_POINTER"] = string("calculateRateVector")
	PROBLEM_DICTIONARY["CONTROL_FUNCTION_POINTER"] = string("calculateControlPolicyForAllModels")
	PROBLEM_DICTIONARY["CELL_LINE_POINTER"] = string("U937")
	
	# return -
	return PROBLEM_DICTIONARY
	
end	

