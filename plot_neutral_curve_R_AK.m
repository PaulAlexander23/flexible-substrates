function [ci, AK, R] = plot_neutral_curve_R_AK(method,k,cotbeta,S,AD,AT,AB,AI,modes)
    %PLOT_NEUTRAL_CURVE_R_AK
    if nargin < 9
        modes = 1;
    end
    
    RN = 50;
    RL = 5;
    R = linspace(0,RL,RN);
    AKN = 50;
    AK = logspace(-2,3,AKN);
    
    ci = zeros(RN,AKN,modes);
    
    for j = 1:RN
        for n = 1:AKN
            ci(j,n,:) = imag(compute_c_switchboard(method,k,R(j),cotbeta,S,AD,AT,AB,AK(n),AI,modes));
        end
    end
    
    hold on;
    for n = 1:modes
        contour_single(log10(AK), R, ci(:,:,n));
    end
    xlabel('log_{10}(A_K)');
    ylabel('R');
end