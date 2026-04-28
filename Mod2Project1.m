% Written by Ben Champagne 3/31/2026

%% Project 1: Vehicle Braking Distance Simulator

clc; % clears command window
clear; % removes all variables from workspace

%% Parameters
dt = 0.01; % sets simulation time step in seconds
v0_list = [10, 20, 30]; % defines array of initial velocities in m/s
mu = 0.7; % sets friction coefficient for braking force
g = 9.81; % sets gravitational acceleration constant

figure; % creates a new figure window
hold on; % allows multiple plots on same figure

for k = 1:length(v0_list) % loops through each initial velocity
    v = v0_list(k); % sets current velocity to selected initial velocity
    x = 0; % initializes position (distance traveled) to zero
    t = 0; % initializes time to zero
    
    v_hist = []; % initializes array to store velocity history
    x_hist = []; % initializes array to store position history
    
    while v > 0 % continues simulation while vehicle is still moving
        a = -mu * g; % computes constant deceleration due to friction
        v = v + a*dt; % updates velocity using acceleration over time step
        x = x + v*dt; % updates position using current velocity over time step
        t = t + dt; % increments time by time step
        
        v_hist(end+1) = v; % appends current velocity to history array
        x_hist(end+1) = x; % appends current position to history array
    end % ends simulation loop when vehicle stops
    
    plot(0:length(x_hist)-1, x_hist, 'DisplayName', ['v0 = ' num2str(v0_list(k))]); % plots stopping distance vs time steps for current velocity
end % ends loop over initial velocities

xlabel('Time Step'); % labels x-axis as time step index
ylabel('Stopping Distance (m)'); % labels y-axis as stopping distance in meters
title('Braking Distance vs Time'); % sets plot title
legend; % displays legend for each velocity curve