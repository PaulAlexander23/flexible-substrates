function plot_v(k,R,cotbeta,S,AD,AT,AB,AK,AI,varargin)
    %PLOT_V
    
    [~, vec] = compute_OS_eigs(k,R,cotbeta,S,AD,AT,AB,AK,AI);
    
    z = linspace(0,1)';
    
    phi = compute_phi(z, vec);
    
    v = real(1i * k * phi(:,1));
    
    plot(v,z,varargin{:},'LineWidth',1.1)
    xlabel('$v$','Interpreter','latex')
    ylabel('$z$','Interpreter','latex')
end
