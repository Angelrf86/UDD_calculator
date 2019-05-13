function [R_S_3D] = Laue_temp_Gui_3D(Z,a_Par,b_Par,c_Par,Energy_Bragg,h_Miller,k_Miller,l_Miller,DWF,f_0,f_1,f_2,absor,Range_E_neg,Range_E_pos,Polarization,Ang_asy_Deg,Thickness,N_Step,FBD,ky_array,kx_array,crystal_orientation)
%%% Calculations
% Constants
c_light= 299792458;%Light Speed m/s
h_planck = 4.13566733*10^(-15); % eV
%h_plank and c_light
hc = 1.2398e-06;

%Wave Length Bragg
WaveL_Bragg = h_planck*c_light/Energy_Bragg; %m

%Crystal parameters
Thickness = Thickness * 1e-6;

r_e = 2.8179403267*10^(-15);
V= a_Par*10^(-10)*b_Par*10^(-10)*c_Par*10^(-10);

d_hkl= 10^(-10)/sqrt((h_Miller/(a_Par))^2+...
    (k_Miller/(b_Par))^2+...
    (l_Miller/(c_Par))^2);

%Trying minimize the effects of exp
r_e_over_V = 2.8179403267*10^(15)/(a_Par*b_Par*c_Par);

if mod((h_Miller+k_Miller+l_Miller),2) == 0
    coef = 8;
else
    coef = abs(4*(1-1i));
end

% Factor
F0 = Z+f_1+1i*f_2;
FH = f_0+f_1+1i*f_2;

if absor == 0
    Chi_0_Cx = -r_e_over_V * WaveL_Bragg^2 * 8 * abs(F0) / (pi);
    Chi_h_Cx = -r_e_over_V * WaveL_Bragg^2 * coef * abs(FH) / (pi) * DWF;
    Chi_h_n_Cx = -r_e_over_V * WaveL_Bragg^2 * coef * abs(FH) /(pi) * DWF;
else
    Chi_0_Cx = -r_e_over_V * WaveL_Bragg^2 * 8 * F0 / (pi);
    Chi_h_Cx = -r_e_over_V * WaveL_Bragg^2 * coef * FH / (pi) * DWF;
    Chi_h_n_Cx = -r_e_over_V * WaveL_Bragg^2 * coef * FH /(pi) * DWF;
end

%Beam properties
k0_Bragg = 2*pi/WaveL_Bragg;

Theta_Bragg = asin(WaveL_Bragg/(2*d_hkl));

% Definition polarization and Asymmetry
if Polarization == 'p'
    P = cos(2*Theta_Bragg);
else
    P = 1;
end

Ang_asy = Ang_asy_Deg*pi/180;

gam_0 = sin(pi/2-Theta_Bragg+Ang_asy);
gam_H = sin(pi/2+Theta_Bragg-Ang_asy);

b = gam_0/gam_H;

m_d = [0, cos(Ang_asy)/d_hkl, sin(Ang_asy)/d_hkl];

q = b*Chi_h_Cx*Chi_h_n_Cx*abs(P)^2;


%Range work
%In case there is assymetry 
Theta_Bragg_Asy = Theta_Bragg + Ang_asy;

WaveL_Bragg_neg = h_planck*c_light/(Energy_Bragg - Range_E_neg); %m
WaveL_Bragg_pos = h_planck*c_light/(Energy_Bragg + Range_E_pos); %

Theta_Bragg_neg = asin(WaveL_Bragg_neg/(2*d_hkl)) + Ang_asy;
Theta_Bragg_pos = asin(WaveL_Bragg_pos/(2*d_hkl)) + Ang_asy;

Range_De_neg = Theta_Bragg_neg*180/pi();
Range_De_pos = Theta_Bragg_pos*180/pi();

Theta_Initial = Range_De_neg;
Steps_De_Theta = (Range_De_pos-Range_De_neg)/N_Step;

if crystal_orientation == 1
    Matrix_Bragg = [1 0 0; 0, cos(Theta_Bragg_Asy), -sin(Theta_Bragg_Asy); 0, sin(Theta_Bragg_Asy), cos(Theta_Bragg_Asy)];
else
    Matrix_Bragg = [-1 0 0; 0, -cos(Theta_Bragg_Asy), -sin(Theta_Bragg_Asy); 0, sin(Theta_Bragg_Asy), -cos(Theta_Bragg_Asy)];
end

% Vectorized version of the code
i_Theta = 1:N_Step;

Theta_De = Theta_Initial + (Steps_De_Theta.*i_Theta);
Theta = Theta_De.*pi/180-Ang_asy;

%Calculation of the Energy for each angle
WaveL = 2*d_hkl*sin(Theta);

Energy = hc./WaveL;
%We save the value of the diference of the energy in an array
E_Scan =  (Energy-Energy_Bragg);

k0_Theta = 2*pi./WaveL;

kx_array = reshape(kx_array, 1, []);
ky_array = reshape(ky_array, 1, 1, []);
k0_Theta = reshape(k0_Theta, 1, 1, 1, []);

kz0 = sqrt(k0_Theta.^2-ky_array.^2-kx_array.^2);

k0_vect = vertcat(...
    repmat(kx_array, [1, 1, length(ky_array), N_Step]), ...
    repmat(ky_array, [1, length(kx_array), 1, N_Step]), ...
    kz0);

k0_beam = bsxpagemult(Matrix_Bragg, k0_vect);

alfa_beam = squeeze(bsxpagemult(m_d, k0_beam))/2/pi;

alfa =(2*alfa_beam + 1/(d_hkl)^2)*4*pi*pi /k0_Bragg^2 ;

%Definition of y
y =0.5*(b*alfa + Chi_0_Cx*(1-b));

Y_2 = (- y + sqrt(q + y.^2))/(Chi_h_n_Cx*P);
Y_1 = (- y - sqrt(q + y.^2))/(Chi_h_n_Cx*P);

X_1 = 0.5*(Chi_0_Cx -y + sqrt(q + y.^2));
X_2 = 0.5*(Chi_0_Cx -y - sqrt(q + y.^2));

R1 = Y_1;
R2 = Y_2;

expX1 = exp(1i*k0_Bragg/gam_0*X_1*Thickness);
expX2 = exp(1i*k0_Bragg/gam_0*X_2*Thickness);

if FBD == 1
    R_0_0_S = (R2.*expX1-R1.*expX2)./(R2-R1);
    R_S_3D =  R_0_0_S;
    
else
    R_0_H_S = R2.*R1.*(expX1-expX2)./(R2-R1);
    R_S_3D =  R_0_H_S;
end
