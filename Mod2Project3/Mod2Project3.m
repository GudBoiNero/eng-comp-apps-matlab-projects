% Written by Ben Champagne 3/31/2026

%% Project 3: Temperature Regulation System (Drug Concentration Model)

clc; % clears command window
clear; % removes all variables from workspace

%% Parameters
dt = 0.1; % sets time step for simulation in seconds
t_end = 50; % defines total simulation time
t = 0:dt:t_end; % creates time vector from 0 to t_end with step dt

dose = 50; % sets drug dose added at each interval
k_elim = 0.1; % sets elimination rate constant

%% Initialize variables
C = 0; % initializes drug concentration to zero
C_hist = []; % initializes array to store concentration history

%% Simulation loop
for i = 1:length(t) % loops through each time step
    if mod(t(i), 10) == 0 % checks if current time is a multiple of 10 for dosing
        C = C + dose; % adds dose to concentration at dosing times
    end % ends dosing condition
    
    dC = -k_elim * C; % computes rate of concentration decrease using first-order elimination
    C = C + dC*dt; % updates concentration using Euler integration
    C_hist(end+1) = C; % appends updated concentration to history array
end % ends simulation loop

%% Plot
plot(t, C_hist); % plots concentration over time
xlabel('Time'); % labels x-axis as time
ylabel('Concentration'); % labels y-axis as concentration
title('Drug Concentration Over Time'); % sets plot title