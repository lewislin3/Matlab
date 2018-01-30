function P2(m)
ans=zeros(m);
ax=1:(m-1)/2;
big=m-ax
small=1+ax
ans(small:big,small:big)=1;

disp(ans);
end