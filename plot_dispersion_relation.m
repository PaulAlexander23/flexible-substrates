function plot_dispersion_relation(method,R,cotbeta,S,AD,AT,AB,AK,AI,kL,modes,varargin)
    %PLOT_DISPERSION_RELATION
    if method == "n"
        M = 40;
    else
        M = 1000;
    end
    if(nargin<10)
        kL = 0.5;
    end
    if(nargin<11)
        modes = 1;
    end
    
    k = linspace(min(1e-5,kL/M),kL,M);
    c = zeros(M,modes);
    
    parfor j = 1:M
        c(j,:) = compute_c_switchboard(method,k(j),R,cotbeta,S,AD,AT,AB,AK,AI,modes)
    end
    
    plot(k,imag(c),varargin{:},'LineWidth',1.1);
    xlabel('$\alpha$','Interpreter','latex')
    ylabel('$c_i$','Interpreter','latex')
    title('Dispersion relation')
end
