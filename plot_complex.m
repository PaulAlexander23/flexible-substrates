function plot_complex(method,R,cotbeta,S,AD,AT,AB,AK,AI,kL,modes,varargin)
    %PLOT_COMPLEX
    if method == "n"
        M = 80;
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
    hold on
    for n = 1:modes
        
        x = real(c(:,n))
        y = imag(c(:,n))
        plot([x], [y],varargin{:});
    end
    xlabel('$\Re(c)$','Interpreter','latex')
    ylabel('$\Im(c)$','Interpreter','latex')
    title('')
end
