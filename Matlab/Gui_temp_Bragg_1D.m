%Basic Bragg geometry 1D case for thin and thick crystals

function [Theta_Bragg,Chi_0_Cx,Chi_h_Cx,R_S,E_Scan,G_0H,t_array,k_array,Dwidth]= Gui_temp_Bragg_1D(a_Par,b_Par,c_Par,Energy_Bragg,Energy_center,h_Miller,k_Miller,l_Miller,DWF,F0,FH,F_H,absor,Range_E_neg,Range_E_pos,Polarization,Ang_asy_Deg,Thickness,N_Step,FBD,crystal_orientation)
%%% Calculations
% Constants
c_light= 299792458;%Light Speed m/s
h_planck = 4.13566733*10^(-15);% eV
%h_plank and c_light
hc = 1.2398e-06;

m_electron = 9.109e-31; %Kg

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

% Factor
if absor == 0
    Chi_0_Cx = -r_e_over_V* WaveL_Bragg^2 * abs(F0) / (pi);
    Chi_h_Cx = -r_e_over_V * WaveL_Bragg^2 * abs(FH) / (pi) * DWF;
    Chi_h_n_Cx = -r_e_over_V * WaveL_Bragg^2 * abs(F_H) /(pi) * DWF;
else
    Chi_0_Cx = -r_e_over_V * WaveL_Bragg^2 * F0 / (pi);
    Chi_h_Cx = -r_e_over_V * WaveL_Bragg^2 * FH / (pi) * DWF;
    Chi_h_n_Cx = -r_e_over_V * WaveL_Bragg^2 * F_H /(pi) * DWF;
end



k0_Bragg = 2*pi/WaveL_Bragg;
%beam properties
kx0 =0.0001*k0_Bragg;
ky0 =0.0001*k0_Bragg;

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

%Range work
%In case there is assymetry 
Theta_Bragg_Asy = Theta_Bragg + Ang_asy;

WaveL_Bragg_neg = hc/(Energy_center - Range_E_neg); %m
WaveL_Bragg_pos = hc/(Energy_center + Range_E_pos); %

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

% Vectorized loop over time steps
i_Theta = 1:N_Step;

Theta_De = Theta_Initial + (Steps_De_Theta.*i_Theta);
Theta = Theta_De.*pi/180 -Ang_asy;


%Calculation of the Energy for each angle
WaveL = 2*d_hkl*sin(Theta);

Energy = hc./WaveL;
%We save the value of the diference of the energy in an array
E_Scan =  (Energy-Energy_Bragg);

k0_Theta = 2*pi./WaveL;

k_array = k0_Theta;

kz0 = sqrt(k0_Theta.^2-ky0^2-kx0^2);

k0_vect = [repmat(kx0, 1, N_Step); repmat(ky0, 1, N_Step); kz0];

k0_beam = Matrix_Bragg*k0_vect;

alfa_beam = m_d*k0_beam/2/pi;

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


%% Study how to plot with Dimaond

R_0_H_S0 = R1;
R_0_0_S0 = expX1.*(R2-R1)./R2;

R_0_H_S1 = R2;
R_0_0_S1 = -expX2.*(R2-R1)./R1;

R_0_H_S2 = R2 .* R1 .* (expX2-expX1) ./ (R2.*expX2 - R1.*expX1);
R_0_0_S2 = expX2 .* expX1 .* (R2-R1) ./ (expX2.*R2 - expX1.*R1);


condition_dynamical_Bragg_min = find(real(R_0_H_S0) < real(R_0_H_S1));
condition_dynamical_Bragg_max = find(imag(R_0_H_S0) < imag(R_0_H_S1));

condition_dynamical_Bragg = intersect(condition_dynamical_Bragg_min,condition_dynamical_Bragg_max);

% E_Scan(condition_dynamical_Bragg)
% 
% figure
% plot(E_Scan,real(R_0_H_S0),'b')
% hold on
% plot(E_Scan,real(R_0_H_S1),'r')
% 
% figure
% plot(E_Scan,imag(R_0_H_S0),'c')
% hold on
% plot(E_Scan,imag(R_0_H_S1),'g')


%layer large
if isempty(condition_dynamical_Bragg)
    R_0_H_S = R_0_H_S2;
    R_0_0_S = R_0_0_S2;
    
else    
    I_min = condition_dynamical_Bragg(1,1)-1;
    %E_Scan(I_min)
    
    I_max = condition_dynamical_Bragg_max(1,length(condition_dynamical_Bragg_max));
    %E_Scan(I_max)
    
    R_0_H_S = R_0_H_S0;
    R_0_H_S (E_Scan > E_Scan(I_min)) = R_0_H_S1(E_Scan > E_Scan(I_min));
    R_0_H_S (E_Scan > E_Scan(I_max)) = R_0_H_S2(E_Scan > E_Scan(I_max));
    
    R_0_0_S = R_0_0_S0;
    R_0_0_S (E_Scan > E_Scan(I_min)) = R_0_0_S1(E_Scan > E_Scan(I_min));
    R_0_0_S (E_Scan > E_Scan(I_max)) = R_0_0_S2(E_Scan > E_Scan(I_max));
end

% %% Normal case
% R_0_H_S = R2 .* R1 .* (expX2-expX1) ./ (R2.*expX2 - R1.*expX1);
% R_0_0_S = expX2 .* expX1 .* (R2-R1) ./ (expX2.*R2 - expX1.*R1);
    
if FBD == 0
    R_S =  R_0_H_S;
else
    R_S =  R_0_0_S;
end

%figure
%hold on
%plot(E_Scan,abs(R_0_H_S).^2,'k')
%plot(E_Scan,abs(R_0_0_S).^2,'k')

%Ideal case reflectivity and Area under it
I_0H_S = (abs(R_S)).^2;

E_max0 = 0;
I_0H_Smax = 0;
for i_Gmax = 1:N_Step
    if I_0H_Smax < I_0H_S(1, i_Gmax)
        I_0H_Smax = I_0H_S(1, i_Gmax);
        E_max0 = E_Scan(1,i_Gmax);
    end
end

E_Scan = E_Scan +Energy_Bragg;

G_0H = fftshift(ifft(R_S));

dE = E_Scan(1,2)-E_Scan(1,1);

df = dE/h_planck;

T = 1/df;

dt = T / N_Step;

t_array = dt * linspace(1,N_Step,N_Step);

Dwidth = round(2* P* abs(Chi_h_Cx) * sqrt(abs(b))/sin(2*Theta_Bragg),8);

Delta = abs(WaveL_Bragg * sqrt(gam_0 * abs(gam_H)) / P/ sqrt(Chi_h_Cx * Chi_h_n_Cx));




%figure
%plot(E_Scan,abs(R_S).^2)
