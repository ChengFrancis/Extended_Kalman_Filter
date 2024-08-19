% Define timer
delta_t = 0.5; % sampling period
T_total = 50; % total simulation time
t = 0:delta_t:T_total; % simulation time vector

% Mean and covariance of radius and angular velocity
mu_r = 2; % mean of radius (meters)
sigma_r = sqrt(0.1); % standard deviation of radius (meters)
mu_omega = 1; % mean angular velocity (rad/s)
sigma_omega = sqrt(0.1); % standard deviation of angular velocity (rad/s)

% Measurement noise standard deviation
sigma_x = sqrt(0.2);  

% Center of the circular trajectory
x0 = 0; 
y0 = 0; 

% Initial state and covariance
theta_0 = 0; % starting angle at t=0
x_hat = [mu_r; theta_0]; % initial state [r; theta]
P = diag([sigma_r^2, (sigma_omega * delta_t)^2]); % initial state covariance

% Store the robot path for plotting
robot_path = zeros(2, length(t)); 

% Process noise covariance matrix
Q = [0, 0; 0, (sigma_omega * delta_t)^2]; 

% Measurement noise covariance
R = sigma_x^2;  

% Simulation loop
for k = 1:length(t)
    % Call the Extended Kalman Filter function
    [x_hat, P] = Extended_Kalman_Filter(x_hat, P, Q, R, mu_r, mu_omega, delta_t, x0, sigma_x);
    
    % Save robot path for plotting
    robot_path(:, k) = [x0 + x_hat(1)*cos(x_hat(2)); y0 + x_hat(1)*sin(x_hat(2))];
end

% Plotting the robot path
figure;
plot(robot_path(1, :), robot_path(2, :), 'b-', 'LineWidth', 2);
hold on;
plot(x0, y0, 'ro', 'MarkerSize', 8, 'LineWidth', 2);
title('Robot Path Simulation using EKF');
xlabel('X Coordinate');
ylabel('Y Coordinate');
grid on;
axis equal;
legend('Robot Path', 'Circle Center');