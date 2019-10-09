function [c, type] = createWithClassify(k, R, cotbeta, S, AD, AT, AB, AK, AI, modes, numberOfPolynomials)

    Rl = length(R);
    c = zeros(Rl,length(k),modes);
    type = zeros(Rl, length(k), modes);
    
    parfor ki = 1:length(k)
        for Ri = 1:Rl
            [val, vec] = computeNumerical(k(ki), R(Ri), cotbeta, S, AD, AT, AB, AK, AI, numberOfPolynomials, modes);
            c(Ri,ki,:) = val;
            type(Ri,ki,:) = classifyFromEigenvector(k(ki), vec, modes);
        end
    end
    
    saveData("neutral-curve", c, type, k, R, cotbeta, S, AD, AT, AB, AK, AI, modes, numberOfPolynomials)
end
