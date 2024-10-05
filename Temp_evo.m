%%%% Evolution of the chemical reaction 
function [f] = Temp_evo(m)

time = 0:0.1:10;

Y0(1) = 0;     % Concentration of Product
Y0(2) = 0;     % Concentration of Transition state complex
Y0(3) = 0;     % Concentration of Enzyme-substrate complex
Y0(4) = 60;    % Concentration of Enzyme
Y0(5) = 12000; % Concentration of Substrate

[t,Y] = ode45(@(t,Y) Def_incorrect(t,Y,m), time, Y0);
[t,X] = ode45(@(t,X) Def_correct(t,X,m), time, Y0);

% Rslt1 = table(t,X);
% Rslt2 = table(t,Y);
% A = X(:,2)./(X(:,4).*X(:,5));
% B = Y(:,2)./(Y(:,4).*Y(:,5));
% f = B./A;
% f = X(:,2);
% f = Y(:,3)./X(:,3);
f = Y(:,2)./X(:,2);
% fx = X(:,1);
% fy = Y(:,1);
% plot(t,X(:,2),'r')
% hold on
% plot(t,X(:,3),'b')
% figure
% plot(t,ES)
% hold on
% plot(t,ESP)
end