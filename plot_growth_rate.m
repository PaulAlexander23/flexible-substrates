function plot_growth_rate(method,R,cotbeta,S,AD,AT,AB,AK,AI,kL,modes,varargin)
    %PLOT_GROWTH_RATE
    if method == "n"
        M = 80;
    else
        M = 100;
    end
    if(nargin<10)
        kL = 0.5;
    end
    if(nargin<11)
        modes = 1;
    end
    
    
    k = linspace(min(1e-4,kL/M),kL,M);
    c = zeros(M,modes);
    
    for j = 1:M
        params = makeParamsStruct(k(j), R, cotbeta, S, AD, AT, AB, AK, AI);
        c(j,:) = computeEigenvalues(method,params,modes);
    end
    
    plot(k,k'.*imag(c),varargin{:},'LineWidth',1.1);
    xlabel('$\alpha$','Interpreter','latex')
    ylabel('$\omega_i$','Interpreter','latex')
    title('Growth rate')
end
