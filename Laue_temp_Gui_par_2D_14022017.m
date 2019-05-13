function [R_S_2D] = Laue_temp_Gui_par_2D_14022017(Z,a_Par,b_Par,c_Par,Energy_Bragg,h_Miller,k_Miller,l_Miller,DWF,f_0,f_1,f_2,absor,Range_E_neg,Range_E_pos,Polarization,Thickness,N_Step,FBD,ky_array)

%%% Calculations
%microns
Thickness = Thickness * 1e-6;

r_e = 2.8179403267*10^(-15);
%Light Speed m/s
c_light= 299792458;
% eV
h_planck = 4.13566733*10^(-15);

% Factor
F0 = Z+f_1+1i*f_2;
FH = f_0+f_1+1i*f_2;

WaveL_Bragg = h_planck*c_light/Energy_Bragg    ; %m
WaveL_Bragg_neg = h_planck*c_light/(Energy_Bragg-Range_E_neg); %m
WaveL_Bragg_pos = h_planck*c_light/(Energy_Bragg+Range_E_pos); %

k0_Bragg = 2*pi/WaveL_Bragg;

% NStepx = N_Step/10;
% NStepy = N_Step/10;
%beam properties
% kx0 =0.0001*k0_Bragg;
% sigma_kx = .2*k0_Bragg;
% kx0_array = linspace(-NStepx/2,NStepx/2,NStepx)*k0_Bragg/2;
% kx_array = gaussmf(kx0_array,[sigma_kx kx0_array(1,NStepx/2)])*kx0;
%
% ky0 =0.0001*k0_Bragg;
% sigma_ky = .2*k0_Bragg;
% ky0_array = linspace(-NStepy/2,NStepy/2,NStepy)*k0_Bragg/2;
% ky_array = gaussmf(ky0_array,[sigma_ky ky0_array(1,NStepy/2)])*ky0;

kx0 =0*k0_Bragg;
kx_array = kx0*ones(1,N_Step);
kx = 0;



V= a_Par*10^(-10)*b_Par*10^(-10)*c_Par*10^(-10);

if mod((h_Miller+k_Miller+l_Miller),2) == 0
    coef = 8;
else
    coef = abs(4*(1-1i));
end

if absor == 0
    Chi_0_Cx = -r_e * WaveL_Bragg^2 * 8 * abs(F0) / (pi * V);
    Chi_h_Cx = -r_e * WaveL_Bragg^2 * coef * abs(FH) / (pi * V) * DWF;
    Chi_h_n_Cx = -r_e * WaveL_Bragg^2 * coef * abs(FH) /(pi * V) * DWF;
else
    Chi_0_Cx = -r_e * WaveL_Bragg^2 * 8 * F0 / (pi * V);
    Chi_h_Cx = -r_e * WaveL_Bragg^2 * coef * FH / (pi * V) * DWF;
    Chi_h_n_Cx = -r_e * WaveL_Bragg^2 * coef * FH /(pi * V) * DWF;
end  


%m
d_hkl= 1/sqrt((h_Miller/(a_Par*10^(-10)))^2+...
    (k_Miller/(b_Par*10^(-10)))^2+...
    (l_Miller/(c_Par*10^(-10)))^2);

Theta_Bragg = asin(WaveL_Bragg/(2*d_hkl));
Theta_Bragg_neg = asin(WaveL_Bragg_neg/(2*d_hkl));
Theta_Bragg_pos = asin(WaveL_Bragg_pos/(2*d_hkl));

Theta_Bragg_De = Theta_Bragg*180/pi();
Range_De_neg = Theta_Bragg_neg*180/pi();
Range_De_pos = Theta_Bragg_pos*180/pi();

Theta_Initial = Range_De_neg;
Steps_De_Theta = (Range_De_pos-Range_De_neg)/N_Step;

Ang_asy = 0*pi/180;

gam_0 = sin(pi/2-Theta_Bragg+Ang_asy);
gam_H = sin(pi/2+Theta_Bragg-Ang_asy);

