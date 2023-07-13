clc; clear; close all

dt = 0.1;
end_time = 20;
time = 0:dt:end_time;
IC = [0 0 0];

% [Time, Theta] = ode45(@Angular_Velocity_ODE, time, IC);
omega = [0; 0; 1];
[Time, Theta] = ode45(@(Time, Theta) Angular_Velocity_ODE(Time, Theta, omega), time, IC);



figure(1)
plot_EulerAngles(Time, Theta)
pause(1)

figure(2)
Animate_attitude(Time, Theta, 'deg', 1e-10)

%% First Method
Orientation_Matrix_M1_total = zeros(3,3,length(Theta));

for ii = 1:length(Theta)
    Orientation_Matrix_M1 = O1(Theta(ii,1))*O2(Theta(ii,2))*O3(Theta(ii,3));
    
    Orientation_Matrix_M1_total(:,:,ii) = Orientation_Matrix_M1;
    figure(3)
    Animate_Orientation_Matrix(Orientation_Matrix_M1, 1e-10)
end

%% Second Method
omega = [2*sind(0.01*time) ; -3*cosd(0.02*time); 0+sind(0.03*time)]*5;

Orientation_Matrix_M2_total = zeros(3,3,length(time));
Orientation_Matrix_M2 = eye(3);

Orientation_Matrix_M2_total(:,:,1) = Orientation_Matrix_M2;

for k = 1:length(time)
    % Orientation_Matrix_M2 = expm(-super_cross(omega*pi/180*dt))*Orientation_Matrix_M2;
    Orientation_Matrix_M2 = expm(-super_cross(omega(:,k))*pi/180*dt)*Orientation_Matrix_M2;
    Orientation_Matrix_M2_total(:,:,k+1) = Orientation_Matrix_M2;

    figure(5)
    Animate_Orientation_Matrix(Orientation_Matrix_M2, 1e-10)
end

%% Error
figure
for jj = 1:length(Orientation_Matrix_M1_total)
    Z = Orientation_Error(Orientation_Matrix_M1_total(:,:,jj), ...
        Orientation_Matrix_M2_total(:,:,jj));
    semilogy(jj,abs(Z),'o')
    hold on
end

%% Extra
% figure
% eulZYX = rad2deg(rotm2eul(Orientation_Matrix_M1','ZYX'));
% plot(ii,eulZYX(1),'ro')
% hold on
% plot(ii,eulZYX(2),'bo')
% plot(ii,eulZYX(3),'go')
% hold on