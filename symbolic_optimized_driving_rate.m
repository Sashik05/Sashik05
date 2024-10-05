% symbolically computing the optimized driving rate constant
% m--> driving rate constant, x and y --> correct and incorrect substrates
% kxp and kyp--> association rate constants for ES
% kx and ky--> disscoiation rate constants for ES
% lxp and lyp--> association rate constants for ES*
% lx and ly --> dissociation rate constants for ES*
% w --> catalytic step rate constant
syms m kxp kx lxp lx ky ly

w = 0;
kyp = kxp;
lyp = lxp;

fx = ((m*kxp)/((kx+m)*(lx+w))) + lxp/(lx+w); % correct product formation rate  
fy = ((m*kyp)/((ky+m)*(ly+w))) + lyp/(ly+w); % incorrect product formation rate

fz = fy/fx;       % Error fraction


A=diff(log(fz),m);
eq=A==0;
sol=solve(eq,m);   
M = abs(sol(1));  % optimized driving rate constant

% M = abs(kx*ky*lxp*(kxp + lxp))^(1/2)/abs(kxp + lxp)