function [x_hat, P] = Extended_Kalman_Filter(x_hat, P, Q, R, mu_r, mu_omega, delta_t, x0, sigma_x)

    % Prediction
    theta_pred = x_hat(2) + mu_omega * delta_t;
    x_pred = [mu_r; theta_pred];
    F = [1 0; 0 1];  
    P_pred = F * P * F' + Q; 

    % Measurement update
    H = [-sin(theta_pred), 0]; 
    z = x0 + mu_r*cos(theta_pred) + sigma_x*randn; 
    y = z - (x0 + mu_r*cos(x_pred(2))); 
    S = H * P_pred * H' + R; 
    K = P_pred * H' / S; 
    x_hat = x_pred + K * y; 
    P = (eye(2) - K * H) * P_pred;

end