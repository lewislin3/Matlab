classdef P2
    properties
        x=0;
        y=0;
        r=0;
    end
    methods
        function obj=P2(a,b,c)
            if nargin==0
                obj.x=0;
                obj.y=0;
                obj.r=1;
            else
                obj(1,numel(a)) = P2;
                for ii = 1:numel(a)
             
                    obj(ii).x = a(ii);
                    obj(ii).y = b(ii);
                    obj(ii).r = c(ii);
                    
                end
                obj = reshape(obj, size(a));
            end
        end
        
        function ans=lt(A,B)
            ans = 1;
            if size(A)==[1,1]
                
                for ii = 1:numel(B)
                    if A.r < B(ii).r
                        ans(ii) = 1;
                    
                    else
                        ans(ii) = 0;
                    end
                end
                ans=reshape(ans,size(B));
            elseif size(B)==[1,1]
                for ii = 1:numel(A)
                    if A(ii).r < B.r
                        ans(ii) = 1;
                    
                  
                    else
                        ans(ii) = 0;
                    end
                end
                ans=reshape(ans,size(A));
            else
                
                for ii = 1:numel(A)
                    if A(ii).r < B(ii).r
                        ans(ii) = 1;
                    
                    
                    else
                        ans(ii) = 0;
                    end
                end
                ans=reshape(ans,size(A));
            end
            
        end
        
        function disp(a)
            s=size(a);
            for ii=1:s(1)
                for jj=1:s(2)
                    fprintf('( %d , %d , %d) ',a(ii,jj).x, a(ii,jj).y,a(ii,jj).r);
                end
                fprintf('\n');
            end
        end
        
        
         
        
        
        function iswithin(A,B)
            
            s=size(A);
            
            bx=repmat(B(1),s)
            by=repmat(B(2),s)
            a=zeros(size(A));
            ii=[1:numel(A)];
            a=A.x
            
            
            
            
           
        end
        
        
       
        
        
    end
        
end