% Written by Ben Champagne 3/31/2026

%% Project 5: Two-Sensor Calibration and Agreement Check

clc; clear; close all; % clears command window, workspace variables, and closes all figures

%% Calibration Points - Sensor 1
x1 = [0, 20]; % defines calibration input values for sensor 1
y1_pts = [0, 40]; % defines corresponding output values for sensor 1

%% Calibration Points - Sensor 2
x2 = [0, 20]; % defines calibration input values for sensor 2
y2_pts = [10, 30]; % defines corresponding output values for sensor 2

%% Compute Linear Models
m1 = (y1_pts(2) - y1_pts(1)) / (x1(2) - x1(1)); % computes slope of sensor 1 calibration line
b1 = y1_pts(1); % assigns intercept of sensor 1 using first calibration point

m2 = (y2_pts(2) - y2_pts(1)) / (x2(2) - x2(1)); % computes slope of sensor 2 calibration line
b2 = y2_pts(1); % assigns intercept of sensor 2 using first calibration point

%% Evaluate Models
x = 0:1:30; % creates vector of input values from 0 to 30 in steps of 1
y1 = m1*x + b1; % computes sensor 1 outputs using linear model
y2 = m2*x + b2; % computes sensor 2 outputs using linear model

%% Plot Outputs
figure; % creates a new figure window
plot(x, y1, 'b', 'LineWidth', 2); hold on; % plots sensor 1 output and keeps figure active for additional plots
plot(x, y2, 'r--', 'LineWidth', 2); % plots sensor 2 output with dashed red line
legend('Sensor 1', 'Sensor 2'); % adds legend to distinguish the two sensors
title('Sensor Outputs Comparison'); % sets plot title
xlabel('x'); % labels x-axis
ylabel('Output'); % labels y-axis

%% Error Function
e = y1 - y2; % computes difference between sensor outputs at each x

figure; % creates a new figure window
plot(x, e, 'k', 'LineWidth', 2); % plots error as a function of x
title('Error e(x) = y1 - y2'); % sets plot title
xlabel('x'); % labels x-axis
ylabel('Error'); % labels y-axis

%% Minimum Absolute Error
[~, idx] = min(abs(e)); % finds index where absolute error is smallest
best_x = x(idx); % retrieves corresponding x value for minimum error

fprintf('Best agreement at x = %.2f\n', best_x); % prints x value where sensors agree most closely