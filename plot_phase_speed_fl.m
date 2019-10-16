function plot_phase_speed_fl(method, R, cotbeta, S, AD, AT, AB, AK, AI, kL, modes, varargin)
    %PLOT_PHASE_SPEED
    M = 1000;
    if (nargin < 10)
        kL = 0.5;
    end
    if (nargin < 11)
        modes = 1;
    end

    k = linspace(kL/M, kL, M);
    c = nan(M, modes);

    parfor j = 1:M
        c(j, :) = compute_c_switchboard(method, k(j), R, cotbeta, S, AD, AT, AB, AK, AI, modes)
    end

    plot(k, followLine2(sort(real(c), 2)), varargin{:}, 'LineWidth', 1.1);
    xlabel('$\alpha$', 'Interpreter', 'latex')
    ylabel('$c_r$', 'Interpreter', 'latex')
    title('Phase speed')
end
