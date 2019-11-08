function [val, vec, residual] = chebyshevTauFlexibleOS(k,R,cotbeta,S,AD,AT,AB,AK,AI,numberOfPolynomials)
    %COMPUTE_OS_EIGS Solution of the Orr-Sommerfeld eigenvalue problem for the complex wave
    %speed c(k,...) = cr + i*ci
    %Outputs a vector of sorted eigenvalues, and a matric of eigenvectors.
    %Zero modes and spurious modes ignored.
    %k = wavenumber
    %R = Reynolds number
    %cotbeta = cot(inclination angle \beta)
    %S = surface tension parameter S'
    %AD = damping parameter A_D'
    %AT = tension parameter A_T'
    %AB = rigidity parameter A_B'
    %AK = stiffness parameter A_K'
    %
    %S', A_D', A_T', A_B', A_K' are the rescaled versions of the parameters,
    %see page 7 of the paper.
    
    M=numberOfPolynomials+3; %A,B are 2Mx2M, M = number of modes/polynomials + 3
    
    %Construct D and D^2
    I=eye(M);
    D=zeros(M,M);
    for j = 1:M/2
        D(1,2*j)=2*j-1;
    end
    for m=2:M
        for j = 1:(M-m+1)/2
            D(m,m+2*j-1)=2*(m+2*(j-1));
        end
    end
    D2=D*D;
    
    %Construct V
    P=zeros(M,M); P(2,1)=1/4; P(3,1)=-1/16; P(2,2)=-1/16;
    Q=1/4*(spdiags([ones(M,1) 3*ones(M,1) ones(M,1)],[-1 0 1],M,M));
    F=-1/16*(spdiags(...
        [ones(M,1) zeros(M,1) 2*ones(M,1) zeros(M,1) ones(M,1)],...
        [-2 -1 0 1 2],M,M));
    V=P+Q+F;
    
    %BCs
    a1f=(2*k^2+2)*ones(1,M);
    a1c=ones(1,M);
    b1f=2*k^2*a1c;
    b1c=a1c;
    
    a2f=k^3*(2*cotbeta+k^2*S)*a1c+2*(k*R-2*1i*k^2)*(0:M-1).^2;
    a2c=k/2*(2*cotbeta+k^2*S)*a1c+2*1i*(0:M-1).^2;
    b2f=2*k*R*(0:M-1).^2;
    b2c=zeros(1,M);
    
    a3f =(-1).^(0:M-1);
    b3f =(-1).^(0:M-1).*(0:M-1).^2;
    a3c=zeros(1,M);
    b3c=zeros(1,M);
    
    a4f=(-1i*k*(k^2*AT+k^4*AB+AK-2*cotbeta))*(-1).^(0:M-1);
    b4f=k*(k*AD)*(-1).^(0:M-1);
    a4c=zeros(1,M);
    b4c=-2*b3f;
    
    e4f=1i*k^3*AI*(-1).^((1:M)+1);
    
    %Trim D2,I,V by 2 rows
    D2=D2(1:M-2,:);
    I=I(1:M-2,:);
    V=V(1:M-2,:);
    
    %Construct A and B and E in c^2*Ex+Ax=cBx
    A=[4*D2-k^2*I -I;...
        -2*1i*k*R*I 4*D2-k^2*I-1i*k*R*V;...
        a1f a1c;...
        a2f a2c;...
        a3f a3c;...
        a4f a4c];
    B=[zeros(M-2,2*M);...
        zeros(M-2,M) -1i*k*R*I;...
        b1f b1c;...
        b2f b2c;...
        b3f b3c;...
        b4f b4c];
    E=[zeros(2*M-1,2*M);...
        e4f zeros(1,M)];
    
    %Solve eigenvalue problem c^2*Ex-cBx+Ax=0
    [vec, val] = polyeig(A,-B,E);
    
    val = filterResults(val);
    
    [val, vec] = sortResults(val,vec);
    
    residual = (sum(abs((A*vec - B*vec*diag(val)+ E*vec*diag(val.^2))).^2).^0.5)';
    
    val = val.';
end

function val = filterResults(val)
    val(isinf(val)) = nan + nan*1i;
    val(abs(val)>1e6) = nan + nan*1i;
    val(abs(val)<1e-5) = nan + nan*1i;
end

function [val, vec] = sortResults(val, vec)
    [~,index] = sort(imag(val),'descend','MissingPlacement','last');
    val = val(index);
    vec = vec(:,index);
end