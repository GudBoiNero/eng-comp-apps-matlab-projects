% Written by Ben Champagne 3/31/2026

%% Project 2: Battery Discharge Model (RC Circuit Simulation)

clc; % clears command window
clear; % removes all variables from workspace

%% Parameters
dt = 0.01; % sets time step for simulation in seconds
t_end = 10; % defines total simulation time in seconds
t = 0:dt:t_end; % creates time vector from 0 to t_end with step dt

R = 1000; % sets resistance in ohms
C = 0.001; % sets capacitance in farads
V_source = 5; % sets constant voltage source in volts

%% Initialize variables
V = 0; % initializes capacitor voltage at 0 volts
V_hist = []; % initializes array to store voltage history over time

%% Simulation loop
for i = 1:length(t) % loops through each time step
    dV = (V_source - V)/(R*C); % computes rate of change of voltage using RC differential equation
    V = V + dV*dt; % updates voltage using Euler integration method
    V_hist(end+1) = V; % appends updated voltage to history array
end % ends simulation loop

%% Plot
plot(t, V_hist); % plots capacitor voltage over time
xlabel('Time (s)'); % labels x-axis as time in seconds
ylabel('Voltage (V)'); % labels y-axis as voltage in volts
title('RC Charging Curve'); % sets plot title