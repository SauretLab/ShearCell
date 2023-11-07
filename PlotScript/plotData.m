%list = {'all','2big2med','2big1m','2big','systemWeight'};
%list = {'1med','1big2med1small','1big'};
list = {'1med','1big2med1small','1big'};
for i = 1:length(list)
    filename = strcat('thirdCohesive',string(list(i)),'.csv');
    a = readmatrix(filename);

    plot(a(1,:),a(2,:));
    xlim([0 inf]);
    
    hold on
end

legend(string(list))