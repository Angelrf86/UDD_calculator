function [Z,F0,FH,F_H,a_Par,b_Par,c_Par,alpha_Par,beta_Par,gamma_Par] = Element_Bragg_temp_Gui_10092018(element,h_Miller, k_Miller, l_Miller,Energy_Bragg)


vector_Miller = [h_Miller, k_Miller, l_Miller];



%Cell Parameters
if size(element,2) == 1
    if element == 'C'
        Z = 6;
        
        a_Par = 3.567;
        b_Par = 3.567;
        c_Par = 3.567;
        
        alpha_Par = 90;
        beta_Par = 90;
        gamma_Par = 90;


        if vector_Miller == [4,0,0]
            f_0 = 1.6077047;
        elseif(vector_Miller == [0,4,0])
            f_0 = 1.6077047;
        elseif vector_Miller == [0,0,4]
            f_0 = 1.6077047;
        elseif vector_Miller == [1,1,1]
            f_0 = 3.1379116;
        elseif vector_Miller == [2,2,0]
            f_0 = 2.029862;
        elseif vector_Miller == [2,0,2]
            f_0 = 2.029862;
        elseif vector_Miller == [0,2,2]
            f_0 = 2.029862;
        elseif vector_Miller == [1,1,3]
            f_0 =1.7972306 ;
        elseif vector_Miller == [3,1,1]
            f_0 = 1.7972306 ;
        elseif vector_Miller == [1,3,1]
            f_0 =1.7972306 ;
        elseif vector_Miller == [3,3,1]
            f_0 = 1.5400894;
        elseif vector_Miller == [1,3,3]
            f_0 = 1.5400894;
        elseif vector_Miller == [3,1,3]
            f_0 = 1.5400894;
        elseif vector_Miller == [5,1,1]
            f_0 = 1.4097152;
        elseif vector_Miller == [1,5,1]
            f_0 = 1.4097152;
        elseif vector_Miller == [1,1,5]
            f_0 = 1.4097152;
        elseif vector_Miller == [2,2,4]
            f_0 = 1.454006;
        elseif vector_Miller == [4,2,2]
            f_0 = 1.454006;
        elseif vector_Miller == [2,4,2]
            f_0 = 1.454006;
        elseif vector_Miller == [4,4,4]
            f_0 = 1.1557;
        elseif vector_Miller == [5,3,3]
            f_0 = 1.20988;
        elseif vector_Miller == [3,5,3]
            f_0 = 1.20988;
        elseif vector_Miller == [3,3,5]
            f_0 = 1.20988;
        elseif vector_Miller == [5,3,1]
            f_0 = 1.3040249;
        elseif vector_Miller == [3,5,1]
            f_0 = 1.3040249;
        elseif vector_Miller == [5,1,3]
            f_0 = 1.3040249;
        elseif vector_Miller == [3,1,5]
            f_0 = 1.3040249;
        elseif vector_Miller == [1,3,5]
            f_0 = 1.3040249;
        elseif vector_Miller == [1,5,3]
            f_0 = 1.3040249;
        elseif vector_Miller == [4,4,0]
            f_0 = 1.3420491;
        elseif vector_Miller == [4,0,4]
            f_0 = 1.3420491;
        elseif vector_Miller == [0,4,4]
            f_0 = 1.3420491;
        elseif vector_Miller == [5,1,5]
            f_0 = 1.1248178;
        elseif vector_Miller == [1,5,5]
            f_0 = 1.1248178;
        elseif vector_Miller == [5,5,1]
            f_0 = 1.1248178;
        elseif vector_Miller == [3,3,3]
            f_0 = 1.4097152;
        end

      %  num = xlsread('Diamond_f1_f2.xlsx');
         num = xlsread('Cf1f2.xlsx');
       
         for i_Energy = 2:size(num,1)
            if Energy_Bragg > num(i_Energy-1,1)
                if Energy_Bragg <= num(i_Energy,1)
                    f_1 = num(i_Energy,2);
                    f_2 = num(i_Energy,3);
                end
            end
        end        
        

        coef = (1 + (-1)^(h_Miller+k_Miller) + (-1)^(h_Miller+l_Miller) + (-1)^(k_Miller+l_Miller)) * (1 + (-1i)^(h_Miller+k_Miller+l_Miller));


        F0 = (Z + f_1 + 1i * f_2) * 8;
        FH = (f_0 + f_1 + 1i * f_2) * abs(coef);
        F_H = (f_0 + f_1 + 1i * f_2) * abs(coef);
        
    end
    
