clear all
%��������� ������ 10 �������, ��������� ����������� � 4 ���� � ����������
%��������� �������� ����������� ����������� � ���������
%������ �������� ����� ����� ��������� �������� 1, 2 � 3 -
%��� ����, �������������� ��������, ������� � ����� ����������
boots = load_boots(1:10, 0.25, 0);
%�������� ��������
new_boots=Cut_logo(boots);
%��������� �� ���� ������������ ��������� ��������
boots_edges = edge_log(new_boots);
%������� ����������� ����� ���� �����������
boots_spectrum = get_spectrum(boots_edges);
%������� ��� ����������, ��������
subplot(1,3,1);
imshow(new_boots(:,:,1,4));
subplot(1,3,2);
imshow(boots_edges(:,:,1,4));
subplot(1,3,3);
plot(boots_spectrum(1,:,4));

bs=[];
for k=1:30
    bs=cat(1,bs,squeeze(boots_spectrum(:,:,k,1)));
end;
 bs=bs';
net = selforgmap([4 11]);
net = train(net, bs);
plotsomhits(net,bs); 