%crystal_orientation defines if the geometry of the crystal is + or -, that
%means if the normal is positive with respect to the imcoming beam.
function [R_S_3D] = Bragg_temp_Gui_3D_test...
    (a_Par,b_Par,c_Par,Energy_Bragg,Energy_center,h_Miller,k_Miller,l_Miller,...
    DWF,F0,FH,F_H,absor,Range_E_neg,Range_E_pos,Polarization,Ang_asy_Deg,Thickness,N_Step,...
    FBD,ky_array,kx_array,crystal_orientation,cluster)
%%% Calculations
% Constants
c_light= 299792458; %Light Speed m/s
h_planck = 4.13566733*10^(-15); % eV
%h_plank and c_light
hc = 1.2398e-06;

% Wave length Bragg
WaveL_Bragg = hc/Energy_Bragg    ; %m


% Crystal properties
Thickness = Thickness * 1e-6;
%radius and volume
r_e = 2.8179403267*10^(-15);
V= a_Par*10^(-10)*b_Par*10^(-10)*c_Par*10^(-10);

%m
d_hkl= 10^(-10)/sqrt((h_Miller/(a_Par))^2+...
    (k_Miller/(b_Par))^2+...
    (l_Miller/(c_Par))^2);

%Trying minimize the effects of exp
r_e_over_V = 2.8179403267*10^(15)/(a_Par*b_Par*c_Par);

if absor == 0
    Chi_0_Cx = -r_e_over_V* WaveL_Bragg^2 *  abs(F0) / (pi);
    Chi_h_Cx = -r_e_over_V * WaveL_Bragg^2 *  abs(FH) / (pi) * DWF;
    Chi_h_n_Cx = -r_e_over_V * WaveL_Bragg^2 * abs(F_H) /(pi) * DWF;
else
    Chi_0_Cx = -r_e_over_V * WaveL_Bragg^2 * F0 / (pi);
    Chi_h_Cx = -r_e_over_V * WaveL_Bragg^2 *  FH / (pi) * DWF;
    Chi_h_n_Cx = -r_e_over_V * WaveL_Bragg^2 *  F_H /(pi) * DWF;
end


%beam properties
k0_Bragg = 2*pi/WaveL_Bragg;

Theta_Bragg = asin(WaveL_Bragg/(2*d_hkl));

if Polarization == 'p'
    P = cos(2*Theta_Bragg);
else
    P = 1;
end


Ang_asy = Ang_asy_Deg*pi/180;

gam_0 = cos(-pi/2 + Theta_Bragg + Ang_asy);
gam_H = cos(pi/2 + Theta_Bragg - Ang_asy);

b = gam_0/gam_H;

m_d = [0, cos(Ang_asy)/d_hkl, sin(Ang_asy)/d_hkl];

q = b*Chi_h_Cx*Chi_h_n_Cx*abs(P)^2;

%% Range work
%In case there is assymetry 
Theta_Bragg_Asy = Theta_Bragg + Ang_asy;

WaveL_Bragg_neg = h_planck*c_light/(Energy_center-Range_E_neg); %m
WaveL_Bragg_pos = h_planck*c_light/(Energy_center+Range_E_pos); %

Theta_Bragg_neg = asin(WaveL_Bragg_neg/(2*d_hkl)) + Ang_asy;
Theta_Bragg_pos = asin(WaveL_Bragg_pos/(2*d_hkl)) + Ang_asy;

Range_De_neg = Theta_Bragg_neg*180/pi();
Range_De_pos = Theta_Bragg_pos*180/pi();

Theta_Initial = Range_De_neg;
Steps_De_Theta = (Range_De_pos-Range_De_neg)/N_Step;

%% Matrix Bragg defines the planes in function of the incident beam
%crystal orientation define the normal of the crystal to be positive or
%negative with respect to the incoming beam.
if crystal_orientation == 1
    Matrix_Bragg = [1 0 0; 0, cos(Theta_Bragg_Asy), -sin(Theta_Bragg_Asy); 0, sin(Theta_Bragg_Asy), cos(Theta_Bragg_Asy)];
