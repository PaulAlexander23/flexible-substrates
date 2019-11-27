function phi = computePhi(z,vec)
   y = -1 + 2*z; % Transform from 0 to 1 into -1 to 1
   
   phi = inverseChebyshevTransform(vec, y);
end
