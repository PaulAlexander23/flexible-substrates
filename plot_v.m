function plot_v(k,R,cotbeta,S,AD,AT,AB,AK,AI,varargin)
    %PLOT_V
    
    [~, vec] = compute_OS_eigs(k,R,cotbeta,S,AD,AT,AB,AK,AI,1);
    
    z = linspace(0,1)';
    
    phi = computePhi(z, vec);
    
    v = 2 * real(1i * k * phi(:,1));
    
    plot(v,z,varargin{:},'LineWidth',1.1)
    xlabel('$\tilde{v}$','Interpreter','latex')
    ylabel('$z$','Interpreter','latex')
end
