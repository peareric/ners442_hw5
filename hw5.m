% Eric Pearson
% Sara Bashir 
% NERS 442 HW5
close all;
% clear;
clc;

%%
% 1
% a)
load('full_ejection.mat','time','reactivity','power');

figure(1);
plot(time,power,'-k');
gca.FontSize = 18;
xlabel('Time [sec]');
ylabel('Relative Core Power');
title('Power versus Time');

figure(2);
plot(time,reactivity,'-k');
gca.FontSize = 18;
xlabel('Time [sec]');
ylabel('Core Reactivity [$]');
title('Reactivity versus Time');

reactivity_full = reactivity;
power_full = power;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% b)
% boron 1147.96

% i)
% K-eff = 1.007675

% ii)
load('partial_ejection.mat','reactivity','power');

figure(3);
plot(time,power_full,'-r',time,power,'-k');
gca.FontSize = 18;
xlabel('Time [sec]');
ylabel('Relative Core Power');
title('Power versus Time');
legend('Full Insertion','Partial Insertion');

figure(4);
plot(time,reactivity_full,'-r',time,reactivity,'-k');
gca.FontSize = 18;
xlabel('Time [sec]');
ylabel('Core Reactivity [$]');
title('Reactivity versus Time');
legend('Full Insertion','Partial Insertion');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% c)
load('33_power_ejection.mat','power_0','react_0','power_33','react_33');

figure(5);
plot(time,power_0,'-r',time,power_33,'-k');
gca.FontSize = 18;
xlabel('Time [sec]');
ylabel('Relative Core Power');
title('Power versus Time');
legend('Core at 0% Power','Core at 33% Power');
axis([0 1 0 70]);

figure(6);
plot(time,react_0,'-r',time,react_33,'-k');
gca.FontSize = 18;
xlabel('Time [sec]');
ylabel('Core Reactivity [$]');
title('Reactivity versus Time');
legend('Core at 0% Power','Core at 33% Power');

%%
% 2

% hgap 10% up


