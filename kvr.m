
M = 100;
N = 100;

R = linspace(0,10,M);
alpha = linspace(0,1.5,N);
stable = zeros(M,N);

parfor j = 1:M
    for k = 1:N
        stable(j,k) = OS_eigs_corrected(alpha(k),R(j),1,1,1,1,1,1);
    end
end

[X,Y] = meshgrid(R,alpha);

contour(X,Y,stable,[0,0]);
%imagesc(log10(AK),R,stable);
xlabel('R')
ylabel('\alpha')
