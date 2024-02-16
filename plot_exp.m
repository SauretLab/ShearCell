%% Data Estimates PLot - Mohr Coloumb Failure

g = 9.81; % acceleration due to gravity [m/s^2]
shaft = 2; % Weight of shaft attatchment with no additional mass [kg]

R_out = 0.083; %radius of outer cylinder [m]
R_in = 0.051; %radius of inner cylinder [m]
% Height = ; %height of cylinders [m]
% Vol_tot = pi*Height*(R_out^2 - R_in^2); %[m^3]

L = 0.216; % force arm length [m]

% Normal Stress = (m + shaft)*g;
% sig = Normal Stress / pi*(R_out^2 - R_in^2)
% tau = Torque / ((2*pi/3)*(R_out^3 - R_in^3))

%% Experiment Specific Detials:

% d = ; %grain size [m]
% rho_g = ; %grain density [kg/m^3]
% mass_g = ; %mass of grains placed into cell [kg]
% 
% rho_b = mass_g./Vol_tot; %system bulk density [kg/m^3]
% phi = rho_b./rho_g; %volume fraction estimate [dim-less]

%% mass 1: 1.1495kg

m1 = 1.1495; % mass 1 [kg]
N1 = (m1 + shaft)*g; % Normal Load 1 [N]
sig1 = N1/(pi*(R_out^2 - R_in^2)); % Normal Stress 1 [Pa]

T1 = [1.140 1.432 1.129 1.123 1.116]; % measured torques at failure 1 [Nm]
tau1 = T1./((2*pi/3)*(R_out^3 - R_in^3)); % Shear Stress at Failure 1 [Pa]
tau1_avg = mean(tau1);
tau1_err = std(tau1);

T1_dry = [];

figure(1)
plot ((sig1.*ones(size(T1))), tau1, 'bo');
xlim([0 5000])
ylim([0 5000])
grid on
xlabel('$\sigma$ (Pa)', 'Interpreter','latex', 'FontSize',20)
ylabel('$\tau$ (Pa)', 'Interpreter','latex', 'FontSize',20)
hold on

%% mass 2: 2.270kg

m2 = 2.270; % mass 2 [kg]
N2 = (m2 + shaft)*g; % Normal Load 2 [N]
sig2 = N2/(pi*(R_out^2 - R_in^2)); % Normal Stress 2 [Pa]

T2 = [1.69 1.70 1.71 1.71 1.715]; % measured torques at failure 2 [Nm]
tau2 = T2./((2*pi/3)*(R_out^3 - R_in^3)); % Shear Stress at Failure 2 [Pa]
tau2_avg = mean(tau2);
tau2_err = std(tau2);

plot ((sig2.*ones(size(T2))), tau2, 'bo');

%% mass 3: 3.3490kg

m3 = 3.349; % mass 3 [kg]
N3 = (m3 + shaft)*g; % Normal Load 3 [N]
sig3 = N3/(pi*(R_out^2 - R_in^2)); % Normal Stress 3 [Pa]

T3 = [2.02 2.03 2.04 2.04 2.04]; % measured torques at failure 3 [Nm]
tau3 = T3./((2*pi/3)*(R_out^3 - R_in^3)); % Shear Stress at Failure 3 [Pa]
tau3_avg = mean(tau3);
tau3_err = std(tau3);

plot ((sig3.*ones(size(T3))), tau3, 'bo');

%% mass 4: 0kg

m4 = 0; % mass 4 [kg]
N4 = (m4 + shaft)*g; % Normal Load 4 [N]
sig4 = N4/(pi*(R_out^2 - R_in^2)); % Normal Stress 4 [Pa]

T4 = [0.76 0.78 0.77 0.76 0.75]; % measured torques at failure 3 [Nm]
tau4 = T4./((2*pi/3)*(R_out^3 - R_in^3)); % Shear Stress at Failure 3 [Pa]
tau4_avg = mean(tau4);
tau4_err = std(tau4);

plot ((sig4.*ones(size(T4))), tau4, 'bo');

sig = [sig1 sig2 sig3 sig4];
tau = [tau1_avg tau2_avg tau3_avg tau4_avg];

plot (sig, tau, 'ro')