elseif size(element,2) == 2
    
    if element == 'Si'
        Z = 14;
        a_Par = 5.431;
        b_Par = 5.431;
        c_Par = 5.431;

        alpha_Par = 90;
        beta_Par = 90;
        gamma_Par = 90;

        if vector_Miller == [5,1,3]
            f_0 = 5.92227;
        elseif vector_Miller == [5,3,1]
            f_0 = 5.92227;
        elseif vector_Miller == [3,5,1]
            f_0 = 5.92227;
        elseif vector_Miller == [3,1,5]
            f_0 = 5.92227;
        elseif vector_Miller == [1,5,3]
            f_0 = 5.92227;
        elseif vector_Miller == [1,3,5]
            f_0 = 5.92227;
        elseif vector_Miller == [3,1,1]
            f_0 = 8.2626997;
        elseif vector_Miller == [1,3,1]
            f_0 = 8.2626997;
        elseif vector_Miller == [1,1,3]
            f_0 = 8.2626997;
        elseif vector_Miller == [1,1,1]
            f_0 = 10.702846;
        elseif vector_Miller == [2,2,0]
            f_0 = 8.8399534;
        elseif vector_Miller == [2,0,2]
            f_0 = 8.8399534;
        elseif vector_Miller == [0,2,2]
            f_0 = 8.8399534;
        elseif vector_Miller == [4,0,0]
            f_0 = 7.5887902;
        elseif vector_Miller == [0,4,0]
            f_0 = 7.5887902;
        elseif vector_Miller == [0,0,4]
            f_0 = 7.5887902;
        elseif vector_Miller == [3,3,1]
            f_0 = 7.2654482;
        elseif vector_Miller == [1,3,3]
            f_0 = 7.2654482;
        elseif vector_Miller == [3,1,3]
            f_0 = 7.2654482;
        elseif vector_Miller == [4,4,0]
            f_0 = 6.143148;
        elseif vector_Miller == [0,4,4]
            f_0 = 6.143148;
        elseif vector_Miller == [4,0,4]
            f_0 = 6.143148;
        elseif vector_Miller == [3,3,3]
            f_0 = 6.5355327;
        elseif vector_Miller == [5,5,5]
            f_0 = 3.8871919;
        elseif vector_Miller == [1,5,5]
            f_0 = 4.9354269;
        elseif vector_Miller == [5,1,5]
            f_0 = 4.9354269;
        elseif vector_Miller == [5,5,1]
            f_0 = 4.9354269;
        elseif vector_Miller == [5,5,3]
            f_0 = 4.5371446;
        elseif vector_Miller == [5,3,5]
            f_0 = 4.5371446;           
        elseif vector_Miller == [3,5,5]
            f_0 = 4.5371446;
        elseif vector_Miller == [3,3,5]
            f_0 = 5.3936593;
        elseif vector_Miller == [3,5,3]
            f_0 = 5.3936593;
        elseif vector_Miller == [5,3,3]
            f_0 = 5.3936593;
        elseif vector_Miller == [8,0,0]
            f_0 = 4.3147635 ;
        elseif vector_Miller == [0,8,0]
            f_0 = 4.3147635 ;
        elseif vector_Miller == [0,0,8]
            f_0 = 4.3147635 ; 
            
