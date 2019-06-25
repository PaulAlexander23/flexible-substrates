function plot_h(k,R,cotbeta,S,AD,AT,AB,AK,AI,varargin)
    %PLOT_H
    
    [val, vec] = compute_OS_eigs(k,R,cotbeta,S,AD,AT,AB,AK,AI);
    
    delta = 0.1;
    phi = compute_phi([1-delta, 1], vec);
    
    x = linspace(0,2*pi/k)';
    
    h = real((phi(end,1) / (-val(end) + (phi(end,1)-phi(end-1,1))/(delta))) * exp(1i*k*x));
    
    plot(x,h,varargin{:},'LineWidth',1.1)
    xlabel('$x$','Interpreter','latex')
    ylabel('$h$','Interpreter','latex')
end
