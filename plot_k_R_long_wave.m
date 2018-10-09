function [ci, R, k] = plot_k_R_long_wave(cotbeta,S,AD,AT,AB,AK,AI)
    
    kN = 100;
    k = linspace(0,1.5,kN);
    RN = 100;
    R = linspace(0,5,RN);
    ci = zeros(RN,kN);
    
    parfor j = 1:RN
        ci(:,j)= imag(compute_c_long_wave(k,R(j),cotbeta,0,0,0,0,AK,0));
        %ci(:,j)= imag(compute_c_long_wave(k,R(j),cotbeta,k.^2*S,k*AD,k.^2*AT,k.^4*AB,AK,k.^2*AI));
    end

    contour_single(R, k, ci);
    xlabel('R');
    ylabel('k');
end
