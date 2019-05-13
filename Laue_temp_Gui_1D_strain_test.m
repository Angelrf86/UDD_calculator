%%%
% The parameters that should change are thickness, a_Par, b_Par and c_Par
% Asy could change due to the strain introduction in future code.
%%%%
function [Theta_Bragg_Asy,Chi_0_Cx,Chi_h_Cx,R_S,E_Scan_plot,G_0H,t_array,Dwidth] = Laue_temp_Gui_1D_strain_test(a_Par_strain,b_Par_strain,c_Par_strain,...
    Energy_Bragg,Energy_center_strain,h_Miller_strain,k_Miller_strain,l_Miller_strain,DWF,F0_strain,FH_strain,F_H_strain,absor,Range_E_neg,Range_E_pos,Polarization,...
    Ang_asy_Deg_strain,Thickness_strain,N_Step,FBD,crystal_orientation,strain_perp)
%%% Calculations
% Constants
r_e = 2.8179403267*10^(-15);
c_light= 299792458;%Light Speed m/s
h_planck = 4.13566733*10^(-15); % eV

%Wave Length Bragg
WaveL_Bragg = h_planck*c_light/Energy_Bragg; %m

layers = size(Thickness_strain,2); 

for i_layers = 1 : size(Thickness_strain,2) 

    %Crystal parameters
    Thickness = Thickness_strain(1,i_layers) * 1e-6;
    
    a_Par = a_Par_strain(1,i_layers)+strain_perp(1,i_layers)*a_Par_strain(1,i_layers);
    b_Par = b_Par_strain(1,i_layers);
    c_Par = c_Par_strain(1,i_layers);
    
    h_Miller = h_Miller_strain(1,i_layers);
    k_Miller = k_Miller_strain(1,i_layers);
    l_Miller = l_Miller_strain(1,i_layers);
    
    F0 = F0_strain(1,i_layers);
    FH = FH_strain(1,i_layers);
    F_H = F_H_strain(1,i_layers);
    
    Ang_asy_Deg = Ang_asy_Deg_strain(1,i_layers);
    
    Energy_center = Energy_center_strain(1,i_layers);
    
    
    
    %Calculation of the matrix
    V= a_Par*10^(-10)*b_Par*10^(-10)*c_Par*10^(-10);
    
    d_hkl= 1 / sqrt((h_Miller / (a_Par*10^(-10)))^2 + ...
        (k_Miller / (b_Par*10^(-10)))^2 + ...
        (l_Miller / (c_Par*10^(-10)))^2);
    
    
    if absor == 0
        Chi_0_Cx = r_e * WaveL_Bragg^2 * abs(F0) / (pi * V);
        Chi_h_Cx = r_e * WaveL_Bragg^2 * abs(FH) / (pi * V) * DWF;
        Chi_h_n_Cx = r_e * WaveL_Bragg^2 * abs(F_H) /(pi * V) * DWF;
    else
        Chi_0_Cx = r_e * WaveL_Bragg^2 * F0 / (pi * V);
        Chi_h_Cx = r_e * WaveL_Bragg^2 * FH / (pi * V) * DWF;
        Chi_h_n_Cx = r_e * WaveL_Bragg^2 * F_H /(pi * V) * DWF;
    end
    
    
    %Beam properties
    k0_Bragg = 2*pi/WaveL_Bragg;
    kx0 =0.0001*k0_Bragg;
    ky0 =0.0001*k0_Bragg;
    
    Theta_Bragg = asin(WaveL_Bragg/(2*d_hkl));
    
    Theta_Bragg_De = Theta_Bragg*180/pi();
    
    % Definition polarization and Asymmetry
    if Polarization == 'p'
        P = cos(2*Theta_Bragg);
    else
        P = 1;
    end
    
    Ang_asy = Ang_asy_Deg*pi/180;
    
    % propagation vectors
    gam_0 = sin(pi/2 - Theta_Bragg + Ang_asy);
    gam_H = sin(pi/2 + Theta_Bragg - Ang_asy);
    
    b = gam_0/gam_H;
    
    m_d = [0, cos(Ang_asy)/d_hkl, sin(Ang_asy)/d_hkl];
    
    q = 4*b*Chi_h_Cx*Chi_h_n_Cx*abs(P)^2;
    
    %% Range work
    %In case there is assymetry
    Theta_Bragg_Asy = Theta_Bragg + Ang_asy;
    
    WaveL_Bragg_neg = h_planck*c_light/(Energy_center - Range_E_neg); %m
    WaveL_Bragg_pos = h_planck*c_light/(Energy_center + Range_E_pos); %
    
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
    
    %% Vectorized loop over time steps
    i_Theta = 1:N_Step;
    
    Theta_De = Theta_Initial + (Steps_De_Theta.*i_Theta);
    Theta = Theta_De.*pi/180 -Ang_asy;
    %Theta_Scan = Theta_De-Theta_Bragg_De;
    
    %Calculation of the Energy for each angle
    WaveL = 2*d_hkl*sin(Theta);
    
    Energy = h_planck*c_light./WaveL;
    %We save the value of the diference of the energy in an array
    E_Scan =  (Energy-Energy_Bragg);
    
    k0_Theta = 2*pi./WaveL;
    
    kz0 = sqrt(k0_Theta.^2-ky0^2-kx0^2);
    
    k0_vect = [repmat(kx0, 1, N_Step); repmat(ky0, 1, N_Step); kz0];
    
    k0_beam = Matrix_Bragg*k0_vect;
    
    alfa_beam = m_d*k0_beam/2/pi;
    
    %alfa =(2*alfa_beam + 1/(d_hkl)^2)*4*pi*pi /k0_Bragg^2 ;
    alfa = 2*sin(2*Theta_Bragg) * (Theta-Theta_Bragg);
    
    %Strain
    if Theta >Theta_Bragg 
        alfa = 2*sin(2*Theta_Bragg) * (Theta-Theta_Bragg) + ((sin(Ang_asy).^2.*tan(Theta_Bragg)-sin(Ang_asy)*cos(Ang_asy)) * strain_perp(1,i_layers));
    else
        alfa = 2*sin(2*Theta_Bragg) * (Theta-Theta_Bragg) + ((sin(Ang_asy).^2.*tan(Theta_Bragg)+sin(Ang_asy)*cos(Ang_asy)) * strain_perp(1,i_layers));
    end
    %Definition of y
    y =(b*alfa - Chi_0_Cx*(1-b));
    
    R2 = ( y + sqrt(q + y.^2))/(2*Chi_h_n_Cx*P);
    R1 = ( y - sqrt(q + y.^2))/(2*Chi_h_n_Cx*P);
    
    X_1 = (2*Chi_0_Cx + y + sqrt(q + y.^2));
    X_2 = (2*Chi_0_Cx + y - sqrt(q + y.^2));
    
    
    expX1 = exp(1i*k0_Bragg/gam_0/4*X_1*Thickness);
    expX2 = exp(1i*k0_Bragg/gam_0/4*X_2*Thickness);
    
    if i_layers == 1 %First layer
        R_00_S0 = (R2 .* expX1 - R1 .* expX2)./(R2 - R1);
        R_0H_S0 = R2 .* R1 .*(expX1 - expX2)./(R2 - R1);
        
    else        %other layer
        R_00_S = (R2 .* expX1 - R1 .* expX2) ./ (R2 - R1).* R_00_S0 + (expX2 - expX1) ./ (R2 - R1) .* R_0H_S0;
        R_0H_S = R2 .* R1 .* (expX1 - expX2) ./ (R2 - R1).* R_00_S0 + (R2 .* expX2 - R1 .* expX1 ) ./ (R2 - R1).* R_0H_S0;
        R_00_S0 = R_00_S;
        R_0H_S0 = R_0H_S;
        
    end
    
