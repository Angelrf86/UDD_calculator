%% Probably not working


% Layer_definition defind the crystal dispacing at the moment we describe
% the type as step point but it could be upgrade it to other aproximations.
% Type = (1) will select step fuctionThe crystal_length (nm) is need to 
% defind the number of points for the approximation
% Type = (2) Strange Smooth
% Type = (3) Heaviside Smooth style with tanh.
%
%
function [ISD_Smooth,N_Crystal] = Layer_Definition_Approx_Multi_Strain_30052018(Crystal_Length_Initial,Strain_Array,Interfase_p,Step_Length) 

N_Crystal = Step_Length;
Crystal_Length_Array = Crystal_Length_Initial/Step_Length;

if Crystal_Length_Array > 2500000
    if N_Crystal<10000
        Crystal_Length_Array = Crystal_Length_Initial/10000;
        N_Crystal = 10000;
    end
elseif Crystal_Length_Array > 25000
    if N_Crystal<100
        Crystal_Length = Crystal_Length_Initial/100;    
        N_Crystal = 100;
    end
end

Crystal_Length_Total = 0;
[Tonto,L]=size(Crystal_Length_Array);

Crystal_Length_Array;

Crystal_zero =0;
for i_Crystal=1:L
    
    if Crystal_Length_Array(1,i_Crystal) == 0
        Crystal_zero = Crystal_zero+1;

    else
        Crystal_Length_Total = Crystal_Length_Total+Crystal_Length_Array(1,i_Crystal);
    end
end

n_layers = int16(Crystal_Length_Total);

ISD = ones(1,n_layers);

L = L-Crystal_zero;

for pasu=1:L
    Strain(1,pasu) = Strain_Array(1,pasu);
    Crystal_Length(1,pasu) = Crystal_Length_Array(1,pasu);
    n_layers_array (1,pasu) = int16(Crystal_Length_Array(1,pasu));
end

Interfase = (Interfase_p(1,1)*n_layers/100);

Interfase_val = Interfase(1,1);

% for i_Inter = 1:n_layers
%    if Interfase_val > Interfase(1,i_Inter)
%        Interfase_val = Interfase(1,i_Inter);
%    end
% end

t=0;
for i_Strain =1:L
    i=1;
    i0=i; 
    n_layers_array(1,i_Strain) +1 ;
    while i<n_layers_array(1,i_Strain) +1            
        %Generate the value for the dispacing
        t=t+1; 
        ISD(1,t)=Strain(1,i_Strain);
        Position(1,t)=t       ;    
        i=i+1;
    end   
end

% end_h = int16((Interfase(1,1))+t);

% for h=t:end_h
%     ISD(1,h)=0;
%     Position(1,h)=h;      
% end

ISD_S = Smooth_Hei_Steps_VP_Interfase_Array(Position,ISD,Interfase_val);

ISD_Smooth(1,:) = Position*N_Crystal;
ISD_Smooth(2,:) = ISD_S(1,:);
ISD_Smooth(3,:) = ISD(1,:);


% 
%   figure
%   hold on
%   title('Strain vs Depth')
%   xlabel('Depth(nm)')
%   ylabel('da/a')
%   plot(ISD_Smooth(1,:),ISD_Smooth(2,:),'-')
%   plot(ISD_Smooth(1,:),ISD_Smooth(3,:),'r-')
end