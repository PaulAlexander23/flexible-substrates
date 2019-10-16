function plot_u(k,R,cotbeta,S,AD,AT,AB,AK,AI,varargin)
    %PLOT_U
    
    [~, vec] = compute_OS_eigs(k,R,cotbeta,S,AD,AT,AB,AK,AI,1);
    
    z = linspace(0,1)';
    
    phi = computePhi(z, vec);
    
    u = 2 * diff(real(phi(:,1)))./diff(z);
    
    plot(u,z(1:end-1)+z(2)/2,varargin{:},'LineWidth',1.1);
    xlabel('$\tilde{u}$','Interpreter','latex')
    ylabel('$z$','Interpreter','latex')
end
