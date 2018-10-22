function plot_dispersion_relation(R,cotbeta,S,AD,AT,AB,AK,kL)
    %PLOT_DISPERSION_RELATION
    M = 200; % 200
    if(nargin<8)
        kL = 0.5;
    end
    k = linspace(kL/M,kL,M);
    numberOfModes = 2;
    c = zeros(M,numberOfModes);
    
    parfor j = 1:M
        e = compute_OS_eigs(k(j),R,cotbeta,S,AD,AT,AB,AK);
        c(j,:) = e(1:numberOfModes);
    end
    
    plot(k,imag(c),'k');
    xlabel('$\alpha$','Interpreter','latex')
    ylabel('$c_i$','Interpreter','latex')
    title('Dispersion relation')
end