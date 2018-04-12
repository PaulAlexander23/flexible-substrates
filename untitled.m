k = 0.001;
R=1;
cotbeta=1; 
S=1; 
AD=1;
AT=1;
AB=1; 
AK=10;
AI=0;


[dominant_ci, c] = OS_eigs_corrected_again(k,R,cotbeta,S,AD,AT,AB,AK)

approxC = 2 + k*c1(R,cotbeta,k^2*S,k*AD,k^2*AT,k^4*AB,AK,k^2*AI)

dominant_ci