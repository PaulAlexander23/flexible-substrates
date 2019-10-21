load ~/Data/flexible-substrates/modesInitialSweep2/neutral-curve-cotbeta-14_3007-S-1000-AD-10-AT-0-AB-0-AK-1000-AI-0-modes-5-nop-80.mat

[X, Y] = meshgrid(R, k);
Rq = logspace(log10(R(1)),log10(R(end)),1000);
kq = linspace(k(1),k(end),1000);
[Xq, Yq] = meshgrid(Rq, kq);
figure;
hold on
for j = 1:5
    
    cq = interp2(X, Y, imag(c(:,:,j)).', Xq, Yq);
    contour(Rq,kq, cq, [0, 0])
end
set(gca, 'XScale', 'log')
