x0 = 0; % initial position
v0 = 0.01; % initial velocity
[t, y] = rk4(@duffing,[0; 100], [x0; v0], 0.01);
plot(t, y(1,t));
plot(y(1,:), y(2, :)); % Pase diagram = position vs. velocity