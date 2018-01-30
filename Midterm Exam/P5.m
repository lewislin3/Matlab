function P5(im,x)
A=imread(im);

%imshow(A);

s=size(A)
if x(4)>=s(1)
    x(4)=s(1);
end
if x(3)>=s(2)
    x(3)=s(2);
end
s=size(s)
ic=256-A;
if s(2)==3
    
    if(x(1)<=x(3) || x(2)<=x(4))

    A(x(2):x(4),x(1):x(3),1)=ic(x(2):x(4),x(1):x(3),1);
    A(x(2):x(4),x(1):x(3),2)=ic(x(2):x(4),x(1):x(3),2);
    A(x(2):x(4),x(1):x(3),3)=ic(x(2):x(4),x(1):x(3),3);
    imshow(A)
    else
        imshow(A)
    end

end
if s(2)==2
    if(x(1)<=x(3) || x(2)<=x(4))
    A(x(2):x(4),x(1):x(3))=ic(x(2):x(4),x(1):x(3));
    imshow(A)
    else
        imshow(A)
    end
end
end