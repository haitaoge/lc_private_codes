a  % ��Ϊaû�и�ֵ�����Իᱨ��

% ��try catch���ﵽ�ݴ��Ŀ�ģ�ͬʱҲ��ȡ������Ϣ
try
    a;
catch ME
    fprintf('�������Ϣ�ǣ�%s\n', ME.message)
    a = 1;
end

fprintf('a����ֵ����ֵΪ��%d\n', a)