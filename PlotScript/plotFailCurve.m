%list = {'all','2big2med','2big1m','2big','systemWeight'};
%list = {'1med','1big2med1small','1big'};
clear
clc
close all

list = {'Max'};
for i = 1:length(list)
    filename = strcat('thirdCohesive',string(list(i)),'.csv');
    Time_Force = readmatrix(filename);
    
    Shear = Time_Force;
    armLength = 0.15;
    % Nedderman eq for torque
    rext = 0.09525;
    rint = 0.0508;
    Shear(2,:) = (2*pi/3)*(rext^3-rint^3)*(Time_Force(2,:)*armLength);

    loglog(Shear(1,:),Shear(2,:));
    xlim([0 inf]);
    xlabel('time')
    ylabel('shear')
    
    hold on
end
grid on
legend(string(list))