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
plot(time,power,'.-k');
hold on;
n = 69;
plot([time(n) time(n)],[0 5],'-k');
m = 46;
plot([time(m) time(m)],[0 5],'-k');
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
load('hgap_up.mat','power_hgap_up','tf_hgap_up','tf_base');

hgap_maxP = max(power_hgap_up);
base_maxP = max(power_full);
maxP_sens_hgap_up = sqrt( ((hgap_maxP-base_maxP)/base_maxP).^2./(.1^2) )

hgap_maxTf = max(tf_hgap_up);
base_maxTf = max(tf_base);
maxTf_sens_hgap_up = sqrt( ((hgap_maxTf-base_maxTf)/base_maxTf).^2./(.1^2) )

% Width diff taken to be new intersect with power level at end of base
interp = @(y,y1,y2,x1,x2) x1 + (y-y1).*(x2-x1)/(y2-y1);
hgap_width = interp(power_full(69),power_hgap_up(69),power_hgap_up(70),...
             time(69),time(70)) - time(46);
base_width = time(69)-time(46);
width_sens_hgap_up = sqrt( ((hgap_width-base_width)/base_width).^2./(.1^2) )

% hgap 10% down
save('hgap_down.mat','power_hgap_down','tf_hgap_down');

hgap_maxP = max(power_hgap_down);
maxP_sens_hgap_down = sqrt( ((hgap_maxP-base_maxP)/base_maxP).^2./(.1^2) )

hgap_maxTf = max(tf_hgap_down);
maxTf_sens_hgap_down = sqrt( ((hgap_maxTf-base_maxTf)/base_maxTf).^2./(.1^2) )

% Width diff taken to be new intersect with power level at end of base
interp = @(y,y1,y2,x1,x2) x1 + (y-y1).*(x2-x1)/(y2-y1);
hgap_width = interp(power_full(69),power_hgap_up(69),power_hgap_up(70),...
             time(69),time(70)) - time(46);
base_width = time(69)-time(46);
width_sens_hgap_down = sqrt( ((hgap_width-base_width)/base_width).^2./(.1^2) )

