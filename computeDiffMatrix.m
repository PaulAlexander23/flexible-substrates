function D = computeDiffMatrix(N, dz)
    D = spdiags(ones(N,1)*[-1,0,1]/2,[-1,0,1],N,N);
    D(1,1:3) = [-3, 4, -1]/2;
    D(end,end-2:end) = [1, -4, 3]/2;
    D = D ./ dz(1);
end