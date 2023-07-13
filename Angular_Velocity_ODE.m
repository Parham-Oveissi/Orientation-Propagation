function d_theta = Angular_Velocity_ODE(t, theta, omega)

% d_theta = zeros(3,1);
% d_theta(1) = 2*sind(0.01*t) - sind(theta(1))*tand(theta(2))*3*cosd(0.02*t) + cosd(theta(1))*tand(theta(2))*(4+sind(0.03*t));
% d_theta(2) = 0 - cosd(theta(1))*3*cosd(0.02*t) - sind(theta(1))*(4+sind(0.03*t)); 
% d_theta(3) = 0 - sind(theta(1))*secd(theta(2))*3*cosd(0.02*t) + cosd(theta(1))*secd(theta(2))*(4+sind(0.03*t));

Phi = theta(1);
Theta = theta(2);
Psi = theta(3);

S = [1 sind(Phi)*tand(Theta) cosd(Phi)*tand(Theta); ...
    0 cosd(Phi) -sind(Phi); ... 
    0 sind(Phi)*secd(Theta) cosd(Phi)*secd(Theta)];


omega = [2*sind(0.01*t) ; -3*cosd(0.02*t); 0+sind(0.03*t)]*5;
% omega = [3; 3; 0];

d_theta = S*omega;


