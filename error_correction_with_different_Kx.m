% ploting for error analysis with different Kx values


kxp = 100;
kyp = kxp;
beta = 0.0001;
ky = [1,15,95];
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
%     if i == 1
%         Min_Errors(i) = min(fz);
%         y = find(fz == min(fz));
%         m_0(i) = m(y(1));
%     end
%     if i == 2
%         [~,a] = find(m == m_0(1));
%         Err_F = fz(a);
%     end
        G_color = [0, 0, 0.5; 0.2196, 0.4980, 0.2235; 1.0, 0.6980, 0.0];
%     G_color = [0, 0, 0.5; 1.0, 0.6980, 0.0];
    plot(log(m),log(fz),'Color',G_color(i,:),'LineWidth',2)
    xlabel({'log (m) in RT units','Energy cost at driving step'},'FontSize',12)
    ylabel({'log (f) in RT units','Free energy disparity'},'FontSize',12)
    
    hold on
end

scatter(log(m_0),log(Min_Errors),20,'r','filled')
% hold on
% scatter(log(m_0(1)),log(Err_F),20,'m','filled')

legend('K_{1X}','K_{2X}','K_{3X}','f_{min}','Box','off');
% legend('K_X1','f_{min}','Box','off');


