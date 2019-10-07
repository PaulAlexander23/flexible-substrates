
currentAxis = gca();
yticks = currentAxis.YTick;

currentFigure = gcf();
currentFigure.Units = 'centimeters';
currentFigure.Position = [1, 10, 7.2, 6];

currentAxis.YTick = yticks;

filename = makeFilename("nc","cotbeta",cotbeta,"S",S,"AD",AD,"AT",AT,"AB",AB,"AK",AK,"AI",AI);
print(filename, '-depsc')