% Written by Ben Champagne 3/31/2026

%% Data Generation

clear; clc; % clears workspace variables and command window

days = 42; % defines number of days as 42 (6 weeks)
hours = days * 24; % computes total number of hours in dataset

time = (1:hours)'; % creates column vector of time indices from 1 to total hours
hour_of_day = mod(time,24); % computes hour within each day (0–23) using modulo

%% Simulate Usage Pattern
base = 0.5 + 0.3*sin(2*pi*hour_of_day/24); % creates baseline daily sinusoidal energy pattern
noise = 0.1*randn(size(time)); % generates random noise with normal distribution matching time vector size
peak_boost = (hour_of_day >= 18 & hour_of_day <= 22)*0.7; % adds fixed increase during peak hours (6 PM–10 PM)

energy_kWh = base + peak_boost + noise; % combines base usage, peak boost, and noise into total energy signal

%% Save Data
T = table(time, hour_of_day, energy_kWh); % creates table with time, hour_of_day, and energy values
writetable(T, 'energy_data.csv'); % writes table to CSV file named energy_data.csv
