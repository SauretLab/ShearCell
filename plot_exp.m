%% Data Estimates PLot - Mohr Coloumb Failure

g = 9.81; % acceleration due to gravity [m/s^2]
shaft = 2.2905; % Weight of shaft attatchment with no additional mass [kg]

R_out = 0.09525;
% R_out = 0.083;%radius measured %radius of outer cylinder [m]
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

plot ((sig4.*ones(size(T4))), tau4, 'go');

sig = [sig1 sig2 sig3 sig4];
tau = [tau1_avg tau2_avg tau3_avg tau4_avg];

plot (sig, tau, 'ro')


%% mass 0: only system laod, wet

mwet1 = 0+ .4;
N1 = (mwet1 + shaft)*g; % Normal Load 1 [N]
sig1 = N1/(pi*(R_out^2 - R_in^2)); % Normal Stress 1 [Pa]

T1 = [7.34322 7.336 8.627 9.185 9.743 9.267 8.326 7.799 6.853].*L; % %force times length arm -measured torques at failure 1 [Nm]
tau1 = T1./((2*pi/3)*(R_out^3 - R_in^3)); % Shear Stress at Failure 1 [Pa]
tau1_avg = mean(tau1);
tau1_err = std(tau1);

T1_dry = [];

figure(1)
plot ((sig1.*ones(size(T1))), tau1, 'diamondr');
xlim([0 5000])
ylim([0 5000])
grid on
xlabel('$\sigma$ (Pa)', 'Interpreter','latex', 'FontSize',20)
ylabel('$\tau$ (Pa)', 'Interpreter','latex', 'FontSize',20)
hold on


%% mass 1: sys load + m1, wet

mwet1 = 1.1495+ .4;
N1 = (mwet1 + shaft)*g; % Normal Load 1 [N]
sig1 = N1/(pi*(R_out^2 - R_in^2)); % Normal Stress 1 [Pa]

T1 = [11.809 12.913 11.367 14.394 9.865 10.279].*L; % %force times length arm -measured torques at failure 1 [Nm]
tau1 = T1./((2*pi/3)*(R_out^3 - R_in^3)); % Shear Stress at Failure 1 [Pa]
tau1_avg = mean(tau1);
tau1_err = std(tau1);

T1_dry = [];

figure(1)
plot ((sig1.*ones(size(T1))), tau1, 'diamondr');
xlim([0 5000])
ylim([0 5000])
grid on
xlabel('$\sigma$ (Pa)', 'Interpreter','latex', 'FontSize',20)
ylabel('$\tau$ (Pa)', 'Interpreter','latex', 'FontSize',20)
hold on


%% mass 2: sys load + m2, wet

mwet2 = 2.270 + .4;
N1 = (mwet2 + shaft)*g; % Normal Load 1 [N]
sig1 = N1/(pi*(R_out^2 - R_in^2)); % Normal Stress 1 [Pa]

T1 = [14.39 14.54 12.15 13.92 13.59].*L; % %force times length arm -measured torques at failure 1 [Nm]
tau1 = T1./((2*pi/3)*(R_out^3 - R_in^3)); % Shear Stress at Failure 1 [Pa]
tau1_avg = mean(tau1);
tau1_err = std(tau1);

T1_dry = [];

figure(1)
plot ((sig1.*ones(size(T1))), tau1, 'diamondr');
xlim([0 5000])
ylim([0 5000])
grid on
xlabel('$\sigma$ (Pa)', 'Interpreter','latex', 'FontSize',20)
ylabel('$\tau$ (Pa)', 'Interpreter','latex', 'FontSize',20)
hold on

tau_c_Co_075 = 110.55; % shear stress intercept avg of trials
mu_Co_075 = (0.3169 + 0.374 + 0.3124)/3; % friction avg of trials
%% fit line
x = linspace (0, 5000, 1000);
plot (x, mu_Co_075.*x + tau_c_Co_075, '-', 'Color', '#007DC5')

%% incline plane data

% W = 0.5%
% trial #1
h_d1077_W05_1 = [18.69 23.36 28.04 32.71 37.38]; % h/d for the given parameter _ trial #
theta_d1077_W05_1 = [44.6 38.3 35.2 32.3 29.8]; %average failure angle per height _ trial #
phi_d1077_W05_1 = 0.54; %average volume fraction for trials 

sig_d1077_W05_1 = [181.3910828 265.4280553 325.0979281 399.7404828 473.2729614]; % normal stress at collapse in Pa
tau_d1077_W05_1 = [178.8759039 209.622447 229.331361 252.7054432 271.0459807]; % shear stress at collapse in Pa

    % trial #2
h_d1077_W05_2 = [18.69 23.36 28.04 32.71 37.38]; % h/d for the given parameter _ trial #
theta_d1077_W05_2 = [39.2 38.2 31.8 30.8 29.8]; %average failure angle per height _ trial #
phi_d1077_W05_2 = 0.58; %average volume fraction for trials 

sig_d1077_W05_2 = [210.8637366 272.3763531 354.9937603 434.0420361 512.9249152]; % normal stress at collapse in Pa
tau_d1077_W05_2 = [171.9762672 214.3390545 220.1054567 258.7409825 293.7548687]; % shear stress at collapse in Pa

    % trial #3
h_d1077_W05_3 = [18.69 23.36 28.04 32.71 37.38]; % h/d for the given parameter _ trial #
theta_d1077_W05_3 = [39.8 35.8 34.8 28.3 28.7]; %average failure angle per height _ trial #
phi_d1077_W05_3 = 0.54; %average volume fraction for trials 

sig_d1077_W05_3 = [195.5718898 274.7544262 334.6632677 408.3384504 476.8037773]; % normal stress at collapse in Pa
tau_d1077_W05_3 = [162.9443555 198.1591418 232.5970303 219.8676023 261.0424431]; % shear stress at collapse in Pa

    % average
Co_075 = 7.51; % cohesive number avg of trials (lc / d)
tau_c_Co_075 = 110.55; % shear stress intercept avg of trials
mu_Co_075 = (0.3169 + 0.374 + 0.3124)/3; % friction avg of trials
lc_Co_075 = 8.15; % cohesive length avg of trials (mm)
lc_Co_075_err = 1.17; %error in lc

plot (sig_d1077_W05_1, tau_d1077_W05_1, 'o', 'MarkerSize', 10, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', '#007DC5')
hold on
plot (sig_d1077_W05_2, tau_d1077_W05_2, 'o', 'MarkerSize', 10, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', '#007DC5')
plot (sig_d1077_W05_3, tau_d1077_W05_3, 'o', 'MarkerSize', 10, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', '#007DC5')


