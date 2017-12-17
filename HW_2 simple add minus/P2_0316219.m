function P2_0316219(A)
   A(A==' ')=[];%delete space
   kk=0;
   if A(1)=='-'
       A=['0' A];
   end
   [number,calc]=strsplit(A,{'+','-',' '}); % split the string
   
   %disp(number);
   %disp(calc);
   number=char(number);
   cnt=size(number);
   cnt=cnt(1);    
   tmp=number(1,:);
   
   for ii=1:cnt-1 %run add sub
       
         if(strcmp(calc(ii),'+'))
               tmp=add(tmp,number(ii+1,:));
         end
       
         if(strcmp(calc(ii),'-'))
               tmp=sub(tmp,number(ii+1,:));
         end
   end
   
   
   ans=simplify(tmp); %simplify
   ans(ans==' ')=[];
   disp(ans);

end

function tmp=add(A,B)
    numberA=strsplit(A,{'/'});%split with /
    numberB=strsplit(B,{'/'});
    numberA=char(numberA);
    numberB=char(numberB);
    SA=size(numberA);
    SB=size(numberB);
    %decide how to add
    if SA(1)==2
        if SB(1)==2
            numberA=str2num(numberA);
            numberB=str2num(numberB);
            tmpup=numberA(1)*numberB(2)+numberB(1)*numberA(2);
            tmpdn=numberB(2)*numberA(2);
            tmpup=num2str(tmpup);
            tmpdn=num2str(tmpdn);
            tmp=[tmpup '/' tmpdn];
        else
            numberA=str2num(numberA);
            numberB=str2num(numberB);
            tmpup=numberA(1)+numberB(1)*numberA(2);
            tmpdn=numberA(2);
            tmpup=num2str(tmpup);
            tmpdn=num2str(tmpdn);
            tmp=[tmpup '/' tmpdn];
        end
    else
        if SB(1)==2
            numberA=str2num(numberA);
            numberB=str2num(numberB);
            tmpup=numberA(1)*numberB(2)+numberB(1);
            tmpdn=numberB(2);
            tmpup=num2str(tmpup);
            tmpdn=num2str(tmpdn);
            tmp=[tmpup '/' tmpdn];
        else
            numberA=str2num(numberA);
            numberB=str2num(numberB);
            tmpup=numberA(1)+numberB(1);
            tmpdn=1;
            tmpup=num2str(tmpup);
            tmpdn=num2str(tmpdn);
            tmp=[tmpup '/' tmpdn];
        end
    end
        
end

function tmp=sub(A,B)
    numberA=strsplit(A,{'/'});%split with /
    numberB=strsplit(B,{'/'});
    numberA=char(numberA);
    numberB=char(numberB);
    SA=size(numberA);
    SB=size(numberB);
    %decide how to sub
    if SA(1)==2
        if SB(1)==2
            numberA=str2num(numberA);
            numberB=str2num(numberB);
            tmpup=numberA(1)*numberB(2)-numberB(1)*numberA(2);
            tmpdn=numberB(2)*numberA(2);
            tmpup=num2str(tmpup);
            tmpdn=num2str(tmpdn);
            tmp=[tmpup '/' tmpdn];
        else
            numberA=str2num(numberA);
            numberB=str2num(numberB);
            tmpup=numberA(1)-numberB(1)*numberA(2);
            tmpdn=numberA(2);
            tmpup=num2str(tmpup);
            tmpdn=num2str(tmpdn);
            tmp=[tmpup '/' tmpdn];
        end
    else
        if SB(1)==2
            numberA=str2num(numberA);
            numberB=str2num(numberB);
            tmpup=numberA(1)*numberB(2)-numberB(1);
            tmpdn=numberB(2);
            tmpup=num2str(tmpup);
            tmpdn=num2str(tmpdn);
            tmp=[tmpup '/' tmpdn];
        else
            numberA=str2num(numberA);
            numberB=str2num(numberB);
            tmpup=numberA(1)-numberB(1);
            tmpdn=1;
            tmpup=num2str(tmpup);
            tmpdn=num2str(tmpdn);
            tmp=[tmpup '/' tmpdn];
        end
    end
end

function ans=my_gcd(A,B) %gcd
    numberA=A;
    numberB=B;
    while numberB ~= 0
        r=mod(numberA,numberB);
        numberA=numberB;
        numberB=r;
    end
    ans=numberA;
    
end

function ans=simplify(A) %simplify by gcd
     [numberA,B]=strsplit(A,{'/','-'});
     cnt=size(B);
     numberA=char(numberA);
     numberA=str2num(numberA);
     tmp=my_gcd(numberA(1),numberA(2));
     numberA=numberA/tmp;
     if(numberA(2)==1)
        numberA=num2str(numberA);
     
        if cnt(2)==2
             ans=['-' numberA(1,:)];
        else
             ans=[numberA(1,:)];
        end
     else
        numberA=num2str(numberA);
     
        if cnt(2)==2
             ans=['-' numberA(1,:) '/' numberA(2,:)];
        else
             ans=[numberA(1,:) '/' numberA(2,:)];
        end
     end
     
     

end