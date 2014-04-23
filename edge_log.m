function [ boots_log ] = edge_log( boots )
boots_log = [];
for id = 1:(size(boots, 4))
    blog=[];
    for k=1:30
        blog = cat(3,blog,edge(boots(:, :, k, id),'log'));
    end;
    boots_log = cat(4, boots_log, blog);
end;
end

