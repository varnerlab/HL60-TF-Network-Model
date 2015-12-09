include ("DDS.jl")
IC=readdlm("IC.txt");
bounds=readdlm("bounds.txt"); #Bounds on the rate constants
MAXJ=bounds[:,2];
MINJ=bounds[:,1];

r=0.2; #Neigborhood perturbation parameter
NI=10000; #Number of function evaluations

(bestval,bestsolution)=DDS(IC,MAXJ,MINJ,r,NI);
#save ./DDS_Results/DDS_solution.mat bestsolution;
#save -ascii ./DDS_Results/DDS_error.txt bestval;
#save -ascii ./DDS_Results/DDS_time.txt timeDDS;
