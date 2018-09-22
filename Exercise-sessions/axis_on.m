function [] = axis_on(length)
  hold on;
  grid on;
  plot([-length, length], [0, 0], 'bk-');
  plot([0, 0], [-length, length], 'bk-');
end