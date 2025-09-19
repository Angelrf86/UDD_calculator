%crystal_orientation defines if the geometry of the crystal is + or -, that
%means if the normal is positive with respect to the imcoming beam.

function [R_S_3D] = Bragg_temp_Gui_3D_test_strain...
    (a_Par_strain,b_Par_strain,c_Par_strain,Energy_Bragg,Energy_center_strain,h_Miller_strain,k_Miller_strain,l_Miller_strain,...
    DWF,F0_strain,FH_strain,F_H_strain,absor,Range_E_neg,Range_E_pos,Polarization,Ang_asy_Deg_strain,Thickness_strain,N_Step,...
    FBD,ky_array,kx_array,crystal_orientation,strain_perp,strain_par,cluster)
%%% Calculations
% Constants
c_light= 299792458; %Light Speed m/s
h_planck = 4.13566733*10^(-15); % eV
%h_plank and c_light
hc = 1.2398e-06;

% Wave length Bragg
WaveL_Bragg = hc/Energy_Bragg    ; %m

%radius and volume
r_e = 2.8179403267*10^(-15);

N_Stepx = size(ky_array,2);
N_Stepy = size(kx_array,2);


Matrix0 = zeros(2,2,N_Stepy,N_Stepx,N_Step);
MatrixC = zeros(2,2,N_Stepy,N_Stepx,N_Step);
Matrix_total = zeros(2,2,N_Stepy,N_Stepx,N_Step);

for i_N_Steps = 1: N_Step
    for i_N_Stepsx = 1:N_Stepx
        for i_N_Stepsy = 1:N_Stepy
            Matrix_total(:,:,i_N_Stepsy,i_N_Stepsx,i_N_Steps) = eye(2);
        end
    end
end
Matrix_total_gpu = gpuArray(Matrix_total);
tic
layers = size(Thickness_strain,2); % number of layers
time_past = 0;
for i_layers = 1 : layers
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
    
    
    %alfa =(2*alfa_beam + 1/(d_hkl)^2)*4*pi*pi /k0_Bragg^2 ;
    %Strain
    if Theta >Theta_Bragg
        alfa = (2*alfa_beam + 1/(d_hkl)^2)*4*pi*pi /k0_Bragg^2 +...
        ((sin(Ang_asy).^2.*tan(Theta_Bragg) - sin(Ang_asy) * cos(Ang_asy)) * strain_perp(1,i_layers));
    else
        alfa = (2*alfa_beam + 1/(d_hkl)^2)*4*pi*pi /k0_Bragg^2 +...
        ((sin(Ang_a7654134POPPPOOOsy).^2.*tan(Theta_Bragg) + sin(Ang_asy) * cos(Ang_asy)) * strain_perp(1,i_layers));
    end
    
    %Definition of y
    y =0.5*(b*alfa + Chi_0_Cx*(1-b));
    
    R2 = (- y + sqrt(q + y.^2))/(Chi_h_n_Cx*P);
    R1 = (- y - sqrt(q + y.^2))/(Chi_h_n_Cx*P);
    
    X_1 = 0.5*(Chi_0_Cx +(-y + sqrt(q + y.^2)));
    X_2 = 0.5*(Chi_0_Cx +(-y - sqrt(q + y.^2)));
    
    expX1 = exp(1i.*k0_Bragg./gam_0.*X_1.*Thickness);
    expX2 = exp(1i.*k0_Bragg./gam_0.*X_2.*Thickness);
    
    Matrix0(1,1,:,:,:) = ones(N_Stepy,N_Stepx,N_Step);
    Matrix0(1,2,:,:,:) = ones(N_Stepy,N_Stepx,N_Step);
    Matrix0(2,1,:,:,:) = R1(:,:,:);
    Matrix0(2,2,:,:,:) = R2(:,:,:);
    
    MatrixC(1,1,:,:,:) = expX1;
    MatrixC(1,2,:,:,:) = expX2;
    MatrixC(2,1,:,:,:) = R1 .*expX1;
    MatrixC(2,2,:,:,:) = R2 .*expX2;
    
    %%GPU
    MatrixC_gpu = gpuArray(MatrixC);
    Matrix0_gpu = gpuArray(Matrix0);
    Matrix0_gpu = pagefun(@inv,Matrix0_gpu);
    
    Matrix_total_gpu = pagefun(@mtimes,Matrix_total_gpu,MatrixC_gpu);
    Matrix_total_gpu = pagefun(@mtimes,Matrix_total_gpu,Matrix0_gpu);
    
    %     for i_N_Steps = 1: N_Step
    %         for i_N_Stepsx = 1:N_Stepx
    %             for i_N_Stepsy = 1:N_Stepy
    %                 T0_calculate(:,:) = inv(Matrix0(:,:,i_N_Stepsy,i_N_Stepsx,i_N_Steps));
    %                 TC_calculate(:,:) = MatrixC(:,:,i_N_Stepsy,i_N_Stepsx,i_N_Steps);
    %                 Matrix_total_1(:,:) = Matrix_total(:,:,i_N_Stepsy,i_N_Stepsx,i_N_Steps);
    %
    %                 Matrix_total(:,:,i_N_Stepsy,i_N_Stepsx,i_N_Steps) = Matrix_total_1 * TC_calculate *T0_calculate;
    %             end
    %         end
    %     end
   
    time_step = toc;
    time_past  = time_past + time_step;
    if i_layers == 1
        time_total = layers * toc;
    else
        time_total = 0.85 * time_total+0.15 * (layers * toc);
    end
    disp(sprintf('layer %d from %d, time per step %d, time elapse %d h from total time %d h', i_layers,layers,time_step,time_past/3600,time_total/3600))
    
