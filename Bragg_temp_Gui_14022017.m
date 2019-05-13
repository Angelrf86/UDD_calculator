function [Theta_Bragg,Chi_0_Cx,Chi_h_Cx,R_S,E_Scan,t_array,k_array]= Bragg_temp_Gui_14022017(Z,a_Par,b_Par,c_Par,Energy_Bragg,Energy_center,h_Miller,k_Miller,l_Miller,DWF,f_0,f_1,f_2,absor,Range_E_neg,Range_E_pos,Polarization,Thickness,N_Step,FBD)

vector_Miller = [h_Miller,h_Miller,l_Miller];


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
WaveL_Bragg_neg = h_planck*c_light/(Energy_center-Range_E_neg); %m
WaveL_Bragg_pos = h_planck*c_light/(Energy_center+Range_E_pos); %

k0_Bragg = 2*pi/WaveL_Bragg;
%beam properties
kx0 =0.0001*k0_Bragg;
ky0 =0.0001*k0_Bragg;

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

gam_0 = sin(pi/2 + Theta_Bragg + Ang_asy);
gam_H = sin(-pi/2 + Theta_Bragg - Ang_asy);

b= gam_0/gam_H;

m_d = [0 , cos(Ang_asy)/d_hkl, -sin(Ang_asy)/d_hkl];


I_Area_0H_S = 0;
I_Area_00_S = 0;
I_Area_00n_S = 0;

%Initialaiting the values of Theta and the Energy for each step    
E_Scan = ones(1,N_Step);
Theta_Scan = ones(1,N_Step);

%Starting the Loop for the Ideal case
t=1;
sv = ones(1,3);
nv = ones(1,3);
tv = ones(1,3);

Matrix_Bragg  = zeros (3,3);


for i_Theta=1:N_Step
    Theta_De = Theta_Initial + (Steps_De_Theta*i_Theta);
    Theta = Theta_De*pi()/180;
    Theta_Scan(1,t) = Theta_De-Theta_Bragg_De;
    
    %Calculation of the Energy for each angle
    WaveL = 2*d_hkl*sin(Theta); 

    Energy = h_planck*c_light/WaveL; 
    %We save the value of the diference of the energy in an array
    E_Scan(1,t) =  (Energy-Energy_Bragg);
    
    sv = [1, 0 ,0];
    nv = [0, cos(Theta_Bragg),-sin(Theta_Bragg)];
    tv = [0, sin(Theta_Bragg),cos(Theta_Bragg)];
    
    %Existing Vectors
    ex =  [1,0,0];
    ey =  [0,cos(2*Theta_Bragg),sin(2*Theta_Bragg)];
    ez =  [0,sin(2*Theta_Bragg),cos(2*Theta_Bragg)];
    
    for i_Matrix = 1:3
        Matrix_Bragg(1,i_Matrix) = sv(1,i_Matrix); 
        Matrix_Bragg(2,i_Matrix) = nv(1,i_Matrix);
        Matrix_Bragg(3,i_Matrix) = tv(1,i_Matrix);
    end
    
    k0_Theta = 2*pi/WaveL   ; 
    
    k_array(1,i_Theta) = k0_Theta;
    
    kz0 = sqrt(k0_Theta^2-ky0^2-kx0^2);
    
    k0_vect = [kx0, ky0, kz0];
    
    k0_beam = zeros(1,3);
    for j_k0_beam = 1:3
        k0_beam(1,j_k0_beam) = Matrix_Bragg(j_k0_beam,1)* k0_vect(1,1) + Matrix_Bragg(j_k0_beam,2)* k0_vect(1,2) + Matrix_Bragg(j_k0_beam,3)* k0_vect(1,3);
    end
    
    m_d = [0 , cos(Ang_asy)/d_hkl, sin(Ang_asy)/d_hkl];
    
    b1 = 1/(1- m_d(1,2)/k0_beam(1,2));
    
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
    
    y_S(1,t) =  y;
        
    q = b*Chi_h_Cx*Chi_h_n_Cx;
    
    Y_2 = (- y + sqrt(q + y.^2))/Chi_h_n_Cx;
    Y_1 = (- y - sqrt(q + y.^2))/Chi_h_n_Cx ;
    
    X_1 = 0.5*(Chi_0_Cx -y + sqrt(q + y.^2));
    X_2 = 0.5*(Chi_0_Cx -y - sqrt(q + y.^2));
    
    R1 = Y_1;
    R2 = Y_2;
          
    expX1 = exp(1i*k0_Bragg/gam_0*X_1*Thickness);
    expX2 = exp(1i*k0_Bragg/gam_0*X_2*Thickness);
    
    R_0_H_S = R2*R1*(expX2-expX1)/(R2*expX2-R1*expX1);
        
    R_0_0_S = expX2*expX1*(R2-R1)/(expX2*R2-expX1*R1) ;       
    
    R_1_S(1,t) = R1;    
    R_2_S(1,t) = R2;
    
    C = exp(1i*real(Chi_0_Cx)*k0_Bragg*Thickness/(2*gam_0));
 
    if FBD == 0
        R_S(1,t) =  R_0_H_S;
    else
        R_S(1,t) =  R_0_0_S;
    end
    
        
    t=t+1;
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
E_Scan_plot = E_Scan;
    
