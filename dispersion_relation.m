
R = 1; cotbeta = 1; S = 1; AD = 1; AT = 1; AB = 1; AK = 1;
M = 100;

k = linspace(0,1.5,M);
c = zeros(M,1);

parfor j = 1:M
    c(j) = OS_eigs_corrected(k(j),R,cotbeta,S,AD,AT,AB,AK);
end

plot(k,c);
xlabel('R')
ylabel('\alpha')
