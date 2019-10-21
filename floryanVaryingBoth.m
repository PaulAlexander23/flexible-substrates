addpath ../flexible-substrates/
global colorCount


AK = [1e3, 1e2, 1e1, 1e0];
AD = [1e-1, 1e0, 1e1, 1e2, 1e3];
timeTaken = zeros(length(AK),length(AD));

for j = 1:length(AK)
    for k = 1:length(AD)
        tic;
        figure('Units', 'centimeters', 'Position', [1, 10, 7.2, 6])
        colorCount = 1;
        plot_neutral_curve("n",linspace(0.001,2.8,100),logspace(-1,5,100),cot(pi/45),1000,AD(k),0,0,AK(j),0,5); % AK=1e3 on Box
        ylabel("$R$")
        xlabel("$k$")
        set(gca, 'YScale', 'log')
        yticks(10.^[-1,1,3,5]);
        view([90 -90])
        prettyPlot();
        print(sprintf('floryanAK%.0eAD%.0e',AK(j),AD(k)), '-depsc')
        timeTaken(j,k) = toc;
    end
end