function plot_phase_speed_long_wave(R,cotbeta,S,AD,AT,AB,AK,AI)
    
    M = 100;
    k = linspace(0,2,M);
    %c = compute_c_long_wave(k,R,cotbeta,S*(k.^2),AD*(k),AT*(k.^2),AB*(k.^4),AK,AI*(k.^2));
    c = compute_c_long_wave(k,R,cotbeta,0,0,0,0,AK,0);
    
    plot(k,real(c));
    xlabel('$\alpha$','Interpreter','latex')
    ylabel('$\Re(c)$','Interpreter','latex')
    title('Phase speed')
end