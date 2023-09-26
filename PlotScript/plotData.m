list = ['Max','11kg','8kg','6kg','4kg','0kg'];

for i = 1:size(list)
    filename = strcat('firstCohesive',num2str(stations(i)),'.csv')
    a = readmatrix(filename);

    plot(a(1,:),a(2,:));

end