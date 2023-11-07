%list = {'all','2big2med','2big1m','2big','systemWeight'};
%list = {'1med','1big2med1small','1big'};
list = {'e1med'};
data = struct;
hold on

% Create figures 'a' and 'b'
figure('Name', 'Data Plot');
a = gcf;
hold on

figure('Name', 'FFT Plot');
b = gcf;
hold on

for i = 1:length(list)
    fileName = strcat('thirdCohesiv',string(list(i)),'.csv');

    data.(string(list(i))) = readmatrix(fileName);

    figure(a)
    plot(data.(string(list(i)))(1,:),data.(string(list(i)))(2,:));
    xlim([0 inf]);

    % Compute the FFT of the concatenated data
    fs = 1 / (data.(string(list(i)))(i, 2) - data.(string(list(i)))(i, 1));  % Calculate the sampling frequency
    N = length(data.(string(list(i))));  % Length of the concatenated data
    frequencies = (0:N-1) * fs / N;  % Frequency axis
    fft_result = fft(data.(string(list(i))), N);  % Compute the FFT

    % Plot the FFT result
    figure(b)
    plot(frequencies, abs(fft_result));
    title('FFT of Concatenated Data');
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
end 
figure(a)
legend(string(list))