function [ci, AD, R] = plot_R_AD(k,cotbeta,S,AK,AT,AB)
    
    res = 50;
    
    R = logspace(-2,3,res);
    AD = logspace(-2,3,res);
    
    ci = zeros(res);
    
    for j = 1:res
        for n = 1:res
            ci(j,n) = imag(compute_c_numerics(k,R(j),cotbeta,S,AD(n),AT,AB,AK));
        end
    end
    
    contour_single(log10(AD), log10(R), ci);
    xlabel('log_{10}(A_D)');
    ylabel('log_{10}(R)');
end




