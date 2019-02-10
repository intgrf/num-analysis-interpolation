function result = MyConv(p1, p2) 

len1 = length(p1);
len2 = length(p2);

% ������������� ������������ ��������� � ������� 
% � �������:
%           ����� - len2, �.�. �������� �� ������ ��������� p2
%           �������� - len1 + len2 - 1, �.�. ���������� �������� �������
%                                            len2 - 1 ���

partialMult = zeros(len2, len1 + len2 - 1);

for i = len2: -1 : 1
    partialMult(len2 - i + 1 , i:i + len1 -1) = p1 * p2(i);
end

result = sum(partialMult);

end

