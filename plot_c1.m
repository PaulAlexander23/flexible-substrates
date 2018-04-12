
cotbeta=1; tanbeta = 1/cotbeta;
S=1; 
AD=1;
AT=1;
AB=1; 
AK=1000;
AI=0;

R=linspace(0.0001,30,100);

c1 = 0.2e1 ./ 0.3e1 .* (0.2e1 + (-0.2e1 ./ 0.5e1 .* AD .* R .* 1i .^ 3 + R .* (AB - 4 .* AI + AK + AT) .* 1i .^ 2 ./ 0.5e1 + AD .* (S - 0.2e1 .* R) .* 1i + (AB - (4 .* AI) + AK + AT + 0.4e1 ./ 0.5e1 .* S) .* R - S .* (AB - 4 .* AI + AK + AT) ./ 0.2e1) .* tanbeta .^ 2 + (-0.2e1 ./ 0.5e1 .* R + S - AB + (4 .* AI) - AK - AT - 0.2e1 ./ 0.5e1 .* R .* 1i .^ 2 + 0.2e1 .* 1i .* AD) .* tanbeta) .* 1i ./ ((0.2e1 .* AD .* 1i .^ 3 + (-AB + 4 .* AI - AK - AT) .* 1i .^ 2 + S) .* tanbeta + 0.2e1 .* 1i .^ 2 + 0.2e1) ./ tanbeta;
hold on
plot(R,real(c1));
plot(R,imag(c1));