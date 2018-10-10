function [ci, AD, R] = plot_neutral_curve_R_AD(k,cotbeta,S,AK,AT,AB)
    %PLOT_NEUTRAL_CURVE_R_AD
    res = 50;
    
    R = logspace(-2,3,res);
    AD = logspace(-2,3,res);
    
    ci = zeros(res);
    
    for j = 1:res
        for n = 1:res
            ci(j,n) = max(imag(compute_OS_eigs(k,R(j),cotbeta,S,AD(n),AT,AB,AK)));
        end
    end
    
    contour_single(log10(AD), log10(R), ci);
    xlabel('log_{10}(A_D)');
    ylabel('log_{10}(R)');
end




