%%%% Reaction evolution with time for incorrect product formation
function D_y = Def_incorrect(t,Y,m)

k_yp = 100;
k_y = 2;
l_y = 5;
l_yp = 0.001;
w = 0.0000000001;

D_y = zeros(5,1);
D_y(1) = w*Y(2);
D_y(2) = m*Y(3) + l_yp*Y(4)*Y(5) - (l_y + w)*Y(2);
D_y(3) = -(k_y + m)*Y(3) + k_yp*Y(4)*Y(5);
D_y(4) = -(k_yp + l_yp)*Y(4)*Y(5) + l_y*Y(2) + k_y*Y(3) + w*Y(2);
D_y(5) = -(k_yp + l_yp)*Y(4)*Y(5) + l_y*Y(2) + k_y*Y(3);

% Incorrect Product = Y(1);
% Enzyme-Substrate complex at higher intermidiate state (P_ys) = Y(2);
% Enzyme-Substrate complex at intermediate state (P_y) = Y(3);
% Enzyme (P) = Y(4);
% Incorrect substrate (y) = Y(5);

end