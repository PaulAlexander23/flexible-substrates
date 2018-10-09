function [ci, R, k] = plot_neutral_curve_k_R(cotbeta,S,AD,AT,AB,AK)
    %PLOT_NEUTRAL_CURVE_K_R
    kN = 100;
    k = linspace(0,1.5,kN);
    RN = 100;
    R = linspace(0,5,RN);
    ci = zeros(kN,RN);
    
    parfor j = 1:RN
        for n = 1:kN
            ci(n,j) = max(imag(compute_OS_eigs(k(n),R(j),cotbeta,S,AD,AT,AB,AK)));
        end
    end
    
    contour_single(R, k, ci);
    xlabel('R');
    ylabel('k');
end
