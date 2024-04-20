% Read data from CSV file
data = csvread('1mmg wt0point5sys_111_111+112_223+111_223+111+112.csv'); % Replace 'your_file.csv' with the path to your CSV file

% Extract x and y data from the CSV data (assuming two columns)
x = data(:, 1); % Assuming the x values are in the first column
y = data(:, 2); % Assuming the y values are in the second column

% Calculate averages over 1-second and 5-second intervals
interval1 = 7; % 1 second interval
x1 = (interval1:interval1:max(x))'; % Create x values for 1-second intervals
y1 = zeros(size(x1)); % Initialize y values for 1-second averages
for i = 1:length(x1)
    idx = x >= (x1(i) - interval1) & x < x1(i); % Find indices within 1-second interval
    y1(i) = mean(y(idx)); % Calculate average y value within the interval
end

% Define custom minimum and maximum time values for x-axis
minTime = 1500; % Minimum time
maxTime = 1800;
% Create a figure with four subplots vertically stacked

% figure;
% % Plot original data
% plot(x, y, 'b-');
% xlabel('Time (seconds)');
% ylabel('Force (Newtons)');
% title('Original Data');
% grid on;
% xlim([minTime, maxTime]); % Set x-axis limits
% ylim([0,2]);

% Plot averages over 1-second intervals
figure;
plot(x1, y1, 'm-', 'LineWidth',2.5);
xlabel('Time (seconds)');
ylabel('Force (Newtons)');
title('Bulk Yield seen in Force');
grid off;
xlim([minTime, maxTime]); % Set x-axis limits
ylim([0,2]);
