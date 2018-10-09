function [ci, R, k] = plot_neutral_curve_k_R_long_wave(cotbeta,AK)
    %PLOT_NEUTRAL_CURVE_K_R_LONG_WAVE
    kN = 100;
    k = linspace(0,1.5,kN);
    RN = 100;
    R = linspace(0,5,RN);
    ci = zeros(RN,kN);
    
    parfor j = 1:RN
        ci(:,j)= imag(compute_long_wave(k,R(j),cotbeta,0,0,0,0,AK,0));
    end

    contour_single(R, k, ci);
    xlabel('R');
    ylabel('k');
end
