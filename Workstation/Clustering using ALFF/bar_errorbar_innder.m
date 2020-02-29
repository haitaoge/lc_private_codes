function  bar_errorbar_innder( Mean,Std)
%�˺����������ƴ���������״ͼ��ͬʱ���˫����t�����pֵ,Ŀǰ�Ĵ�ֻ���������鱻�ԡ�
%input:
% Matrix Ϊһ��cell���������ÿ�����������Ϣ
% ����Matrix{1}Ϊ���˵ı������󣬱����в����鱻����=N������2��������age��education��
% ��ô�ñ�������Ӧ����һ��N��2�еľ���������һ������ı����ʽ��
%            age     education
% subject1    15         9
% subject2    20         12
% .           .           .
% .           .           .
% .           .           .
% subjectN    16         15
%��ô����ľ�����ʽΪ[15 20 . . . 16;9  12 . . . 15]
%���Ƶ����������ı�������
%% =================================================================
showXTickLabels=1;
showYLabel=0;
showLegend=1;
%% =================================================================
% Matrix={Matrix1, Matrix2,Matrix3,Matrix4};
% Mean=cell2mat(cellfun(@(x) mean(x,1),Matrix,'UniformOutput',false)')';
% Std=cell2mat(cellfun(@(x) std(x),Matrix,'UniformOutput',false)')';

h = bar(Mean,0.6,'EdgeColor','k','LineWidth',1.5);
grid on
% h(1).FaceColor=[0.2,0.2,0.2];h(2).FaceColor='w';
% h(1).Visible='off';h(2).Visible='off';
% set(gca,'YTick',-0.01:0.00001:0.02);
f = @(a)bsxfun(@plus,cat(1,a{:,1}),cat(1,a{:,2})).';%��ȡÿһ����״ͼ���ߵ�x����
coordinate_x=f(get(h,{'xoffset','xdata'}));
hold on
% errorbar(coordinate_x,cell2mat(get(h,'ydata')).',...
%            Std,'s','MarkerSize',0.0001,'linewidth',1.5,'Color','k');%Std��������,����2��Ϊ��ֻ��ʾһ��
%�������
for i=1:numel(Mean)
    if Mean(i)>=0
        line([coordinate_x(i),coordinate_x(i)],[Mean(i),Mean(i)+Std(i)],'linewidth',2);
    else
        line([coordinate_x(i),coordinate_x(i)],[Mean(i),Mean(i)-Std(i)],'linewidth',2);
    end
end
ax = gca;
box off

% ax.XTick =  1:size(Matrix{1},1);
ax.XTick =  1:size(Mean,1);

% x���label
if showXTickLabels
%     ax.XTickLabels = ...
%         {'�����л�/���ϻ� ','�Ҳ���ϻأ�����)','�Ҳ�ǰ�۴��� ','�Ҳ�β״��','���β״��',...
%         '�Ҳ�putamen','���putamen','�ҲൺҶ/frontal Operculum Corter','��ൺҶ/frontal Operculum Corter',...
%         '�Ҳ����ʺ� ','������ʺ� ','�Ҳຣ��','��ຣ��','�Ҳຣ���Ի�','��ຣ���Ի�',...
%         ' �Ҳ����',' ������','�Ҳ�cuneus','���cuneus','�Ҳ�angular gyrus','�Ҳ�������'};
    ax.XTickLabels = ...
        {'HAMD-label-a','HAMA-label-a','Duration-label-a',...
        'HAMD-label-noa','HAMA-label-noa','Duration-label-noa'};...
    
    set(ax,'Fontsize',10);%����ax��ߴ�С
    % set(ax,'ytick',-0.1:0.05:0.1);
    ax.XTickLabelRotation = 45;
    % Yrang_max=max(max(Mean + Std));
    % ax.YLim=[-0.1 0.1];%����y�᷶Χ
    %����x�᷶Χ
    % xlabel('variables','FontName','Times New Roman','FontSize',20);
end

% y���labe
if showYLabel
    ylabel('dALFF','FontName','Times New Roman','FontWeight','bold','FontSize',10);
end

% legend
if showLegend
    h=legend('Medication','Non-Medication','Orientation','vertical ','Location','NorthWest');%������Ҫ�޸�
    set(h,'Fontsize',10);%����legend�����С
    set(h,'Box','off');
    % h.Location='best';
    box off
    % grid on
    % grid minor
end
end

