

AK = logspace(-1,3,20);
R = linspace(0,10,20);
stable = zeros(20);

for j = 1:20
    for k = 1:20
        stable(j,k) = OS_eigs_corrected(1,R(k),1,1,1,1,1,AK(j));
    end
end

[X,Y] = meshgrid(log10(AK),R);

contour(X,Y,stable,[0,0]);
%imagesc(log10(AK),R,stable);