% ploting for error analysis with different Kx values
% To illustrate the natural selection of enzyme

kxp = 100;
kyp = kxp;
beta = 0.0001;
ky = [0.5,50];
kx = beta.*ky;
alpha = beta;
ly = 5;
lx = alpha*ly;
lxp = 0.001;
lyp = lxp;
w = 0;

for i = 1:length(kx)
    m = [linspace(0.00000000001,0.002,30000000),linspace(0.002+0.200001990025879*10^-7,1000,1000000)];
    fx = ((m.*kxp)./((kx(i) + m).*(lx + w)))+ (lxp/(lx + w));
    fy = ((m.*kyp)./((ky(i) + m).*(ly + w)))+ (lyp/(ly + w));
    
    fz = fy./fx;
    
    Min_Errors(i) = min(fz);
    y = find(fz == min(fz));
    m_0(i) = m(y(1));
    
    if i==2
       x = find(m == m_0(1));
       P_Error = fz(x(1));
    end
    
    G_color = [0, 0, 0.5; 1.0, 0.6980, 0.0];
    plot(log(m),log(fz),'Color',G_color(i,:),'LineWidth',2)
    xlabel({'log (Driving rate constant) in RT units','Energy cost at driving step'},'FontSize',12)
    ylabel({'log (Error fraction) in RT units','Free energy difference'},'FontSize',12)
    
    hold on
end

% legend('K_X1','K_X2','Box','off');

scatter(log(m_0(2)),log(Min_Errors(2)),20,'r','filled')
% scatter(log(m_0(1)),log(P_Error),20,'m','filled')

legend('K_X1','K_X2','f_{min}','Box','off');
