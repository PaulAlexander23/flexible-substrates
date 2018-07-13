function plot_phase_speed(R,cotbeta,S,AD,AT,AB,AK)
    
    M = 100;
    k = linspace(0,2,M);
    c = zeros(M,1);
    
    parfor j = 1:M
        c(j) = compute_c_numerics(k(j),R,cotbeta,S,AD,AT,AB,AK);
    end
    
    plot(k,real(c));
    xlabel('$\alpha$','Interpreter','latex')
    ylabel('$\Re(c)$','Interpreter','latex')
    title('Phase speed')
end