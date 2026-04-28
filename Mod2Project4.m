% Written by Ben Champagne 3/31/2026

%% Project 4: Drug Concentration in the Body (Cooling Model - Newton's Law)

clc; % clears command window
clear; % removes all variables from workspace

%% Parameters
dt = 0.1; % sets time step for simulation
t_end = 50; % defines total simulation time
t = 0:dt:t_end; % creates time vector from 0 to t_end with step dt

T_env = 25; % sets ambient temperature
T = 100; % initializes object temperature
k = 0.05; % sets cooling constant

%% Initialize variables
T_hist = []; % initializes array to store temperature history

%% Simulation loop
for i = 1:length(t) % loops through each time step
    dT = -k*(T - T_env); % computes rate of temperature change based on difference from environment
    T = T + dT*dt; % updates temperature using Euler integration
    T_hist(end+1) = T; % appends updated temperature to history array
end % ends simulation loop

%% Plot
plot(t, T_hist); % plots temperature over time
xlabel('Time'); % labels x-axis as time
ylabel('Temperature (°C)'); % labels y-axis as temperature in Celsius
title('Cooling Curve'); % sets plot title