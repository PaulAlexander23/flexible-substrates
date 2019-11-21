function D = computeChebyshevDifferentiationMatrix(numberOfModes)
    D = zeros(numberOfModes,numberOfModes);
    
    for j = 1:numberOfModes/2
        D(1,2*j)=2*j-1;
    end
    
    for m=2:numberOfModes
        for j = 1:(numberOfModes-m+1)/2
            D(m,m+2*j-1)=2*(m+2*(j-1));
        end
    end
     
%     for k = numberOfModes-2:-1:1
%         D(k,:) = D(k+1, :);
%         D(k,k+1) = 2 * k;
%     end
%     c = ones(numberOfModes,1);
%     c(1) = 2;
%     
%     D = D ./ c;
end
    