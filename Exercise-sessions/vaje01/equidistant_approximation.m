x = linspace(-1, 1, 21);

x = x';
f = @(x) 1 ./ (1 + 25*x.**2);
b = f(x);

for i = 0:20
  A = [ones(size(x))];
  for j = 1:i
    A = [x.**j, A];
  end
z = A'*A\A'*b;
solution_name = sprintf('n%d.mat', i);
save(solution_name);
end