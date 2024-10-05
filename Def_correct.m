%%%% Reaction evolution with time for correct product formation
function D_x = Def_correct(t,X,m)

k_xp = 100;
k_x = 2*10^(-4);
l_x = 5*10^(-4);
l_xp = 0.001;
w = 0.0000000001;


D_x = zeros(5,1);
D_x(1) = w*X(2);
D_x(2) = m*X(3) + l_xp*X(4)*X(5) - (l_x + w)*X(2);
D_x(3) = -(k_x + m)*X(3) + k_xp*X(4)*X(5);
D_x(4) = -(k_xp+l_xp)*X(4)*X(5) + l_x*X(2) + k_x*X(3) + w*X(2);
D_x(5) = -(k_xp+l_xp)*X(4)*X(5) + l_x*X(2) + k_x*X(3);

% Correct Product = X(1);
% Enzyme-Substrate complex at transition state (P_xs) = X(2);
% Enzyme-Substrate complex (P_x) = X(3);
% Enzyme (P) = X(4);
% Correct substrate (x) = X(5);

end