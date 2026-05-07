% Written by Ben Champagne 3/31/2026

%% Project 6: Profit vs Production

clc; % clears command window
clear; % removes all variables from workspace
close all; % closes all open figure windows

%% Parameters
p = 20; % sets price per unit
a = 0.05; % sets quadratic cost coefficient (increasing cost)
b = 5; % sets linear cost coefficient (per-unit cost)
c = 100; % sets fixed cost independent of production

%% Compute values
x = 0:1:80; % creates vector of production values from 0 to 80
R = p * x; % computes revenue as price times units for each x
C = a*x.^2 + b*x + c; % computes cost using quadratic model element-wise over x
P = R - C; % computes profit as revenue minus cost for each x

%% Plot
figure; % creates a new figure window
plot(x, R, 'g', 'LineWidth', 2); % plots revenue vs x as a green line
hold on; % keeps current plot so additional lines are added
plot(x, C, 'r', 'LineWidth', 2); % plots cost vs x as a red line
plot(x, P, 'b', 'LineWidth', 2); % plots profit vs x as a blue line
legend('Revenue', 'Cost', 'Profit'); % labels each plotted line
title('Profit Model'); % sets title of the plot
xlabel('Units'); % labels x-axis as units produced
ylabel('Dollars'); % labels y-axis as dollar values

%% Max profit
[maxProfit, idx] = max(P); % finds maximum profit value and its index in P
best_x = x(idx); % finds production level corresponding to max profit using index

fprintf('Max profit of %.2f occurs at x = %d units\n', maxProfit, best_x); % prints formatted max profit and production level

%% Break-even points
break_even = x(abs(P) < 5); % finds x values where profit is approximately zero within tolerance of 5
fprintf('Approximate break-even points:\n'); % prints header for break-even values
disp(break_even); % displays the break-even production values