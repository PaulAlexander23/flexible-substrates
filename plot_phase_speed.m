function plot_phase_speed(R,cotbeta,S,AD,AT,AB,AK)
    %PLOT_PHASE_SPEED
    M = 200;
    kL = 2;
    k = linspace(kL/M,kL,M);
    numberOfModes = 4;
    c = zeros(M,numberOfModes);
    
    parfor j = 1:M
        e = compute_OS_eigs(k(j),R,cotbeta,S,AD,AT,AB,AK);
        c(j,:) = e(1:numberOfModes);
    end
    
    plot(k,real(c));
    xlabel('$\alpha$','Interpreter','latex')
    ylabel('$c_r$','Interpreter','latex')
    title('Phase speed')
end