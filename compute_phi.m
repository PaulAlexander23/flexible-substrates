function phi = compute_phi(y,vec)
   %COMPUTE_PHI
   N = size(vec,1)/2 - 3;
   T = zeros(length(y),N+3);
   
   for k = 0:N+2
       T(:,k+1) = myChebyshevT(k,y);
   end
   
   phi = T*vec(1:end/2,:);
end