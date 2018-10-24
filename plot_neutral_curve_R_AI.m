function [ci, AI, R] = plot_neutral_curve_R_AI(k,cotbeta,S,AD,AT,AB,AK,numberOfModes)
    %PLOT_NEUTRAL_CURVE_R_AK
    RN = 50;
    RL = 5;
    R = linspace(0,RL,RN);
    AIN = 50;
    AI = linspace(0,10,AIN);
    if nargin < 8
        numberOfModes = 1;
    end
    ci = zeros(RN,AIN,numberOfModes);
    
    parfor j = 1:RN
        for n = 1:AIN
            val = imag(compute_OS_eigs(k,R(j),cotbeta,S,AD,AT,AB,AK,AI(n)));
            ci(j,n,:) = val(1:numberOfModes);
        end
    end
    hold on;
    for n = 1:numberOfModes
        contour_single(AI, R, ci(:,:,n));
    end
    xlabel("A_I");
    ylabel("R");
end