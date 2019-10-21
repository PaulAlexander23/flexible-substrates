global colorCount

% figure
unstableIndex = imag(c)>0;
type(~unstableIndex)=0;
[surface, shear, wall] = splitIntoModes(type);

colorCount = 1;
hold('on');
contour_single(k, R, surface-0.5);
% contour_single(k, R, surface-1.5);
contour_single(k, R, shear-0.5);
contour_single(k, R, wall-0.5);

view([90 -90])
prettyPlot();
set(gca, 'YScale', 'log')
ylabel("$R$")
xlabel("$k$")
% yticks(10.^[-1,1,3,5]);
axis([0,2.8,10,10^5]);
