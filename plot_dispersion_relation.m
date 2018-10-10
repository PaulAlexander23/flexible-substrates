function plot_dispersion_relation(R,cotbeta,S,AD,AT,AB,AK)
    %PLOT_DISPERSION_RELATION
    M = 200;
    kL = 2;
    k = linspace(kL/M,kL,M);
    numberOfModes = 4;
    c = zeros(M,numberOfModes);
    
    parfor j = 1:M
        e = compute_OS_eigs(k(j),R,cotbeta,S,AD,AT,AB,AK);
        c(j,:) = e(1:numberOfModes);
    end
    
    plot(k,imag(c));
    xlabel('$\alpha$','Interpreter','latex')
    ylabel('$\Im(c)$','Interpreter','latex')
    title('Dispersion relation')
end