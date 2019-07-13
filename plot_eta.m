function plot_eta(k,R,cotbeta,S,AD,AT,AB,AK,AI,varargin)
    %PLOT_ETA
    
    [val, vec] = compute_OS_eigs(k,R,cotbeta,S,AD,AT,AB,AK,AI,1);
    
    phi = compute_phi(0, vec);
    
    x = linspace(0,2*pi/k)';
    
    eta = 2 * real(phi(1) / val(1) * exp(1i*k*x));
    
    plot(x,eta,varargin{:},'LineWidth',1.1)
    xlabel('$x$','Interpreter','latex')
    ylabel('$\tilde{\eta}$','Interpreter','latex')
end
