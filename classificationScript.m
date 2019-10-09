load ~/Data/flexible-substrates/floryan/neutral-curve-cotbeta-14_3007-S-1000-AD-1000-AT-0-AB-0-AK-100000000-AI-0-modes-5-nop-80.mat
%% Surface Mode
plotFromLoad
hold on
kSurface = 0.2;
RSurface = 1000;

plot(kSurface, RSurface, '.')

%%
[val, vec, residual] = computeNumerical(kSurface,RSurface,cotbeta,S,AD,AT,AB,AK,AI,numberOfPolynomials);

%%
val(1)

%%
plot_phi(kSurface, RSurface, cotbeta, S, AD, AT, AB, AK, AI,1)

%% Shear Mode
plotFromLoad
hold on
kShear = 2;
RShear = 5500;

plot(kShear, RShear, '.')

%%
[val, vec, residual] = computeNumerical(kShear,RShear,cotbeta,S,AD,AT,AB,AK,AI,numberOfPolynomials);

%%
val(1)

%%
plot_phi(kShear, RShear, cotbeta, S, AD, AT, AB, AK, AI,1)

%% Both
plotFromLoad
hold on
kBoth = 1;
RBoth = 1e4;

plot(kBoth, RBoth, '.')

%%
[val, vec, residual] = computeNumerical(kBoth,RBoth,cotbeta,S,AD,AT,AB,AK,AI,numberOfPolynomials);

%%
val(1)
val(2)

%%
figure;
plot_phi(kBoth, RBoth, cotbeta, S, AD, AT, AB, AK, AI,1)
figure;
plot_phi(kBoth, RBoth, cotbeta, S, AD, AT, AB, AK, AI,2)