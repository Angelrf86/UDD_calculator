% Layer_definition defind the crystal dispacing at the moment we describe
% the type as step point but it could be upgrade it to other aproximations. 
%
%
function [Gauss,N_Crystal] = Layer_Definition_Gaussian_depth_10102014(Crystal_Length_Initial,Strain,depth,Step_Length) 

N_Crystal = Step_Length;
Crystal_Length = Crystal_Length_Initial/Step_Length;
depth=depth/Step_Length;

if Crystal_Length > 2500000
    if N_Crystal<10000
        Crystal_Length = Crystal_Length_Initial/10000;
        depth=depth/10000;
        N_Crystal = 10000;
    end
elseif Crystal_Length > 25000
    if N_Crystal<100
        Crystal_Length = Crystal_Length_Initial/100;
        depth=depth/100;
        N_Crystal = 100;
    end
end

width_Strain = Crystal_Length/2;
Start_depth = depth - width_Strain;
n_layers = int16(Start_depth+Crystal_Length);

%Matrix weight and width
PlotingISD = linspace(1,Crystal_Length,Crystal_Length);
ISD = zeros(1,Crystal_Length+depth);

i=1;
StrainT = 0;
while i<n_layers
    if i<Start_depth
        ISD(1,i)=0;
        StrainT=StrainT+0;
        ISD(2,i)=StrainT;
    elseif i<Start_depth+Crystal_Length
        ISD(1,i)=Strain;
        StrainT=StrainT+Strain;
        ISD(2,i)=StrainT;
    end
    i=i+1;
end

StrainMed = abs(StrainT/2);

i=1;
while abs(ISD(2,i))< StrainMed
    sigma=i;
    i=i+1; 
end

c=Crystal_Length/2.51;
LengthGauss = 5*Crystal_Length/3+depth;

b=depth;

PlotingGauss = linspace(1,LengthGauss,LengthGauss);
Gauss = zeros(3,n_layers);
GaussT = 0;
for p=1:LengthGauss
    Gauss(2,p)= Strain*exp(-(p-b)^2/(2*c^2));
    GaussT = GaussT+ Strain*exp(-(p-b)^2/(2*c^2));    
end
Gauss (1,:) = PlotingGauss(1,:);

for p=1:Start_depth+Crystal_Length
    Gauss(3,p)=ISD(1,p);
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