else
    Matrix_Bragg = [-1 0 0; 0, -cos(Theta_Bragg_Asy), -sin(Theta_Bragg_Asy); 0, sin(Theta_Bragg_Asy), -cos(Theta_Bragg_Asy)];
end

%% Loop
% Vectorized version of the code
i_Theta = 1:N_Step;

Theta_De = Theta_Initial + (Steps_De_Theta.*i_Theta);
Theta = Theta_De.*pi/180-Ang_asy;

%Calculation of the Energy for each angle
WaveL = 2*d_hkl*sin(Theta);

Energy = hc./WaveL;
%We save the value of the diference of the energy in an array
E_Scan =  (Energy-Energy_center);

k0_Theta = 2*pi./WaveL;

kx_array = reshape(kx_array, 1, []);
ky_array = reshape(ky_array, 1, 1, []);
k0_Theta = reshape(k0_Theta, 1, 1, 1, []);

kz0 = sqrt(k0_Theta.^2-ky_array.^2-kx_array.^2);

k0_vect = vertcat(...
    repmat(kx_array, [1, 1, length(ky_array), N_Step]), ...
    repmat(ky_array, [1, length(kx_array), 1, N_Step]), ...
    kz0);

%Cluster
if cluster == true
    k0_beam = bsxpagemult(Matrix_Bragg, k0_vect);    
    alfa_beam = squeeze(bsxpagemult(m_d, k0_beam))/2/pi;
    
else 
    
    for i_k01 = 1:size(k0_vect,2)
        for i_k02 = 1:size(k0_vect,3)
            for i_k03 = 1:size(k0_vect,4)
                for j_k0_beam = 1:3
                    k0_beam(j_k0_beam,i_k01,i_k02,i_k03) = Matrix_Bragg(j_k0_beam,1)* k0_vect(1,i_k01,i_k02,i_k03) + Matrix_Bragg(j_k0_beam,2)* k0_vect(2,i_k01,i_k02,i_k03)+ Matrix_Bragg(j_k0_beam,3)* k0_vect(3,i_k01,i_k02,i_k03);
                end
            end
        end
    end
    for i_k01 = 1:size(k0_beam,2)
        for i_k02 = 1:size(k0_beam,3)
            for i_k03 = 1:size(k0_beam,4)
                alfa_beam(i_k01,i_k02,i_k03) = squeeze(m_d(1,1)* k0_beam(1,i_k01,i_k02,i_k03) + m_d(1,2)* k0_beam(2,i_k01,i_k02,i_k03)+ m_d(1,3)* k0_beam(3,i_k01,i_k02,i_k03))/2/pi;
            end
        end
    end
end


alfa =(2*alfa_beam + 1/(d_hkl)^2)*4*pi*pi /k0_Bragg^2 ;

%Definition of y
y =0.5*(b*alfa + Chi_0_Cx*(1-b));

R2 = (- y + sqrt(q + y.^2))/(Chi_h_n_Cx*P);
R1 = (- y - sqrt(q + y.^2))/(Chi_h_n_Cx*P);

X_1 = 0.5*(Chi_0_Cx +(-y + sqrt(q + y.^2)));
X_2 = 0.5*(Chi_0_Cx +(-y - sqrt(q + y.^2)));

expX1 = exp(1i.*k0_Bragg./gam_0.*X_1.*Thickness);
expX2 = exp(1i.*k0_Bragg./gam_0.*X_2.*Thickness);

if FBD == 0
    R_0_H_S = R2.*R1.*(expX2-expX1)./(R2.*expX2-R1.*expX1);
    R_S_3D =  R_0_H_S;
else
    R_0_0_S = expX2.*expX1.*(R2-R1)./(expX2.*R2-expX1.*R1) ;
    R_S_3D =  R_0_0_S;
end
% 
% 
% 
% figure
% R_S_3D_plot(:,:) = R_S_3D(:,:,size(R_S_3D,3)/2);
% imagesc(abs(R_S_3D_plot).^2)
