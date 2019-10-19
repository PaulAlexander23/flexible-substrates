
unstableIndex = imag(c)>0;
unstablePhi = unstableIndex.*phi;
unstableC = unstableIndex.*c;

mode = zeros(size(unstableC));
for r = 1:size(mode,3)
    for s = 1:size(mode,2)
        for t = 1:size(mode,1)
            modeArray = classifyMode(unstableC(t,s,r), squeeze(unstablePhi(t,s,r,:)), k(t), false);
            mode(t,s,r) = find(modeArray);
        end
    end
end

mode = unstableIndex.*mode;
figure;
surf(R,k,mode(:,:,1).');
colorbar
set(gca, 'XScale', 'log')
