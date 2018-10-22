%MAIN Driver for the flexible substrates paper

clear all
global colorCount

colorCount = 1;

%%

figure('position',[680,558,6*80,5*60]);

plot_neutral_curve_k_R(1,1,0.1,1,1,3,2);
text(2.5,2,'Stable')
text(2.5,0.5,'Unstable')

print('secondary-modes-1','-depsc')

%%

figure('position',[680,558,6*80,5*60]);

plot_neutral_curve_R_AK(0.5,1,1,0.1,1,1,2);
text(2,1,'Stable')
text(0.5,4,'Unstable')
text(-1,3,'Unstable')
legend('Largest mode','Secondary mode')

print('secondary-modes-2','-depsc')

%%

figure('position',[680,558,6*80,5*60]);
%k,cotbeta,S,AK,AT,AB,numberOfModes
plot_neutral_curve_R_AD(0.5,1,1,3,1,1,5);
text(0,-1,'Stable')
text(-1,2,'Unstable')
legend('Largest mode','Secondary mode')

print('secondary-modes-3','-depsc')

%%
% 
% figure('position',[680,558,6*80,5*60]); % figure 14
% 
% plot_dispersion_relation(0.4,1,1,0.1,1,1,3);
% 
% print('figure-14','-depsc')
% 
% %%
% 
% figure('position',[680,558,6*80,5*60]); % figure 15
% 
% plot_phase_speed(0.4,1,1,0.1,1,1,3);
% 
% print('figure-15','-depsc')
% 
% 
% %%
% 
% figure('position',[680,558,6*80,5*60]); % figure 16
% 
% colorCount = 1;
% hold on
% plot_k_R(1,1,0.1,1,1,3);
% plot_k_R(1,1,0.4,1,1,3);
% 
% legend('A_D = 0.1','A_D = 0.4','Location','southeast')
% 
% print('figure-16','-depsc')
% 
% %%
% 
% figure('position',[680,558,6*80,5*60]); % figure 18
% 
% colorCount = 1;
% hold on;
% plot_AK_R(0.5,1,1,0.1,1,1);
% plot_AK_R(0.5,1,1,1,1,1);
% 
% print('figure-18','-depsc')