end


if FBD == 0
    %GPU
    R_0H_S0(:,:,:) = - Matrix_total_gpu(2,1,:) ./  Matrix_total_gpu(2,2,:);
    R_S_3D_gather(1,:) =  gather(R_0H_S0);
    
    for i_N_Steps = 1:N_Step
         for i_N_Stepsx = 1:N_Stepx
             for i_N_Stepsy = 1: N_Stepy                 
                 R_S_3D(i_N_Stepsy,i_N_Stepsx,i_N_Steps) = R_S_3D_gather(i_N_Stepsy + (i_N_Stepsx-1)*N_Stepy + (i_N_Steps-1)* N_Stepy * N_Stepx);
             end
         end
    end
    
    %CPU
    %R_0H_S0(:,:,:) = - Matrix_total(2,1,:,:,:) ./  Matrix_total(2,2,:,:,:);    
    %R_S_3D =  (R_0H_S0);
    
else
    %GPU
    R_00_S0(:,:,:) =  Matrix_total_gpu(1,1,:) - Matrix_total_gpu(2,1,:) ./  Matrix_total_gpu(2,2,:) .* Matrix_total_gpu (1,2,:);
      
    R_S_3D_gather(1,:) =  gather(R_00_S0);
    
    for i_N_Steps = 1:N_Step
         for i_N_Stepsx = 1:N_Stepx
             for i_N_Stepsy = 1: N_Stepy                 
                 R_S_3D(i_N_Stepsy,i_N_Stepsx,i_N_Steps) = R_S_3D_gather(i_N_Stepsy + (i_N_Stepsx-1)*N_Stepy + (i_N_Steps-1)* N_Stepy * N_Stepx);
             end
         end
    end
    
    %CPU
    %R_00_S0(:,:,:) =  Matrix_total(1,1,:,:,:) - Matrix_total(2,1,:,:,:) ./  Matrix_total(2,2,:,:,:) .* Matrix_total (1,2,:,:,:);    
    %R_S_3D =  (R_00_S0);
end

% 
% figure
% plot(abs(R_S_3D_gather).^2)
% pause(1)
% 
% figure
% R_S_3D_plot(1,:) = R_S_3D(1,1,:);
% plot(abs(R_S_3D_plot).^2)

% 
% 
% 
% figure
% R_S_3D_plot(:,:) = R_S_3D(:,:,size(R_S_3D,3)/2);
% imagesc(abs(R_S_3D_plot).^2)
