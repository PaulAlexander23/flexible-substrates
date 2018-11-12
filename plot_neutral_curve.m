function [ci, AK, R] = plot_neutral_curve(k,R,cotbeta,S,AD,AT,AB,AK,AI,numberOfModes)
    %PLOT_NEUTRAL_CURVE_R_AK
    
    if arg(1) == "k" && arg(2) == "R"
        func = @(x,y) imag(compute_OS_eigs(x,y,cotbeta,S,AD,AT,AB,AK,AI));
    elseif arg(1) == "R" && arg(2) == "AK"
        func = @(x,y) imag(compute_OS_eigs(k,x,cotbeta,S,AD,AT,AB,y,AI));
    elseif arg(1) == "R" && arg(2) == "AD"
        func = @(x,y) imag(compute_OS_eigs(k,x,cotbeta,S,AD,AT,AB,y,AI));
    elseif arg(1) == "R" && arg(2) == "AI"
        func = @(x,y) imag(compute_OS_eigs(k,x,cotbeta,S,AD,AT,AB,y,AI));
    end
    
    xN = 100;
    xL = 5;
    x = linspace(0,xL,xN);
    yN = 100;
    y = logspace(-2,3,yN);
    
    if nargin < 7
        numberOfModes = 1;
    end
    
    ci = zeros(xN,yN,numberOfModes);
    
    parfor j = 1:xN
        for n = 1:yN
            val = func(x(n),y(n));
            ci(j,n,:) = val(1:numberOfModes);
        end
    end
    
    hold on;
    
    for n = 1:numberOfModes
        contour_single(log10(x), y, ci(:,:,n));
    end
    
    xlabel(arg(1));
    ylabel(arg(2));
end