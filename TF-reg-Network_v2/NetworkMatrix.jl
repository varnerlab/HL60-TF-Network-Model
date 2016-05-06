#__author__ = 'Kathy Rogers'

function stoichMatrix()

	#Create Empty matrix
	stoich_Matrix = zeros(18,18)

	#Fill in what is known from literature

	#RAR (1) upregulates RAR (1)
	stoich_Matrix[1,1] = 1
	#RAR (1) upregulates PU1 (10)
	stoich_Matrix[10,1] = 1
	#RAR (1) upregulates CEBPa (7)
	stoich_Matrix[7,1] = 1
	#RAR (1) upregulates IRF1 (4)
	stoich_Matrix[4,1] = 1
	#RAR (1) represses Oct4 (18)
	stoich_Matrix[18,1] = -1
	#RAR (1) upregulates CD38 (12)
	stoich_Matrix[12,1] = 1
	#RAR (1) upregulates p21 (15)
	stoich_Matrix[15,1] = 1
	#RAR (1) upregulates AhR (6)
	stoich_Matrix[6,1] = 1
	#RAR (1) upregulates EGR1 (9)
	stoich_Matrix[9,1] = 1

	#VDR (2) upregulates PPAR (3)
	stoich_Matrix[3,2] = 1
	#VDR (2) upregulates PU1 (10)
	stoich_Matrix[10,2] = 1
	#VDR (2) upregulates p21 (15)
	stoich_Matrix[15,2] = 1

	#PPAR (3) upregulates CEBPa (7)
	stoich_Matrix[7,3] = 1
	#PPAR (3) upregulates IRF1 (4)
	stoich_Matrix[4,3] = 1
	#PPAR (3) upregulates Oct1 (5)
	stoich_Matrix[5,3] = 1
	#PPAR (3) represses AP1 (11)
	stoich_Matrix[11,3] = -1
	#PPAR (3) represses E2F (16)
	stoich_Matrix[16,3] = -1
	#PPAR (3) represses EGR1 (9)
	stoich_Matrix[9,3] = -1
	#PPAR (3) upregulates CD38 (12)
	stoich_Matrix[12,3] = 1
	#PPAR (3) upregulates CD14 (14)
	stoich_Matrix[14,3] = 1
	#PPAR (3) upregulates p21 (15)
	stoich_Matrix[15,3] = 1
	#PPAR (3) represses p47 (17)
	stoich_Matrix[17,3] = -1

	#PU1 (10) represses PPAR (3)
	stoich_Matrix[3,10] = -1
	#PU1 (10) upregulates PU1 (10)
	stoich_Matrix[10,10] = 1
	#PU1 (10) upregulates AP1 (11)
	stoich_Matrix[11,10] = 1
	#PU1 (10) upregulates EGR1 (9)
	stoich_Matrix[9,10] = 1
	#PU1 (10) upregulates CD11b (13)
	stoich_Matrix[13,10] = 1
	#PU1 (10) upregulates p21 (15)
	stoich_Matrix[15,10] = 1
	#PU1 (10) upregulates p47 (17)
	stoich_Matrix[17,10] = 1
	#PU1 (10) upregulates VDR (2)
	stoich_Matrix[2,10] = 1

	#CEBPa (7) upregulates PPAR (3)
	stoich_Matrix[3,7] = 1
	#CEBPa (7) upregulates PU1 (10)
	stoich_Matrix[10,7] = 1
	#CEBPa (7) upregulates CEBPa (7)
	stoich_Matrix[7,7] = 1
	#CEBPa (7) upregulates Gfi1 (8)
	stoich_Matrix[8,7] = 1
	#CEBPa (7) represses E2F (16)
	stoich_Matrix[16,7] = -1
	#CEBPa (7) upregulates CD14 (14)
	stoich_Matrix[14,7] = 1
	#CEBPa (7) upregulates p21 (15)
	stoich_Matrix[15,7] = 1

	#IRF1 (4) upregulates CD38 (12)
	stoich_Matrix[12,4] = 1
	#IRF1 (4) upregulates p21 (15)
	stoich_Matrix[15,4] = 1

	#Gfi1 (8) represses PU1 (10)
	stoich_Matrix[10,8] = -1
	#Gfi1 (8) represses CEBPa (7)
	stoich_Matrix[7,8] = -1
	#Gfi1 (8) represses E2F (16)
	stoich_Matrix[16,8] = -1
	#Gfi1 (8) represses EGR1 (9)
	stoich_Matrix[9,8] = -1
	#Gfi1 (8) represses p21 (15)
	stoich_Matrix[15,8] = -1

	#Oct1 (5) upregulates VDR (2)
	stoich_Matrix[2,5] = 1
	#Oct1 (5) upregulates PU1 (10)
	stoich_Matrix[10,5] = 1

	#AP1 (11) upregulates VDR (2)
	stoich_Matrix[2,11] = 1
	#AP1 (11) represses CEBPa (7)
	stoich_Matrix[7,11] = -1
	#AP1 (11) upregulates PU1 (10)
	stoich_Matrix[10,11] = 1
	#AP1 (11) upregulates p21 (15)
	stoich_Matrix[15,11] = 1

	#E2F (16) upregulates E2F (16)
	stoich_Matrix[16,16] = 1

	#EGR1 (9) upregulates PPAR (3)
	stoich_Matrix[3,9] = 1
	#EGR1 (9) represses Gfi1 (8)
	stoich_Matrix[8,9] = -1
	#EGR1 (9) upregulates CD14 (14)
	stoich_Matrix[14,9] = 1

	#AhR (6) upregulates AP1 (11)
	stoich_Matrix[11,6] = 1
	#AhR (6) upregulates IRF1 (4)
	stoich_Matrix[4,6] = 1
	#AhR (6) represses Oct4 (18)
	stoich_Matrix[18,6] = -1
	#AhR (6) represses PU1 (10)
	stoich_Matrix[10,6] = -1	
	
	#return 
	return stoich_Matrix

end	