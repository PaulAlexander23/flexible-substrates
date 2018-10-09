function [ci, AK, R] = plot_neutral_curve_R_AK(k,cotbeta,S,AD,AT,AB)
    %PLOT_NEUTRAL_CURVE_R_AK
    res = 100;
    
    R = linspace(0,10,res);
    AK = logspace(-2,3,res);
    
    ci = zeros(res);
    
    parfor j = 1:res
        for n = 1:res
            ci(j,n) = max(imag(compute_OS_eigs(k,R(j),cotbeta,S,AD,AT,AB,AK(n))));
        end
    end
    
    contour_single(log10(AK), R, ci);
    xlabel('log_{10}(A_K)');
    ylabel('R');
end




