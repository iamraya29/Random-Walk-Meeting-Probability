clc; clear; close all;

% Parameters
N = 10;            % Grid size (10x10 city)
T = 1000;          % Time steps
trials = 500;      % Number of trials

% Monte Carlo Counters
meetings_original = 0;
meetings_shifted = 0;

% Visualization Setup
figure;
hold on;
title('Random Walk Simulation');
xlabel('X Position');
ylabel('Y Position');
grid on;
axis([1 N 1 N]);
xticks(1:N);
yticks(1:N);

% Predefine Legend Colors
plot(NaN, NaN, 'b-', 'LineWidth', 1.5); % Dummy plot for Person A
plot(NaN, NaN, 'r-', 'LineWidth', 1.5); % Dummy plot for Person B
plot(NaN, NaN, 'go', 'MarkerFaceColor', 'g', 'MarkerSize', 5); % Meetings
plot(NaN, NaN, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 5); % Missed Meetings

% Run the Simulation
for trial = 1:trials
    % Initial Positions
    xa = randi(N); ya = randi(N); % Person A
    xb = randi(N); yb = randi(N); % Person B
    
    % Shift in A's Trajectory
    xa_shifted = xa + 1; % Slight x-direction shift

    % Store Trajectories
    pathA = [xa, ya];
    pathB = [xb, yb];

    for t = 1:T
        % Random Steps
        step_a = randi(4);
        step_b = randi(4);
        
        % Update Positions
        if step_a == 1, xa = min(N, xa + 1); % Right
        elseif step_a == 2, xa = max(1, xa - 1); % Left
        elseif step_a == 3, ya = min(N, ya + 1); % Up
        else, ya = max(1, ya - 1); % Down
        end
        
        if step_b == 1, xb = min(N, xb + 1);
        elseif step_b == 2, xb = max(1, xb - 1);
        elseif step_b == 3, yb = min(N, yb + 1);
        else, yb = max(1, yb - 1);
        end

        % Store Trajectories
        pathA = [pathA; xa, ya];
        pathB = [pathB; xb, yb];

        % Check Meeting Condition
        if xa == xb && ya == yb
            meetings_original = meetings_original + 1;
            plot(xa, ya, 'go', 'MarkerFaceColor', 'g', 'MarkerSize', 5); % Green dot for meeting
        end
        if xa_shifted == xb && ya == yb
            meetings_shifted = meetings_shifted + 1;
            plot(xa_shifted, ya, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 5); % Black dot for missed meetings
        end
    end

    % Plot Paths
    plot(pathA(:,1), pathA(:,2), 'b-', 'LineWidth', 1.5); % Person A (Blue)
    plot(pathB(:,1), pathB(:,2), 'r-', 'LineWidth', 1.5); % Person B (Red)
end

% Compute Probabilities
P_original = meetings_original / (T * trials);
P_shifted = meetings_shifted / (T * trials);
P_miss = P_original - P_shifted;

% Display Results
fprintf('Probability of Meeting Before Shift: %.4f\n', P_original);
fprintf('Probability of Meeting After Shift: %.4f\n', P_shifted);
fprintf('Missed Meeting Probability: %.4f\n', P_miss);

% Add Legend
legend({'Person A Path', 'Person B Path', 'Meetings (Green)', 'Missed Meetings (Black)'}, 'Location', 'best');