%forbbiden
        elseif vector_Miller == [2,0,0]
            f_0 =  9.987655911118708;
        elseif vector_Miller == [0,2,0]
            f_0 =  9.987655911118708;
        elseif vector_Miller == [0,0,2]
            f_0 =  9.987655911118708;
        elseif vector_Miller == [2,2,2]
            f_0 =  8.020228180799377;
        elseif vector_Miller == [6,2,2]
            f_0 =  5.21902253603512;
        elseif vector_Miller == [2,6,2]
            f_0 =  5.21902253603512;
        elseif vector_Miller == [2,2,6]
            f_0 =  5.21902253603512;
        elseif vector_Miller == [4,4,2]
            f_0 =  5.747483396891868;
        elseif vector_Miller == [4,2,4]
            f_0 =  5.747483396891868;
        elseif vector_Miller == [2,4,4]
            f_0 =  5.747483396891868;
        elseif vector_Miller == [6,0,0]
            f_0 =  5.747483396891868;
        end
        %num = xlsread('Silicon_f1_f2.xlsx');
        num = xlsread('Sif1f2.xlsx');
        for i_Energy = 2:size(num,1)
            if Energy_Bragg > num(i_Energy-1,1)
                if Energy_Bragg <= num(i_Energy,1)
                    f_1 = num(i_Energy,2);
                    f_2 = num(i_Energy,3);
                end
            end
        end
        
        coef = (1+(-1)^(h_Miller+k_Miller)+(-1)^(h_Miller+l_Miller)+(-1)^(k_Miller+l_Miller))*(1+(-1i)^(h_Miller+k_Miller+l_Miller));
        
        F0 = (Z + f_1 + 1i * f_2) * 8;
        FH = (f_0 + f_1 + 1i * f_2) * abs(coef);
        F_H = (f_0 + f_1 + 1i * f_2) * abs(coef);
    
    
    
    elseif element == 'Ge'
        Z = 32;
        a_Par = 5.658;
        b_Par = 5.658;
        c_Par = 5.658;

        alpha_Par = 90;
        beta_Par = 90;
        gamma_Par = 90;
        
         if vector_Miller == [5,1,3]
             f_0 = 15.622178200533803;
         elseif vector_Miller == [5,3,1]
             f_0 = 15.622178200533803;
         elseif vector_Miller == [3,5,1]
             f_0 = 15.622178200533803;
         elseif vector_Miller == [3,1,5]
             f_0 = 15.622178200533803;
         elseif vector_Miller == [1,5,3]
             f_0 = 15.622178200533803;
         elseif vector_Miller == [1,3,5]
             f_0 = 15.622178200533803;
         elseif vector_Miller == [3,1,1]
             f_0 = 22.378056270949067;
         elseif vector_Miller == [1,3,1]
             f_0 = 22.378056270949067;
         elseif vector_Miller == [1,1,3]
             f_0 = 22.378056270949067;
         elseif vector_Miller == [1,1,1]
             f_0 = 27.367058878665116; 
         elseif vector_Miller == [2,2,0]
            f_0 = 23.797789346546946;
        elseif vector_Miller == [2,0,2]
            f_0 = 23.797789346546946;
        elseif vector_Miller == [0,2,2]
            f_0 = 23.797789346546946;
        elseif vector_Miller == [4,0,0]
            f_0 = 20.461697153045826;
        elseif vector_Miller == [0,4,0]
            f_0 = 20.461697153045826;
        elseif vector_Miller == [0,0,4]
            f_0 = 20.461697153045826;
        elseif vector_Miller == [3,3,1]
            f_0 = 19.486433565396258;
        elseif vector_Miller == [1,3,3]
            f_0 = 19.486433565396258;
        elseif vector_Miller == [3,1,3]
            f_0 = 19.486433565396258;
        elseif vector_Miller == [4,4,0]
            f_0 = 16.21692019691965;
        elseif vector_Miller == [0,4,4]
            f_0 = 16.21692019691965;
        elseif vector_Miller == [4,0,4]
            f_0 = 16.21692019691965;
        elseif vector_Miller == [3,3,3]
            f_0 = 17.324324213026493;
        elseif vector_Miller == [5,5,5]
            f_0 = 10.665062488265056;
        elseif vector_Miller == [1,5,5]
            f_0 = 13.103721306960553;
        elseif vector_Miller == [5,1,5]
            f_0 = 13.103721306960553;
        elseif vector_Miller == [5,5,1]
            f_0 = 13.103721306960553;
        elseif vector_Miller == [5,5,3]
            f_0 = 12.150938489418056;
        elseif vector_Miller == [5,3,5]
            f_0 = 12.150938489418056;           
        elseif vector_Miller == [3,5,5]
            f_0 = 12.150938489418056;
        elseif vector_Miller == [3,3,5]
            f_0 = 14.242875380623753;
        elseif vector_Miller == [3,5,3]
            f_0 = 14.242875380623753;
        elseif vector_Miller == [5,3,3]
            f_0 = 14.242875380623753;
        elseif vector_Miller == [8,0,0]
            f_0 = 11.63309041116516 ;
        elseif vector_Miller == [0,8,0]
            f_0 = 11.63309041116516 ;
         elseif vector_Miller == [0,0,8]
             f_0 = 11.63309041116516 ;
         elseif vector_Miller == [4,4,4]
             f_0 = 13.506653614349618;
             
