list = {'Max','11kg','8kg','6kg','4kg','0kg'};

for i = 1:length(list)
    filename = strcat('firstCohesive',string(list(i)),'.csv');
    a = readmatrix(filename);

    plot(a(1,:),a(2,:));
    xlim([0 200]);
    
    hold on
end

legend(string(list))