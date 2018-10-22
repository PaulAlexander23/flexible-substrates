function [ci, AK, R] = plot_neutral_curve_R_AK(k,cotbeta,S,AD,AT,AB,AI,numberOfModes)
    %PLOT_NEUTRAL_CURVE_R_AK
    RN = 100;
    RL = 5;
    R = linspace(0,RL,RN);
    AKN = 100;
    AK = logspace(-2,3,AKN);
    if nargin < 7
        numberOfModes = 1;
    end
    ci = zeros(RN,AKN,numberOfModes);
    
    parfor j = 1:RN
        for n = 1:AKN
            val = imag(compute_OS_eigs(k,R(j),cotbeta,S,AD,AT,AB,AK(n),AI));
            ci(j,n,:) = val(1:numberOfModes);
        end
    end
    hold on;
    for n = 1:numberOfModes
        contour_single(log10(AK), R, ci(:,:,n));
    end
    xlabel('log_{10}(A_K)');
    ylabel('R');
end