b= gam_0/gam_H;

m_d = [0 , cos(Ang_asy)/d_hkl, -sin(Ang_asy)/d_hkl];


I_Area_0H_S = 0;
I_Area_00_S = 0;
I_Area_00n_S = 0;


for i_ky = 1:size(ky_array,2)
    ky = ky_array(1,i_ky);
    %Initialaiting the values of Theta and the Energy for each step
    E_Scan = ones(1,N_Step);
    Theta_Scan = ones(1,N_Step);
    
    
    %Starting the Loop for the Ideal case
    t=1;
    sv = ones(1,3);
    nv = ones(1,3);
    tv = ones(1,3);
    
    Matrix_Bragg  = zeros (3,3);
    C = exp(1i*real(Chi_0_Cx)*k0_Bragg*Thickness/(2*gam_0));
    parfor i_Theta=1:N_Step
        Theta_De = Theta_Initial + (Steps_De_Theta*i_Theta);
        Theta = Theta_De*pi()/180;
        Theta_Scan(1,i_Theta) = Theta_De-Theta_Bragg_De;
        
        %Calculation of the Energy for each angle
        WaveL = 2*d_hkl*sin(Theta);
        
        Energy = h_planck*c_light/WaveL;
        
        %We save the value of the diference of the energy in an array
        E_Scan(1,i_Theta) =  (Energy-Energy_Bragg);
        
        %Defining the value of the complex number inside the square root
%         sv = [1, 0 ,0];
%         nv = [0, cos(Theta_Bragg),-sin(Theta_Bragg)];
%         tv = [0, sin(Theta_Bragg),cos(Theta_Bragg)];
        %nv = [0, sin(Theta_Bragg),-cos(Theta_Bragg)]; %Laue?
        %tv = [0, cos(Theta_Bragg),sin(Theta_Bragg)]; %Laue?
        
        %Existing Vectors
        ex =  [1,0,0];
        ey =  [0,cos(2*Theta_Bragg),sin(2*Theta_Bragg)];
        ez =  [0,sin(2*Theta_Bragg),cos(2*Theta_Bragg)];
        
        Matrix_Bragg = [1 0 0; 0, cos(Theta_Bragg),-sin(Theta_Bragg) ; 0, sin(Theta_Bragg),cos(Theta_Bragg)]
        
%         for i_Matrix = 1:3
%             Matrix_Bragg(1,i_Matrix) = sv(1,i_Matrix);
%             Matrix_Bragg(2,i_Matrix) = nv(1,i_Matrix);
%             Matrix_Bragg(3,i_Matrix) = tv(1,i_Matrix);
%         end
        
        k0_Theta = 2*pi/WaveL   ;
        
        dk(1,i_Theta) = k0_Theta;
        
        kz0 = sqrt(k0_Theta^2-ky^2-kx^2);
        
        k0_vect = [kx, ky, kz0];
        
        k0_beam = zeros(1,3);
        for j_k0_beam = 1:3
            k0_beam(1,j_k0_beam) = Matrix_Bragg(j_k0_beam,1)* k0_vect(1,1) + Matrix_Bragg(j_k0_beam,2)* k0_vect(1,2) + Matrix_Bragg(j_k0_beam,3)* k0_vect(1,3);
        end
        
        %m_d = [0 , cos(pi/2-Ang_asy)/d_hkl, sin(pi/2-Ang_asy)/d_hkl];
        m_d = [0 , cos(Ang_asy)/d_hkl, sin(Ang_asy)/d_hkl];
        
        alfa_beam = (k0_beam(1,1) * m_d(1,1) + k0_beam(1,2) * m_d(1,2) + k0_beam(1,3) * m_d(1,3))/2/pi;
        
        %% Shvydko direct approx
        %Polarization
        if Polarization == 'p'
            P= cos(2*Theta_Bragg);
        else
            P = 1;
        end
        
        alfa =(2*alfa_beam + 1/(d_hkl)^2)*4*pi*pi /k0_Bragg^2 ;
        
        %Definition of y
        y =0.5*(b*alfa + Chi_0_Cx*(1-b));
        
        q = b*Chi_h_Cx*Chi_h_n_Cx;
        
        Y_2 = (- y + sqrt(q + y.^2))/Chi_h_n_Cx;
        Y_1 = (- y - sqrt(q + y.^2))/Chi_h_n_Cx ;
        
        X_1 = 0.5*(Chi_0_Cx -y + sqrt(q + y.^2));
        X_2 = 0.5*(Chi_0_Cx -y - sqrt(q + y.^2));
        
        R1 = Y_1;
        R2 = Y_2;
        
        expX1 = exp(1i*k0_Bragg/gam_0*X_1*Thickness);
        expX2 = exp(1i*k0_Bragg/gam_0*X_2*Thickness);
        
        R_0_0_S = (R2*expX1-R1*expX2)/(R2-R1);
        R_0_H_S = R2*R1*(expX1-expX2)/(R2-R1);
        
