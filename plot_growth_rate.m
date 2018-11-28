function plot_growth_rate(method,R,cotbeta,S,AD,AT,AB,AK,AI,kL,modes,varargin)
    %PLOT_GROWTH_RATE
    if method == "n"
        M = 20;
    else
        M = 1000;
    end
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
    plot(k,k'.*imag(c),varargin{:});
    xlabel('$\alpha$','Interpreter','latex')
    ylabel('$\omega_i$','Interpreter','latex')
    title('Growth rate')
end