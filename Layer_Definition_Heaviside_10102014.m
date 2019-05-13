% Layer_definition defind the crystal dispacing at the moment we describe
% the type as step point but it could be upgrade it to other aproximations. 
%
%
function [ISD_H,N_Crystal] = Layer_Definition_Heaviside_0805018(Crystal_Length_Initial,Strain,Step_Length) 

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

ISD = ones(1,n_layers+10);

i=1;
while i<n_layers
    i0=i;        
    %Generate the value for the dispacing
    for t=i0:(i+1)
        ISD(1,t)=Strain;
        ISD(2,t)=t;
    end
    i=i+1;
end

for p=i+1:i+10
        ISD(1,p)=0;
        ISD(2,p)=p;
end

 ISD(2,:)=ISD(2,:)*N_Crystal;

 ISD_H(1,:)=ISD(2,:);
 ISD_H(2,:)=ISD(1,:);
% figure
% hold on
% title('Strain vs Depth')
% xlabel('Depth(nm)')
% ylabel('da/a')
% plot(ISD(2,:),ISD(1,:),'-')

end