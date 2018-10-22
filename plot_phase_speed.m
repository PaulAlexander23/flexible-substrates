function plot_phase_speed(R,cotbeta,S,AD,AT,AB,AK,kL)
    %PLOT_PHASE_SPEED
    M = 200;
    if(nargin<8)
        kL = 0.5;
    end
    k = linspace(kL/M,kL,M);
    numberOfModes = 1;
    c = zeros(M,numberOfModes);
    
    parfor j = 1:M
        e = compute_OS_eigs(k(j),R,cotbeta,S,AD,AT,AB,AK);
        c(j,:) = e(1:numberOfModes);
    end
    
    plot(k,real(c),'k');
    xlabel('$\alpha$','Interpreter','latex')
    ylabel('$c_r$','Interpreter','latex')
    title('Phase speed')
end