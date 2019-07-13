function plot_phi(k,R,cotbeta,S,AD,AT,AB,AK,AI,mode,varargin)
    %PLOT_PHI
    if ~exist('mode','var')
        mode = 1;
    end
    
    [~, vec] = compute_OS_eigs(k,R,cotbeta,S,AD,AT,AB,AK,AI,mode);
   
    z = linspace(0,1)';
    
    phi = compute_phi(z, vec);

    plot(real(phi(:,mode)),z,varargin{:},'LineWidth',1.1)
    hold on
    plot(imag(phi(:,mode)),z,varargin{:},'--','LineWidth',1.1)
    
    legend('$\Re(\phi)$','$\Im(\phi)$')
    ylabel('$z$','Interpreter','latex')
end