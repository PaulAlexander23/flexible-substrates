function T = myChebyshevT(n,x)
    if n == 0
        T = ones(size(x));
    elseif n == 1
        T = x;
    else
        Told = ones(size(x));
        T = x;
        for i = 2:n
            temp = T;
            T = 2 * x .* T - Told;
            Told = temp;
        end
    end
end
