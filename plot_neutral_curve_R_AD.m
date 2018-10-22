function [ci, AD, R] = plot_neutral_curve_R_AD(k,cotbeta,S,AK,AT,AB,numberOfModes)
    %PLOT_NEUTRAL_CURVE_R_AD
    RN = 100;
    RL = 5;
    %R = linspace(0,RL,RN);
    R = logspace(-2,3,RN);
    ADN = 100;
    AD = logspace(-2,3,ADN);
    if nargin < 7
        numberOfModes = 1;
    end
    ci = zeros(RN,ADN,numberOfModes);
    
    for j = 1:RN
        for n = 1:ADN
            val = imag(compute_OS_eigs(k,R(j),cotbeta,S,AD(n),AT,AB,AK));
            ci(j,n,:) = val(1:numberOfModes);
        end
    end
    hold on;
    for n = 1:numberOfModes
        contour_single(log10(AD), log10(R), ci(:,:,n));
    end
    xlabel('log_{10}(A_D)');
    ylabel('log_{10}(R)');
end




