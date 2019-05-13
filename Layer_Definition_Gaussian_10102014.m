% Layer_definition defind the crystal dispacing at the moment we describe
% the type as step point but it could be upgrade it to other aproximations. 
%
%
function [Gauss,N_Crystal] = Layer_Definition_Gaussian_10102014(Crystal_Length_Initial,Strain,Step_Length) 

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

n_layers = int16(Crystal_Length);

%Matrix weight and width
PlotingISD = linspace(1,Crystal_Length,Crystal_Length);
ISD = zeros(1,Crystal_Length);

i=1;

StrainT = 0;
while i<n_layers
    ISD(1,i)=Strain;
    StrainT=StrainT+Strain;
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
Gauss = zeros(3,n_layers);
GaussT = 0;
for p=1:LengthGauss
    Gauss(2,p)= Strain*exp(-(p-b)^2/(2*c^2));
    GaussT = GaussT+ Strain*exp(-(p-b)^2/(2*c^2));    
end
Gauss (1,:) = PlotingGauss(1,:);

for p=1:Crystal_Length
    Gauss (3,p)=ISD(1,p);
end

 Gauss(1,:)=Gauss(1,:)*N_Crystal;
%figure
%hold on
%title('Strain vs Depth')
%xlabel('Depth(nm)')
%ylabel('da/a')
%plot(PlotingGauss(1,:),Gauss(3,:),'r')
%plot(PlotingGauss(1,:),Gauss(2,:),'*')

end