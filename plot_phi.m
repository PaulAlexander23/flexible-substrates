function plot_phi(k,R,cotbeta,S,AD,AT,AB,AK,AI,varargin)
    %PLOT_PHI
    
    [~, vec] = compute_OS_eigs(k,R,cotbeta,S,AD,AT,AB,AK,AI);
    
    z = linspace(0,1)';
    
    phi = compute_phi(z, vec);
    
    plot(real(phi(:,1)),z,varargin{:},'LineWidth',1.1)
    xlabel('$\phi$','Interpreter','latex')
    ylabel('$z$','Interpreter','latex')
end
