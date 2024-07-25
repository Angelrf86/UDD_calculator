%Looks it is failing with 250 um thicknesses for R00
%Calculates the reflectivity of the Bragg in a layer method

function [Theta_Bragg,Chi_0_Cx,Chi_h_Cx,R_S,E_Scan,G_0H,t_array,k_array,Dwidth]= Gui_temp_Bragg_1D_strain(a_Par_strain,b_Par_strain,c_Par_strain,...
    Energy_Bragg,Energy_center_strain,h_Miller_strain,k_Miller_strain,l_Miller_strain,DWF,F0_strain,FH_strain,F_H_strain,absor,...
    Range_E_neg,Range_E_pos,Polarization,Ang_asy_Deg_strain,Thickness_strain,N_Step,FBD,crystal_orientation,strain_perp, strain_parll)
%%% Calculations
% Constants
c_light= 299792458;%Light Speed m/s
h_planck = 4.13566733*10^(-15);% eV
%h_plank and c_light
hc = 1.2398e-06;

% Wave length Bragg
WaveL_Bragg = hc/Energy_Bragg    ; %m

%radius and volume
r_e = 2.8179403267*10^(-15);

layers = size(a_Par_strain,2);

tic
for i_layers = 1 : layers
    %Crystal parameters
    Thickness = Thickness_strain(1,i_layers)*1e-6;
    a_Par = a_Par_strain(1,i_layers);
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
    
    q = b * Chi_h_Cx * Chi_h_n_Cx * abs(P)^2;
    
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
    WaveL = 2 * d_hkl * sin(Theta);
    
    Energy = hc./WaveL;
    %We save the value of the diference of the energy in an array
    E_Scan =  (Energy-Energy_Bragg);
    
    k0_Theta = 2*pi./WaveL;
    
    k_array = k0_Theta;
    
    kz0 = sqrt(k0_Theta.^2-ky0^2-kx0^2);
    
    k0_vect = [repmat(kx0, 1, N_Step); repmat(ky0, 1, N_Step); kz0];
    
    k0_beam = Matrix_Bragg * k0_vect;

    alfa_beam = m_d * k0_beam / (2 * pi);
    
%     alfa =(2 * alfa_beam + 1 / (d_hkl)^2) * (2 * pi) ^ 2 / k0_Bragg ^ 2 ;
    
    %Try alfa as laue zachariensen
   % WaveL_beam = 2 * pi ./ k0_beam;
   % alfa = 4 * (WaveL_beam - WaveL_Bragg) ./ WaveL_Bragg .* (sin(Theta_Bragg)).^2;
    
    %Strain
     if Theta >Theta_Bragg 
         alfa = 2*sin(2*Theta_Bragg) * (Theta-Theta_Bragg) + ((sin(Ang_asy).^2.*tan(Theta_Bragg) - sin(Ang_asy)*cos(Ang_asy)) * strain_perp(1,i_layers)) + ((cos(Ang_asy).^2.*tan(Theta_Bragg) - sin(Ang_asy)*cos(Ang_asy)) * strain_parll(1,i_layers));
     else
         alfa = 2*sin(2*Theta_Bragg) * (Theta-Theta_Bragg) + ((sin(Ang_asy).^2.*tan(Theta_Bragg) + sin(Ang_asy)*cos(Ang_asy)) * strain_perp(1,i_layers)) + ((cos(Ang_asy).^2.*tan(Theta_Bragg) + sin(Ang_asy)*cos(Ang_asy)) * strain_parll(1,i_layers));
     end
    
    %Definition of y
    y = 0.5 * (b * alfa + Chi_0_Cx * (1-b));
    
    R1 = (- y + sqrt(q + y.^2))/(Chi_h_n_Cx*P);
    R2 = (- y - sqrt(q + y.^2))/(Chi_h_n_Cx*P);   
    
    X_1 = 0.5 * (Chi_0_Cx - y + sqrt(q + y.^2));
    X_2 = 0.5 * (Chi_0_Cx - y - sqrt(q + y.^2));
    
    expX1 = exp(-1i * k0_Bragg / gam_0 * X_1 * Thickness);
    expX2 = exp(-1i * k0_Bragg / gam_0 * X_2 * Thickness);
    
    expX2(N_Step*0.5:N_Step*0.617) = unwrap(unwrap(unwrap(unwrap(real(expX2(N_Step*0.5:N_Step*0.617)))))) + 1i.*unwrap(unwrap(unwrap(unwrap(imag(expX2(N_Step*0.5:N_Step*0.617))))));

    % We save the values of the matrix terms to calculate M for the 4
    % diffraction equations:
     Matrix0(i_layers,1,1,:) = ones(1,N_Step);
     Matrix0(i_layers,1,2,:) = ones(1,N_Step);
     Matrix0(i_layers,2,1,:) = R1(1,:);
     Matrix0(i_layers,2,2,:) = R2(1,:);
     MatrixC(i_layers,1,1,:) = expX1(1,:);
     MatrixC(i_layers,1,2,:) = expX2(1,:);
     MatrixC(i_layers,2,1,:) = R1(1,:).*expX1(1,:);
     MatrixC(i_layers,2,2,:) = R2(1,:).*expX2(1,:);
    
