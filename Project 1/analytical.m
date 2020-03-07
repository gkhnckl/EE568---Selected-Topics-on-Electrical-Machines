clc; clear all; close all;
thet = linspace(-45,45,5000);  %deg, electrical angle

g1 = 2*0.5e-3;  %m, air gap clearance of the first part
g2 = 2*2.5e-3;  %m, air gap clearance of the second part
d = 20e-3; %m, model depth
mu0 = pi*4e-7; %H/m, permeability of free space
I = 3;  %A, current
N = 250;  %number of turns
rad_ef = 11e-3;  %m, effective radius

thet1 = 80-abs(thet);  %deg, angle of the first part
thet2 = abs(thet); %deg, angle of the second part

len1 = pi*rad_ef*thet1/180;  %m, arc length of first part
len2 = pi*rad_ef*thet2/180;  %m, arc length of second part

area1 = len1*d;  %m2, area of the first part
area2 = len2*d;  %m2, area of the second part

rel1 = g1/mu0./area1;  %1/H, reluctance of first part
rel2 = g2/mu0./area2;  %1/H, reluctance of second part

rel = rel1.*rel2 ./ (rel1+rel2); %1/H, effective reluctance

ind = N^2./rel;  %H, inductance
energy = 0.5*ind*I^2; %J, stored energy

torque = diff(energy)./diff(thet*pi/180); %Nm, torque

% plot(thet,ind);
% plot(thet(2:end),torque);


%% inductance plot

filedir = 'C:\Users\DELL\Documents\Dersler\EE568 Selected Topics on Electrical Machines\Project 1\Ind.csv';   % file import
ind_fem_data = readtable(filedir,'HeaderLines',1);

thet_fem = table2array(ind_fem_data(:,2));  %ms, time data
ind_fem = table2array(ind_fem_data(:,3));  %V, induced voltage fem phase

plot(thet_fem,ind_fem,thet,ind*1e3,'linewidth',2);
legend('FEA','Analytical');

xlabel('Angular position (deg)');
ylabel('Inductance (mH)');
title('Inductance comparison');


%% torque plot

filedir = 'C:\Users\DELL\Documents\Dersler\EE568 Selected Topics on Electrical Machines\Project 1\Tor.csv';   % file import
torque_fem_data = readtable(filedir,'HeaderLines',1);

thet_fem = table2array(torque_fem_data(:,2));  %ms, time data
torque_fem = table2array(torque_fem_data(:,3));  %V, induced voltage fem phase

plot(thet_fem,torque_fem,thet(2:end),torque*1e3,'linewidth',2);
legend('FEA','Analytical');

xlabel('Angular position (deg)');
ylabel('Torque (mNm)');
title('Torque comparison');

