% Read data from CSV file
data = csvread('1mm_0.5%wetsys_plus422g_plus422g.csv'); % Replace 'your_file.csv' with the path to your CSV file

% Extract x and y data from the CSV data (assuming two columns)
x = data(:, 1); % Assuming the x values are in the first column
y = data(:, 2); % Assuming the y values are in the second column

% Plot the data
plot(x, y, 'b-'); % 'b-' specifies blue solid line, you can customize this

% Add labels and title
xlabel('Time (seconds)');
ylabel('Force (Newtons)');
title('Force vs Time');

% Add grid (optional)
grid on;

% Add legend (optional)
legend('Data');

% Save the plot (optional)
% saveas(gcf, 'your_plot.png'); % Save the plot as an image file

% Display the plot