%         R_1_S(1,i_Theta) = R1;
%         R_2_S(1,i_Theta) = R2;
        
        if FBD == 1
            R_S(1,i_Theta) =  R_0_0_S;
        else
            R_S(1,i_Theta) =  R_0_H_S;
        end

    end    
    R_S_2D(i_ky,:) = R_S(1,:);
end

  
% figure  
% surf(E_Scan,kx_array,abs(R_0H_S_2D).^2,'edgecolor','none')
%  figure
%  surf(kx_array,ky_array,abs(R_0H_S_3D(:,:,N_Step/2)).^2)
%  figure
%  surf(kx_array,ky_array,abs(R_0H_S_3D(:,:,N_Step)).^2)
%
%  figure
%  size(R_0H_S_3D);
%  R_0H_S (1,:) = R_0H_S_3D(1,1,:);
%  plot(E_Scan,abs(R_0H_S).^2)
%  figure
%  R_0H_S (1,:) =R_0H_S_3D(N_Step/10/2,N_Step/10/2,:);
%  plot(E_Scan,abs(R_0H_S).^2)
%
%  figure
%  R_0H_S (1,:) =R_0H_S_3D(N_Step/10,N_Step/10,:);
%  plot(E_Scan,abs(R_0H_S).^2)
% 
% 
% G_0H_S_2D = fftshift(fftshift(fftn(R_S_2D),1),2);
% G_00_S_2D = fftshift(fftshift(fftn(R_00_S_2D),1),2);


% figure
% surf(kx_array,ky_array,abs(G_0H_S_3D(:,:,1)).^2,'edgecolor','none')
% figure
% surf(kx_array,ky_array,abs(G_0H_S_3D(:,:,N_Step/2)).^2,'edgecolor','none')
% figure
% surf(kx_array,ky_array,abs(G_0H_S_3D(:,:,N_Step)).^2,'edgecolor','none')
%
% figure
% G_0H_S (1,:) = G_0H_S_3D(1,1,:);
% plot(E_Scan,abs(G_0H_S).^2)
% figure
% G_0H_S (1,:) =G_0H_S_3D(N_Step/10/2,N_Step/10/2,:);
% plot(E_Scan,abs(G_0H_S).^2)
%
% figure
% G_0H_S (1,:) =G_0H_S_3D(N_Step/10,N_Step/10,:);
% plot(E_Scan,abs(G_0H_S).^2)
%
%
% R_0H_3D = ifftn(G_0H_S_3D);
%
% figure
% surf(kx_array,ky_array,abs(R_0H_3D(:,:,1)).^2,'edgecolor','none')
% figure
% surf(kx_array,ky_array,abs(R_0H_3D(:,:,N_Step/2)).^2,'edgecolor','none')
% figure
% surf(kx_array,ky_array,abs(R_0H_3D(:,:,N_Step)).^2,'edgecolor','none')
%
% figure
% R_0H (1,:) = R_0H_3D(1,1,:);
% plot(E_Scan,abs(R_0H).^2)
% figure
% R_0H (1,:) =R_0H_3D(N_Step/10/2,N_Step/10/2,:);
% plot(E_Scan,abs(R_0H).^2)
%
% figure
% R_0H (1,:) =R_0H_3D(N_Step/10,N_Step/10,:);
% plot(E_Scan,abs(R_0H).^2)



