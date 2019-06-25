function plot_u(k,R,cotbeta,S,AD,AT,AB,AK,AI,varargin)
    %PLOT_U
    
    [~, vec] = compute_OS_eigs(k,R,cotbeta,S,AD,AT,AB,AK,AI);
    
    z = linspace(0,1)';
    
    phi = compute_phi(z, vec);
    
    u = diff(real(phi(:,1)))./diff(z);
    
    plot(u,z(1:end-1)+z(2)/2,varargin{:},'LineWidth',1.1)
    xlabel('$u$','Interpreter','latex')
    ylabel('$z$','Interpreter','latex')
end
