function phi = computePhi(y,vec)
   %COMPUTE_PHI
   N = length(vec)/2 - 3;
   T = zeros(length(y),N+3);
   
   y = -1 + 2*y; % Transform to -1 to 1
   
   for k = 0:N+2
       T(:,k+1) = myChebyshevT(k,y);
   end
   
   phi = T*vec(1:end/2,:);
end
