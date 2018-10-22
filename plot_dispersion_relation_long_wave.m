function plot_dispersion_relation_long_wave(R,cotbeta,AK,kL)
    %PLOT_DISPERSION_RELATION_LONG_WAVE
    M = 2;
    if(nargin<8)
        kL = 0.5;
    end
    k = linspace(0,kL,M);
    
    c = compute_long_wave(k,R,cotbeta,0,0,0,0,AK,0);
    %c = compute_long_wave(k,R,cotbeta,S*(k.^2),AD*(k),AT*(k.^2),AB*(k.^4),AK,AI*(k.^2));
    
    plot(k,imag(c),'k--');
    xlabel('$\alpha$','Interpreter','latex')
    ylabel('$c_i$','Interpreter','latex')
    title('Dispersion relation')
end