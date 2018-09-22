f = @(x) (x(1)^2 + x(2)^2)^2 -2*(x(1)^2-x(2)^2);
gradf = @(x) 4*norm(x)^2*x + 4*[-1 0; 0 1]*x;

K = krivulja(f, gradf, [1;1], 0.1, 10);
plot(K(1, :), K(2,:));