%Forbidden
         elseif vector_Miller == [2,0,0]
             f_0 = 25.75700537009571 ;
         elseif vector_Miller == [0,2,0]
             f_0 = 25.75700537009571 ;
         elseif vector_Miller == [0,0,2]
             f_0 = 25.75700537009571 ;
         elseif vector_Miller == [6,0,0]
             f_0 = 15.442000137381601;
         elseif vector_Miller == [0,6,0]
             f_0 = 15.442000137381601;
         elseif vector_Miller == [0,0,6]
             f_0 = 15.442000137381601;
         elseif vector_Miller == [10,0,0]
             f_0 = 9.0259616414308;
         elseif vector_Miller == [0,10,0]
             f_0 = 9.0259616414308;
         elseif vector_Miller == [0,0,10]
             f_0 = 9.0259616414308;
         elseif vector_Miller == [4,4,2]
             f_0 = 15.434170258792749;
         elseif vector_Miller == [4,2,4]
             f_0 = 15.434170258792749;
         elseif vector_Miller == [2,4,4]
             f_0 = 15.434170258792749;
         elseif vector_Miller == [2,2,2]
             f_0 = 21.958394471403533;
         elseif vector_Miller == [6,2,2]
             f_0 = 14.088631286375854;
         elseif vector_Miller == [2,6,2]
             f_0 = 14.088631286375854;
         elseif vector_Miller == [2,2,6]
             f_0 = 14.088631286375854;
         elseif vector_Miller == [4,2,0]
             f_0 = 19.18393337563041;             
         elseif vector_Miller == [0,4,2]
             f_0 = 19.18393337563041;
         elseif vector_Miller == [4,0,2]
             f_0 = 19.18393337563041;
         elseif vector_Miller == [0,2,4]
             f_0 = 19.18393337563041;
         elseif vector_Miller == [2,4,0]
             f_0 = 19.18393337563041;
         elseif vector_Miller == [2,0,4]
             f_0 = 19.18393337563041;
        end
        %num = xlsread('Silicon_f1_f2.xlsx');
        num = xlsread('Gef1f2.xlsx');
        for i_Energy = 2:size(num,1)
            if Energy_Bragg > num(i_Energy-1,1)
                if Energy_Bragg <= num(i_Energy,1)
                    f_1 = num(i_Energy,2);
                    f_2 = num(i_Energy,3);
                end
            end
        end
        
        
        coef = (1+(-1)^(h_Miller+k_Miller)+(-1)^(h_Miller+l_Miller)+(-1)^(k_Miller+l_Miller))*(1+(-1i)^(h_Miller+k_Miller+l_Miller));
        
        F0 = (Z + f_1 + 1i * f_2) * 8;
        FH = (f_0 + f_1 + 1i * f_2) * abs(coef);
        F_H = (f_0 + f_1 + 1i * f_2) * abs(coef);
    
    elseif element == 'Cu'
        Z = 29;
        a_Par = 3.6147;
        b_Par = 3.6147;
        c_Par = 3.6147;

        alpha_Par = 90;
        beta_Par = 90;
        gamma_Par = 90;
        
        %(5 3 1) 6
         if vector_Miller == [5,1,3]
             f_0 = 8.479441847;
         elseif vector_Miller == [5,3,1]
             f_0 = 8.479441847;
         elseif vector_Miller == [3,5,1]
             f_0 = 8.479441847;
         elseif vector_Miller == [3,1,5]
             f_0 = 8.479441847;
         elseif vector_Miller == [1,5,3]
             f_0 = 8.479441847;
         elseif vector_Miller == [1,3,5]
             f_0 = 8.479441847;
         
         %(3 1 1) 3
         elseif vector_Miller == [3,1,1]
             f_0 = 14.780420008001158;
         elseif vector_Miller == [1,3,1]
             f_0 = 14.780420008001158;
         elseif vector_Miller == [1,1,3]
             f_0 = 14.780420008001158;
             
         %(1 1 1) 1    
         elseif vector_Miller == [1,1,1]
             f_0 = 22.076403920641386;
             
         %(2 2 0) 3     
         elseif vector_Miller == [2,2,0]
             f_0 = 16.781528876512315;
         elseif vector_Miller == [2,0,2]
             f_0 = 16.781528876512315;
         elseif vector_Miller == [0,2,2]
             f_0 = 16.781528876512315;
         
         %(4 0 0) 3    
         elseif vector_Miller == [4,0,0]
             f_0 = 12.462063060718062;
         elseif vector_Miller == [0,4,0]
             f_0 = 12.462063060718062;
         elseif vector_Miller == [0,0,4]
             f_0 = 12.462063060718062;
             
         %(3 3 1) 3    
         elseif vector_Miller == [3,3,1]
             f_0 = 11.458170012564599;
         elseif vector_Miller == [1,3,3]
             f_0 = 11.458170012564599;
         elseif vector_Miller == [3,1,3]
             f_0 = 11.458170012564599;
             
         %(4 4 0) 3    
         elseif vector_Miller == [4,4,0]
             f_0 = 8.84517391739503;
         elseif vector_Miller == [0,4,4]
             f_0 = 8.84517391739503;
         elseif vector_Miller == [4,0,4]
             f_0 = 8.84517391739503;
             
         %(3 3 3) 1    
         elseif vector_Miller == [3,3,3]
             f_0 = 9.610896192595437;
             
         %(5 5 5) 1    
         elseif vector_Miller == [5,5,5]
             f_0 = 6.297531406768737;
             
         %(1 5 5) 3    
         elseif vector_Miller == [1,5,5]
             f_0 = 7.2278515826038925;
         elseif vector_Miller == [5,1,5]
             f_0 = 7.2278515826038925;
         elseif vector_Miller == [5,5,1]
             f_0 = 7.2278515826038925;
             
         %(5 5 3) 3    
         elseif vector_Miller == [5,5,3]
             f_0 = 6.848147870620422;
         elseif vector_Miller == [5,3,5]
             f_0 = 6.848147870620422;
         elseif vector_Miller == [3,5,5]
             f_0 = 6.848147870620422;
             
         %(3 3 5) 3    
         elseif vector_Miller == [3,3,5]
             f_0 = 7.740685145274509;
         elseif vector_Miller == [3,5,3]
             f_0 = 7.740685145274509;
         elseif vector_Miller == [5,3,3]
             f_0 = 7.740685145274509;
             
         %(8 0 0) 3    
         elseif vector_Miller == [8,0,0]
             f_0 = 6.653661580908738;
         elseif vector_Miller == [0,8,0]
             f_0 = 6.653661580908738;
         elseif vector_Miller == [0,0,8]
             f_0 = 6.653661580908738;
             
         %(4 4 4) 1    
         elseif vector_Miller == [4,4,4]
             f_0 = 7.4007047814;
             
         %(2 0 0) 3    
         elseif vector_Miller == [2,0,0]
             f_0 = 20.722723186178786;
         elseif vector_Miller == [0,2,0]
             f_0 = 20.722723186178786;
         elseif vector_Miller == [0,0,2]
             f_0 = 20.722723186178786;
             
         %(6 0 0) 3    
         elseif vector_Miller == [6,0,0]
             f_0 = 8.370022543737559;
         elseif vector_Miller == [0,6,0]
             f_0 = 8.370022543737559;
         elseif vector_Miller == [0,0,6]
             f_0 = 8.370022543737559;
             
         %(10 0 0) 3    
         elseif vector_Miller == [10,0,0]
             f_0 = 5.673202116606426;
         elseif vector_Miller == [0,10,0]
             f_0 = 5.673202116606426;
         elseif vector_Miller == [0,0,10]
             f_0 = 5.673202116606426;
             
         %(4 4 2) 3    
         elseif vector_Miller == [4,4,2]
             f_0 = 8.370022543737559;
         elseif vector_Miller == [4,2,4]
             f_0 = 8.370022543737559;
         elseif vector_Miller == [2,4,4]
             f_0 = 8.370022543737559;
             
         %(2 2 2) 1    
         elseif vector_Miller == [2,2,2]
             f_0 = 14.232754530964987;
             
         %(6 2 2) 3    
         elseif vector_Miller == [6,2,2]
             f_0 = 7.666640699631865;
         elseif vector_Miller == [2,6,2]
             f_0 = 7.666640699631865;
         elseif vector_Miller == [2,2,6]
             f_0 = 7.666640699631865;
             
         %(4 2 0) 6    
         elseif vector_Miller == [4,2,0]
             f_0 = 11.16961968334427;
         elseif vector_Miller == [0,4,2]
             f_0 = 11.16961968334427;
         elseif vector_Miller == [4,0,2]             
             f_0 = 11.16961968334427;
         elseif vector_Miller == [0,2,4]
             f_0 = 11.16961968334427;
         elseif vector_Miller == [2,4,0]
             f_0 = 11.16961968334427;
         elseif vector_Miller == [2,0,4]
             f_0 = 11.16961968334427;
         end
         
         num = xlsread('Cuf1f2.xlsx');
         for i_Energy = 2:size(num,1)
             if Energy_Bragg > num(i_Energy-1,1)
                 if Energy_Bragg <= num(i_Energy,1)
                     f_1 = num(i_Energy,2);
                     f_2 = num(i_Energy,3);
                 end
             end
         end
                  
         coef = (1 + (-1)^(h_Miller+k_Miller) + (-1)^(h_Miller+l_Miller) + (-1)^(k_Miller+l_Miller));
         
         F0 = (Z + f_1 + 1i * f_2) * 4;
         FH = (f_0 + f_1 + 1i * f_2) * abs(coef);
         F_H = (f_0 + f_1 + 1i * f_2) * abs(coef);
         
    end
    