%Ideal case reflectivity and Area under it
% I_0H_S = (abs(R_00_S)).^2;
% I_00_S = (abs(R_00_S)).^2;
% 
% 
% 
% 
% I_0H_Smax = 0;
% for(i_Gmax = 1:N_Step)
%     if I_0H_Smax < I_0H_S(1, i_Gmax)
%         I_0H_Smax = I_0H_S(1, i_Gmax);
%         E_max0 = E_Scan(1,i_Gmax);
%     end
% end
% 
% E_Scan_plot = E_Scan;

%
% figure
% plot (E_Scan_plot,I_0H_S)
% xlabel('Energy (eV)')
% ylabel('Intensity (arb. units)')
% figure
% plot (E_Scan_plot,I_00_S)
% xlabel('Energy (eV)')
% ylabel('Intensity (arb. units)')
%
% figure
% plot (Theta_Scan,I_0H_S)
% xlabel('Theta (Deg)')
% ylabel('Intensity (arb. units)')
% figure
% plot (Theta_Scan,I_00_S)
% xlabel('Theta (Deg)')
% ylabel('Intensity (arb. units)')

% G_0H = fftshift(ifft(R_0H_S));
% G_00 = fftshift(ifft(R_00_S));
% 
% dE = E_Scan(1,2)-E_Scan(1,1);
% 
% df = dE/h_planck;
% 
% T = 1/df;
% 
% dt = T / N_Step;
% 
% t_array = dt * linspace(1,N_Step,N_Step);

% dkx = kx_array(1,1)-kx_array(1,2);
% dx = 2*pi/(N_Step/10*dkx);
% x_array = dx *linspace(1,N_Step,N_Step) ;

% dky = ky_array(1,1)-ky_array(1,2);
% dy = 2*pi/(N_Step/2*dky);
% y_array = dy *linspace(1,N_Step/10,N_Step/10) ;
% 
% G_max = 0;
% for i_Gmax = 1:N_Step
%     if FBD == 1
%         if G_max < abs(G_00(1, i_Gmax))^2
%             G_max = abs(G_00(1, i_Gmax))^2;
%             t_max0 = t_array (1,i_Gmax);
%         end
%     elseif FBD == 0
%         if G_max < abs(G_0H(1, i_Gmax))^2
%             G_max = abs(G_0H(1, i_Gmax))^2;
%             t_max0 = t_array (1,i_Gmax);
%         end
%     end
% end

%t_array_plot = t_array-t_max0;

% figure
% plot (t_array_plot,abs(G_0H).^2)
% xlabel('Time (s)')
% ylabel('Intensity (arb. units)')
%
% figure
% plot (t_array_plot,abs(G_00).^2)
% xlabel('Time (s)')
% ylabel('Intensity (arb. units)')



% d_hkl = d_hkl;
% Theta_Bragg_De  = Theta_Bragg_De ;
% 
% w_D = 4 * r_e * d_hkl^2 * coef* abs(FH) *abs(P)/ (pi * V);
% 
% w_s = w_D *tan(Theta_Bragg);
% 
% Dl_l = w_s/2*cot(Theta_Bragg);
% 
% %position of transverse displacement
% xmax_0 = (c_light* t_max0*cot(Theta_Bragg));
% x_transvers_array(1,:) = (c_light*t_array(1,:)*cot(Theta_Bragg));
%x_transvers_array(1,:) = (c_light*t_array(1,:) - Thickness*acos(Theta_Bragg))/2;
%xmax_0 = (c_light*t_max0 - Thickness*acos(Theta_Bragg))/2;
% figure
% plot (x_transvers_array,abs(G_00).^2)
% xlabel('Time (s)')
% ylabel('Intensity (arb. units)')
end