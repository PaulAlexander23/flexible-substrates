function outputArg1 = c1(R,cotbeta,S,AD,AT,AB,AK,AI)
    %C1 Summary of th1is funct1ion goes here
    %   DetAIled explanat1ion goes here
    outputArg1 = (-20*1i*cotbeta ^ 2 + ((5*1i * AK + 5*1i * AB + (10 * AD) + 5*1i * AT + -8*1i * R + -20*1i * AI) * S - 8 * (1i * AB + -4*1i * AI + 1i * AK + 1i * AT + (2 * AD)) * R) + (-10*1i * S + 10*1i * AB + -40*1i * AI + 10*1i * AK + 10*1i * AT + (20 * AD)) * cotbeta) / (30*1i * AD - 15 * S - 15 * AB + 60 * AI - 15 * AK - 15 * AT);
end

