function P4(w)
wa=w.K
wb=w.N
[~,x]=sort([w.K]);
wa=wa(x);
wa=[wa 1000000];
wb=wb(x);
wb=[wb 1000000];
s=size(wa);
tmp=wa(1);
sum=0;
for ii=1:s(2)
    if wa(ii)==tmp
        sum=sum+wb(ii);
        tmp=wa(ii);
    end
    if wa(ii)~=tmp
        
        fprintf("K=%d sum(N)=%d\n",tmp,sum);
        sum=wb(ii);
        tmp=wa(ii);
    end
end
end