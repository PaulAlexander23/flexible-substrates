function [ci, R, k] = plot_neutral_curve_k_R(cotbeta,S,AD,AT,AB,AK)
    %PLOT_NEUTRAL_CURVE_K_R
    kN = 100;
    kL = 5;
    k = linspace(kL/kN,kL,kN);
    RN = 100;
    RL = 10;
    R = linspace(RL/RN,RL,RN);
    numberOfModes = 3;
    ci = zeros(kN,RN,numberOfModes);
    
    parfor j = 1:RN
        for n = 1:kN
            val = imag(compute_OS_eigs(k(n),R(j),cotbeta,S,AD,AT,AB,AK));
            ci(n,j,:) = val(1:numberOfModes);
            
        end
    end
    hold on;
    for n = 1:numberOfModes
        contour_single(R, k, ci(:,:,n));
    end
    xlabel('R');
    ylabel('k');
end
