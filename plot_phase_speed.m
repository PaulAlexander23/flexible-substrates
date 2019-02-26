function plot_phase_speed(method,R,cotbeta,S,AD,AT,AB,AK,AI,kL,modes,varargin)
    %PLOT_PHASE_SPEED
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
    c = nan(M,modes);
    
    parfor j = 1:M
        c(j,:) = compute_c_switchboard(method,k(j),R,cotbeta,S,AD,AT,AB,AK,AI,modes)
    end
    
    plot(k,sort(real(c),2),varargin{:},'LineWidth',2);
    xlabel('$\alpha$','Interpreter','latex')
    ylabel('$c_r$','Interpreter','latex')
    title('Phase speed')
end