end


%Init matrix T
for i_N_Step = 1:N_Step
    T(:,:,i_N_Step) = eye(2,2);
end

%Calculate matrix T for last layer
for i_N_Step = 1:N_Step
    T0_calculate(:,:) = Matrix0(i_layers,:,:,i_N_Step);
    TC_calculate(:,:) = MatrixC(i_layers,:,:,i_N_Step);    
    T(:,:,i_N_Step) = TC_calculate * inv(T0_calculate);
end

%From the rear surface up
while i_layers > 1    
    i_layers = i_layers - 1; %Next step
    for i_N_Step = 1:N_Step        
        M_calculate01(:,:) = Matrix0(i_layers, :, :, i_N_Step);
        M_calculateC1(:,:) = MatrixC(i_layers, :, :, i_N_Step);
        
%         T2(:,:,i_N_Step) = M_calculateC1 * inv(M_calculate01);
        
        T_calculate(:,:) = T(:,:,i_N_Step);
        %T after the new layer
        T(:,:,i_N_Step) = T_calculate * M_calculateC1 * inv(M_calculate01);
    end    
%         R_0H_S2(1,:) = - T2(2,1,:) ./T2 (2,2,:);
%         figure(120)
%         subplot(2,1,1)
%         plot(abs(R_0H_S2).^2)
%         title(i_layers)
%         R_0H_S(1,:) = - T(2,1,:) ./T (2,2,:);
%         subplot(2,1,2)
%         plot(abs(R_0H_S).^2)
%         title(i_layers)
        
end
%Solve the waves in the rear surface 
R_0H_S0(1,:) = - T(2,1,:) ./T (2,2,:);

I_condition = [ones(1,N_Step);R_0H_S0];

%Built the top surface from the solution in the rear surface
for i_layers = 1 : layers    
    for i_N_Step = 1:N_Step        
      M_calculate01(:,:) = Matrix0(i_layers, :, :, i_N_Step);
      M_calculateC1(:,:) = MatrixC(i_layers, :, :, i_N_Step);
      
      Solution_T0(:,i_N_Step) = linsolve(M_calculate01,I_condition(:,i_N_Step));
      I_condition(:,i_N_Step) = M_calculateC1 * Solution_T0(:,i_N_Step);
    end
    
    R_00_S0(1,:) = I_condition(1,:);
    R_0H_Sh(1,:) = I_condition(2,:);
    
%     figure(120)
%     subplot(2,1,1)
%     plot(abs(R_00_S0).^2)
%     title(i_layers)    
%     subplot(2,1,2)
%     plot(abs(R_0H_Sh).^2)
%     title(i_layers)
end

toc
if FBD(1,1) == 0
    R_S(1,:) =  R_0H_S0(1,:);
else
    R_S(1,:) =  R_00_S0(1,:);
end

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
%figure
%plot(E_Scan,abs(R_S).^2)
