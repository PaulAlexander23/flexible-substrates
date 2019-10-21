

unstableIndex = imag(c)>0;
type(~unstableIndex)=0;
[surface, shear, wall] = splitIntoModes(type);

global colorCount
colorCount = 1;
hold('on');
contour_single(k, R, surface-0.5);
% contour_single(k, R, surface-1.5);
contour_single(k, R, shear-0.5);
contour_single(k, R, wall-0.5);

set(gca, 'YScale', 'log')
view([90 -90])

