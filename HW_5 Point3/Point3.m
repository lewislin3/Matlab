classdef Point3
    properties
        x=0;
        y=0;
        z=0;
    end
    
    methods
        
        function obj=Point3(a,b,c)
            
            if nargin == 0
                x=0;
                y=0;
                z=0;
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
        
        function a=plus(x,y)
        end
        
        function a=minus(x,y)
        end
        
    end
    
    
    
end