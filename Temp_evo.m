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

f = Y(:,2)./X(:,2);

end
