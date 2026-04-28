% Written by Ben Champagne 3/31/2026

%% Project 11: Inspection Threshold Detection

clc; % clears command window
clear; % removes all variables from workspace
close all; % closes all open figure windows

%% Define models
x = 0:0.5:20; % creates vector of x values from 0 to 20 in steps of 0.5

Q = -0.5*(x - 10).^2 + 60; % computes quadratic quality model centered at x=10 with peak value 60
T = 2*x + 20; % computes linear threshold model increasing with slope 2 and intercept 20

%% Plot
figure; % creates a new figure window
plot(x, Q, 'b', 'LineWidth', 2); % plots quality model as a blue line
hold on; % keeps current plot so next plot overlays
plot(x, T, 'r--', 'LineWidth', 2); % plots threshold model as a dashed red line
legend('Quality Q(x)', 'Threshold T(x)'); % labels plotted lines
title('Threshold Detection'); % sets title of the plot
xlabel('x'); % labels x-axis
ylabel('Value'); % labels y-axis

%% Find pass condition
pass = Q >= T; % creates logical array where true indicates quality meets or exceeds threshold

%% Output intervals
pass_x = x(pass); % extracts x values where pass condition is true

fprintf('Pass occurs approximately in these x ranges:\n'); % prints header message
disp(pass_x); % displays x values where system passes