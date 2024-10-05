% ploting for error analysis

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


% correct product formation rate
fx = ((m.*kxp)./((kx + m).*(lx + w)))+ (lxp/(lx + w));
% For error product formation

fy = ((m.*kyp)./((ky + m).*(ly + w)))+ (lyp/(ly + w));


fz = fy./fx;


y = find(fz == min(fz));
m_0 = m(y(1));


plot(log(m),log(fz),'Color',[0 0 0.5],'LineWidth',2)

xlabel({'log (m) in RT units','Energy cost at Driving Step'},'FontSize',12)
ylabel({'log (f) in RT units','Free energy disparity'},'FontSize',12)

hold on
scatter(log(m_0),log(min(fz)),20,'r','filled')

end






