function create(k, R, cotbeta, S, AD, AT, AB, AK, AI, modes, numberOfPolynomials, jobid)
    if nargin < 12, jobid = ""; end
    Rl = length(R);
    val = zeros(Rl,length(k),modes);
    vec = zeros(Rl,length(k),2*(numberOfPolynomials+3),modes);
    
    parfor ki = 1:length(k)
        for Ri = 1:Rl
            params = makeParamsStruct(k(ki),R(Ri),cotbeta,S,AD,AT,AB,AK,AI);
            [val(Ri,ki,:), vec(Ri,ki,:,:)] = computeNumerical(params,numberOfPolynomials,modes);
        end
    end

    saveData("neutral-curve", val, vec, k, R, cotbeta, S, AD, AT, AB, AK, AI, modes, numberOfPolynomials, jobid)
end
