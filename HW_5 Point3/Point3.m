classdef Point3
    properties
        x=0;
        y=0;
        z=0;
    end
    
    methods
        
        function obj=Point3(a,b,c)
            
            if nargin == 0
                obj.x=0;
                obj.y=0;
                obj.z=0;
            else
                
                obj(1,numel(a)) = Point3;
                for ii = 1:numel(a)
             
                    obj(ii).x = a(ii);
                    obj(ii).y = b(ii);
                    obj(ii).z = c(ii);
                    
                end
                
                obj = reshape(obj, size(a));
                
                
            end
           
        end
        
        function a=norm(n)
            
            s=size(n);
            a=zeros(s);
            
        end
        
        function disp(a)
            
            s=size(a);
            for ii=1:s(1)
                for jj=1:s(2)
                    fprintf('( %d , %d , %d)',a(ii,jj).x, a(ii,jj).y,a(ii,jj).z);
                end
                fprintf('\n');
            end
            
        end
        
        function obj=plus(A,B)
            if size(A)==[1,1]
                a=0;
                b=0;
                c=0;
               
                for ii = 1:numel(B)
                    a(ii)=B(ii).x+A.x;
                    b(ii)=B(ii).y+A.y;
                    c(ii)=B(ii).z+A.z;
                end
                a = reshape(a, size(B));
                b = reshape(b, size(B));
                c = reshape(c, size(B));

                obj=Point3(a,b,c);

                
                
                
            elseif size(B)==[1,1]
                a=0;
                b=0;
                c=0;
               
                for ii = 1:numel(A)
                    a(ii)=A(ii).x+B.x;
                    b(ii)=A(ii).y+B.y;
                    c(ii)=A(ii).z+B.z;
                end
                a = reshape(a, size(A));
                b = reshape(b, size(A));
                c = reshape(c, size(A));

                obj=Point3(a,b,c);
              
                
            else
                a=0;
                b=0;
                c=0;
               
                for ii = 1:numel(A)
                    a(ii)=A(ii).x+B(ii).x;
                    b(ii)=A(ii).y+B(ii).y;
                    c(ii)=A(ii).z+B(ii).z;
                end
                a = reshape(a, size(A));
                b = reshape(b, size(A));
                c = reshape(c, size(A));

                obj=Point3(a,b,c);
                
            end
            
            
        end
        
        function a=minus(x,y)
            if size(A)==[1,1]
                a=0;
                b=0;
                c=0;
               
                for ii = 1:numel(B)
                    a(ii)=B(ii).x-A.x;
                    b(ii)=B(ii).y-A.y;
                    c(ii)=B(ii).z-A.z;
                end
                a = reshape(a, size(B));
                b = reshape(b, size(B));
                c = reshape(c, size(B));

                obj=Point3(a,b,c);

                
                
                
            elseif size(B)==[1,1]
                a=0;
                b=0;
                c=0;
               
                for ii = 1:numel(A)
                    a(ii)=A(ii).x-B.x;
                    b(ii)=A(ii).y-B.y;
                    c(ii)=A(ii).z-B.z;
                end
                a = reshape(a, size(A));
                b = reshape(b, size(A));
                c = reshape(c, size(A));

                obj=Point3(a,b,c);
              
                
            else
                a=0;
                b=0;
                c=0;
               
                for ii = 1:numel(A)
                    a(ii)=A(ii).x-B(ii).x;
                    b(ii)=A(ii).y-B(ii).y;
                    c(ii)=A(ii).z-B(ii).z;
                end
                a = reshape(a, size(A));
                b = reshape(b, size(A));
                c = reshape(c, size(A));

                obj=Point3(a,b,c);
                
            end
        end
        
        function ans=eq(A,B)
            ans = 1;
            if size(A)==[1,1]
                
                for ii = 1:numel(B)
                    if A.x ~= B(ii).x
                        ans(ii) = 0;
                    
                    elseif A.y ~= B(ii).y
                        ans(ii) = 0;
                    
                    elseif A.z ~= B(ii).z
                        ans(ii) = 0;
                    else
                        ans(ii) = 1;
                    end
                end
                ans=reshape(ans,size(B));
            elseif size(B)==[1,1]
                for ii = 1:numel(A)
                    if B.x ~= A(ii).x
                        ans(ii) = 0;
                    
                    elseif B.y ~= A(ii).y
                        ans(ii) = 0;
                    
                    elseif B.z ~= A(ii).z
                        ans(ii) = 0;
                    else
                        ans(ii) = 1;
                    end
                end
                ans=reshape(ans,size(A));
            else
                
                for ii = 1:numel(A)
                    if B(ii).x ~= A(ii).x
                        ans(ii) = 0;
                    
                    elseif B(ii).y ~= A(ii).y
                        ans(ii) = 0;
                    
                    elseif B(ii).z ~= A(ii).z
                        ans(ii) = 0;
                    else
                        ans(ii) = 1;
                    end
                end
                ans=reshape(ans,size(A));
            end
         
        end
        function ans=sum(A,num)
            if nargin==1
                a=0;
                b=0;
                c=0;
                for ii = 1:numel(A)
                    a=a+A(ii).x;
                    b=b+A(ii).y;
                    c=c+A(ii).z;
                end
                ans=Point3(a,b,c);
            end
            if nargin==2
                
                a=0;
                b=0;
                c=0;
                for ii = 1:numel(A)
                    a(ii)=A(ii).x;
                    b(ii)=A(ii).y;
                    c(ii)=A(ii).z;
                end
                a = reshape(a, size(A));
                b = reshape(b, size(A));
                c = reshape(c, size(A));
                a = sum(a,num);
                b = sum(b,num);
                c = sum(c,num);
                ans=Point3(a,b,c);
                
            end
        end
        
        function ans=mean(A,num)
            if nargin==1
                a=0;
                b=0;
                c=0;
                for ii = 1:numel(A)
                    a=a+A(ii).x;
                    b=b+A(ii).y;
                    c=c+A(ii).z;
                end
                a=a/numel(A);
                b=b/numel(A);
                c=c/numel(A);
                ans=Point3(a,b,c);
            end
            if nargin==2
                a=0;
                b=0;
                c=0;
                for ii = 1:numel(A)
                    a(ii)=A(ii).x;
                    b(ii)=A(ii).y;
                    c(ii)=A(ii).z;
                end
                a = reshape(a, size(A));
                b = reshape(b, size(A));
                c = reshape(c, size(A));
                a = mean(a,num);
                b = mean(b,num);
                c = mean(c,num);
                ans=Point3(a,b,c);
            end
        end
        
        
        
    end
    
    
    
end