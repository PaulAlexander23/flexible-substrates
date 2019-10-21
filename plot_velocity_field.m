function plot_velocity_field(k,R,cotbeta,S,AD,AT,AB,AK,AI,varargin)
    xResolution = 20;
    zResolution = 20;
    arrowScale = 0.5;
    
    [~, vec] = compute_OS_eigs(k,R,cotbeta,S,AD,AT,AB,AK,AI,1);
    
    z = linspace(0,1,zResolution + 1)';
    
    phi = computePhi(z, vec);
    
    
    x = linspace(0,2*pi/k,xResolution);
    
    u = 2 * real(diff(phi(:,1))./diff(z) * exp(1i*k*x));
    v = 2 * real(1i * k * (phi(2:end,1) + phi(1:end-1,1))/2 * exp(1i*k*x));

    zCentre = z(1:end-1)/2 + z(2:end)/2;
    quiver(x, zCentre, u, v, arrowScale, varargin{:})
    xlabel('$x$')
    ylabel('$z$')
end
