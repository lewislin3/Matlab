function P3(w)

aa=size(w);
aa=aa(1)
hold on
axis([-10 10 -10 10])
color=['y' 'b' 'm' 'c' 'r' 'g' 'w'];
for ii=1:aa
    tmp=w(ii,:);
    if tmp(1)==tmp(3)
        plot([tmp(1) tmp(3)],[-10 10],'color',color(ii));
        plot([tmp(1) tmp(3)],[tmp(2) tmp(4)],'-o','color',color(ii))
    else
    
    a=-(tmp(2)-tmp(4));
    b=(tmp(1)-tmp(3));
    c=-(tmp(2)-tmp(4))*(tmp(1))+(tmp(1)-tmp(3))*(tmp(2));
    x=[-10 10];
    y=[(+10*a+c)/b (-10*a+c)/b];
    plot(x,y,'-m','color',color(ii))
    plot([tmp(1) tmp(3)],[tmp(2) tmp(4)],'-o','color',color(ii))
    end
end
end