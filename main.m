%MAIN Driver for the flexible substrates paper

clear all
global colorCount

colorCount = 1;

%%
colorCount = 1;

figure('position',[680,558,5*80,5*60]);
plot_AK_R_long_wave(1); % figure 1

print('figure-1','-depsc')

%%

figure('position',[680,558,5*80,5*60]); % figure 2
colorCount = 1;
hold on;
labels = [];
for cotbeta = [0.25,0.5,1,2,4]
    plot_AK_R_long_wave(cotbeta);
    labels = [labels, sprintf("cot(\\beta) = %g",cotbeta)];
end
legend(labels);

print('figure-2','-depsc')

%%

figure('position',[680,558,5*80,5*60]);
hold on
plot_dispersion_relation_long_wave(1,1,0,0,0,0,1,0);
plot_dispersion_relation(1,1,0,0,0,0,1);

print('figure-3','-depsc')

figure('position',[680,558,5*80,5*60]);
hold on
plot_phase_speed_long_wave(1,1,0,0,0,0,1,0);
plot_phase_speed(1,1,0,0,0,0,1);

print('figure-4','-depsc')

%%

figure('position',[680,558,5*80,5*60]);
hold on
plot_dispersion_relation_long_wave(1,1,1,1,1,1,1,0);
plot_dispersion_relation(1,1,1,1,1,1,1);

print('figure-5','-depsc')

figure('position',[680,558,5*80,5*60]);
hold on
plot_phase_speed_long_wave(1,1,1,1,1,1,1,0);
plot_phase_speed(1,1,1,1,1,1,1);

print('figure-6','-depsc')

%%

figure('position',[680,558,5*80,5*60]); % figure 7
colorCount = 1;
hold on;
plot_AK_R_long_wave(1);
labels = ["Long wave"];
for k = [0.1,0.2,0.3]
    plot_AK_R(k,1,1,1,1,1);
    labels = [labels, sprintf("\\alpha = %g",k)];
end
axis([-1,3,0,2])
legend(labels);
legend('Location','northwest');

print('figure-7','-depsc')

%%

figure('position',[680,558,5*80,5*60]); % figure 8

colorCount = 1;

plot_k_R(1,1,1,1,1,1);

print('figure-8','-depsc')

%%

figure('position',[680,558,6*80,5*60]); % figure 9
colorCount = 1;
cotbeta = 1;
S = 1;
AD = 1;
AT = 1;
AB = 1;
labels = [];

hold on;
for AK = 2.^(-2:4)
    plot_k_R(cotbeta,S,AD,AT,AB,AK);
    labels = [labels, sprintf("A_K = %g",AK)];
end
legend(labels);
legend('Location','eastoutside');

print('figure-9','-depsc')

%%

figure('position',[680,558,6*80,5*60]); % figure 10
colorCount = 1;
cotbeta = 1;
S = 1;
AT = 1;
AB = 1;
AK = 1;
labels = [];

hold on;
mywaitbar = waitbar(0);
for AD = 2.^(-2:2:6)
    plot_k_R(cotbeta,S,AD,AT,AB,AK);
    labels = [labels, sprintf("A_D = %g",AD)];
    waitbar((log2(AD)+3)/9, mywaitbar);
end
legend(labels);
legend('Location','eastoutside');

print('figure-10','-depsc')

mywaitbar.delete;

%%

figure('position',[680,558,6*80,5*60]); % figure 11
colorCount = 1;
cotbeta = 1;
AD = 1;
AT = 1;
AB = 1;
AK = 1;
labels = [];

hold on;
for S = 2.^(-2:4)
    plot_k_R(cotbeta,S,AD,AT,AB,AK);
    labels = [labels, sprintf("S = %g",S)];
end
legend(labels);
legend('Location','eastoutside');

print('figure-11','-depsc')

%%

figure('position',[680,558,6*80,5*60]); % figure 12
colorCount = 1;
cotbeta = 1;
S = 1;
AD = 1;
AB = 1;
AK = 1;
labels = [];

hold on;
for AT = 2.^(-2:4)
    plot_k_R(cotbeta,S,AD,AT,AB,AK);
    labels = [labels, sprintf("A_T = %g",AT)];
end
legend(labels);
legend('Location','eastoutside');

print('figure-12','-depsc')

%%

figure('position',[680,558,6*80,5*60]); % figure 13
colorCount = 1;
cotbeta = 1;
S = 1;
AD = 1;
AT = 1;
AK = 1;
labels = [];

hold on;
for AB = 2.^(-2:4)
    plot_k_R(cotbeta,S,AD,AT,AB,AK);
    labels = [labels, sprintf("A_B = %g",AB)];
end
legend(labels);
legend('Location','eastoutside');

print('figure-13','-depsc')

%%

figure('position',[680,558,6*80,5*60]); % figure 14

plot_dispersion_relation(0.4,1,1,0.1,1,1,3);

print('figure-14','-depsc')

%%

figure('position',[680,558,6*80,5*60]); % figure 15

plot_phase_speed(0.4,1,1,0.1,1,1,3);

print('figure-15','-depsc')


%%

figure('position',[680,558,6*80,5*60]); % figure 16

colorCount = 1;
hold on
plot_k_R(1,1,0.1,1,1,3);
plot_k_R(1,1,0.4,1,1,3);

legend('A_D = 0.1','A_D = 0.4','Location','southeast')

print('figure-16','-depsc')

%%

figure('position',[680,558,6*80,5*60]); % figure 17

hold on;
for AD = linspace(0.1,0.3,9)
    plot_dispersion_relation(0.4,1,1,AD,1,1,3);
end

print('figure-17','-depsc')

%%

figure('position',[680,558,6*80,5*60]); % figure 18

colorCount = 1;
hold on;
plot_AK_R(0.5,1,1,0.1,1,1);
plot_AK_R(0.5,1,1,1,1,1);

print('figure-18','-depsc')
