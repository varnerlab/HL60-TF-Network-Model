#__author__ = 'jeffreyvarner'

#using Debug
#using ODE
using Sundials
include("BalanceEquations.jl")

function solveBalanceEquations(pBalanceEquations,time_vector,PROBLEM_DICTIONARY)

    # Get the initial conditions from the problem dictionary -
    IC = PROBLEM_DICTIONARY["INITIAL_CONDITION_VECTOR"]
    
	# Call the ODE solver
	f(t,x,dxdt) = pBalanceEquations(t,x,dxdt,PROBLEM_DICTIONARY)
	XI = Sundials.cvode(f,IC,time_vector;reltol = 1.0e-4, abstol = 1.0e-6)		
	
    X = abs(XI)

    # return a time,state array -
    return (time_vector,X)
   
end  