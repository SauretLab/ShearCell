% Read data from CSV file
data = csvread('1.15mm0.5%wet5kgPre_sys,+1,+2,+3failed.csv'); % Replace 'your_file.csv' with the path to your CSV file

% Extract x and y data from the CSV data (assuming two columns)
x = data(:, 1); % Assuming the x values are in the first column
y = data(:, 2); % Assuming the y values are in the second column

% Plot the data
plot(x, y, 'b-'); % 'b-' specifies blue solid line, you can customize this

% Add labels and title
xlabel('X-axis Label');
ylabel('Y-axis Label');
title('Your Plot Title');

% Add grid (optional)
grid on;

% Add legend (optional)
legend('Data');

% Save the plot (optional)
% saveas(gcf, 'your_plot.png'); % Save the plot as an image file

% Display the plot
