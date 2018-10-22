%% EIGENFUNCTIONS

% Parameters
%k = 0.3; R = 1; cotbeta = 1; S = 0; AD = 0; AT = 0; AB = 0; AK = 1;
%k = 0.3; R = 1; cotbeta = 1; S = 1; AD = 1; AT = 1; AB = 1; AK = 1;
k = 0.5; R = 0.3; cotbeta = 1; S = 1; AD = 0.1; AT = 1; AB = 1; AK = 3;

% Solve eigenvalue problem
[val, vec, residual] = compute_OS_eigs(k,R,cotbeta,S,AD,AT,AB,AK);

% Construct domain
y = linspace(0,1).';

% Construct phi for the most unstable mode
phi = compute_phi(y,vec(:,2));
c = val(1);

% Construct base solution
u_bar = y.*(2-y);
v_bar = 0;
p_bar = 2*cotbeta/R * (1 - y);
eta_bar = 0;
h_bar = 1;

dy = y(2)-y(1);
D1 = spdiags(ones(100,1)*[-1,1],[0,1],100,100)/dy;
D3 = spdiags(ones(100,1)*[-1/2,1,-1,1/2],[-2,-1,1,2],100,100)/dy/dy/dy;

% Construct perturbation
u_hat = ((phi(2:end)-phi(1:end-1))./(y(2:end)-y(1:end-1)));
v_hat = (-1i*k*phi);
%p_hat = -(u_bar - c)*diff(phi) + diff(u_bar)*phi + (diff(phi,3) - k^2 * diff(phi))/(1i*k*R);
eta_hat = (phi(1)/c);
h_hat = (phi(end)/(c - u_bar(end)));
p_hat = -(u_bar - c) .* (D1*phi) + (D1*u_bar) .* phi + (D3*phi - k^2 * D1*phi)/(1i*k*R);

% Construct full solution
u = u_bar(2:end) + u_hat;
v = v_bar + v_hat;
%p = p_bar + p_hat;
eta = eta_bar + eta_hat;
h = h_bar + h_hat;

display(c)
display(h)
display(eta)

%% Plot the result

figure()
plot_dispersion_relation(R,cotbeta,S,AD,AT,AB,AK)

figure()
plot_phase_speed(R,cotbeta,S,AD,AT,AB,AK)

fh = figure();
hold on;
plot(y, real(phi));
plot(y, imag(phi));
title('Eigenfunctions')
xlabel('y')
ylabel('\phi')
legend('Real','Imag')

fh = figure();
hold on;
plot(u_hat,y(2:end))
plot(v_hat,y)
title('Eigenfunctions velocity');
xlabel('');
ylabel('y');
legend('hat(u)','hat(v)')
%pubgraph(fh,24,2,.'w.')

fh = figure();
hold on;
plot(u, y(2:end))
plot(v, y)
title('Eigenfunctions velocity');
xlabel('');
ylabel('y');
legend('bar(u) + hat(u)','bar(v) + hat(v)')

%%

x = linspace(0,2*pi/k).';
t = 0;
A = 0.5;
normalmode = A * exp(1i*k*(x-c*t));

ETA = eta_bar.' + normalmode*eta_hat.';
H = h_bar.' + normalmode*h_hat.';

%U = u_bar(2:end).' + real(normalmode*u_hat.');
%V = v_bar.' + real(normalmode*v_hat.');

U = real(normalmode*u_hat.');
V = real(normalmode*v_hat.');
P = real(normalmode*p_hat.');

PHI = normalmode*phi.';

figure();
hold on;
plot(x,H,x,ETA);
quiver(repmat(x(5:5:end),1,19),repmat(y(6:5:end),1,20).',...
    U(5:5:end,5:5:end),V(5:5:end,6:5:end));
%contour(repmat(x(5:10:end),1,10),repmat(y(5:10:end),1,10).',...
%    sqrt(U(5:10:end,5:10:end).^2+V(5:10:end,5:10:end).^2));
contour(x,y,...
    real(PHI)',40);