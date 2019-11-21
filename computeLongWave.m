function c = computeLongWave(params)
    %COMPUTE_LONG_WAVE Given required parameters, returns eigenvalue c
    %from the asymptotic long wave analysis.
    c = 2 + 1i * params.k .* (8/15 * params.R - 2/3 * params.cotbeta ...
        + 4/3 * params.cotbeta.^2 ./ params.AK);
end
