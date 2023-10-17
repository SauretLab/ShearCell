clear

load('var1cNoOut.mat');
load('var2cNoOut.mat');
scatter(var1cNoOut(1,:), var1cNoOut(2,:)/0.02039);
hold on
scatter(var2cNoOut(1,:), var2cNoOut(2,:)/0.02039);
xlabel('Normal Stress')
xlim([0,10000])
ylabel('Shear Stress')
ylim([0,10000])

x = [var1cNoOut(1,:),var2cNoOut(1,:)];
y = [var1cNoOut(2,:)/0.02039,var2cNoOut(2,:)/0.02039];
Fit = polyfit(x,y,1);

% Generate a line using the fitted coefficients
x_line = linspace(min(x), max(x), 100); % Create a range of x values
y_line = polyval(Fit, x_line); % Compute the corresponding y values

plot(x_line, y_line); % Plot the linear regression line
