function [X_demean] = lc_demean(X,dim)
% ���ڶ����ݽ��г��Ծ�ֵ����Ŀ����ͳһ���ݵ�����
% input:
%   X:�������������n_subj*n_feature
%   dim=1,��ÿ����������ֵ����ˮƽ��;dim=2,��ÿ����������������ֵ������ˮƽ��
%%
if nargin<2
    dim=2;% Ĭ�ϸ���ˮƽ
end

%
[n_subj,n_feature]=size(X);
X_demean = bsxfun(@rdivide, X, mean(X,dim));
end

