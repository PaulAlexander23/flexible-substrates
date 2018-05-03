function plot_dispersion_relation_linear(R,cotbeta,S,AT,AB,AK,AI)
    
    M = 100;
    k = linspace(0,1.5,M);
    c = 2 + k.*compute_c1(R,cotbeta,S.*(k.^2),AD.*(k),AT.*(k.^2),AB.*(k.^4),AK,AI.*(k.^2));
    
    plot(k,imag(c));
    xlabel('$\alpha$','Interpreter','latex')
    ylabel('$\Im(c)$','Interpreter','latex')
    title('Dispersion relation')
end