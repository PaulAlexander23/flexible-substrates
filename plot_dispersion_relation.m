function plot_dispersion_relation(method,R,cotbeta,S,AD,AT,AB,AK,AI,kL,modes)
    %PLOT_DISPERSION_RELATION
    M = 200;
    if(nargin<10)
        kL = 0.5;
    end
    if(nargin<11)
        modes = 1;
    end
    
    k = linspace(kL/M,kL,M);
    c = zeros(M,modes);
    
    parfor j = 1:M
        c(j,:) = compute_c_switchboard(method,k(j),R,cotbeta,S,AD,AT,AB,AK,AI,modes)
    end
    
    plot(k,imag(c),'k');
    xlabel('$\alpha$','Interpreter','latex')
    ylabel('$c_i$','Interpreter','latex')
    title('Dispersion relation')
end