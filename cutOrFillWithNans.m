function out = cutOrFillWithNans(in, len)
    shape = size(in);
    out = nan(len, shape(2:end));
    index = 1:min(len, shape(1));
    out(index,:,:) = in(index,:,:);
end