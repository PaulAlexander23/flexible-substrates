function out = followLine2(y)
    y = y';
    n = size(y, 2);
    order = [1, 2];
    out = zeros(size(y));

    dif = y(1, :) - y(2, :);
    gradDif = dif(2:end) - dif(1:end-1);

    out(:, 1) = y(order, 1);
    swapped = false;
    for i = 2:n - 2
        out(:, i) = y(order, i);
        if gradDif(i+1) < 0 && gradDif(i) > 0 && swapped == false
            order(1:2) = [order(2), order(1)];
            swapped = true;
        end
    end

    out(:, end-1) = y(order, end-1);
    out(:, end) = y(order, end);
end