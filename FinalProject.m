% Written by Ben Champagne 3/31/2026

%% Project 1: Smart Home Energy Dashboard

clear; clc; close all; % clears workspace variables, clears command window, and closes all open figures

%% Load Data
data = readtable('energy_data.csv'); % reads CSV file into a table called data

time = data.time; % extracts time column from table into vector time
hour = data.hour_of_day; % extracts hour_of_day column into vector hour
energy = data.energy_kWh; % extracts energy_kWh column into vector energy

%% Data Cleaning
energy(energy < 0) = 0; % replaces all negative energy values with 0

%% Metrics
mean_energy = mean(energy); % computes average energy usage
max_energy = max(energy); % finds maximum energy usage value
std_energy = std(energy); % computes standard deviation of energy usage

%% Weekly Aggregation
days = floor(length(energy)/24); % calculates number of full days based on hourly data
daily_energy = reshape(energy(1:days*24), 24, days); % reshapes energy into 24 rows (hours) by number of days
daily_totals = sum(daily_energy); % sums each column to get total energy per day

%% Weekday vs Weekend
weekday_idx = mod((1:days),7) <= 5; % creates logical index for weekdays (days 1–5 in each week)
weekend_idx = ~weekday_idx; % creates logical index for weekends as inverse of weekday index

weekday_avg = mean(daily_totals(weekday_idx)); % computes average daily energy for weekdays
weekend_avg = mean(daily_totals(weekend_idx)); % computes average daily energy for weekends

%% Figures - Time Series
figure; % creates a new figure window
plot(time, energy); % plots energy versus time
xlabel('Time (hours)'); % labels x-axis
ylabel('Energy (kWh)'); % labels y-axis
title('Energy Usage Over Time'); % sets plot title

%% Figures - Histogram
figure; % creates a new figure window
histogram(energy, 20); % plots histogram of energy with 20 bins
xlabel('Energy (kWh)'); % labels x-axis
ylabel('Frequency'); % labels y-axis
title('Energy Usage Distribution'); % sets plot title

%% Figures - Weekday vs Weekend
figure; % creates a new figure window
bar([weekday_avg, weekend_avg]); % creates bar chart comparing weekday and weekend averages
set(gca, 'XTickLabel', {'Weekday','Weekend'}); % sets x-axis labels for bars
ylabel('Avg Daily Energy (kWh)'); % labels y-axis
title('Weekday vs Weekend Usage'); % sets plot title

%% Figures - Dashboard
figure; % creates a new figure window
tiledlayout(2,2); % creates a 2x2 grid layout for subplots

nexttile; % moves to first tile
plot(time, energy); % plots time series in first tile
title('Time Series'); % sets subplot title

nexttile; % moves to second tile
histogram(energy); % plots histogram in second tile
title('Distribution'); % sets subplot title

nexttile; % moves to third tile
plot(daily_totals); % plots daily totals over time
title('Daily Totals'); % sets subplot title

nexttile; % moves to fourth tile
bar([weekday_avg, weekend_avg]); % plots weekday vs weekend bar chart
title('Weekday vs Weekend'); % sets subplot title

sgtitle('Energy Dashboard'); % sets overall title for tiled layout

%% What-if Analysis
peak_hours = (hour >= 18 & hour <= 22); % creates logical index for peak hours (6 PM to 10 PM)
energy_reduced = energy; % copies original energy data into new variable
energy_reduced(peak_hours) = 0.8 * energy_reduced(peak_hours); % reduces energy by 20% during peak hours

total_original = sum(energy); % computes total original energy usage
total_new = sum(energy_reduced); % computes total energy after reduction

savings_percent = (total_original - total_new)/total_original * 100; % calculates percent energy savings

disp(['Estimated Energy Savings: ', num2str(savings_percent), '%']); % displays formatted savings percentage