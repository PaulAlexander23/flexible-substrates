function out = contour_single(x, y, Z)
    
    global colorCount
    
    colors = get(gca,'colororder');
    out = contour(x, y, Z, [0 0], 'Linecolor', colors(colorCount,:));
    
    colorCount = 1+mod(colorCount,7);
    
end

