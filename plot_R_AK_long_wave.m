function [ci, AK, R] = plot_R_AK_long_wave(cotbeta)
    
    res = 100;
    
    R = linspace(0,10,res);
    AK = logspace(-1,3,res);
    
    ci = zeros(res);
    
    for j = 1:res
        for k = 1:res
            ci(j,k) = imag(compute_c_long_wave(1,R(j),cotbeta,0,0,0,0,AK(k),0));
        end
    end
    
    contour_single(log10(AK), R, ci);
    
    xlabel('log_{10}(A_K)');
    ylabel('R');
end




