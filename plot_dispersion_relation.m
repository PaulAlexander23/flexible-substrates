function plot_dispersion_relation(R,cotbeta,S,AD,AT,AB,AK)
    
    M = 100;
    k = linspace(0,1.5,M);
    c = zeros(M,1);
    
    parfor j = 1:M
        %c(j) = OS_eigs_corrected_again(k(j),R,cotbeta,S,AD,AT,AB,AK);
        % To retain the phase speed need to identify the index of the maximum
        [~,temp] = compute_OS_eigs(k(j),R,cotbeta,S,AD,AT,AB,AK);
        [~,I] = max(imag(temp));
        c(j) = temp(I);
    end
    
    plot(k,imag(c));
    xlabel('$\alpha$','Interpreter','latex')
    ylabel('$\Im(c)$','Interpreter','latex')
    title('Dispersion relation')
end