% figure
% plot (E_Scan_plot,I_0H_S)
% xlabel('Energy (eV)')
% ylabel('Intensity (arb. units)')
% figure
% plot (E_Scan_plot,I_00_S)
% xlabel('Energy (eV)')
% ylabel('Intensity (arb. units)')

%figure
%plot (Theta_Scan,I_0H_S)
%xlabel('Theta (Deg)')
%ylabel('Intensity (arb. units)')
%figure
%plot (Theta_Scan,I_00_S)
%xlabel('Theta (Deg)')
%ylabel('Intensity (arb. units)')

G_0H = fftshift(ifft(R_S));

dE = E_Scan(1,2)-E_Scan(1,1);

df = dE/h_planck;

T = 1/df;

dt = T / N_Step;

t_array = dt * linspace(1,N_Step,N_Step);

% t_max0 = 0;
% G_max = 0;
% for i_Gmax = 1:N_Step
%     if FBD == 1
%         if G_max < abs(G_00(1, i_Gmax))^2
%             G_max = abs(G_00(1, i_Gmax))^2;
%             t_max0 = t_array (1,i_Gmax);
%         end
%     elseif FBD == 0
%          if G_max < abs(G_0H(1, i_Gmax))^2
%             G_max = abs(G_0H(1, i_Gmax))^2;
%             t_max0 = t_array (1,i_Gmax);
%         end
%     end
% end
% 
% t_array_plot = t_max0-t_array;
% 
% figure
% plot (t_array_plot,abs(G_0H).^2)
% xlabel('Time (s)')
% ylabel('Intensity (arb. units)')
% 
% figure
% plot (t_array_plot,abs(G_00).^2)
% xlabel('Time (s)')
% ylabel('Intensity (arb. units)')

% 
% d_hkl = d_hkl;
% Theta_Bragg_De  = Theta_Bragg_De ;
% 
% w_D = 4 * r_e * d_hkl^2 * coef* abs(FH) *abs(P)/ (pi * V);
% 
% w_s = w_D *tan(Theta_Bragg);
% 
% Dl_l = w_s/2*cot(Theta_Bragg);

%position of transverse displacement

%X_max0 = (c_light* t_max0-Thickness*acos(Theta_Bragg))/2;
%x_transvers_array(1,:) = (c_light*t_array(1,:)-Thickness*acos(Theta_Bragg))/2;
% X_max0 = (c_light* t_max0*cot(Theta_Bragg));
% x_transvers_array(1,:) = (c_light*t_array(1,:)*cot(Theta_Bragg));
%figure
%plot (x_transvers_array,abs(G_00).^2)
%xlabel('Time (s)')
%ylabel('Intensity (arb. units)')

end
