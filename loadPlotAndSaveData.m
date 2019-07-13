files = dir('*.mat');
fileNames = {files.name};
% hold on
for file = fileNames
    figure;
    load(file{1});
    plotFromLoad;
    resizeAndSaveFigure;
end