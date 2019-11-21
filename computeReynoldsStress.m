% function term2 = computeReynoldsStress(z, phi, dphidz, params)    
%     dz = diff(z);
%     
% %     mdphidz = diff(phi)./dz;
%     D = computeDiffMatrix(length(phi),dz(1));
%     dphidz = D * phi;
%     
%     mz = (z(2:end) + z(1:end-1))/2;
%     mphi = (phi(2:end) + phi(1:end-1))/2;
%     mdphidz = (dphidz(2:end) + dphidz(1:end-1))/2;
%     
%     term2 = -8*pi*params.R * sum((imag(mphi.*conj(mdphidz)).*(1-mz)) .* dz);
% end
function reynoldsStress = computeReynoldsStress(vec, params)    
    N = length(vec);
    
    D = computeChebyshevDifferentiationMatrix(N);

    dydz = 2;
    Dvec = dydz * D * vec;
    
    integrand = computeChebyshevProduct(vec, conj(Dvec));
    integrand = computeChebyshevProduct(integrand, [1,-1]');
    
    I = computeChebyshevIntegrationMatrix(2*N^2);
    
    integral = I * integrand;

    integral = computePhi(1, integral) - computePhi(0, integral);
    
    reynoldsStress = - 8 * pi * params.R * imag(integral);
    
end
