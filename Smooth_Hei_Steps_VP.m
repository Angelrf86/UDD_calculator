function [ISD_Smooth] = Smooth_Hei_Steps_VP(Position,ISD,Interfase)

[n,N] = size(ISD);

ISD_Smooth = ISD;
i=1;
for l=2:N
    if ISD(1,l) == ISD(1, l-1)
        
    else
        Point_Array(1,i) = l;
        i=i+1;
    end
end

%Small array that includes 8 points of ISD to produce the smooth
%approx
for p=1:length(Point_Array)
    Point=Point_Array(1,p);
    n=1;    
    for j=(Point-Interfase):(Point+Interfase)
        ISD_SS(1,n)=ISD(1,j);
        Position_SS(1,n)=Position(1,j);
        n=n+1;
    end
    
    Def=1;
    Interfase1=Interfase+1;
    
    p_tan = 0.1;
    while Def > 0.001
        %Define the Smooth value
        g=Point-Interfase;
        x=linspace(-1,1,length(ISD_SS));
        for h=1:n-1
            ISD_Smooth(1,g)=(ISD_SS(1,1)-(ISD_SS(1,1)-ISD_SS(1,n-1))*tanh(p_tan*x(1,h)))/2+ISD_SS(1,n-1)/2 ;      
            g=g+1;
        end
        Def=(ISD_Smooth(1,Point-Interfase1)-ISD_Smooth(1,Point-Interfase))/ISD_Smooth(1,Point-Interfase1);
        p_tan=p_tan+0.1;
    end
    
end

