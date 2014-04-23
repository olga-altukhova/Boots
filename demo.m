clear all
%загружаем первые 10 ботинок, уменьшаем изображения в 4 раза и используем
%втроенный алгоритм конвертации изображений в яркостные
%третий аргумент также может принимать значения 1, 2 и 3 -
%что даст, соответственно крастную, зеленую и синюю компоненты
boots = load_boots(1:10, 0.25, 0);
%удаление логотипа
new_boots=Cut_logo(boots);
%применяем ко всем изображениям выделение контуров
boots_edges = edge_log(new_boots);
%считаем собственные числа всех изображений
boots_spectrum = get_spectrum(boots_edges);
%смотрим что получилось, например
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