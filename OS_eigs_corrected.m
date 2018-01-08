function [dominant_ci, c] = OS_eigs_corrected(k,R,cotbeta,S,AD,AT,AB,AK)
    
    %Solution of the Orr-Sommerfeld eigenvalue problem for the complex wave
    %speed c(k,...) = cr + i*ci
    %Outputs a vector of eigenvalues, and the most positive imaginary
    %part, dominant_ci. Zero modes and spurious modes ignored.
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
    
    
    %number of modes/polynomials
    N=20;
    M=N+3; %A,B are 2Mx2M
    
    %Construct D and D^2
    D=zeros(M,M);
    j=1;
    while 2*j<=M
        D(1,2*j)=2*j-1; j=j+1;
    end
    for l=2:M
        j=1;
        while l+2*j-1<=M
            D(l,l+2*j-1)=2*(l+2*(j-1)); j=j+1;
        end
    end
    clear l
    D2=D*D;
    I=eye(M);
    
    %Construct V
    P=zeros(M,M); P(2,1)=1/4; P(3,1)=-1/16; P(2,2)=-1/16;
    
    B=[ones(M,1) 3*ones(M,1) ones(M,1)]; Q=1/4*(spdiags(B,[-1 0 1],M,M));
    
    B=[ones(M,1) zeros(M,1) 2*ones(M,1) zeros(M,1) ones(M,1)]; ...
        F=-1/16*(spdiags(B,[-2 -1 0 1 2],M,M));
    
    V=P+Q+F;
    
    %BCs
    clear n a3f b3f a4f b4f
    a1f=(2*k^2+2)*ones(1,M);
    a1c=ones(1,M);
    b1f=2*k^2*a1c;
    b1c=a1c;
    
    for j=1:M, n(j)=(j-1)^2; end
    a2f=k^3*(2*cotbeta+k^2*S)*a1c+2*(k*R-2*1i*k^2)*n;
    a2c=k/2*(2*cotbeta+k^2*S)*a1c+2*1i*n;
    b2f=2*k*R*n;
    b2c=zeros(1,M);
    
    % %old BC3
    % for j=1:M, a3f(j)=(-1)^j*(j-1)^2; end
    % a3c=zeros(1,M); b3f=zeros(1,M); b3c=zeros(1,M);
    
    %updated BC3
    for j=1:M,
        a3f(j)=(-1)^(j-1);
        b3f(j)=(-1)^(j-1)*(j-1)^2;
    end
    a3c=zeros(1,M); b3c=zeros(1,M);
    
    
    
    
    for j=1:M,
        a4f(j)=(-1i*k*(k^2*AT+k^4*AB+AK-2*cotbeta)+4*k^2)*(-1)^(j+1);
        b4f(j)=k*(k*AD+2*R*1i)*(-1)^(j+1);
    end
    a4c=zeros(1,M);
    %b4c=2*a3f; %using old BC3
    b4c=-2*b3f; %using updated BC3
    
    %Trim D2,I,V by 2 rows
    D2=D2(1:M-2,:);
    I=I(1:M-2,:);
    V=V(1:M-2,:);
    
    %Construct A and B
    A=[4*D2-k^2*I -I; -2*1i*k*R*I 4*D2-k^2*I-1i*k*R*V; a1f a1c; a2f a2c; a3f a3c; a4f a4c];
    B=[zeros(M-2,2*M); zeros(M-2,M) -1i*k*R*I; b1f b1c; b2f b2c; b3f b3c; b4f b4c];
    
    %Removal of 3rd BC
    %elim=zeros(1,2*M);
    %for j=1:(M-1)
    %    elim(j)=(-1)^(M+j)/(M^2)*(j-1)^2;
    %end
    %for j=1:2*M
    %    A(j,:)=A(j,:)+A(j,M)*elim;
    %    B(j,:)=B(j,:)+B(j,M)*elim;
    %end
    %A(2*M-1,:)=[]; A(:,M)=[];
    %B(2*M-1,:)=[]; B(:,M)=[];
    
    %solve eigenvalue problem A*x=c*B*x
    c_raw=eig(A,B);
    for j=1:length(c_raw)           %remove inf eigs
        if isfinite(c_raw(j))==0
            c_raw(j)=0;
        end
    end
    [row,col,c]=find(c_raw);
    
    % plot_modes=0;
    % if plot_modes==1
    % clear figure
    % plot(c,'o','markersize',5), grid on, xlabel('c_r'), ylabel('c_i'), xlim([-1 2]),
    % ylim([-1 0.5])
    % title(['\alpha=', num2str(k), ', R=', num2str(R), ', cot\beta=', num2str(cotB), ', S=', num2str(S), ...
    %     ', A_D=', num2str(AD), ', A_T=', num2str(AT), ', A_B=', num2str(AB), ', A_K=', num2str(AK)])
    % end
    
    %eliminate spurious modes that have magnitude above a certain threshold,
    %e.g., 10^6
    [dominant_ci,j]=max(imag(c));
    dominant_cr=real(c(j));
    while sqrt(dominant_cr^2+dominant_ci^2)>10^6,
        c(j)=[]; [dominant_ci,j]=max(imag(c)); dominant_cr=real(c(j));
    end
    
    %ignore modes with c=0 and count how many
    zero_modes_ignored=0;
    while sqrt(dominant_cr^2+dominant_ci^2)<10^(-8),
        c(j)=[]; [dominant_ci,j]=max(imag(c)); dominant_cr=real(c(j));
        zero_modes_ignored=zero_modes_ignored+1;
    end
    
    
end