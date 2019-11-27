function f = inverseChebyshevTransform(a, z)
    N = length(a);
    T = zeros(length(z), N);
    
    for k = 0:N-1
       T(:, k+1) = myChebyshevT(k, z);
    end

   f = T * a;
end