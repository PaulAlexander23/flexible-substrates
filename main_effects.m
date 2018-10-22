%MAIN Driver for the flexible substrates paper

clear all
global colorCount

colorCount = 1;

%% LINEAR STABILITY

figure('position',[680,558,5*80,5*60]); % figure 2
colorCount = 1;
hold on;
labels = [];
for cotbeta = [0.2,1,5]
    plot_neutral_curve_R_AK_long_wave(cotbeta);
    labels = [labels, sprintf("cot(\\beta) = %g",cotbeta)];
end
legend(labels);
text(-0.5,5,'Stable')
text(2,3,'Unstable')

print('figure-3','-depsc')

%% NUMERICAL METHODS

figure('position',[680,558,5*80,5*60]);
hold on
plot_phase_speed_long_wave(1,1,100);
plot_phase_speed(1,1,1,1,1,1,100,0);
plot_phase_speed_long_wave(1,1,10);
plot_phase_speed(1,1,1,1,1,1,10,0);
plot_phase_speed_long_wave(1,1,1);
plot_phase_speed(1,1,1,1,1,1,1,0);
text(0.1,1.8,"A_{K} increasing \rightarrow")

print('figure-4a','-depsc')

figure('position',[680,558,5*80,5*60]);
hold on
plot_dispersion_relation_long_wave(1,1,100);
plot_dispersion_relation(1,1,1,1,1,1,100,0);
plot_dispersion_relation_long_wave(1,1,10);
plot_dispersion_relation(1,1,1,1,1,1,10,0);
plot_dispersion_relation_long_wave(1,1,1);
plot_dispersion_relation(1,1,1,1,1,1,1,0);
axis([0,inf,-inf,0.4])
text(0.2,0.1,"A_{K} increasing \uparrow")

print('figure-4b','-depsc')

%%

figure('position',[680,558,5*80,5*60]);
hold on
plot_phase_speed_long_wave(10,1,1);
plot_phase_speed(10,1,1,1,1,1,1,0);
plot_phase_speed_long_wave(5,1,1);
plot_phase_speed(5,1,1,1,1,1,1,0);
plot_phase_speed_long_wave(1,1,1);
plot_phase_speed(1,1,1,1,1,1,1,0);
text(0.1,1.3,"R increasing \downarrow")

print('figure-4b','-depsc')

figure('position',[680,558,5*80,5*60]);
hold on
plot_dispersion_relation_long_wave(10,1,1);
plot_dispersion_relation(10,1,1,1,1,1,1,0);
plot_dispersion_relation_long_wave(5,1,1);
plot_dispersion_relation(5,1,1,1,1,1,1,0);
plot_dispersion_relation_long_wave(1,1,1);
plot_dispersion_relation(1,1,1,1,1,1,1,0);
axis([0,inf,-inf,0.5])
text(0.2,0.1,"R increasing \leftarrow")

print('figure-4c','-depsc')

%%

figure('position',[680,558,5*80,5*60]);
hold on
plot_dispersion_relation_long_wave(1,1,1);
plot_dispersion_relation(1,1,0,0,0,0,1,0);
axis([0,inf,0,2])

print('figure-5a','-depsc')

figure('position',[680,558,5*80,5*60]);
hold on
plot_phase_speed_long_wave(1,1,1);
plot_phase_speed(1,1,0,0,0,0,1,0);
axis([0,inf,0,10])

print('figure-5b','-depsc')

%%

figure('position',[680,558,5*80,5*60]); % figure 7
colorCount = 1;
hold on;
plot_neutral_curve_R_AK_long_wave(1);
labels = strings(4,1);
labels(1) = "Long wave";
n = 2;
for k = [0.1,0.2,0.3]
    plot_neutral_curve_R_AK(k,1,1,1,1,1,0);
    labels(n) = sprintf("\\alpha = %g",k);
    n = n+1;
end
clear n;
axis([-1,3,0,2])
legend(labels);
legend('Location','northwest');

