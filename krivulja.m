function K=krivulja(f,gradf,T0,delta,n)
	%K=krivulja(f,gradf,T0,delta,n)
	%returns a sequence of equadistant points on the curve
	%defined by 
	%f(x,y)=0
	%gradf - gradient of the function f
	%T0 - initial point on the curve. T0 should not be further than delta 
	% from the curve
	%delta - distance between successive points
	%n - number of points returned
	%K - 2xn matrix containing the points as columns 
	
	G=@(x,T0) [feval(f,x);(x(1)-T0(1))^2+(x(2)-T0(2))^2-delta^2];%system
	%of equations we need to solve
	JG=@(x,T0) [feval(gradf,x);2*(x(1)-T0(1)),2*(x(2)-T0(2))];%the Jacobian
	%of G

	T=T0+randn(2,1)*delta;%choose a random initial guess near T0 
	T0=newton(G,JG,T,1e-12,20,T0);%find a point on the curve near T0
	K=[T0];%save T0 
	T=T0+randn(2,1)*delta;%choose a random initial guess for the next point
	%any guess should do if its not too far away from T0
	for i=1:n
		T=newton(G,JG,T,1e-12,20,T0);%solve the system to find the next point
		K=[K T];%saving the next point
		T=2*T-T0;%first guess for next point lies in the direction T-T0 from the new point T 
		T0=K(:,end);%overwriting T0
	end