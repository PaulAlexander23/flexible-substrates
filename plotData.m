global colorCount

% figure
colorCount = 1;
hold on;
for modei = 1:modes
    contour(k, R, c(:,:,modei), [0, 0], 'k');
end
view([90 -90])
prettyPlot();
set(gca, 'YScale', 'log')
ylabel("$R$")
xlabel("$k$")
% yticks(10.^[-1,1,3,5]);
axis([0,2.8,10,10^5]);