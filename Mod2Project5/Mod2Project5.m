% Written by Ben Champagne 3/31/2026

%% Project 5: Traffic Flow on a Single Road Segment (Wind Turbine Power Model)

clc; % clears command window
clear; % removes all variables from workspace

%% Parameters
dt = 0.1; % sets time step for simulation
t_end = 50; % defines total simulation time
t = 0:dt:t_end; % creates time vector from 0 to t_end with step dt

rho = 1.225; % sets air density in kg/m^3
A = 10; % sets swept area of turbine blades
Cp = 0.4; % sets power coefficient (efficiency factor)

%% Wind speed model
v = 8 + 2*sin(0.2*t); % computes wind speed as sinusoidal variation over time

%% Power calculation
P = 0.5 * rho * A * Cp .* (v.^3); % computes power output proportional to cube of wind speed

%% Plot wind speed
subplot(2,1,1); % creates first subplot in a 2-row layout
plot(t, v); % plots wind speed over time
xlabel('Time'); % labels x-axis as time
ylabel('Wind Speed (m/s)'); % labels y-axis as wind speed
title('Wind Speed'); % sets subplot title

%% Plot power output
subplot(2,1,2); % creates second subplot in a 2-row layout
plot(t, P); % plots power output over time
xlabel('Time'); % labels x-axis as time
ylabel('Power (W)'); % labels y-axis as power in watts
title('Power Output'); % sets subplot title