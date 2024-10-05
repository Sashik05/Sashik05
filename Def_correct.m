%%%% Reaction evolution with time for correct product formation
function D_x = Def_correct(t,X,m)

k_xp = 100; % EX association rate constant
k_x = 2*10^(-4); % EX dissociation rate constant
l_x = 5*10^(-4); % EX* dissociation rate constant
l_xp = 0.001;   % EX* association rate constant
w = 0.0000000001;  % catalytic step rate constant


D_x = zeros(5,1);   % stores differential rate equations
D_x(1) = w*X(2);  % correct product formation rate
D_x(2) = m*X(3) + l_xp*X(4)*X(5) - (l_x + w)*X(2); % EX* formation rate
D_x(3) = -(k_x + m)*X(3) + k_xp*X(4)*X(5); % EX formation rate
D_x(4) = -(k_xp+l_xp)*X(4)*X(5) + l_x*X(2) + k_x*X(3) + w*X(2);
D_x(5) = -(k_xp+l_xp)*X(4)*X(5) + l_x*X(2) + k_x*X(3);

% Correct Product = X(1);
% Enzyme-Substrate complex at transition state (P_xs) = X(2);
% Enzyme-Substrate complex (P_x) = X(3);
% Enzyme (P) = X(4);
% Correct substrate (x) = X(5);

end
