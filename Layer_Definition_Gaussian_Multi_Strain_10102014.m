% Layer_definition defind the crystal dispacing at the moment we describe
% the type as step point but it could be upgrade it to other aproximations. 
%
%
function [Gauss_array,N_Crystal] = Layer_Definition_Gaussian_Multi_Strain_10102014(Crystal_Length_Initial,Strain,Step_Length) 


N_Crystal = Step_Length;
Crystal_Length = Crystal_Length_Initial/Step_Length;

if Crystal_Length > 2500000
    if N_Crystal<10000
        Crystal_Length = Crystal_Length_Initial/10000;
        N_Crystal = 10000;
    end
elseif Crystal_Length > 25000
    if N_Crystal<100
        Crystal_Length = Crystal_Length_Initial/100;    
        N_Crystal = 100;
    end
end
    Crystal_Length_Total = 0;
    n_layers_total = 0;

    [Tonto,L]=size(Crystal_Length);

    for i_Crystal=1:L
        Crystal_Length_Total = Crystal_Length_Total+Crystal_Length(1,i_Crystal);
        n_layers_array(1,i_Crystal) = Crystal_Length_Total;
        n_layers_total = n_layers_total + int16(Crystal_Length(1,i_Crystal));
    end
    ISD = zeros(1,n_layers_total);
       
    t=0;
    
    for i_Strain =1:L
        i=1;
        StrainT = 0;
        while i<n_layers_array(1,i_Strain)
            ISD(1,i)=Strain(1,i_Strain);
            StrainT=StrainT+Strain(1,i_Strain);
            ISD(2,i)=StrainT;
            i=i+1;
        end  
        StrainMed = abs(StrainT/2);
        i=1;
        while abs(ISD(2,i))< StrainMed
            b=i;
            i=i+1; 
        end
    
        c=b;
        LengthGauss = 6*b;
    
        PlotingGauss = linspace(1,LengthGauss,LengthGauss);
        Gauss = zeros(3,n_layers_array);
        GaussT = 0;
        for p=1:LengthGauss
            Gauss(2,p)= Strain(1,i_Strain)*exp(-(p-b)^2/(2*c^2));
            GaussT = GaussT+ Strain(1,i_Strain)*exp(-(p-b)^2/(2*c^2));    
        end
        Gauss (1,:) = PlotingGauss(1,:);
    
        for p=1:n_layers_array(1,i_Strain)
            Gauss (3,p)=ISD(1,p);
        end
        for w=1:LengthGauss
            Gauss_ar(t+1,w)= Gauss(1,w);
            Gauss_ar(t+2,w)= Gauss(2,w);
            Gauss_ar(t+3,w)= Gauss(3,w);       
        end
        t=t+3;
    end

    Gauss_array(1,:) = Gauss(1,:);
    for we =1:LengthGauss
        Gauss_arr2 = 0;
        Gauss_arr3 = 0;
        for te=0:L-1
            Gauss_arr2 = Gauss_arr2 + Gauss_ar(3*te+2,we);
            Gauss_arr3 = Gauss_arr3 + Gauss_ar(3*te+3,we);
        end
        Gauss_array(2,we) = Gauss_arr2;
        Gauss_array(3,we) = Gauss_arr3;        
    end
     Gauss(1,:)=Gauss(1,:)*N_Crystal;
% figure
% hold on
% title('Strain vs Depth')
% xlabel('Depth(nm)')
% ylabel('da/a')
% plot(Gauss_array(1,:),Gauss_array(2,:),'-')
% plot(Gauss_array(1,:),Gauss_array(3,:),'r')
% plot(Gauss_ar(1,:),Gauss_ar(2,:),'--')
% plot(Gauss_ar(1,:),Gauss_ar(3,:),'y')
% plot(Gauss_ar(4,:),Gauss_ar(5,:),'-.')
% plot(Gauss_ar(4,:),Gauss_ar(6,:),'g')
 
 
end