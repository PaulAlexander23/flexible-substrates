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
    
    c = zeros(yN,xN,modes);
    
    parfor xi = 1:xN
        for yi = 1:yN
            B = C;
            B(xI) = inputs{xI}(xi);
            B(yI) = inputs{yI}(yi);
            c(yi,xi,:) = imag(compute_c_switchboard(method,B(1),B(2),B(3),B(4),B(5),B(6),B(7),B(8),B(9),modes));
        end
    end
    hold on;
    for modei = 1:modes
        contour_single(x, y, c(:,:,modei));
    end

end
