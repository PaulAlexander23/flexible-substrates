function plot_phi(k,R,cotbeta,S,AD,AT,AB,AK,AI,varargin)
    %PLOT_PHI
    
    [~, vec] = compute_OS_eigs(k,R,cotbeta,S,AD,AT,AB,AK,AI);
    
    y = linspace(0,1)';
    
    phi = compute_phi(y, vec);
    
    plot(real(phi(:,1)),y,varargin{:},'LineWidth',1.1)
    xlabel('$\phi$','Interpreter','latex')
    ylabel('$y$','Interpreter','latex')
    title('Most unstable eigenfunction')
end
