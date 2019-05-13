% Layer_definition defind the crystal dispacing at the moment we describe
% the type as step point but it could be upgrade it to other aproximations. 
%
%
function [ISD_H,N_Crystal] = Layer_Definition_Heaviside_Multi_Strain_30052018(Crystal_Length_Initial,Strain,Step_Length) 

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
    n_layers_array(1,i_Crystal) = int16(Crystal_Length(1,i_Crystal));
    n_layers_total = n_layers_total + int16(Crystal_Length(1,i_Crystal));
end

ISD = ones(1,n_layers_total);

t=0;
for i_Strain =1:L
    i=1;
    while i<n_layers_array(1,i_Strain)+1
        %Generate the value for the dispacing
        t=t+1; 
        ISD(1,t)=Strain(1,i_Strain);
        ISD(2,t)=t;            
        i=i+1;
    end
   
end

% for p=t+1:t+10
%         ISD(1,p)=0;
%         ISD(2,p)=p;
% end

 ISD(2,:)=ISD(2,:)*N_Crystal;
 
 ISD_H(1,:)=ISD(2,:);
 ISD_H(2,:)=ISD(1,:);
%  figure
%  hold on
%  title('Strain vs Depth')
%  xlabel('Depth(nm)')
%  ylabel('da/a')
%  plot(ISD(2,:),ISD(1,:),'-')

end