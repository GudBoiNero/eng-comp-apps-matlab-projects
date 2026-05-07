%% PIZZA COOLING SIMULATOR 🍕
% ES115 – Engineering Computer Applications
% Module 2: Physics Application
%
% ================================
% SLIDE 2: PROBLEM OVERVIEW
% ================================
% System: A hot slice of pizza cooling down over time
% Importance: Heat transfer is critical in engineering (electronics, HVAC, materials)
% Real-world application: Predicting safe temperatures (also... not burning your mouth)

clear; clc; close all;

%% ================================
% SLIDE 3: ENGINEERING OBJECTIVE
% ================================
% Objective: Determine how long it takes for pizza to reach a safe eating temperature
% Question: When is the pizza no longer dangerously hot?

%% ================================
% PARAMETERS (constants)
% ================================
T_initial = 90;     % Initial pizza temp (°C) - fresh out of oven
T_env = 10;         % Room temperature (°C)
k = 0.03;           % Cooling constant (depends on environment)

time_end = 600;     % total time (seconds)
dt = 1;             % time step

%% ================================
% SLIDE 4: MATHEMATICAL MODEL
% ================================
% Newton's Law of Cooling:
% dT/dt = -k(T - T_env)
%
% Discretized (used in code):
% T_new = T_old + dt * (-k * (T_old - T_env))

%% ================================
% INITIAL CONDITIONS
% ================================
time = 0:dt:time_end;
T = zeros(size(time));
T(1) = T_initial;

%% ================================
% SLIDE 5: ALGORITHM / LOGIC
% ================================
% 1. Start with initial temperature
% 2. Loop over time
% 3. Update temperature using cooling equation
% 4. Check temperature zones (fun logic)

for i = 1:length(time)-1
    
    % Update rule (Euler method)
    T(i+1) = T(i) + dt * (-k * (T(i) - T_env));
    
    % FUN CONDITIONAL LOGIC (for presentation)
    if T(i) > 70
        status(i) = "🔥 Lava (DO NOT EAT)";
    elseif T(i) > 50
        status(i) = "⚠️ Risky Bite";
    else
        status(i) = "✅ Safe to Eat";
    end
    
end

%% ================================
% SLIDE 6: MATLAB IMPLEMENTATION
% ================================
% Key concepts used:
% - for loop (time stepping)
% - if/elseif/else (decision making)
% - arrays to store data

%% ================================
% SLIDE 7: RESULTS (PLOTS)
% ================================
figure;
plot(time, T, 'LineWidth', 2);
xlabel('Time (seconds)');
ylabel('Temperature (°C)');
title('Pizza Cooling Over Time 🍕');
grid on;
hold on;

% Add reference lines for zones
yline(70, '--r', 'Too Hot');
yline(50, '--g', 'Safe Zone');

%% ================================
% FIND IMPORTANT TIMES
% ================================
safe_index = find(T < 50, 1); % first time pizza is safe

if ~isempty(safe_index)
    safe_time = time(safe_index);
    fprintf('Pizza is safe to eat after %.1f seconds (%.1f minutes)\n', ...
        safe_time, safe_time/60);
else
    fprintf('Pizza is still too hot!\n');
end

%% ================================
% SLIDE 8: ANALYSIS
% ================================
% Observations:
% - Temperature decreases exponentially over time
% - Fast cooling at first, then slows down
% - Eventually approaches room temperature
%
% Physical meaning:
% - Large temperature difference → faster cooling
% - Small difference → slower cooling
%
% Key result:
% - Time when pizza becomes safe (~50°C)
