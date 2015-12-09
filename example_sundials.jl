using Sundials
using Debug

@debug function f2(t, y, ydot, p) 
	p[1] = y[1];
	p[2] = 0;   
	#ydot[1] = p[1]*(y[2]+y[1]-y[1]^3/3)
  	#dot[2] = -(y[1]-p[1]+y[2]*p[2])/p[2]
	ydot[1] = p[1];
	ydot[2] = p[2];
	@bp
end

# Time t
t = [i for i in 0.:10]

# Initial conditions y0 = [V, R]
y0 = [-1., 1.];

# Parameters p = [a, b, c]
p = [0.2, 0.2];

f(t, y, ydot) = f2(t, y, ydot, p)

data = Sundials.cvode(f, y0, t)

print(data)