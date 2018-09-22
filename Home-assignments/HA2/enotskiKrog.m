function [f, dotf, ddot] = enotskiKrog(t, s)

t = [t s];

f = [...
cos(t(1))*cos(t(2));...
sin(t(1))*cos(t(2));...
sin(t(2))...
];

dotf = [...
-sin(t(1))*cos(t(2)), -cos(t(1))*sin(t(2)); 
cos(t(1))*cos(t(2)),  -sin(t(1))*sin(t(2)); 
0,                    cos(t(2))];

ddot = zeros(3,2,2);

% derivative of dotf over t(1)
ddot(:,:,1) = [-cos(t(1))*cos(t(2)), sin(t(1))*sin(t(2)); 
				 -sin(t(1))*cos(t(2)), -cos(t(1))*sin(t(2)); 
				 0,                    0];

% derivative of dotf over t(2)
ddot(:,:,2) = [sin(t(1))*sin(t(2)),   cos(t(1))*sin(t(2)); 
				 -cos(t(1))*sin(t(2)),  -sin(t(1))*cos(t(2)); 
					0,                    -sin(t(2))];

end
