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