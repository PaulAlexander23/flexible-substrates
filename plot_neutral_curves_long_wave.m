function plot_neutral_curves_long_wave(cotbeta,S,AD,AT,AB,AK,AI)
    %PLOT_NEUTRAL_CURVES Plots neutral curves c_i=0 in the
    %   wavenumber-Reynolds number (k-R) plane,
    
    %mesh and range of k-R plane
    n=100;
    k=linspace(0.01,4,n);
    m=100;
    R=linspace(0.0001,30,m);
    
    parfor j=1:m
        for i=1:n
            ci(i,j)=2 + compute_c1(R,cotbeta,S,AD,AT,AB,AK,AI);
        end
    end
    
    %Plot neutral curve
    contour(R,k,ci,[0 0],'k')
    xlabel('$R$','Interpreter','latex')
    ylabel('wavenumber $\alpha$','Interpreter','latex')
    title(['$\cot \beta=$', num2str(cotbeta),', $S=$', num2str(S),...
        ', $A_D=$', num2str(AD), ', $A_T=$', num2str(AT),...
        ', $A_B=$', num2str(AB), ', $A_K=$', num2str(AK)],'Interpreter','latex')
    
end