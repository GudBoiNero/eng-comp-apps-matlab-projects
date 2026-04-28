% Written by Ben Champagne 3/31/2026

%% Project 8: Delivery Time Estimator

clc; % clears command window
clear; % removes all variables from workspace
close all; % closes all open figure windows

%% Model parameters
speed = 40; % sets delivery speed in miles per hour
m = 60 / speed; % converts speed to minutes per mile (slope of model)
b = 10; % sets fixed handling time in minutes (intercept)

%% Evaluate
d = 0:1:40; % creates vector of distances from 0 to 40 miles
T = m*d + b; % computes delivery time for each distance using linear model

%% Create table with interpretation
label = strings(size(d)); % creates string array to store category labels for each distance

for i = 1:length(d) % loops through each distance value
    if d(i) < 10 % checks if current distance is less than 10
        label(i) = "short"; % assigns "short" label for small distances
    elseif d(i) < 25 % checks if current distance is less than 25
        label(i) = "medium"; % assigns "medium" label for mid-range distances
    else % handles distances 25 and above
        label(i) = "long"; % assigns "long" label for larger distances
    end % ends conditional block
end % ends loop over distances

table_data = table(d', T', label', 'VariableNames', {'Distance', 'Time', 'Category'}); % creates table with distance, time, and category columns

disp(table_data(1:12,:)); % displays first 12 rows of the table

%% Plot
figure; % creates a new figure window
plot(d, T, 'b', 'LineWidth', 2); % plots delivery time vs distance as a blue line
title('Delivery Time vs Distance'); % sets title of the plot
xlabel('Distance (miles)'); % labels x-axis as distance in miles
ylabel('Time (minutes)'); % labels y-axis as time in minutes