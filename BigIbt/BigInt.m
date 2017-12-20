classdef BigInt
    properties
        num=0;
    end
    methods
        function obj = BigInt(n)
            if nargin == 1
                n=num2str(n);
                obj.num=n-'0';
            else
                obj.num=0;
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function str=make_str(k)
            str=char(k.num+'0');
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%
        function disp(a)
            k=make_str(a);
            fprintf('%s\n', k);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function a=plus(x,y)
            
            if class(x)~='BigInt'
                
                sx=size(x);
                sx=sx(2);
                sy=size(y.num);
                sy=sy(2);
                if sx> sy
                    tmp=zeros(1,sx-sy);             
                    y.num=[tmp y.num];
                elseif sx<sy
                    tmp=zeros(1,sy-sx);
                    x=[tmp x];
                else
                end
                a=x+y.num;
            elseif class(y)~='BigInt'
                sx=size(x.num);
                sx=sx(2);
                sy=size(y);
                sy=sy(2);
                if sx> sy
                    tmp=zeros(1,sx-sy);             
                    y=[tmp y];
                elseif sx<sy
                    tmp=zeros(1,sy-sx);
                    x.num=[tmp x.num];
                else
                end
                a=x.num+y;
            else
                
        
                cx=size(x);
                cy=size(y);
                sx=size(x.num);
                sx=sx(2);
                sy=size(y.num);
                sy=sy(2);
                if sx> sy
                    tmp=zeros(1,sx-sy);             
                    y.num=[tmp y.num];
                elseif sx<sy
                    tmp=zeros(1,sy-sx);
                    x.num=[tmp x.num];
                else
                end
                a=x.num+y.num;
            end
            sa=size(a);
            sa=sa(2);
            for ii=2:sa
               if a(ii)>=10
                    a(ii)=mod(a(ii),10);
                    a(ii-1)=a(ii-1)+1;
               end
            end
            a=num2str(a);
            a=a(find(~isspace(a)));
            a=BigInt(a);
        
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%
        function a=times(x,y)
            
            if class(x)~='BigInt'
                a=conv(x,y.num);
            elseif class(y)~='BigInt'
                a=conv(x.num,y);
            else
                a=conv(x.num,y.num);
            end
            sa=size(a);
            sa=sa(2);
            for ii=sa:-1:2
               
               if a(ii)>=10
                    a(ii-1)=a(ii-1)+fix(a(ii)/10);
                    a(ii)=mod(a(ii),10);
                   
               end
            end
            
            a=num2str(a);
            a=a(find(~isspace(a)));
            a=BigInt(a);
        
        end
        
        function t=eq(a,b)
            t= isequal(a.num,b.num);
        end
    end
end
