%NEUTRAL_CURVES
%Plots neutral curves c_i=0 in the wavenumber-Reynolds number (k-R) plane, 

clear

%problem parameters
cotbeta=1; 
S=1; 
AD=1;
AT=1; 
AB=0; 
AK=0.01;

%mesh and range of k-R plane
n=100;
k=linspace(0.01,2,n);
m=100;
R=[linspace(0.0001,8,m)];

parfor j=1:m
    for i=1:n
    ci(i,j)=OS_eigs_corrected(k(i),R(j),cotbeta,S,AD,AT,AB,AK);
    end
end

%Plot neutral curve
figure (1)
hold on
contour(R,k,ci,[0 0],'k'), xlabel('$R$'), ylabel('wavenumber $k$')
hold off
title(['$\cot \beta=$', num2str(cotbeta),', $S=$', num2str(S), ', $A_D=$', num2str(AD), ', $A_T=$', num2str(AT), ', $A_B=$', num2str(AB), ', $A_K=$', num2str(AK)])

