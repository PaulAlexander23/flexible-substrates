function plot_phase_speed_long_wave(R,cotbeta,AK)
    %PLOT_PHASE_SPEED_LONG_WAVE
    M = 2;
    kL = 2;
    k = linspace(0,kL,M);
    
    c = compute_long_wave(k,R,cotbeta,0,0,0,0,AK,0);
    %c = compute_long_wave(k,R,cotbeta,S*(k.^2),AD*(k),AT*(k.^2),AB*(k.^4),AK,AI*(k.^2));
    
    plot(k,real(c));
    xlabel('$\alpha$','Interpreter','latex')
    ylabel('$c_r$','Interpreter','latex')
    title('Phase speed')
end