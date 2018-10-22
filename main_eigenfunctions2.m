%% EIGENFUNCTIONS

% x = [;;], y = [,,], fix dimensions of U and V 

% Parameters
% k = 0.3; R = 1; cotbeta = 1; S = 0; AD = 0; AT = 0; AB = 0; AK = 1; AI = 0;
k = 0.3; R = 1; cotbeta = 1; S = 1; AD = 1; AT = 1; AB = 1; AK = 1; AI = 0;

% Solve eigenvalue problem
[val, vec, residual] = compute_OS_eigs(k,R,cotbeta,S,AD,AT,AB,AK,AI);

% Construct domain
y = linspace(0,1);
x = linspace(0,2*pi/k)';
t = 0;

% Construct phi for the most unstable mode
phi = compute_phi(y,vec(:,1));
c = val(1);

% Construct base solution
u_bar = y.*(2-y);
v_bar = 0;
%p_bar = 2*cotbeta/R * (1 - y);
eta_bar = 0;
h_bar = 1;

% Construct perturbation
u_hat = ((phi(2:end)-phi(1:end-1))./(y(2:end)-y(1:end-1)));
v_hat = (-1i*k*phi);
%p_hat = -(u_bar - c)*diff(phi) + diff(u_bar)*phi + (diff(phi,3) - k^2 * diff(phi))/(1i*k*R);
eta_hat = (phi(1)/c);
h_hat = (phi(end)/(c - 1i*k*u_bar(end)));

% Construct full solution
u = u_bar(2:end) + u_hat;
v = v_bar + v_hat;
%p = p_bar + p_hat;
eta = eta_bar + eta_hat;
h = h_bar + h_hat;

% Normal mode
A = 0.1;
normalmode = A * exp(1i*k*(x-c*t));

%% UNSURE FROM HERE ON

% Interfaces with normal mode
ETA = normalmode*eta_hat';
H = 1 + normalmode*h_hat';

% New domain
Y = y.*(ETA - H) + H;

U_bar = Y.*(2-Y);
V_bar = 0;
% P_bar = 2*cotbeta/R * (1 - y);

PHI = zeros(size(Y));
for n = 1:length(x)
   PHI(:,n) = compute_phi(Y(n),vec(:,1)); 
end

%%

U_hat = ((PHI(:,2:end)-PHI(:,1:end-1))./(Y(:,2:end)-Y(:,1:end-1)));
V_hat = (-1i*k*PHI);
%p_hat = -(u_bar - c)*diff(phi) + diff(u_bar)*phi + (diff(phi,3) - k^2 * diff(phi))/(1i*k*R);
%eta_hat = (PHI(1)/c);
%h_hat = (PHI(end)/(c - 1i*k*u_bar(end)));

U = real(U_bar(:,2:end)' + real(normalmode'.*U_hat'));
V = real(V_bar' + real(normalmode.*V_hat'));
Y = real(Y);

figure();
hold on;
plot(x,H,x,ETA);
X = repmat(x,1,99);
quiver(X(5:3:end,6:3:end),Y(5:3:end,6:3:end),...
    U(5:3:end,5:3:end)',V(5:3:end,6:3:end),0);
contour(X,Y(:,2:end),sqrt(U'.^2+V(:,2:end).^2))
% contour(repmat(x(5:10:end),1,10),repmat(y(5:10:end),1,10)',...
%     sqrt(U(5:10:end,5:10:end).^2+V(5:10:end,5:10:end).^2));