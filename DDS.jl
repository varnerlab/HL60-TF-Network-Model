include ("fit.jl")
#Pkg.add("Debug")
using Debug

function bind(p,MAXJ,MINJ)
	JMIN_NEW=find(p.<MINJ);
	p[JMIN_NEW]=MINJ[JMIN_NEW]+(MINJ[JMIN_NEW]-p[JMIN_NEW]);

	JTEMP1=find(p.>MAXJ);
	p[JTEMP1]=MINJ[JTEMP1];

	JMAX_NEW=find(p.>MAXJ);
	p[JMAX_NEW]=MAXJ[JMAX_NEW]-(p[JMAX_NEW]-MAXJ[JMAX_NEW]);

	JTEMP2=find(p.<MINJ);
	p[JTEMP2]=MAXJ[JTEMP2];

  return p
end


@debug function DDS(IC,MAXJ,MINJ,r,NI)
x=IC;
N=length(IC);
J=1:N;
F_best=fit(x);
F=fit(x);
best=[];
x_best=[];
#x_best[:,1]=IC;
push!(x_best,IC);
for i=1:NI
	P_i=1-(log(i)/log(NI));
	randomnumber=rand(N,1);
	J=find(randomnumber.<P_i);
	if(isempty(J))
    #  @bp
		J=floor(1+length(IC)*rand(1,1));
	end

	SIGMA=r.*(MAXJ-MINJ);

  x_new=x;

	x_new[J]=x[J]+SIGMA[J].*randn(length(J),1);
	x_new=bind(x_new,MAXJ,MINJ);
	F_new=fit(x_new);

	#Greedy step
	if(F_new<F)
	    x=x_new;
	    F=F_new;

		if(F_new<=F_best)
			F_best=F_new;
			#x_best[:,i]=x_new;
      push!(x_best,x_new);
        else
            if i>1
                #x_best[:,i]=x_best[:,i-1];
                previous=x_best[i-1,:];
                push!(x_best,previous);
            end
        end

    else
        if i>1
            #x_best[:,i]=x_best[:,i-1];
             previous=x_best[i-1,:];
             push!(x_best,previous);
        end
	end
push!(best,F_best);
best_value_iter = string("Best value is ",best[i],"in the iteration ",i)
println(best_value_iter);

end
return (best,x_best);
end


