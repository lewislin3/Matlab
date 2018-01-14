function ans=P3(a,b)
% only two dimention xy
    s=size(a);
    xy=0;
    y=[s(2)-1:-1:0];
    y=repmat(y,s(1),1);
    x=[s(1)-1:-1:0]';
    x=repmat(x,1,s(2));
    
    x2=(b(1).^x);
    y2=b(2).^y;
    k1=x2.*y2;
    k1=k1.*a;
    k1=sum(k1);
    k1=sum(k1);
    ans=k1;
end