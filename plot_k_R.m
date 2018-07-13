function [ci, R, k] = plot_k_R(cotbeta,S,AD,AT,AB,AK)
    
    kN = 100;
    k = linspace(0,1.5,kN);
    RN = 100;
    R = linspace(0,5,RN);
    ci = zeros(kN,RN);
    
    parfor j = 1:RN
        for n = 1:kN
            ci(n,j) = imag(compute_c_numerics(k(n),R(j),cotbeta,S,AD,AT,AB,AK));
        end
    end
    
    contour_single(R, k, ci);
    xlabel('R');
    ylabel('k');
end
