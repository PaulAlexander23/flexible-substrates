function p = makeParamsStruct(k, R, cotbeta, S, AD, AT, AB, AK, AI)
    p = struct();
    p.k = k;
    p.R = R;
    p.cotbeta = cotbeta;
    p.S = S;
    p.AK = AK;
    p.AT = AT;
    p.AB = AB;
    p.AD = AD;
    p.AI = AI;
end