text(1.5,0.5,"Stable")
text(-0.7,0.5,"Unstable")

print('figure-6','-depsc')

%%

figure('position',[680,558,5*80,5*60]);
hold on;
plot_dispersion_relation(1,1,1,1,1,1,1,0,20);
plot_dispersion_relation(1,1,1,1,0,0,1,0,20);
plot_dispersion_relation(1,1,1,1,0.1,0.1,1,0,20);
text(2,0.3,"\downarrow increasing A_{B} & A_{T}")

print('figure-7a','-depsc')

figure('position',[680,558,5*80,5*60]);
hold on;
plot_phase_speed(1,1,1,1,1,1,1,0,20);
plot_phase_speed(1,1,1,1,0,0,1,0,20);
plot_phase_speed(1,1,1,1,0.1,0.1,1,0,20);
text(3,1.5,"\downarrow increasing A_{B} & A_{T}")

print('figure-7b','-depsc')

%% NUMERICAL RESULTS

figure('position',[680,558,6*80,5*60]); % figure 9
colorCount = 1;
cotbeta = 1;
S = 1;
AD = 1;
AT = 1;
AB = 1;
labels = [];

hold on;
for AK = [0,1,10]
    plot_neutral_curve_k_R(cotbeta,S,AD,AT,AB,AK,0);
    labels = [labels, sprintf("A_K = %g",AK)];
end
legend(labels);
legend('Location','eastoutside');

print('figure-8','-depsc')

%%

figure('position',[680,558,6*80,5*60]); % figure 10
colorCount = 1;
cotbeta = 1;
S = 1;
AT = 1;
AB = 1;
labels = [];
k = 0.5;
hold on;
mywaitbar = waitbar(0);
for AD = 10.^[-2,-1,0,1,2]
    plot_neutral_curve_R_AK(k,cotbeta,S,AD,AT,AB,0);
    labels = [labels, sprintf("A_D = %g",AD)];
    waitbar((log2(AD)+3)/9, mywaitbar);
end
legend(labels);
legend('Location','eastoutside');
text(0,5,'Stable')
text(1.8,1,'Unstable')
print('figure-9','-depsc')

mywaitbar.delete;

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
    plot_k_R(cotbeta,S,AD,AT,AB,AK,0);
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
    plot_k_R(cotbeta,S,AD,AT,AB,AK,0);
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
    plot_k_R(cotbeta,S,AD,AT,AB,AK,0);
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
    plot_k_R(cotbeta,S,AD,AT,AB,AK,0);
    labels = [labels, sprintf("A_B = %g",AB)];
end
legend(labels);
legend('Location','eastoutside');

print('figure-13','-depsc')

%%

figure('position',[680,558,6*80,5*60]); % figure 14

plot_dispersion_relation(0.4,1,1,0.1,1,1,3,0);

print('figure-14','-depsc')

%%

figure('position',[680,558,6*80,5*60]); % figure 15

plot_phase_speed(0.4,1,1,0.1,1,1,3,0);

print('figure-15','-depsc')


%%

figure('position',[680,558,6*80,5*60]); % figure 16

colorCount = 1;
hold on
plot_k_R(1,1,0.1,1,1,3,0);
plot_k_R(1,1,0.4,1,1,3,0);

legend('A_D = 0.1','A_D = 0.4','Location','southeast')

print('figure-16','-depsc')

%%

figure('position',[680,558,6*80,5*60]); % figure 17

hold on;
for AD = linspace(0.1,0.3,9)
    plot_dispersion_relation(0.4,1,1,AD,1,1,3,0);
end

print('figure-17','-depsc')

%%

figure('position',[680,558,6*80,5*60]); % figure 18

colorCount = 1;
hold on;
plot_AK_R(0.5,1,1,0.1,1,1,0);
plot_AK_R(0.5,1,1,1,1,1,0);

print('figure-18','-depsc')
