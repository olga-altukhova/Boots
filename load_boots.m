function [ boots ] = load_boots( boot_ids, resize, color )
boots = [];
for id = boot_ids
    images = [];
    for k = 0:12:348
        tmp = imresize(imread(strcat(pwd,'\boot', int2str(id),...
            '\kv_angle_', int2str(k),'.jpg'), 'jpg'), resize);
        if color==0
            tmp_gs = rgb2gray(tmp);
        else
            tmp_gs = squeeze(tmp(:,:,color));
        end;
        images = cat(3, images, tmp_gs);
    end;
    boots = cat(4, boots, images);
end;
end

