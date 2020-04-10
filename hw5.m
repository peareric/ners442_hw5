% Eric Pearson
% Sara Bashir 
% NERS 442 HW5
close all;
clear;
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% b)

