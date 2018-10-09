function plot_dispersion_relation(R,cotbeta,S,AD,AT,AB,AK)
    
    M = 100;
    k = linspace(0.0001,2,M);
    c = zeros(M,4);
    
    parfor j = 1:M
        c(j,:) = compute_c_numerics(k(j),R,cotbeta,S,AD,AT,AB,AK);
    end
    
    plot(k,imag(c));
    xlabel('$\alpha$','Interpreter','latex')
    ylabel('$\Im(c)$','Interpreter','latex')
    title('Dispersion relation')
    axis([0,2,-2,2])
end