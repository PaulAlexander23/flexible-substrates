function [ci, R, k] = plot_neutral_curve_k_R(cotbeta,S,AD,AT,AB,AK,AI,numberOfModes)
    %PLOT_NEUTRAL_CURVE_K_R
    kN = 100;
    kL = 3;
    k = linspace(kL/kN,kL,kN);
    RN = 100;
    RL = 5;
    R = linspace(RL/RN,RL,RN);
    if nargin < 7
        numberOfModes = 1;
    end
    ci = zeros(kN,RN,numberOfModes);
    
    parfor j = 1:RN
        for n = 1:kN
            val = imag(compute_OS_eigs(k(n),R(j),cotbeta,S,AD,AT,AB,AK,AI));
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