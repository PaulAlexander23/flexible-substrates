function plot_phase_speed_long_wave(R,cotbeta,S,AT,AB,AK,AI)
    
    M = 100;
    k = linspace(0,1.5,M);
    c = 2 + k.*c1(R,cotbeta,S.*(k.^2),AD.*(k),AT.*(k.^2),AB.*(k.^4),AK,AI.*(k.^2));
    
    plot(k,real(c));
    xlabel('$\alpha$','Interpreter','latex')
    ylabel('$\Re(c)$','Interpreter','latex')
    title('Phase speed')
end