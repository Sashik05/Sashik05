% ploting for error analysis
% The values of the rate constants usesd here
% These are for correct product formation
% syms m w
function [] = accuracy_graph(lxp)
% For correct product formation
kxp = 100;
kyp = kxp;
alpha = 0.0001;
ky = 2;
kx = alpha*ky;
ly = 5;
lx = alpha*ly;
lyp = lxp;
w = 0;
% value considered lxp = 0.001, 

m = [linspace(0.00000000001,0.002,30000000),linspace(0.002+0.200001990025879*10^-7,1000,1000000)];
% m = unique(round(m,5));
% s = -11.5129244366374;
% m_e = exp(s);

fx = ((m.*kxp)./((kx + m).*(lx + w)))+ (lxp/(lx + w));
% f1 = ((m_e*kxp)/((kx + m_e)*(lx + w)))+ (lxp/(lx + w));
% For error product formation

% fy = ((m.*kyp)./((ky + m).*ly))+ (lyp/ly);
fy = ((m.*kyp)./((ky + m).*(ly + w)))+ (lyp/(ly + w));
% f2 = ((m_e*kyp)/((ky + m_e)*(ly + w)))+ (lyp/(ly + w));

% f = f2/f1;

fz = fy./fx;


y = find(fz == min(fz));
m_0 = m(y(1));

% figure1 = figure;
% 
% % Create axes
% axes1 = axes('Parent',figure1);
% hold(axes1,'on');
plot(log(m),log(fz),'Color',[0 0 0.5],'LineWidth',2)
% plot(m,fz,'Color',[0 0 0.5],'LineWidth',2)

xlabel({'log (m) in RT units','Energy cost at Driving Step'},'FontSize',12)
ylabel({'log (f) in RT units','Free energy disparity'},'FontSize',12)

hold on
scatter(log(m_0),log(min(fz)),20,'r','filled')
% % scatter(s,log(f),50,'magenta','filled')
% set(axes1,'FontSize',14,'LineWidth',2);
end






