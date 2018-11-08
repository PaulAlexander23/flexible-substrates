function [c, x, y] = plot_neutral_curve(method,k,R,cotbeta,S,AD,AT,AB,AK,AI,modes)
    %PLOT_NEUTRAL_CURVE
    if nargin < 8
        modes = 1;
    end
    
    inputs = {k,R,cotbeta,S,AD,AT,AB,AK,AI};
    
    xN = 0;
    yN = 0;
    
    for index = 1:length(inputs)
        len = length(inputs{index});
        if len > 1
            if (xN == 0)
                xN = len;
                xI = index;
                continue;
            end
            if(yN == 0)
                yN = len;
                yI = index;
                break;
            end
        end
    end
    
    x = inputs{xI};
    y = inputs{yI};
    
    C = zeros(length(inputs),1);
    for index = 1:length(C)
        if (index ~= xI) && (index ~= yI)
            C(index) = inputs{index};
        end
    end
    
    c = zeros(xN,yN,modes);
    
    for xi = 1:xN
        for yi = 1:yN
            C(xI) = inputs{xI}(xi);
            C(yI) = inputs{yI}(yi);
            k = C(1); R = C(2); cotbeta = C(3); S = C(4); AD = C(5); AT = C(6); AB = C(7); AK = C(8); AI = C(9); 
            c(xi,yi,:) = imag(compute_c_switchboard(method,k,R,cotbeta,S,AD,AT,AB,AK,AI,modes));
        end
    end
    hold on;
    for modei = 1:modes
        contour_single(x, y, c(:,:,modei));
    end

end