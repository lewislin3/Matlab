function P1(m)
x=1:m;
x=1./(x.*(x+1));
disp(x);
y=0;
y=cumsum(x);
disp(y);
plot(1:m,y,'o-m');
end