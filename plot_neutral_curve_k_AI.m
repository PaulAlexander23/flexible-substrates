function [ci, AI, k] = plot_neutral_curve_k_AI(R,cotbeta,S,AD,AT,AB,AK,numberOfModes)
    %PLOT_NEUTRAL_CURVE_R_AK
    kN = 50;
    kL = 5;
    k = linspace(kL/kN,kL,kN);
    AIN = 50;
    %AIL = 10;
    %AI = linspace(0,AIL,AIN);
    AI = logspace(-2,3,AIN);
    if nargin < 8
        numberOfModes = 1;
    end
    ci = zeros(kN,AIN,numberOfModes);
    
    parfor j = 1:kN
        for n = 1:AIN
            val = imag(compute_OS_eigs(k(j),R,cotbeta,S,AD,AT,AB,AK,AI(n)));
            try 
                ci(j,n,:) = val(1:numberOfModes);
            catch
                ci(j,n,:) = -1;
            end
            
        end
    end
    hold on;
    for n = 1:numberOfModes
        contour_single(log10(AI), k, ci(:,:,n));
    end
    xlabel("A_I");
    ylabel("k");
end