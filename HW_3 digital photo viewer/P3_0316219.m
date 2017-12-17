function P3_0316219(d)

s=strcat(d,'/*.jpg');
imagefiles = dir(s); 
ii=1;
bs=50;
clk=0;
nfiles = length(imagefiles); 
disp(nfiles);


filename = imagefiles(ii).name;
s=strcat(d,'/');
s=strcat(s,filename);
image = imread(s);
imsize=size(image)
x=imsize(1);
y=imsize(2);
zoom=1;
if imsize(1)>480
    image=imresize(image,480/imsize(1));
    zoom=zoom*(480/imsize(1));
end
imsize=size(image)
if imsize(2)>640
    image=imresize(image,640/imsize(2));
    zoom=zoom*(640/imsize(2));
end
imsize=size(image)
if imsize(1)==480
    image=padarray(image,[0 ceil((640-imsize(2))/2)],'both');
elseif imsize(2)==640
    image=padarray(image,[ceil((480-imsize(1))/2) 0],'both');
else
    image=padarray(image,[ceil((480-imsize(1))/2) ceil((640-imsize(2))/2)],'both');    
    
enc

f1=figure(1);
imshow(image);
tit=strcat({'picture'},{num2str(ii)},{' of '},{num2str(nfiles)},{' '},{imagefiles(ii).name},{' '},{num2str(x)},{'x'},{num2str(y)},{' '},{num2str(zoom*100)},{'%'});

title(tit);





while 1
    tt = waitforbuttonpress;
    if tt == 1
        c = get(gcf, 'CurrentCharacter');
        dd = get(gcf, 'CurrentKey');
        if c=='<'
            ii=ii-1;
            if ii<=0
                ii=nfiles;
            end
            clk=0;
        end
        if c=='>'
            ii=ii+1;
            if ii>nfiles
                ii=1;
            end
            clk=0;
        end
        
        if c=='+'
            bs=bs*1.1;
        end
        if c=='-'
            bs=bs/1.1;
        end
        if strcmp(dd,'leftarrow')
            if pt(1)>10 
            pt(1)=pt(1)-10;
            end
        end
        if strcmp(dd,'uparrow')
            if pt(2)>10
            pt(2)=pt(2)-10;
            end
        end
        if strcmp(dd,'rightarrow')
            if pt(1)<630
            pt(1)=pt(1)+10;
            end
        end
        if strcmp(dd,'downarrow')
            if pt(2)<470
            pt(2)=pt(2)+10;
            end
        end
            
        
    else
        r = get(gca, 'CurrentPoint');
        pt = r(1, 1:2);
        pt=ceil(pt)% coordinates in 2-D
        disp(pt);
        clk=1;
        
        
    end
    filename = imagefiles(ii).name;
    s=strcat(d,'/');
    s=strcat(s,filename);
    image = imread(s);
    imsize=size(image);
    x=imsize(1);
    y=imsize(2);
    zoom=1;
    
    if imsize(1)>480
       image=imresize(image,480/imsize(1));
       zoom=zoom*(480/imsize(1));
       
    end
    imsize=size(image);
    if imsize(2)>640
        image=imresize(image,640/imsize(2));
        zoom=zoom*(640/imsize(2));
    end
    imsize=size(image);

    if clk==1
        if imsize(1)==480
        image=padarray(image,[0 ceil((640-imsize(2))/2)],'both');
        elseif imsize(2)==640
        image=padarray(image,[ceil((480-imsize(1))/2) 0],'both');
        else
        image=padarray(image,[ceil((480-imsize(1))/2) ceil((640-imsize(2))/2)],'both');    
    
        end

        if(pt(1)>=1 & pt(1)<=640 & pt(2)>=1 & pt(2)<=480)
            lf=pt(2)-bs;
            if lf<=0
                lf=1;
            end
            rt=pt(2)+bs;
            if rt>=480
                rt=480;
            end
            dn=pt(1)-bs;
            if dn<=0
                dn=1;
            end
            up=pt(1)+bs;
            if up>=640
                up=640;
            end
            lf=ceil(lf);
            rt=ceil(rt);
            dn=ceil(dn);
            up=ceil(up);
            nuimage=image(lf:rt,dn:up,:);
            nuimage=imresize(nuimage,3);
            f2=figure(2);
            imshow(nuimage);
            image(lf,dn:up,:)=255;
            image(rt,dn:up,:)=255;
            image(lf:rt,dn,:)=255;
            image(lf:rt,up,:)=255;
            figure(1);
            imshow(image);
            
        else
            close(f2);
            figure(1);
            imshow(image);
        end


        tit=strcat({'picture'},{num2str(ii)},{' of '},{num2str(nfiles)},{' '},{imagefiles(ii).name},{' '},{num2str(x)},{'x'},{num2str(y)},{' '},{num2str(zoom*100)},{'%'});

        title(tit);
    else
        
    if imsize(1)==480
    image=padarray(image,[0 ceil((640-imsize(2))/2)],'both');
    elseif imsize(2)==640
    image=padarray(image,[ceil((480-imsize(1))/2) 0],'both');
    else
    image=padarray(image,[ceil((480-imsize(1))/2) ceil((640-imsize(2))/2)],'both');    
    
    end
    f1=figure(1);
    imshow(image);
    f2=figure(2);
    close(f2);
    tit=strcat({'picture'},{num2str(ii)},{' of '},{num2str(nfiles)},{' '},{imagefiles(ii).name},{' '},{num2str(x)},{'x'},{num2str(y)},{' '},{num2str(zoom*100)},{'%'});

    title(tit);
    end


end
end