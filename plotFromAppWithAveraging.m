% Read data from CSV file
data = csvread('1.15mm0.5%wet5kgPre_sys,+1,+2,+3failed.csv'); % Replace 'your_file.csv' with the path to your CSV file

% Extract x and y data from the CSV data (assuming two columns)
x = data(:, 1); % Assuming the x values are in the first column
y = data(:, 2); % Assuming the y values are in the second column

% Apply Savitzky-Golay filter
windowSize = 51; % Window size
polynomialOrder = 3; % Polynomial order
yFiltered = sgolayfilt(y, polynomialOrder, windowSize);

% Calculate averages over 1-second and 5-second intervals
interval1 = 1; % 1 second interval
interval5 = 5; % 5 second interval
x1 = (interval1:interval1:max(x))'; % Create x values for 1-second intervals
y1 = zeros(size(x1)); % Initialize y values for 1-second averages
x5 = (interval5:interval5:max(x))'; % Create x values for 5-second intervals
y5 = zeros(size(x5)); % Initialize y values for 5-second averages
for i = 1:length(x1)
    idx = x >= (x1(i) - interval1) & x < x1(i); % Find indices within 1-second interval
    y1(i) = mean(y(idx)); % Calculate average y value within the interval
end
for i = 1:length(x5)
    idx = x >= (x5(i) - interval5) & x < x5(i); % Find indices within 5-second interval
    y5(i) = mean(y(idx)); % Calculate average y value within the interval
end

% Define custom minimum and maximum time values for x-axis
minTime = 2000; % Minimum time
maxTime = 4000; % Maximum time

% Create a figure with four subplots vertically stacked
figure;

% Plot original data
subplot(4,1,1);
plot(x, y, 'b-');
xlabel('Time (seconds)');
ylabel('Force (Newtons)');
title('Original Data');
grid on;
xlim([minTime, maxTime]); % Set x-axis limits

% Plot data after Savitzky-Golay filtering
subplot(4,1,2);
plot(x, yFiltered, 'r-');
xlabel('Time (seconds)');
ylabel('Force (Newtons)');
title('Data After Savitzky-Golay Filter');
grid on;
xlim([minTime, maxTime]); % Set x-axis limits

% Plot averages over 1-second intervals
subplot(4,1,3);
plot(x1, y1, 'b-');
xlabel('Time (seconds)');
ylabel('Force (Newtons)');
title('1-second Averages');
grid on;
xlim([minTime, maxTime]); % Set x-axis limits

% Plot averages over 5-second intervals
subplot(4,1,4);
plot(x5, y5, 'k-');
xlabel('Time (seconds)');
ylabel('Force (Newtons)');
title('5-second Averages');
grid on;
xlim([minTime, maxTime]); % Set x-axis limits
