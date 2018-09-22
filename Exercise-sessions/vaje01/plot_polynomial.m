t = linspace(-1, 1);
hold on;
grid on;
axis([-1 1 -10 10]);

p = @(t) 1 ./ (1 + 25*t.**2);
plot(t, p(t), 'b');

for i = 0:20
  to_load = sprintf('n%d', i);
  load(to_load);
  plot(t, polyval(z, t), 'r');
  fig_name = sprintf("fig%d.jpg", i);
  saveas(gcf, fig_name);
end
