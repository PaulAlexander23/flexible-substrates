function phi = computePhi(z,vec)
   %COMPUTE_PHI
%    N = length(vec)/2 - 3;
   N = length(vec);
   T = zeros(length(z),N);%+3);
   
   y = -1 + 2*z; % Transform to -1 to 1
   
   for k = 0:N-1%+2
       T(:,k+1) = myChebyshevT(k,y);
   end
   
%    phi = T*vec(1:end/2,:);

   phi = T*vec;
end
