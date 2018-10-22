
%       R, cotbeta,  S, AD, AT, AB, AK
%C = [   1,       1,  1,  1,  1,  1,  1];
%C = -log(rand(10,7))*10;

for n = 10:size(C,1)
    figure()
    subplot(2,1,1);
    plot_dispersion_relation(C(n,1),C(n,2),C(n,3),C(n,4),C(n,5),C(n,6),C(n,7));
    subplot(2,1,2);
    plot_phase_speed(C(n,1),C(n,2),C(n,3),C(n,4),C(n,5),C(n,6),C(n,7));
end
