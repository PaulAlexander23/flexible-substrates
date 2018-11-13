
%   cotbeta,  S, AD, AT, AB, AK, AI
C = [     1,  1,  1,  1,  1,  1,  1;
          1,  1,  1,  1,  1,  1,0.001;
          1,  1,  0,  0,  0,  1,0.1];

kL = 2;
modes = 1;

for n = 1:size(C,1)
    figure;
    cotbeta = C(n,1); S = C(n,2); AD = C(n,3); AT = C(n,4); AB = C(n,5); AK = C(n,6); AI = C(n,7); 
    plot_dispersion_relation("z",0,cotbeta,S,AD,AT,AB,AK,AI,kL,modes)
    xlabel("$\alpha$")
    ylabel("$c_i$")
end

%% Verification
cotbeta = 1; S = 1; AD = 1; AT = 1; AB = 1; AK = 1; AI = 1;
kL = 1.5; modes = 1;c
figure;
plot_dispersion_relation("z",0,cotbeta,S,AD,AT,AB,AK,AI,kL,modes)
hold on;
plot_dispersion_relation("n",0,cotbeta,S,AD,AT,AB,AK,AI,kL,modes,'--')
xlabel("$\alpha$")
ylabel("$c_i$")
legend("Zero Reynolds number","Numerical Solution")
