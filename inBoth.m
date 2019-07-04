function [c, index] = inBoth(a, b, varargin)
    p = inputParser;
    addOptional(p, 'AbsTol', 1e-14, @isnumeric);
    addOptional(p, 'RelTol', 1e-14, @isnumeric);
    parse(p, varargin{:});

    aIndex = false(length(a), 1);
    for j = 1:length(a)
        location = abs(a(j)-b) <= max(p.Results.RelTol*abs(b), p.Results.AbsTol);
        aIndex(j) = any(location);
        if aIndex(j)
            % Remove first match
            b(find(location, 1)) = [];
        end
    end

    c = a(aIndex);
    index = aIndex;
end