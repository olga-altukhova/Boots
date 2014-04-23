function [ boot_spec ] = get_spectrum( boots )
boot_spec = [];
for id=1:(size(boots,4))
    spectrum = [];
    sp_eax = cell(1,30);
    sp_ls = [];
    for k=1:30
        tmp = cut_spectrum(real(eig(boots(:,:,k,id))));
        sp_eax{k} = tmp;
        sp_ls = cat(1, sp_ls, size(tmp,1));
    end;
    max_l = max(sp_ls);
    for k=1:30
        spectrum = cat(1,spectrum, [sp_eax{k} zeros(1, max_l - size(sp_eax{k},1))]);
    end;
    boot_spec = cat(3, boot_spec, spectrum);
end;

%end;

function sp = cut_spectrum(s)
sz = size(s,1);
sp = zeros(1,sz);
t=1;
for k=1:sz
    if s(k)~=0 
        sp(t)=s(k);
        t = t + 1;
    end;
end;