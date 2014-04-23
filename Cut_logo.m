function [new_boots]=Cut_logo(boots)
new_boots=[];
for k=1:(size(boots,4))
    delta=cat(1,boots(:,:,1,k));
    delta(:,:)=0;
    for l=2:30
       delta=delta+abs(boots(:,:,1,k)-boots(:,:,l,k)); 
    end;
    [i,j]=find(delta<=30);
    new_boots=cat(4,new_boots,boots(:,:,:,k));
    %for l=2:30
        for m=1:size(i,1)
            new_boots(i(m,1),j(m,1),:,k)=0;
        end;
    %end;
end;
end





       