elseif size(element,2) == 3
    
elseif size(element,2) == 4
    
    if element == 'InSb'
        %1 = In
        Z1 = 49;
        %2 = Sb
        Z2 = 51;
        Z = Z1+Z2;
        
        a_Par = 6.479;
        b_Par = 6.479;
        c_Par = 6.479;
        
        alpha_Par = 90;
        beta_Par = 90;
        gamma_Par = 90;

        if vector_Miller == [2,0,0]
            f0_1 = 42.40000;
            f0_2 = 43.815621;
        elseif vector_Miller ==[0,0,2]
            f0_1 = 42.40000;
            f0_2 = 43.815621;
        elseif vector_Miller ==[0,2,0]
            f0_1 = 42.40000;
            f0_2 = 43.815621;
        elseif vector_Miller == [4,0,0]
            f0_1 = 33.696592;
            f0_2 = 35.050966;
        elseif vector_Miller ==[0,4,0]
            f0_1 = 33.696592;
            f0_2 = 35.050966;
        elseif vector_Miller ==[0,0,4]
            f0_1 = 33.696592;
            f0_2 = 35.050966;
        elseif vector_Miller == [2,2,0]
            f0_1 = 38.669840;
            f0_2 = 39.938413;
        elseif vector_Miller ==[2,0,2]
            f0_1 = 38.669840;
            f0_2 = 39.938413;
        elseif vector_Miller ==[0,2,2]
            f0_1 = 38.669840;
            f0_2 = 39.938413;
        elseif vector_Miller == [1,1,1]
            f0_1 = 43.590670;
            f0_2 = 45.105922;
        elseif vector_Miller == [3,1,3]
            f0_1 = 32.297388;
            f0_2 = 33.691727;
        elseif vector_Miller ==[3,3,1]
            f0_1 = 32.297388;
            f0_2 = 33.691727;
        elseif vector_Miller ==[1,3,3]
            f0_1 = 32.297388;
            f0_2 = 33.691727;
        elseif vector_Miller == [1,1,3]
            f0_1 = 36.529839;
            f0_2 = 37.811479;
        elseif vector_Miller ==[1,3,1]
            f0_1 = 36.529839;
            f0_2 = 37.811479;
        elseif vector_Miller == [3,1,1]
            f0_1 = 36.529839;
            f0_2 = 37.811479;
        elseif vector_Miller == [8,0,0]
            f0_1 = 22.069626;
            f0_2 = 23.114477;
        elseif vector_Miller == [0,8,0]
            f0_1 = 22.069626;
            f0_2 = 23.114477;
        elseif vector_Miller == [0,0,8]
            f0_1 = 22.069626;
            f0_2 = 23.114477;
        elseif vector_Miller == [12,0,0]
            f0_1 = 16.845725;
            f0_2 = 17.457510;
        elseif vector_Miller == [0,12,0]
            f0_1 = 16.845725;
            f0_2 = 17.457510;
        elseif vector_Miller == [0,0,12]
            f0_1 = 16.845725;
            f0_2 = 17.457510;
        elseif vector_Miller == [4,4,0]
            f0_1 = 27.799629;
            f0_2 = 29.227815;
        elseif vector_Miller == [4,0,4]
            f0_1 = 27.799629;
            f0_2 = 29.227815;
        elseif vector_Miller == [0,4,4]
            f0_1 = 27.799629;
            f0_2 = 29.227815;
        elseif vector_Miller == [3,3,3]
            f0_1 = 29.290826;
            f0_2 = 30.732197;
        elseif vector_Miller == [4,4,4]
            f0_1 = 24.319017;
            f0_2 = 25.580494;
        elseif vector_Miller == [5,5,5]
            f0_1 = 20.940086;
            f0_2 = 21.854304;
        elseif vector_Miller == [5,5,1]
            f0_1 = 23.824964;
            f0_2 = 25.045735;
        elseif vector_Miller == [5,1,5]
            f0_1 = 23.824964;
            f0_2 = 25.045735;
        elseif vector_Miller == [1,5,5]
            f0_1 = 23.824964;
            f0_2 = 25.045735;
        elseif vector_Miller == [5,5,3]
            f0_1 = 22.680137;
            f0_2 = 23.791126;
        elseif vector_Miller == [5,3,5]
            f0_1 = 22.680137;
            f0_2 = 23.791126;
        elseif vector_Miller == [3,5,5]
            f0_1 = 22.680137;
            f0_2 = 23.791126;
            
        end
        
        num = xlsread('Inf1f2.xlsx');
        for i_Energy = 2:size(num,1)
            if Energy_Bragg > num(i_Energy-1,1)
                if Energy_Bragg <= num(i_Energy,1)
                    f1_1 = num(i_Energy,2);
                    f2_1 = num(i_Energy,3);
                    
                end
            end
        end
        num = xlsread('Sbf1f2.xlsx');
        for i_Energy = 2:size(num,1)
            if Energy_Bragg > num(i_Energy-1,1)
                if Energy_Bragg <= num(i_Energy,1)
                    f1_2 = num(i_Energy,2);
                    f2_2 = num(i_Energy,3);
                end
            end
        end
        
    elseif element == 'CdTe'
        %1 = Gd
        Z1 = 48;
        %2 = Te
        Z2 = 52;
        Z = Z1+Z2;
        
        a_Par = 6.48;
        b_Par = 6.48;
        c_Par = 6.48;
        
        alpha_Par = 90;
        beta_Par = 90;
        gamma_Par = 90;

        if vector_Miller == [2,2,2]
            f0_1 = 35.02877114515919;
            f0_2 = 37.769742517515155;
        elseif vector_Miller == [1,1,1]
            f0_1 = 42.88959851695331;
            f0_2 = 45.945781780309446;
        elseif vector_Miller == [4,0,0]
            f0_1 = 43.1658128894907;
            f0_2 = 46.26399329879855;
       elseif vector_Miller == [0,4,0]
            f0_1 = 43.1658128894907;
            f0_2 = 46.26399329879855;
        elseif vector_Miller == [0,0,4]
            f0_1 = 43.1658128894907;
            f0_2 = 46.26399329879855;            
        elseif vector_Miller == [2,2,0]
            f0_1 = 37.85136968348225;
            f0_2 = 40.525056678251275;
        elseif vector_Miller == [2,0,2]
            f0_1 = 37.85136968348225;
            f0_2 = 40.525056678251275;
        elseif vector_Miller == [0,2,2]
            f0_1 = 37.85136968348225;
            f0_2 = 40.525056678251275;
        end
            
        num = xlsread('Cdf1f2.xlsx');
        for i_Energy = 2:size(num,1)
            if Energy_Bragg > num(i_Energy-1,1)
                if Energy_Bragg <= num(i_Energy,1)
                    f1_1 = num(i_Energy,2);
                    f2_1 = num(i_Energy,3);
                    
                end
            end
        end
        num = xlsread('Tef1f2.xlsx');
        for i_Energy = 2:size(num,1)
            if Energy_Bragg > num(i_Energy-1,1)
                if Energy_Bragg <= num(i_Energy,1)
                    f1_2 = num(i_Energy,2);
                    f2_2 = num(i_Energy,3);
                end
            end
        end
    elseif element == 'GaAs'
        %1 = Ga
        Z1 = 31;
        %2 = As
        Z2 = 33;
        Z = Z1+Z2;
        
        a_Par = 5.65315;
        b_Par = 5.65315;
        c_Par = 5.65315;
        
        alpha_Par = 90;
        beta_Par = 90;
        gamma_Par = 90;

        if vector_Miller == [2,2,2]
            f0_1 = 21.287272237720654;
            f0_2 = 22.53724129338139;
        elseif vector_Miller == [1,1,1]
            f0_1 = 22.663325888637356;
            f0_2 = 23.865715324196472;
        elseif vector_Miller == [4,0,0]
            f0_1 = 19.73110208941089;
            f0_2 = 21.08187921967572;
        elseif vector_Miller == [0,4,0]
            f0_1 = 19.73110208941089;
            f0_2 = 21.08187921967572;
        elseif vector_Miller == [0,0,4]
            f0_1 = 19.73110208941089;
            f0_2 = 21.08187921967572;
        elseif vector_Miller == [2,2,0]
            f0_1 = 23.177376445226372;
            f0_2 = 24.380221259258064;
        elseif vector_Miller == [2,0,2]
            f0_1 = 23.177376445226372;
            f0_2 = 24.380221259258064;
        elseif vector_Miller == [0,2,2]
            f0_1 = 23.177376445226372;
            f0_2 = 24.380221259258064;
        end
            
        num = xlsread('Gaf1f2.xlsx');
        for i_Energy = 2:size(num,1)
            if Energy_Bragg > num(i_Energy-1,1)
                if Energy_Bragg <= num(i_Energy,1)
                    f1_1 = num(i_Energy,2);
                    f2_1 = num(i_Energy,3);
                    
                end
            end
        end
        num = xlsread('Asf1f2.xlsx');
        for i_Energy = 2:size(num,1)
            if Energy_Bragg > num(i_Energy-1,1)
                if Energy_Bragg <= num(i_Energy,1)
                    f1_2 = num(i_Energy,2);
                    f2_2 = num(i_Energy,3);
                end
            end
        end 
        565.315
    end
    
    F0 = ((Z1 + f1_1 + 1i * f1_2) + exp(1i*0/4*pi)*(Z2 + f2_1 + 1i * f2_2))*(1+(-1)^(h_Miller+k_Miller)+(-1)^(h_Miller+l_Miller)+(-1)^(k_Miller+l_Miller));
    FH = ((f0_1 + f1_1 + 1i * f1_2) + exp(1i*2*(h_Miller+k_Miller+l_Miller)/4*pi)*(f0_2 + f2_1 + 1i * f2_2))*(1+(-1)^(h_Miller+k_Miller)+(-1)^(h_Miller+l_Miller)+(-1)^(k_Miller+l_Miller));
    F_H =((f0_1 + f1_1 + 1i * f1_2) + exp(1i*2*(-h_Miller+-k_Miller+-l_Miller)/4*pi)*(f0_2 + f2_1 + 1i * f2_2))*(1+(-1)^(h_Miller+k_Miller)+(-1)^(h_Miller+l_Miller)+(-1)^(k_Miller+l_Miller));
        
        
    
end



% Structure Factor

%Resonant factors
% F0
% FH
% F_H




end

