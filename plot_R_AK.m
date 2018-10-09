function [ci, AK, R] = plot_R_AK(k,cotbeta,S,AD,AT,AB)
    
    res = 100;
    
    R = linspace(0,10,res);
    AK = logspace(-2,3,res);
    
    ci = zeros(res);
    
    parfor j = 1:res
        for n = 1:res
            ci(j,n) = imag(compute_c_numerics(k,R(j),cotbeta,S,AD,AT,AB,AK(n)));
        end
    end
    
    contour_single(log10(AK), R, ci);
    xlabel('log_{10}(A_K)');
    ylabel('R');
end




