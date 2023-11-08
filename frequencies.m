clear; close all

list = {'1med'}; % ,'1big2med1small','1big'
all_data = [];  % Initialize an empty array to store concatenated data

for i = 1:length(list)
    filename = strcat('thirdCohesive', string(list(i)), '.csv');
    a = readmatrix(filename);
    start_col = 50;
    end_col = 1675;
    a = a(:, start_col:end_col);
    all_data = [all_data, a(2, :)];  % Concatenate the second row of each data

    plot(a(1,:), a(2,:));
    xlim([5, inf]);
    grid on
    xlabel('time (s)');
    ylabel('force(N)');
    hold on
end

legend(string(list))

% Compute the FFT of the concatenated data
fs = 1 / (a(1, 2) - a(1, 1));  % Calculate the sampling frequency
N = length(all_data);  % Length of the concatenated data
freqs = (0:N-1) * fs / N;  % Frequency axis
fft_result = fft(all_data, N);  % Compute the FFT

% Plot the FFT result
figure;
plot(freqs, abs(fft_result));
title('FFT of Concatenated Data');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