end
     
if FBD == 0
    R_S =  R_0H_S0;
else
    R_S =  R_00_S0;
end
%% plot
%Ideal case reflectivity and Area under it
I_0H_S = (abs(R_S)).^2;


I_0H_Smax = 0;
for i_Gmax = 1:N_Step
    if I_0H_Smax < I_0H_S(1, i_Gmax)
        I_0H_Smax = I_0H_S(1, i_Gmax);
        E_max0 = E_Scan(1,i_Gmax);
    end
end
E_Scan = E_Scan +Energy_Bragg;
E_Scan_plot = E_Scan;

G_0H = fftshift(ifft(R_S));

dE = E_Scan(1,2)-E_Scan(1,1);

df = dE/h_planck;

T = 1/df;

dt = T / N_Step;

t_array = dt * linspace(1,N_Step,N_Step);


d_hkl = d_hkl;
Theta_Bragg_De  = Theta_Bragg_De ;

w_D = 4 * r_e * d_hkl^2 *abs(FH) *abs(P)/ (pi * V);

w_s = w_D *tan(Theta_Bragg);

Dl_l = w_s/2*cot(Theta_Bragg);

Dwidth = round(2* P* abs(Chi_h_Cx) * sqrt(abs(b))/sin(2*Theta_Bragg),8);

