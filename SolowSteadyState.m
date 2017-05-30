%% solves for the steady-state capital stock in the Solow Model
% parameters
alpha = .5; % capital income share
delta = .1; % depreciation rate
s = .5; % saving rate
% define anonymous functions
f = @(k) k.^alpha;
h = @(k) s*f(k)-delta*k;
% solve for the root of h(k)
k0 = 3.305785124; % inital guess
options = optimset('Display','iter'); % display iterations

kstar = fsolve(h,k0,options);
