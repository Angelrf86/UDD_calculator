function [R_S_3D] = Laue_temp_Gui_3D_test_strain...
    (a_Par_strain,b_Par_strain,c_Par_strain,Energy_Bragg,Energy_center_strain,h_Miller_strain,k_Miller_strain,l_Miller_strain,...
    DWF,F0_strain,FH_strain,F_H_strain,absor,Range_E_neg,Range_E_pos,Polarization,Ang_asy_Deg_strain,Thickness_strain,N_Step,...
    FBD,ky_array,kx_array,crystal_orientation,strain_per, strain_par,cluster)


% Constants
c_light= 299792458;%Light Speed m/s
h_planck = 4.13566733*10^(-15); % eV
%h_plank and c_light
hc = 1.2398e-06;
r_e = 2.8179403267*10^(-15);

%% Calculations
%Wave Length Bragg
WaveL_Bragg = h_planck*c_light/Energy_Bragg; %m

layers = size(Thickness_strain,2); % number of layers 
time_past = 0;

% Loop all layers
for i_layers = 1 : layers 
    tic    
    %Crystal parameters
    Thickness = Thickness_strain(1,i_layers) * 1e-6;
    
    %Expansion of the unit cell
    a_Par = a_Par_strain(1,i_layers); 
    b_Par = b_Par_strain(1,i_layers);
    c_Par = c_Par_strain(1,i_layers);
    
    %Miller index of the reflection
    h_Miller = h_Miller_strain(1,i_layers);
    k_Miller = k_Miller_strain(1,i_layers);
    l_Miller = l_Miller_strain(1,i_layers);
    
    %Structure factos
    F0 = F0_strain(1,i_layers);
    FH = FH_strain(1,i_layers);
    F_H = F_H_strain(1,i_layers);
    
    %Asymmetry
    Ang_asy_Deg = Ang_asy_Deg_strain(1,i_layers);
    
    %Central energy of the beam
    Energy_center = Energy_center_strain(1,i_layers);
    %Calculation of the matrix
    V= a_Par*10^(-10)*b_Par*10^(-10)*c_Par*10^(-10);
    
    d_hkl= 10^(-10)/sqrt((h_Miller/(a_Par))^2+...
        (k_Miller/(b_Par))^2+...
        (l_Miller/(c_Par))^2);
    
    %Trying minimize the effects of exp
    r_e_over_V = 2.8179403267*10^(15)/(a_Par*b_Par*c_Par);
    
    if absor == 0
        Chi_0_Cx = r_e_over_V * WaveL_Bragg^2 * abs(F0) / (pi);
        Chi_h_Cx = r_e_over_V * WaveL_Bragg^2 * abs(FH) / (pi) * DWF;
        Chi_h_n_Cx = r_e_over_V * WaveL_Bragg^2 * abs(F_H) /(pi) * DWF;
    else
        Chi_0_Cx = r_e_over_V * WaveL_Bragg^2 * F0 / (pi);
        Chi_h_Cx = r_e_over_V * WaveL_Bragg^2 * FH / (pi) * DWF;
        Chi_h_n_Cx = r_e_over_V * WaveL_Bragg^2 * F_H /(pi) * DWF;
    end
    
    %Beam properties
    k0_Bragg = 2*pi/WaveL_Bragg;
    
    Theta_Bragg = asin(WaveL_Bragg/(2*d_hkl));
    
    % Definition polarization and Asymmetry
    if Polarization == 'p'
        P = cos(2 * Theta_Bragg);
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
    
    WaveL_Bragg_neg = h_planck*c_light/(Energy_center - Range_E_neg); %m
    WaveL_Bragg_pos = h_planck*c_light/(Energy_center + Range_E_pos); %
    
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
        
    else   %No cluster, small local calculations
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
    

    %alfa =(2*alfa_beam + 1/(d_hkl)^2)*4*pi*pi /k0_Bragg^2; %No strain case    
    %Strain need understand perpendicular and parallel strain calculations

    %Equation are taking into account the 90 deg of assymetric mixmatch
    %between Bragg and Laue geometry.
    if Theta >Theta_Bragg
        %Only perpendicular strain:
        %alfa = (2*alfa_beam + 1/(d_hkl)^2)*4*pi*pi /k0_Bragg^2 +((sin(Ang_asy).^2.*tan(Theta_Bragg) - sin(Ang_asy) * cos(Ang_asy))* strain_per(1,i_layers));

        %Both perpendicular and parallel strain
        alfa = (2*alfa_beam + 1/(d_hkl)^2)*4*pi*pi /k0_Bragg^2  + ((sin(Ang_asy).^2.*tan(Theta_Bragg) - sin(Ang_asy) * cos(Ang_asy)) * strain_per(1,i_layers)) + ((cos(Ang_asy).^2.*tan(Theta_Bragg) - sin(Ang_asy)*cos(Ang_asy)) * strain_par(1,i_layers));
        
    else
        %Only perpendicular strain:
        %alfa = (2*alfa_beam + 1/(d_hkl)^2)*4*pi*pi /k0_Bragg^2 +((sin(Ang_asy).^2.*tan(Theta_Bragg) + sin(Ang_asy) *cos(Ang_asy))* strain_perp(1,i_layers)); % Lings JPCM 18, 2006 9231

        %Both perpendicular and parallel strain
        alfa = (2*alfa_beam + 1/(d_hkl)^2)*4*pi*pi /k0_Bragg^2 + ((sin(Ang_asy).^2.*tan(Theta_Bragg) + sin(Ang_asy) * cos(Ang_asy)) * strain_per(1,i_layers)) + ((cos(Ang_asy).^2.*tan(Theta_Bragg) + sin(Ang_asy)*cos(Ang_asy)) * strain_par(1,i_layers));
    end
    
    %Definition of y
    y =0.5*(b*alfa + Chi_0_Cx*(1-b));
    
    R2 = (- y + sqrt(q + y.^2))/(Chi_h_n_Cx*P);
    R1 = (- y - sqrt(q + y.^2))/(Chi_h_n_Cx*P);
    
    X_1 = 0.5*(Chi_0_Cx +(-y + sqrt(q + y.^2)));
    X_2 = 0.5*(Chi_0_Cx +(-y - sqrt(q + y.^2)));
    
    expX1 = exp(1i.*k0_Bragg./gam_0.*X_1.*Thickness);
    expX2 = exp(1i.*k0_Bragg./gam_0.*X_2.*Thickness);
    
     if i_layers == 1 %First layer
        R_00_S0 = (R2 .* expX1 - R1 .* expX2)./(R2 - R1);
        R_0H_S0 = R2 .* R1 .*(expX1 - expX2)./(R2 - R1);
        
    else%other layer
        R_00_S = (R2 .* expX1 - R1 .* expX2) ./ (R2 - R1).* R_00_S0 + (expX2 - expX1) ./ (R2 - R1) .* R_0H_S0;
        R_0H_S = R2 .* R1 .* (expX1 - expX2) ./ (R2 - R1).* R_00_S0 + (R2 .* expX2 - R1 .* expX1 ) ./ (R2 - R1).* R_0H_S0;
        R_00_S0 = R_00_S;
        R_0H_S0 = R_0H_S;
        
     end
    
    time_step = toc;
    time_past  = time_past + time_step;
    if i_layers == 1
        time_total = layers * toc;
    else
        time_total = 0.85 * time_total+0.15 * (layers * toc);
    end
    disp(sprintf('layer %d from %d, time per step %d min, time elapse %d h from total time %d h', i_layers,layers,time_step/60,time_past/3600,time_total/3600))
end


if FBD == 0
    R_S_3D =  R_0H_S0;
else
    R_S_3D =  R_00_S0;
end
%
% figure
% R_S_3D_plot(:,:) = R_S_3D(:,:,size(R_S_3D,3)/2);
% imagesc(abs(R_S_3D_plot).^2)
% 
% figure
% R_S_3D_plot(:,:) = R_S_3D(:,:,1);
% imagesc(abs(R_S_3D_plot).^2)
% 
% figure
% R_S_3D_plot(:,:) = R_S_3D(:,:,size(R_S_3D,3));
% imagesc(abs(R_S_3D_plot).^2)
% 
% figure
% R_S_3D_plot(:,:) = sum(R_S_3D,3);
% imagesc(abs(R_S_3D_plot).^2)