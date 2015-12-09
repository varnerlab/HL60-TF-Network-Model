#__author__ = 'Kathy Rogers'

function controlProgramForAllModels()

	# setup control parameter vector for model-
	control_parameter_vector = Float64[]

	# m_RAR control parameters -
	#inducer RA
	push!(control_parameter_vector,1.0)    # 1 gain inducer_m1
	push!(control_parameter_vector,2.0)    # 2 order inducer_m1

	#selfloop
	push!(control_parameter_vector,1.0)    # 3 gain p1_m1
	push!(control_parameter_vector,2.0)    # 4 order p1_m1

	#Protein 2 VDR
	push!(control_parameter_vector,1.0)    # 5 gain p2_m1
	push!(control_parameter_vector,2.0)    # 6 order p2_m1

	#Protein 3 PPAR
	push!(control_parameter_vector,1.0)    # 7 gain p3_m1
	push!(control_parameter_vector,2.0)    # 8 order p3_m1

	#Protein 4 IRF1
	push!(control_parameter_vector,1.0)    # 9 gain p4_m1
	push!(control_parameter_vector,2.0)    # 10 order p4_m1

	#Protein 5 Oct1
	push!(control_parameter_vector,1.0)    # 11 gain p5_m1
	push!(control_parameter_vector,2.0)    # 12 order p5_m1

	#Protein 6 AhR
	push!(control_parameter_vector,1.0)    # 13 gain p6_m1
	push!(control_parameter_vector,2.0)    # 14 order p6_m1

	#Protein 7 CEBPa
	push!(control_parameter_vector,1.0)    # 15 gain p7_m1
	push!(control_parameter_vector,2.0)    # 16 order p7_m1

	#Protein 8 Gfi1
	push!(control_parameter_vector,1.0)    # 17 gain p8_m1
	push!(control_parameter_vector,2.0)    # 18 order p8_m1

	#Protein 9 EGR1
	push!(control_parameter_vector,1.0)    # 19 gain p9_m1
	push!(control_parameter_vector,2.0)    # 20 order p9_m1

	#Protein 10 PU1
	push!(control_parameter_vector,1.0)    # 21 gain p10_m1
	push!(control_parameter_vector,2.0)    # 22 order p10_m1

	#Protein 11 AP1
	push!(control_parameter_vector,1.0)    # 23 gain p11_m1
	push!(control_parameter_vector,2.0)    # 24 order p11_m1

	#Protein 12 CD38
	push!(control_parameter_vector,1.0)    # 25 gain p12_m1
	push!(control_parameter_vector,2.0)    # 26 order p12_m1

	#Protein 13 CD11b
	push!(control_parameter_vector,1.0)    # 27 gain p13_m1
	push!(control_parameter_vector,2.0)    # 28 order p13_m1

	#Protein 14 CD14
	push!(control_parameter_vector,1.0)    # 29 gain p14_m1
	push!(control_parameter_vector,2.0)    # 30 order p14_m1

	#Protein 15 p21
	push!(control_parameter_vector,1.0)    # 31 gain p15_m1
	push!(control_parameter_vector,2.0)    # 32 order p15_m1

	#Protein 16 E2F
	push!(control_parameter_vector,1.0)    # 33 gain p16_m1
	push!(control_parameter_vector,2.0)    # 34 order p16_m1

	#Protein 17 p47
	push!(control_parameter_vector,1.0)    # 35 gain p17_m1
	push!(control_parameter_vector,2.0)    # 36 order p17_m1

	#Protein 18 Oct4
	push!(control_parameter_vector,1.0)    # 37 gain p18_m1
	push!(control_parameter_vector,2.0)    # 38 order p18_m1

	# m_VDR control parameters -
	#inducer VD
	push!(control_parameter_vector,1.0)    # 39 gain inducer_m2
	push!(control_parameter_vector,2.0)    # 40 order inducer_m2

	#Protein 1 RAR
	push!(control_parameter_vector,1.0)    # 41 gain p1_m2
	push!(control_parameter_vector,2.0)    # 42 order p1_m2

	#selfloop
	push!(control_parameter_vector,1.0)    # 43 gain p2_m2
	push!(control_parameter_vector,2.0)    # 44 order p2_m2

	#Protein 3 PPAR
	push!(control_parameter_vector,1.0)    # 45 gain p3_m2
	push!(control_parameter_vector,2.0)    # 46 order p3_m2

	#Protein 4 IRF1
	push!(control_parameter_vector,1.0)    # 47 gain p4_m2
	push!(control_parameter_vector,2.0)    # 48 order p4_m2

	#Protein 5 Oct1
	push!(control_parameter_vector,1.0)    # 49 gain p5_m2
	push!(control_parameter_vector,2.0)    # 50 order p5_m2

	#Protein 6 AhR
	push!(control_parameter_vector,1.0)    # 51 gain p6_m2
	push!(control_parameter_vector,2.0)    # 52 order p6_m2

	#Protein 7 CEBPa
	push!(control_parameter_vector,1.0)    # 53 gain p7_m2
	push!(control_parameter_vector,2.0)    # 54 order p7_m2

	#Protein 8 Gfi1
	push!(control_parameter_vector,1.0)    # 55 gain p8_m2
	push!(control_parameter_vector,2.0)    # 56 order p8_m2

	#Protein 9 EGR1
	push!(control_parameter_vector,1.0)    # 57 gain p9_m2
	push!(control_parameter_vector,2.0)    # 58 order p9_m2

	#Protein 10 PU1
	push!(control_parameter_vector,1.0)    # 59 gain p10_m2
	push!(control_parameter_vector,2.0)    # 60 order p10_m2

	#Protein 11 AP1
	push!(control_parameter_vector,1.0)    # 61 gain p11_m2
	push!(control_parameter_vector,2.0)    # 62 order p11_m2

	#Protein 12 CD38
	push!(control_parameter_vector,1.0)    # 63 gain p12_m2
	push!(control_parameter_vector,2.0)    # 64 order p12_m2

	#Protein 13 CD11b
	push!(control_parameter_vector,1.0)    # 65 gain p13_m2
	push!(control_parameter_vector,2.0)    # 66 order p13_m2

	#Protein 14 CD14
	push!(control_parameter_vector,1.0)    # 67 gain p14_m2
	push!(control_parameter_vector,2.0)    # 68 order p14_m2

	#Protein 15 p21
	push!(control_parameter_vector,1.0)    # 69 gain p15_m2
	push!(control_parameter_vector,2.0)    # 70 order p15_m2

	#Protein 16 E2F
	push!(control_parameter_vector,1.0)    # 71 gain p16_m2
	push!(control_parameter_vector,2.0)    # 72 order p16_m2

	#Protein 17 p47
	push!(control_parameter_vector,1.0)    # 73 gain p17_m2
	push!(control_parameter_vector,2.0)    # 74 order p17_m2

	#Protein 18 Oct4
	push!(control_parameter_vector,1.0)    # 75 gain p18_m2
	push!(control_parameter_vector,2.0)    # 76 order p18_m2

	# m_PPAR control parameters -
	#Protein 1 RAR
	push!(control_parameter_vector,1.0)    # 77 gain p1_m3
	push!(control_parameter_vector,2.0)    # 78 order p1_m3

	#Protein 2 VDR
	push!(control_parameter_vector,1.0)    # 79 gain p2_m3
	push!(control_parameter_vector,2.0)    # 80 order p2_m3

	#selfloop
	push!(control_parameter_vector,1.0)    # 81 gain p3_m3
	push!(control_parameter_vector,2.0)    # 82 order p3_m3

	#Protein 4 IRF1
	push!(control_parameter_vector,1.0)    # 83 gain p4_m3
	push!(control_parameter_vector,2.0)    # 84 order p4_m3

	#Protein 5 Oct1
	push!(control_parameter_vector,1.0)    # 85 gain p5_m3
	push!(control_parameter_vector,2.0)    # 86 order p5_m3

	#Protein 6 AhR
	push!(control_parameter_vector,1.0)    # 87 gain p6_m3
	push!(control_parameter_vector,2.0)    # 88 order p6_m3

	#Protein 7 CEBPa
	push!(control_parameter_vector,1.0)    # 89 gain p7_m3
	push!(control_parameter_vector,2.0)    # 90 order p7_m3

	#Protein 8 Gfi1
	push!(control_parameter_vector,1.0)    # 91 gain p8_m3
	push!(control_parameter_vector,2.0)    # 92 order p8_m3

	#Protein 9 EGR1
	push!(control_parameter_vector,1.0)    # 93 gain p9_m3
	push!(control_parameter_vector,2.0)    # 94 order p9_m3

	#Protein 10 PU1
	push!(control_parameter_vector,1.0)    # 95 gain p10_m3
	push!(control_parameter_vector,2.0)    # 96 order p10_m3

	#Protein 11 AP1
	push!(control_parameter_vector,1.0)    # 97 gain p11_m3
	push!(control_parameter_vector,2.0)    # 98 order p11_m3

	#Protein 12 CD38
	push!(control_parameter_vector,1.0)    # 99 gain p12_m3
	push!(control_parameter_vector,2.0)    # 100 order p12_m3

	#Protein 13 CD11b
	push!(control_parameter_vector,1.0)    # 101 gain p13_m3
	push!(control_parameter_vector,2.0)    # 102 order p13_m3

	#Protein 14 CD14
	push!(control_parameter_vector,1.0)    # 103 gain p14_m3
	push!(control_parameter_vector,2.0)    # 104 order p14_m3

	#Protein 15 p21
	push!(control_parameter_vector,1.0)    # 105 gain p15_m3
	push!(control_parameter_vector,2.0)    # 106 order p15_m3

	#Protein 16 E2F
	push!(control_parameter_vector,1.0)    # 107 gain p16_m3
	push!(control_parameter_vector,2.0)    # 108 order p16_m3

	#Protein 17 p47
	push!(control_parameter_vector,1.0)    # 109 gain p17_m3
	push!(control_parameter_vector,2.0)    # 110 order p17_m3

	#Protein 18 Oct4
	push!(control_parameter_vector,1.0)    # 111 gain p18_m3
	push!(control_parameter_vector,2.0)    # 112 order p18_m3


	# m_IRF1 control parameters -
	#Protein 1 RAR
	push!(control_parameter_vector,1.0)    # 113 gain p1_m4
	push!(control_parameter_vector,2.0)    # 114 order p1_m4

	#Protein 2 VDR
	push!(control_parameter_vector,1.0)    # 115 gain p2_m4
	push!(control_parameter_vector,2.0)    # 116 order p2_m4

	#Protein 3 PPAR
	push!(control_parameter_vector,1.0)    # 117 gain p3_m4
	push!(control_parameter_vector,2.0)    # 118 order p3_m4

	#selfloop
	push!(control_parameter_vector,1.0)    # 119 gain p4_m4
	push!(control_parameter_vector,2.0)    # 120 order p4_m4

	#Protein 5 Oct1
	push!(control_parameter_vector,1.0)    # 121 gain p5_m4
	push!(control_parameter_vector,2.0)    # 122 order p5_m4

	#Protein 6 AhR
	push!(control_parameter_vector,1.0)    # 123 gain p6_m4
	push!(control_parameter_vector,2.0)    # 124 order p6_m4

	#Protein 7 CEBPa
	push!(control_parameter_vector,1.0)    # 125 gain p7_m4
	push!(control_parameter_vector,2.0)    # 126 order p7_m4

	#Protein 8 Gfi1
	push!(control_parameter_vector,1.0)    # 127 gain p8_m4
	push!(control_parameter_vector,2.0)    # 128 order p8_m4

	#Protein 9 EGR1
	push!(control_parameter_vector,1.0)    # 129 gain p9_m4
	push!(control_parameter_vector,2.0)    # 130 order p9_m4

	#Protein 10 PU1
	push!(control_parameter_vector,1.0)    # 131 gain p10_m4
	push!(control_parameter_vector,2.0)    # 132 order p10_m4

	#Protein 11 AP1
	push!(control_parameter_vector,1.0)    # 133 gain p11_m4
	push!(control_parameter_vector,2.0)    # 134 order p11_m4

	#Protein 12 CD38
	push!(control_parameter_vector,1.0)    # 135 gain p12_m4
	push!(control_parameter_vector,2.0)    # 136 order p12_m4

	#Protein 13 CD11b
	push!(control_parameter_vector,1.0)    # 137 gain p13_m4
	push!(control_parameter_vector,2.0)    # 138 order p13_m4

	#Protein 14 CD14
	push!(control_parameter_vector,1.0)    # 139 gain p14_m4
	push!(control_parameter_vector,2.0)    # 140 order p14_m4

	#Protein 15 p21
	push!(control_parameter_vector,1.0)    # 141 gain p15_m4
	push!(control_parameter_vector,2.0)    # 142 order p15_m4

	#Protein 16 E2F
	push!(control_parameter_vector,1.0)    # 143 gain p16_m4
	push!(control_parameter_vector,2.0)    # 144 order p16_m4

	#Protein 17 p47
	push!(control_parameter_vector,1.0)    # 145 gain p17_m4
	push!(control_parameter_vector,2.0)    # 146 order p17_m4

	#Protein 18 Oct4
	push!(control_parameter_vector,1.0)    # 147 gain p18_m4
	push!(control_parameter_vector,2.0)    # 148 order p18_m4

	# m_Oct1 control parameters -
	#Protein 1 RAR
	push!(control_parameter_vector,1.0)    # 149 gain p1_m5
	push!(control_parameter_vector,2.0)    # 150 order p1_m5

	#Protein 2 VDR
	push!(control_parameter_vector,1.0)    # 151 gain p2_m5
	push!(control_parameter_vector,2.0)    # 152 order p2_m5

	#Protein 3 PPAR
	push!(control_parameter_vector,1.0)    # 153 gain p3_m5
	push!(control_parameter_vector,2.0)    # 154 order p3_m5

	#Protein 4 IRF1
	push!(control_parameter_vector,1.0)    # 155 gain p4_m5
	push!(control_parameter_vector,2.0)    # 156 order p4_m5

	#selfloop
	push!(control_parameter_vector,1.0)    # 157 gain p5_m5
	push!(control_parameter_vector,2.0)    # 158 order p5_m5

	#Protein 6 AhR
	push!(control_parameter_vector,1.0)    # 159 gain p6_m5
	push!(control_parameter_vector,2.0)    # 160 order p6_m5

	#Protein 7 CEBPa
	push!(control_parameter_vector,1.0)    # 161 gain p7_m5
	push!(control_parameter_vector,2.0)    # 162 order p7_m5

	#Protein 8 Gfi1
	push!(control_parameter_vector,1.0)    # 163 gain p8_m5
	push!(control_parameter_vector,2.0)    # 164 order p8_m5

	#Protein 9 EGR1
	push!(control_parameter_vector,1.0)    # 165 gain p9_m5
	push!(control_parameter_vector,2.0)    # 166 order p9_m5

	#Protein 10 PU1
	push!(control_parameter_vector,1.0)    # 167 gain p10_m5
	push!(control_parameter_vector,2.0)    # 168 order p10_m5

	#Protein 11 AP1
	push!(control_parameter_vector,1.0)    # 169 gain p11_m5
	push!(control_parameter_vector,2.0)    # 170 order p11_m5

	#Protein 12 CD38
	push!(control_parameter_vector,1.0)    # 171 gain p12_m5
	push!(control_parameter_vector,2.0)    # 172 order p12_m5

	#Protein 13 CD11b
	push!(control_parameter_vector,1.0)    # 173 gain p13_m5
	push!(control_parameter_vector,2.0)    # 174 order p13_m5

	#Protein 14 CD14
	push!(control_parameter_vector,1.0)    # 175 gain p14_m5
	push!(control_parameter_vector,2.0)    # 176 order p14_m5

	#Protein 15 p21
	push!(control_parameter_vector,1.0)    # 177 gain p15_m5
	push!(control_parameter_vector,2.0)    # 178 order p15_m5

	#Protein 16 E2F
	push!(control_parameter_vector,1.0)    # 179 gain p16_m5
	push!(control_parameter_vector,2.0)    # 180 order p16_m5

	#Protein 17 p47
	push!(control_parameter_vector,1.0)    # 181 gain p17_m5
	push!(control_parameter_vector,2.0)    # 182 order p17_m5

	#Protein 18 Oct4
	push!(control_parameter_vector,1.0)    # 183 gain p18_m5
	push!(control_parameter_vector,2.0)    # 184 order p18_m5

	# m_AhR control parameters -
	#Protein 1 RAR
	push!(control_parameter_vector,1.0)    # 185 gain p1_m6
	push!(control_parameter_vector,2.0)    # 186 order p1_m6

	#Protein 2 VDR
	push!(control_parameter_vector,1.0)    # 187 gain p2_m6
	push!(control_parameter_vector,2.0)    # 188 order p2_m6

	#Protein 3 PPAR
	push!(control_parameter_vector,1.0)    # 189 gain p3_m6
	push!(control_parameter_vector,2.0)    # 190 order p3_m6

	#Protein 4 IRF1
	push!(control_parameter_vector,1.0)    # 191 gain p4_m6
	push!(control_parameter_vector,2.0)    # 192 order p4_m6

	#Protein 5 Oct1
	push!(control_parameter_vector,1.0)    # 193 gain p5_m6
	push!(control_parameter_vector,2.0)    # 194 order p5_m6

	#selfloop
	push!(control_parameter_vector,1.0)    # 195 gain p6_m6
	push!(control_parameter_vector,2.0)    # 196 order p6_m6

	#Protein 7 CEBPa
	push!(control_parameter_vector,1.0)    # 197 gain p7_m6
	push!(control_parameter_vector,2.0)    # 198 order p7_m6

	#Protein 8 Gfi1
	push!(control_parameter_vector,1.0)    # 199 gain p8_m6
	push!(control_parameter_vector,2.0)    # 200 order p8_m6

	#Protein 9 EGR1
	push!(control_parameter_vector,1.0)    # 201 gain p9_m6
	push!(control_parameter_vector,2.0)    # 202 order p9_m6

	#Protein 10 PU1
	push!(control_parameter_vector,1.0)    # 203 gain p10_m6
	push!(control_parameter_vector,2.0)    # 204 order p10_m6

	#Protein 11 AP1
	push!(control_parameter_vector,1.0)    # 205 gain p11_m6
	push!(control_parameter_vector,2.0)    # 206 order p11_m6

	#Protein 12 CD38
	push!(control_parameter_vector,1.0)    # 207 gain p12_m6
	push!(control_parameter_vector,2.0)    # 208 order p12_m6

	#Protein 13 CD11b
	push!(control_parameter_vector,1.0)    # 209 gain p13_m6
	push!(control_parameter_vector,2.0)    # 210 order p13_m6

	#Protein 14 CD14
	push!(control_parameter_vector,1.0)    # 211 gain p14_m6
	push!(control_parameter_vector,2.0)    # 212 order p14_m6

	#Protein 15 p21
	push!(control_parameter_vector,1.0)    # 213 gain p15_m6
	push!(control_parameter_vector,2.0)    # 214 order p15_m6

	#Protein 16 E2F
	push!(control_parameter_vector,1.0)    # 215 gain p16_m6
	push!(control_parameter_vector,2.0)    # 216 order p16_m6

	#Protein 17 p47
	push!(control_parameter_vector,1.0)    # 217 gain p17_m6
	push!(control_parameter_vector,2.0)    # 218 order p17_m6

	#Protein 18 Oct4
	push!(control_parameter_vector,1.0)    # 219 gain p18_m6
	push!(control_parameter_vector,2.0)    # 220 order p18_m6

	# m_CEBPa control parameters -
	#Protein 1 RAR
	push!(control_parameter_vector,1.0)    # 221 gain p1_m7
	push!(control_parameter_vector,2.0)    # 222 order p1_m7

	#Protein 2 VDR
	push!(control_parameter_vector,1.0)    # 223 gain p2_m7
	push!(control_parameter_vector,2.0)    # 224 order p2_m7

	#Protein 3 PPAR
	push!(control_parameter_vector,1.0)    # 225 gain p3_m7
	push!(control_parameter_vector,2.0)    # 226 order p3_m7

	#Protein 4 IRF1
	push!(control_parameter_vector,1.0)    # 227 gain p4_m7
	push!(control_parameter_vector,2.0)    # 228 order p4_m7

	#Protein 5 Oct1
	push!(control_parameter_vector,1.0)    # 229 gain p5_m7
	push!(control_parameter_vector,2.0)    # 230 order p5_m7

	#Protein 6 AhR
	push!(control_parameter_vector,1.0)    # 231 gain p6_m7
	push!(control_parameter_vector,2.0)    # 232 order p6_m7

	#selfloop
	push!(control_parameter_vector,1.0)    # 233 gain p7_m7
	push!(control_parameter_vector,2.0)    # 234 order p7_m7

	#Protein 8 Gfi1
	push!(control_parameter_vector,1.0)    # 235 gain p8_m7
	push!(control_parameter_vector,2.0)    # 236 order p8_m7

	#Protein 9 EGR1
	push!(control_parameter_vector,1.0)    # 237 gain p9_m7
	push!(control_parameter_vector,2.0)    # 238 order p9_m7

	#Protein 10 PU1
	push!(control_parameter_vector,1.0)    # 239 gain p10_m7
	push!(control_parameter_vector,2.0)    # 240 order p10_m7

	#Protein 11 AP1
	push!(control_parameter_vector,1.0)    # 241 gain p11_m7
	push!(control_parameter_vector,2.0)    # 242 order p11_m7

	#Protein 12 CD38
	push!(control_parameter_vector,1.0)    # 243 gain p12_m7
	push!(control_parameter_vector,2.0)    # 244 order p12_m7

	#Protein 13 CD11b
	push!(control_parameter_vector,1.0)    # 245 gain p13_m7
	push!(control_parameter_vector,2.0)    # 246 order p13_m7

	#Protein 14 CD14
	push!(control_parameter_vector,1.0)    # 247 gain p14_m7
	push!(control_parameter_vector,2.0)    # 248 order p14_m7

	#Protein 15 p21
	push!(control_parameter_vector,1.0)    # 249 gain p15_m7
	push!(control_parameter_vector,2.0)    # 250 order p15_m7

	#Protein 16 E2F
	push!(control_parameter_vector,1.0)    # 251 gain p16_m7
	push!(control_parameter_vector,2.0)    # 252 order p16_m7

	#Protein 17 p47
	push!(control_parameter_vector,1.0)    # 253 gain p17_m7
	push!(control_parameter_vector,2.0)    # 254 order p17_m7

	#Protein 18 Oct4
	push!(control_parameter_vector,1.0)    # 255 gain p18_m7
	push!(control_parameter_vector,2.0)    # 256 order p18_m7

	# m_Gfi1 control parameters -
	#Protein 1 RAR
	push!(control_parameter_vector,1.0)    # 257 gain p1_m8
	push!(control_parameter_vector,2.0)    # 258 order p1_m8

	#Protein 2 VDR
	push!(control_parameter_vector,1.0)    # 259 gain p2_m8
	push!(control_parameter_vector,2.0)    # 260 order p2_m8

	#Protein 3 PPAR
	push!(control_parameter_vector,1.0)    # 261 gain p3_m8
	push!(control_parameter_vector,2.0)    # 262 order p3_m8

	#Protein 4 IRF1
	push!(control_parameter_vector,1.0)    # 263 gain p4_m8
	push!(control_parameter_vector,2.0)    # 264 order p4_m8

	#Protein 5 Oct1
	push!(control_parameter_vector,1.0)    # 265 gain p5_m8
	push!(control_parameter_vector,2.0)    # 266 order p5_m8

	#Protein 6 AhR
	push!(control_parameter_vector,1.0)    # 267 gain p6_m8
	push!(control_parameter_vector,2.0)    # 268 order p6_m8

	#Protein 7 CEBPa
	push!(control_parameter_vector,1.0)    # 269 gain p7_m8
	push!(control_parameter_vector,2.0)    # 270 order p7_m8

	#selfloop
	push!(control_parameter_vector,1.0)    # 271 gain p8_m8
	push!(control_parameter_vector,2.0)    # 272 order p8_m8

	#Protein 9 EGR1
	push!(control_parameter_vector,1.0)    # 273 gain p9_m8
	push!(control_parameter_vector,2.0)    # 274 order p9_m8

	#Protein 10 PU1
	push!(control_parameter_vector,1.0)    # 275 gain p10_m8
	push!(control_parameter_vector,2.0)    # 276 order p10_m8

	#Protein 11 AP1
	push!(control_parameter_vector,1.0)    # 277 gain p11_m8
	push!(control_parameter_vector,2.0)    # 278 order p11_m8

	#Protein 12 CD38
	push!(control_parameter_vector,1.0)    # 279 gain p12_m8
	push!(control_parameter_vector,2.0)    # 280 order p12_m8

	#Protein 13 CD11b
	push!(control_parameter_vector,1.0)    # 281 gain p13_m8
	push!(control_parameter_vector,2.0)    # 282 order p13_m8

	#Protein 14 CD14
	push!(control_parameter_vector,1.0)    # 283 gain p14_m8
	push!(control_parameter_vector,2.0)    # 284 order p14_m8

	#Protein 15 p21
	push!(control_parameter_vector,1.0)    # 285 gain p15_m8
	push!(control_parameter_vector,2.0)    # 286 order p15_m8

	#Protein 16 E2F
	push!(control_parameter_vector,1.0)    # 287 gain p16_m8
	push!(control_parameter_vector,2.0)    # 288 order p16_m8

	#Protein 17 p47
	push!(control_parameter_vector,1.0)    # 289 gain p17_m8
	push!(control_parameter_vector,2.0)    # 290 order p17_m8

	#Protein 18 Oct4
	push!(control_parameter_vector,1.0)    # 291 gain p18_m8
	push!(control_parameter_vector,2.0)    # 292 order p18_m8

	# m_EGR1 control parameters -
	#Protein 1 RAR
	push!(control_parameter_vector,1.0)    # 293 gain p1_m9
	push!(control_parameter_vector,2.0)    # 294 order p1_m9

	#Protein 2 VDR
	push!(control_parameter_vector,1.0)    # 295 gain p2_m9
	push!(control_parameter_vector,2.0)    # 296 order p2_m9

	#Protein 3 PPAR
	push!(control_parameter_vector,1.0)    # 297 gain p3_m9
	push!(control_parameter_vector,2.0)    # 298 order p3_m9

	#Protein 4 IRF1
	push!(control_parameter_vector,1.0)    # 299 gain p4_m9
	push!(control_parameter_vector,2.0)    # 300 order p4_m9

	#Protein 5 Oct1
	push!(control_parameter_vector,1.0)    # 301 gain p5_m9
	push!(control_parameter_vector,2.0)    # 302 order p5_m9

	#Protein 6 AhR
	push!(control_parameter_vector,1.0)    # 303 gain p6_m9
	push!(control_parameter_vector,2.0)    # 304 order p6_m9

	#Protein 7 CEBPa
	push!(control_parameter_vector,1.0)    # 305 gain p7_m9
	push!(control_parameter_vector,2.0)    # 306 order p7_m9

	#Protein 8 Gfi1
	push!(control_parameter_vector,1.0)    # 307 gain p8_m9
	push!(control_parameter_vector,2.0)    # 308 order p8_m9

	#selfloop
	push!(control_parameter_vector,1.0)    # 309 gain p9_m9
	push!(control_parameter_vector,2.0)    # 310 order p9_m9

	#Protein 10 PU1
	push!(control_parameter_vector,1.0)    # 311 gain p10_m9
	push!(control_parameter_vector,2.0)    # 312 order p10_m9

	#Protein 11 AP1
	push!(control_parameter_vector,1.0)    # 313 gain p11_m9
	push!(control_parameter_vector,2.0)    # 314 order p11_m9

	#Protein 12 CD38
	push!(control_parameter_vector,1.0)    # 315 gain p12_m9
	push!(control_parameter_vector,2.0)    # 316 order p12_m9

	#Protein 13 CD11b
	push!(control_parameter_vector,1.0)    # 317 gain p13_m9
	push!(control_parameter_vector,2.0)    # 318 order p13_m9

	#Protein 14 CD14
	push!(control_parameter_vector,1.0)    # 319 gain p14_m9
	push!(control_parameter_vector,2.0)    # 320 order p14_m9

	#Protein 15 p21
	push!(control_parameter_vector,1.0)    # 321 gain p15_m9
	push!(control_parameter_vector,2.0)    # 322 order p15_m9

	#Protein 16 E2F
	push!(control_parameter_vector,1.0)    # 323 gain p16_m9
	push!(control_parameter_vector,2.0)    # 324 order p16_m9

	#Protein 17 p47
	push!(control_parameter_vector,1.0)    # 325 gain p17_m9
	push!(control_parameter_vector,2.0)    # 326 order p17_m9

	#Protein 18 Oct4
	push!(control_parameter_vector,1.0)    # 327 gain p18_m9
	push!(control_parameter_vector,2.0)    # 328 order p18_m9

	# m_PU1 control parameters -
	#Protein 1 RAR
	push!(control_parameter_vector,1.0)    # 329 gain p1_m10
	push!(control_parameter_vector,2.0)    # 330 order p1_m10

	#Protein 2 VDR
	push!(control_parameter_vector,1.0)    # 331 gain p2_m10
	push!(control_parameter_vector,2.0)    # 332 order p2_m10

	#Protein 3 PPAR
	push!(control_parameter_vector,1.0)    # 333 gain p3_m10
	push!(control_parameter_vector,2.0)    # 334 order p3_m10

	#Protein 4 IRF1
	push!(control_parameter_vector,1.0)    # 335 gain p4_m10
	push!(control_parameter_vector,2.0)    # 336 order p4_m10

	#Protein 5 Oct1
	push!(control_parameter_vector,1.0)    # 337 gain p5_m10
	push!(control_parameter_vector,2.0)    # 338 order p5_m10

	#Protein 6 AhR
	push!(control_parameter_vector,1.0)    # 339 gain p6_m10
	push!(control_parameter_vector,2.0)    # 340 order p6_m10

	#Protein 7 CEBPa
	push!(control_parameter_vector,1.0)    # 341 gain p7_m10
	push!(control_parameter_vector,2.0)    # 342 order p7_m10

	#Protein 8 Gfi1
	push!(control_parameter_vector,1.0)    # 343 gain p8_m10
	push!(control_parameter_vector,2.0)    # 344 order p8_m10

	#Protein 9 EGR1
	push!(control_parameter_vector,1.0)    # 345 gain p9_m10
	push!(control_parameter_vector,2.0)    # 346 order p9_m10

	#selfloop
	push!(control_parameter_vector,1.0)    # 347 gain p10_m10
	push!(control_parameter_vector,2.0)    # 348 order p10_m10

	#Protein 11 AP1
	push!(control_parameter_vector,1.0)    # 349 gain p11_m10
	push!(control_parameter_vector,2.0)    # 350 order p11_m10

	#Protein 12 CD38
	push!(control_parameter_vector,1.0)    # 351 gain p12_m10
	push!(control_parameter_vector,2.0)    # 352 order p12_m10

	#Protein 13 CD11b
	push!(control_parameter_vector,1.0)    # 353 gain p13_m10
	push!(control_parameter_vector,2.0)    # 354 order p13_m10

	#Protein 14 CD14
	push!(control_parameter_vector,1.0)    # 355 gain p14_m10
	push!(control_parameter_vector,2.0)    # 356 order p14_m10

	#Protein 15 p21
	push!(control_parameter_vector,1.0)    # 357 gain p15_m10
	push!(control_parameter_vector,2.0)    # 358 order p15_m10

	#Protein 16 E2F
	push!(control_parameter_vector,1.0)    # 359 gain p16_m10
	push!(control_parameter_vector,2.0)    # 360 order p16_m10

	#Protein 17 p47
	push!(control_parameter_vector,1.0)    # 361 gain p17_m10
	push!(control_parameter_vector,2.0)    # 362 order p17_m10

	#Protein 18 Oct4
	push!(control_parameter_vector,1.0)    # 363 gain p18_m10
	push!(control_parameter_vector,2.0)    # 364 order p18_m10

	# m_AP1 control parameters -
	#Protein 1 RAR
	push!(control_parameter_vector,1.0)    # 365 gain p1_m11
	push!(control_parameter_vector,2.0)    # 366 order p1_m11

	#Protein 2 VDR
	push!(control_parameter_vector,1.0)    # 367 gain p2_m11
	push!(control_parameter_vector,2.0)    # 368 order p2_m11

	#Protein 3 PPAR
	push!(control_parameter_vector,1.0)    # 369 gain p3_m11
	push!(control_parameter_vector,2.0)    # 370 order p3_m11

	#Protein 4 IRF1
	push!(control_parameter_vector,1.0)    # 371 gain p4_m11
	push!(control_parameter_vector,2.0)    # 372 order p4_m11

	#Protein 5 Oct1
	push!(control_parameter_vector,1.0)    # 373 gain p5_m11
	push!(control_parameter_vector,2.0)    # 374 order p5_m11

	#Protein 6 AhR
	push!(control_parameter_vector,1.0)    # 375 gain p6_m11
	push!(control_parameter_vector,2.0)    # 376 order p6_m11

	#Protein 7 CEBPa
	push!(control_parameter_vector,1.0)    # 377 gain p7_m11
	push!(control_parameter_vector,2.0)    # 378 order p7_m11

	#Protein 8 Gfi1
	push!(control_parameter_vector,1.0)    # 379 gain p8_m11
	push!(control_parameter_vector,2.0)    # 380 order p8_m11

	#Protein 9 EGR1
	push!(control_parameter_vector,1.0)    # 381 gain p9_m11
	push!(control_parameter_vector,2.0)    # 382 order p9_m11

	#Protein 10 PU1
	push!(control_parameter_vector,1.0)    # 383 gain p10_m11
	push!(control_parameter_vector,2.0)    # 384 order p10_m11

	#selfloop
	push!(control_parameter_vector,1.0)    # 385 gain p11_m11
	push!(control_parameter_vector,2.0)    # 386 order p11_m11

	#Protein 12 CD38
	push!(control_parameter_vector,1.0)    # 387 gain p12_m11
	push!(control_parameter_vector,2.0)    # 388 order p12_m11

	#Protein 13 CD11b
	push!(control_parameter_vector,1.0)    # 389 gain p13_m11
	push!(control_parameter_vector,2.0)    # 390 order p13_m11

	#Protein 14 CD14
	push!(control_parameter_vector,1.0)    # 391 gain p14_m11
	push!(control_parameter_vector,2.0)    # 392 order p14_m11

	#Protein 15 p21
	push!(control_parameter_vector,1.0)    # 393 gain p15_m11
	push!(control_parameter_vector,2.0)    # 394 order p15_m11

	#Protein 16 E2F
	push!(control_parameter_vector,1.0)    # 395 gain p16_m11
	push!(control_parameter_vector,2.0)    # 396 order p16_m11

	#Protein 17 p47
	push!(control_parameter_vector,1.0)    # 397 gain p17_m11
	push!(control_parameter_vector,2.0)    # 398 order p17_m11

	#Protein 18 Oct4
	push!(control_parameter_vector,1.0)    # 399 gain p18_m11
	push!(control_parameter_vector,2.0)    # 400 order p18_m11

	# m_CD38 control parameters -
	#Protein 1 RAR
	push!(control_parameter_vector,1.0)    # 401 gain p1_m12
	push!(control_parameter_vector,2.0)    # 402 order p1_m12

	#Protein 2 VDR
	push!(control_parameter_vector,1.0)    # 403 gain p2_m12
	push!(control_parameter_vector,2.0)    # 404 order p2_m12

	#Protein 3 PPAR
	push!(control_parameter_vector,1.0)    # 405 gain p3_m12
	push!(control_parameter_vector,2.0)    # 406 order p3_m12

	#Protein 4 IRF1
	push!(control_parameter_vector,1.0)    # 407 gain p4_m12
	push!(control_parameter_vector,2.0)    # 408 order p4_m12

	#Protein 5 Oct1
	push!(control_parameter_vector,1.0)    # 409 gain p5_m12
	push!(control_parameter_vector,2.0)    # 410 order p5_m12

	#Protein 6 AhR
	push!(control_parameter_vector,1.0)    # 411 gain p6_m12
	push!(control_parameter_vector,2.0)    # 412 order p6_m12

	#Protein 7 CEBPa
	push!(control_parameter_vector,1.0)    # 413 gain p7_m12
	push!(control_parameter_vector,2.0)    # 414 order p7_m12

	#Protein 8 Gfi1
	push!(control_parameter_vector,1.0)    # 415 gain p8_m12
	push!(control_parameter_vector,2.0)    # 416 order p8_m12

	#Protein 9 EGR1
	push!(control_parameter_vector,1.0)    # 417 gain p9_m12
	push!(control_parameter_vector,2.0)    # 418 order p9_m12

	#Protein 10 PU1
	push!(control_parameter_vector,1.0)    # 419 gain p10_m12
	push!(control_parameter_vector,2.0)    # 420 order p10_m12

	#Protein 11 AP1
	push!(control_parameter_vector,1.0)    # 421 gain p11_m12
	push!(control_parameter_vector,2.0)    # 422 order p11_m12

	#selfloop
	push!(control_parameter_vector,1.0)    # 423 gain p12_m12
	push!(control_parameter_vector,2.0)    # 424 order p12_m12

	#Protein 13 CD11b
	push!(control_parameter_vector,1.0)    # 425 gain p13_m12
	push!(control_parameter_vector,2.0)    # 426 order p13_m12

	#Protein 14 CD14
	push!(control_parameter_vector,1.0)    # 427 gain p14_m12
	push!(control_parameter_vector,2.0)    # 428 order p14_m12

	#Protein 15 p21
	push!(control_parameter_vector,1.0)    # 429 gain p15_m12
	push!(control_parameter_vector,2.0)    # 430 order p15_m12

	#Protein 16 E2F
	push!(control_parameter_vector,1.0)    # 431 gain p16_m12
	push!(control_parameter_vector,2.0)    # 432 order p16_m12

	#Protein 17 p47
	push!(control_parameter_vector,1.0)    # 433 gain p17_m12
	push!(control_parameter_vector,2.0)    # 434 order p17_m12

	#Protein 18 Oct4
	push!(control_parameter_vector,1.0)    # 435 gain p18_m12
	push!(control_parameter_vector,2.0)    # 436 order p18_m12

	# m_CD11b control parameters -
	#Protein 1 RAR
	push!(control_parameter_vector,1.0)    # 437 gain p1_m13
	push!(control_parameter_vector,2.0)    # 438 order p1_m13

	#Protein 2 VDR
	push!(control_parameter_vector,1.0)    # 439 gain p2_m13
	push!(control_parameter_vector,2.0)    # 440 order p2_m13

	#Protein 3 PPAR
	push!(control_parameter_vector,1.0)    # 441 gain p3_m13
	push!(control_parameter_vector,2.0)    # 442 order p3_m13

	#Protein 4 IRF1
	push!(control_parameter_vector,1.0)    # 443 gain p4_m13
	push!(control_parameter_vector,2.0)    # 444 order p4_m13

	#Protein 5 Oct1
	push!(control_parameter_vector,1.0)    # 445 gain p5_m13
	push!(control_parameter_vector,2.0)    # 446 order p5_m13

	#Protein 6 AhR
	push!(control_parameter_vector,1.0)    # 447 gain p6_m13
	push!(control_parameter_vector,2.0)    # 448 order p6_m13

	#Protein 7 CEBPa
	push!(control_parameter_vector,1.0)    # 449 gain p7_m13
	push!(control_parameter_vector,2.0)    # 450 order p7_m13

	#Protein 8 Gfi1
	push!(control_parameter_vector,1.0)    # 451 gain p8_m13
	push!(control_parameter_vector,2.0)    # 452 order p8_m13

	#Protein 9 EGR1
	push!(control_parameter_vector,1.0)    # 453 gain p9_m13
	push!(control_parameter_vector,2.0)    # 454 order p9_m13

	#Protein 10 PU1
	push!(control_parameter_vector,1.0)    # 455 gain p10_m13
	push!(control_parameter_vector,2.0)    # 456 order p10_m13

	#Protein 11 AP1
	push!(control_parameter_vector,1.0)    # 457 gain p11_m13
	push!(control_parameter_vector,2.0)    # 458 order p11_m13

	#Protein 12 CD38
	push!(control_parameter_vector,1.0)    # 459 gain p12_m13
	push!(control_parameter_vector,2.0)    # 460 order p12_m13

	#selfloop
	push!(control_parameter_vector,1.0)    # 461 gain p13_m13
	push!(control_parameter_vector,2.0)    # 462 order p13_m13

	#Protein 14 CD14
	push!(control_parameter_vector,1.0)    # 463 gain p14_m13
	push!(control_parameter_vector,2.0)    # 464 order p14_m13

	#Protein 15 p21
	push!(control_parameter_vector,1.0)    # 465 gain p15_m13
	push!(control_parameter_vector,2.0)    # 466 order p15_m13

	#Protein 16 E2F
	push!(control_parameter_vector,1.0)    # 467 gain p16_m13
	push!(control_parameter_vector,2.0)    # 468 order p16_m13

	#Protein 17 p47
	push!(control_parameter_vector,1.0)    # 469 gain p17_m13
	push!(control_parameter_vector,2.0)    # 470 order p17_m13

	#Protein 18 Oct4
	push!(control_parameter_vector,1.0)    # 471 gain p18_m13
	push!(control_parameter_vector,2.0)    # 472 order p18_m13

	# m_CD14 control parameters -
	#Protein 1 RAR
	push!(control_parameter_vector,1.0)    # 473 gain p1_m14
	push!(control_parameter_vector,2.0)    # 474 order p1_m14

	#Protein 2 VDR
	push!(control_parameter_vector,1.0)    # 475 gain p2_m14
	push!(control_parameter_vector,2.0)    # 476 order p2_m14

	#Protein 3 PPAR
	push!(control_parameter_vector,1.0)    # 477 gain p3_m14
	push!(control_parameter_vector,2.0)    # 478 order p3_m14

	#Protein 4 IRF1
	push!(control_parameter_vector,1.0)    # 479 gain p4_m14
	push!(control_parameter_vector,2.0)    # 480 order p4_m14

	#Protein 5 Oct1
	push!(control_parameter_vector,1.0)    # 481 gain p5_m14
	push!(control_parameter_vector,2.0)    # 482 order p5_m14

	#Protein 6 AhR
	push!(control_parameter_vector,1.0)    # 483 gain p6_m14
	push!(control_parameter_vector,2.0)    # 484 order p6_m14

	#Protein 7 CEBPa
	push!(control_parameter_vector,1.0)    # 485 gain p7_m14
	push!(control_parameter_vector,2.0)    # 486 order p7_m14

	#Protein 8 Gfi1
	push!(control_parameter_vector,1.0)    # 487 gain p8_m14
	push!(control_parameter_vector,2.0)    # 488 order p8_m14

	#Protein 9 EGR1
	push!(control_parameter_vector,1.0)    # 489 gain p9_m14
	push!(control_parameter_vector,2.0)    # 490 order p9_m14

	#Protein 10 PU1
	push!(control_parameter_vector,1.0)    # 491 gain p10_m14
	push!(control_parameter_vector,2.0)    # 492 order p10_m14

	#Protein 11 AP1
	push!(control_parameter_vector,1.0)    # 493 gain p11_m14
	push!(control_parameter_vector,2.0)    # 494 order p11_m14

	#Protein 12 CD38
	push!(control_parameter_vector,1.0)    # 495 gain p12_m14
	push!(control_parameter_vector,2.0)    # 496 order p12_m14

	#Protein 13 CD11b
	push!(control_parameter_vector,1.0)    # 497 gain p13_m14
	push!(control_parameter_vector,2.0)    # 498 order p13_m14

	#selfloop
	push!(control_parameter_vector,1.0)    # 499 gain p14_m14
	push!(control_parameter_vector,2.0)    # 500 order p14_m14

	#Protein 15 p21
	push!(control_parameter_vector,1.0)    # 501 gain p15_m14
	push!(control_parameter_vector,2.0)    # 502 order p15_m14

	#Protein 16 E2F
	push!(control_parameter_vector,1.0)    # 503 gain p16_m14
	push!(control_parameter_vector,2.0)    # 504 order p16_m14

	#Protein 17 p47
	push!(control_parameter_vector,1.0)    # 505 gain p17_m14
	push!(control_parameter_vector,2.0)    # 506 order p17_m14

	#Protein 18 Oct4
	push!(control_parameter_vector,1.0)    # 507 gain p18_m14
	push!(control_parameter_vector,2.0)    # 508 order p18_m14

	# m_p21 control parameters -
	#Protein 1 RAR
	push!(control_parameter_vector,1.0)    # 509 gain p1_m15
	push!(control_parameter_vector,2.0)    # 510 order p1_m15

	#Protein 2 VDR
	push!(control_parameter_vector,1.0)    # 511 gain p2_m15
	push!(control_parameter_vector,2.0)    # 512 order p2_m15

	#Protein 3 PPAR
	push!(control_parameter_vector,1.0)    # 513 gain p3_m15
	push!(control_parameter_vector,2.0)    # 514 order p3_m15

	#Protein 4 IRF1
	push!(control_parameter_vector,1.0)    # 515 gain p4_m15
	push!(control_parameter_vector,2.0)    # 516 order p4_m15

	#Protein 5 Oct1
	push!(control_parameter_vector,1.0)    # 517 gain p5_m15
	push!(control_parameter_vector,2.0)    # 518 order p5_m15

	#Protein 6 AhR
	push!(control_parameter_vector,1.0)    # 519 gain p6_m15
	push!(control_parameter_vector,2.0)    # 520 order p6_m15

	#Protein 7 CEBPa
	push!(control_parameter_vector,1.0)    # 521 gain p7_m15
	push!(control_parameter_vector,2.0)    # 522 order p7_m15

	#Protein 8 Gfi1
	push!(control_parameter_vector,1.0)    # 523 gain p8_m15
	push!(control_parameter_vector,2.0)    # 524 order p8_m15

	#Protein 9 EGR1
	push!(control_parameter_vector,1.0)    # 525 gain p9_m15
	push!(control_parameter_vector,2.0)    # 526 order p9_m15

	#Protein 10 PU1
	push!(control_parameter_vector,1.0)    # 527 gain p10_m15
	push!(control_parameter_vector,2.0)    # 528 order p10_m15

	#Protein 11 AP1
	push!(control_parameter_vector,1.0)    # 529 gain p11_m15
	push!(control_parameter_vector,2.0)    # 530 order p11_m15

	#Protein 12 CD38
	push!(control_parameter_vector,1.0)    # 531 gain p12_m15
	push!(control_parameter_vector,2.0)    # 532 order p12_m15

	#Protein 13 CD11b
	push!(control_parameter_vector,1.0)    # 533 gain p13_m15
	push!(control_parameter_vector,2.0)    # 534 order p13_m15

	#Protein 14 CD14
	push!(control_parameter_vector,1.0)    # 535 gain p14_m15
	push!(control_parameter_vector,2.0)    # 536 order p14_m15

	#selfloop
	push!(control_parameter_vector,1.0)    # 537 gain p15_m15
	push!(control_parameter_vector,2.0)    # 538 order p15_m15

	#Protein 16 E2F
	push!(control_parameter_vector,1.0)    # 539 gain p16_m15
	push!(control_parameter_vector,2.0)    # 540 order p16_m15

	#Protein 17 p47
	push!(control_parameter_vector,1.0)    # 541 gain p17_m15
	push!(control_parameter_vector,2.0)    # 542 order p17_m15

	#Protein 18 Oct4
	push!(control_parameter_vector,1.0)    # 543 gain p18_m15
	push!(control_parameter_vector,2.0)    # 544 order p18_m15

	# m_E2F control parameters -
	#Protein 1 RAR
	push!(control_parameter_vector,1.0)    # 545 gain p1_m16
	push!(control_parameter_vector,2.0)    # 546 order p1_m16

	#Protein 2 VDR
	push!(control_parameter_vector,1.0)    # 547 gain p2_m16
	push!(control_parameter_vector,2.0)    # 548 order p2_m16

	#Protein 3 PPAR
	push!(control_parameter_vector,1.0)    # 549 gain p3_m16
	push!(control_parameter_vector,2.0)    # 550 order p3_m16

	#Protein 4 IRF1
	push!(control_parameter_vector,1.0)    # 551 gain p4_m16
	push!(control_parameter_vector,2.0)    # 552 order p4_m16

	#Protein 5 Oct1
	push!(control_parameter_vector,1.0)    # 553 gain p5_m16
	push!(control_parameter_vector,2.0)    # 554 order p5_m16

	#Protein 6 AhR
	push!(control_parameter_vector,1.0)    # 555 gain p6_m16
	push!(control_parameter_vector,2.0)    # 556 order p6_m16

	#Protein 7 CEBPa
	push!(control_parameter_vector,1.0)    # 557 gain p7_m16
	push!(control_parameter_vector,2.0)    # 558 order p7_m16

	#Protein 8 Gfi1
	push!(control_parameter_vector,1.0)    # 559 gain p8_m16
	push!(control_parameter_vector,2.0)    # 560 order p8_m16

	#Protein 9 EGR1
	push!(control_parameter_vector,1.0)    # 561 gain p9_m16
	push!(control_parameter_vector,2.0)    # 562 order p9_m16

	#Protein 10 PU1
	push!(control_parameter_vector,1.0)    # 563 gain p10_m16
	push!(control_parameter_vector,2.0)    # 564 order p10_m16

	#Protein 11 AP1
	push!(control_parameter_vector,1.0)    # 565 gain p11_m16
	push!(control_parameter_vector,2.0)    # 566 order p11_m16

	#Protein 12 CD38
	push!(control_parameter_vector,1.0)    # 567 gain p12_m16
	push!(control_parameter_vector,2.0)    # 568 order p12_m16

	#Protein 13 CD11b
	push!(control_parameter_vector,1.0)    # 569 gain p13_m16
	push!(control_parameter_vector,2.0)    # 570 order p13_m16

	#Protein 14 CD14
	push!(control_parameter_vector,1.0)    # 571 gain p14_m16
	push!(control_parameter_vector,2.0)    # 572 order p14_m16

	#Protein 15 p21
	push!(control_parameter_vector,1.0)    # 573 gain p15_m16
	push!(control_parameter_vector,2.0)    # 574 order p15_m16

	#selfloop
	push!(control_parameter_vector,1.0)    # 575 gain p16_m16
	push!(control_parameter_vector,2.0)    # 576 order p16_m16

	#Protein 17 p47
	push!(control_parameter_vector,1.0)    # 577 gain p17_m16
	push!(control_parameter_vector,2.0)    # 578 order p17_m16

	#Protein 18 Oct4
	push!(control_parameter_vector,1.0)    # 579 gain p18_m16
	push!(control_parameter_vector,2.0)    # 580 order p18_m16

	# m_p47 control parameters -
	#Protein 1 RAR
	push!(control_parameter_vector,1.0)    # 581 gain p1_m17
	push!(control_parameter_vector,2.0)    # 582 order p1_m17

	#Protein 2 VDR
	push!(control_parameter_vector,1.0)    # 583 gain p2_m17
	push!(control_parameter_vector,2.0)    # 584 order p2_m17

	#Protein 3 PPAR
	push!(control_parameter_vector,1.0)    # 585 gain p3_m17
	push!(control_parameter_vector,2.0)    # 586 order p3_m17

	#Protein 4 IRF1
	push!(control_parameter_vector,1.0)    # 587 gain p4_m17
	push!(control_parameter_vector,2.0)    # 588 order p4_m17

	#Protein 5 Oct1
	push!(control_parameter_vector,1.0)    # 589 gain p5_m17
	push!(control_parameter_vector,2.0)    # 590 order p5_m17

	#Protein 6 AhR
	push!(control_parameter_vector,1.0)    # 591 gain p6_m17
	push!(control_parameter_vector,2.0)    # 592 order p6_m17

	#Protein 7 CEBPa
	push!(control_parameter_vector,1.0)    # 593 gain p7_m17
	push!(control_parameter_vector,2.0)    # 594 order p7_m17

	#Protein 8 Gfi1
	push!(control_parameter_vector,1.0)    # 595 gain p8_m17
	push!(control_parameter_vector,2.0)    # 596 order p8_m17

	#Protein 9 EGR1
	push!(control_parameter_vector,1.0)    # 597 gain p9_m17
	push!(control_parameter_vector,2.0)    # 598 order p9_m17

	#Protein 10 PU1
	push!(control_parameter_vector,1.0)    # 599 gain p10_m17
	push!(control_parameter_vector,2.0)    # 600 order p10_m17

	#Protein 11 AP1
	push!(control_parameter_vector,1.0)    # 601 gain p11_m17
	push!(control_parameter_vector,2.0)    # 602 order p11_m17

	#Protein 12 CD38
	push!(control_parameter_vector,1.0)    # 603 gain p12_m17
	push!(control_parameter_vector,2.0)    # 604 order p12_m17

	#Protein 13 CD11b
	push!(control_parameter_vector,1.0)    # 605 gain p13_m17
	push!(control_parameter_vector,2.0)    # 606 order p13_m17

	#Protein 14 CD14
	push!(control_parameter_vector,1.0)    # 607 gain p14_m17
	push!(control_parameter_vector,2.0)    # 608 order p14_m17

	#Protein 15 p21
	push!(control_parameter_vector,1.0)    # 609 gain p15_m17
	push!(control_parameter_vector,2.0)    # 610 order p15_m17

	#Protein 16 E2F
	push!(control_parameter_vector,1.0)    # 611 gain p16_m17
	push!(control_parameter_vector,2.0)    # 612 order p16_m17

	#selfloop
	push!(control_parameter_vector,1.0)    # 613 gain p17_m17
	push!(control_parameter_vector,2.0)    # 614 order p17_m17

	#Protein 18 Oct4
	push!(control_parameter_vector,1.0)    # 615 gain p18_m17
	push!(control_parameter_vector,2.0)    # 616 order p18_m17

	# m_Oct4 control parameters -
	#Protein 1 RAR
	push!(control_parameter_vector,1.0)    # 617 gain p1_m18
	push!(control_parameter_vector,2.0)    # 618 order p1_m18

	#Protein 2 VDR
	push!(control_parameter_vector,1.0)    # 619 gain p2_m18
	push!(control_parameter_vector,2.0)    # 620 order p2_m18

	#Protein 3 PPAR
	push!(control_parameter_vector,1.0)    # 621 gain p3_m18
	push!(control_parameter_vector,2.0)    # 622 order p3_m18

	#Protein 4 IRF1
	push!(control_parameter_vector,1.0)    # 623 gain p4_m18
	push!(control_parameter_vector,2.0)    # 624 order p4_m18

	#Protein 5 Oct1
	push!(control_parameter_vector,1.0)    # 625 gain p5_m18
	push!(control_parameter_vector,2.0)    # 626 order p5_m18

	#Protein 6 AhR
	push!(control_parameter_vector,1.0)    # 627 gain p6_m18
	push!(control_parameter_vector,2.0)    # 628 order p6_m18

	#Protein 7 CEBPa
	push!(control_parameter_vector,1.0)    # 629 gain p7_m18
	push!(control_parameter_vector,2.0)    # 630 order p7_m18

	#Protein 8 Gfi1
	push!(control_parameter_vector,1.0)    # 631 gain p8_m18
	push!(control_parameter_vector,2.0)    # 632 order p8_m18

	#Protein 9 EGR1
	push!(control_parameter_vector,1.0)    # 633 gain p9_m18
	push!(control_parameter_vector,2.0)    # 634 order p9_m18

	#Protein 10 PU1
	push!(control_parameter_vector,1.0)    # 635 gain p10_m18
	push!(control_parameter_vector,2.0)    # 636 order p10_m18

	#Protein 11 AP1
	push!(control_parameter_vector,1.0)    # 637 gain p11_m18
	push!(control_parameter_vector,2.0)    # 638 order p11_m18

	#Protein 12 CD38
	push!(control_parameter_vector,1.0)    # 639 gain p12_m18
	push!(control_parameter_vector,2.0)    # 640 order p12_m18

	#Protein 13 CD11b
	push!(control_parameter_vector,1.0)    # 641 gain p13_m18
	push!(control_parameter_vector,2.0)    # 642 order p13_m18

	#Protein 14 CD14
	push!(control_parameter_vector,1.0)    # 643 gain p14_m18
	push!(control_parameter_vector,2.0)    # 644 order p14_m18

	#Protein 15 p21
	push!(control_parameter_vector,1.0)    # 645 gain p15_m18
	push!(control_parameter_vector,2.0)    # 646 order p15_m18

	#Protein 16 E2F
	push!(control_parameter_vector,1.0)    # 647 gain p16_m18
	push!(control_parameter_vector,2.0)    # 648 order p16_m18

	#Protein 17 p47
	push!(control_parameter_vector,1.0)    # 649 gain p17_m18
	push!(control_parameter_vector,2.0)    # 650 order p17_m18

	#selfloop
	push!(control_parameter_vector,1.0)    # 651 gain p18_m18
	push!(control_parameter_vector,2.0)    # 652 order p18_m18

	return control_parameter_vector

end	