function I = computeChebyshevIntegrationMatrix(N)
%     N = numberOfModes/2 - 3;
    I = zeros(N,N + 1);
    
    
    I(1,2) = 1;
    if N > 1
        I(2,1:3) = [1/2, 0, 1/2];
    end
    for n = 2:N-1
        I(n+1,n+2) = 1/(2*n + 2);
        I(n+1,n) = 1/(2*n - 2);
    end
    
    I = I.';
    
end