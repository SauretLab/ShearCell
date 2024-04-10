% Read data from CSV file
data = csvread('1mmg wt0point5sys_111_111+112_223+111_223+111+112.csv'); % Replace 'your_file.csv' with the path to your CSV file

% Extract x and y data from the CSV data (assuming two columns)
x = data(:, 1); % Assuming the x values are in the first column
y = data(:, 2); % Assuming the y values are in the second column

% Calculate averages over 1-second and 5-second intervals
interval1 = 1; % 1 second interval
x1 = (interval1:interval1:max(x))'; % Create x values for 1-second intervals
y1 = zeros(size(x1)); % Initialize y values for 1-second averages
for i = 1:length(x1)
    idx = x >= (x1(i) - interval1) & x < x1(i); % Find indices within 1-second interval
    y1(i) = mean(y(idx)); % Calculate average y value within the interval
end

% Define custom minimum and maximum time values for x-axis
minTime = 0; % Minimum time
maxTime = 22000;
% Create a figure with four subplots vertically stacked
figure;

% Plot original data
subplot(3,1,1);
plot(x, y, 'b-');
xlabel('Time (seconds)');
ylabel('Force (Newtons)');
title('Original Data');
grid on;
xlim([minTime, maxTime]); % Set x-axis limits

% Plot averages over 1-second intervals
subplot(3,1,2);
plot(x1, y1, 'b-');
xlabel('Time (seconds)');
ylabel('Force (Newtons)');
title('1-second Averages');
grid on;
xlim([minTime, maxTime]); % Set x-axis limits

% Calculate maximum values in the 1-second averages over every 600 seconds
interval2 = 600; % 600-second interval
max_values = [];
max_indices = [];
for i = 1:interval2:length(y1)
    if i+interval2-1 <= length(y1)
        [max_val, max_idx] = max(y1(i:i+interval2-1));
        max_values = [max_values; max_val];
        max_indices = [max_indices; max_idx + i - 1];
    end
end

% Plot maximum values with markers at the corresponding times
subplot(3,1,3);
plot(x1(max_indices), max_values, 'ro', 'MarkerFaceColor', 'r');
xlabel('Time (seconds)');
ylabel('Max Force (Newtons)');
title('Max Values from 1-second Averages (every 600 seconds)');
grid on;
xlim([minTime, maxTime]); % Set x-axis limits


% Concatenate times and max values into a matrix
max_data = [x1(max_indices), max_values];

% Save the data to a CSV file
csvwrite('max_values_with_time.csv', max_data);
