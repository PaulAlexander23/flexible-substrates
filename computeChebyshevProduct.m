function P = computeChebyshevProduct(u, v)
    M = length(u);
    N = length(v);
    P = zeros(M*N,1);
    for j = 0:M-1
        for k = 0:N-1
            P(j+k+1) = P(j+k+1) + u(j+1) * v(k+1)/2;
            P(abs(j-k)+1) = P(abs(j-k)+1) + u(j+1) * v(k+1)/2;
        end
    end
    
end