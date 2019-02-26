function out = contour_single(x, y, Z, varargin)
    %CONTOUR_SINGLE Plots a single contour line and changes the colour for
    %the next one. 7 distinct colours
    global colorCount
    if isempty(colorCount)
        colorCount = 1;
    end
    
    colors = get(gca,'colororder');
    out = contour(x, y, Z, [0 0], varargin{:}, 'Linecolor', colors(colorCount,:),'LineWidth',2);
    
    colorCount = 1+mod(colorCount,7);
end