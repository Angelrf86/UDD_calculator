% Layer_definition defind the crystal dispacing at the moment we describe
% the type as step point but it could be upgrade it to other aproximations.
% Type = (1) will select step fuctionThe crystal_length (nm) is need to 
% defind the number of points for the approximation
% Type = (2) Strange Smooth
% Type = (3) Heaviside Smooth style with tanh.
%
%
function [ISD_Smooth,N_Crystal] = Layer_Definition_Approx_10102014(Crystal_Length_Initial,Strain,Interfase_p,Step_Length) 

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

ISD = ones(1,n_layers);

Interfase = int16(Interfase_p*n_layers/100);

i=1;
i0=i;
while i<n_layers+1
    %Generate the value for the dispacing
    for t=i0:i
        ISD(1,t)=Strain;        
        Position(1,t)=t;        
    end
    i=i+1;
end

for h=(i):Interfase+i
    ISD(1,h)=0;
    t=t+1;
    Position(1,h)=t;
end

ISD_S = Smooth_Hei_Steps_VP(Position,ISD,Interfase);
ISD_Smooth(1,:) = Position*N_Crystal;
ISD_Smooth(2,:) = ISD_S(1,:);
ISD_Smooth(3,:) = ISD(1,:);

% 
%   figure
%   hold on
%   title('Strain vs Depth')
%   xlabel('Depth(nm)')
%   ylabel('da/a')
%   plot(Position,ISD_Smooth,'-')
%   plot(Position,ISD,'r-')