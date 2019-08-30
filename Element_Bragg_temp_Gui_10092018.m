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
        
        cell_structure = 'dia'; %Diamond cell strucuture

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
         num = xlsread('elements/Cf1f2.xlsx');
       
         for i_Energy = 2:size(num,1)
            if Energy_Bragg > num(i_Energy-1,1)
                if Energy_Bragg <= num(i_Energy,1)
                    f_1 = num(i_Energy,2);
                    f_2 = num(i_Energy,3);
                end
            end
         end
         
    elseif element == 'W'
        Z = 74;
        
        a_Par = 3.155;
        b_Par = 3.155;
        c_Par = 3.155;
        
        alpha_Par = 90;
        beta_Par = 90;
        gamma_Par = 90;
        
        cell_structure = 'bcc'; %crystalline structure
        
        d = 1/sqrt(vector_Miller(1)^2/a_Par^2+vector_Miller(2)^2/b_Par^2+vector_Miller(3)^2/c_Par^2); % d-spacing
        q = 4 * pi/ (2*d); % q vector
        
        a_atom_fact = [29.0818,15.43,14.4327,5.11982];
        b_atom_fact = [1.72029,9.2259,0.321703,57.056];
        c = 9.8875;
        
        f_0 = 0;
        for i_atom_fact = 1:4
            f_0 = f_0 + a_atom_fact(i_atom_fact)*exp(-b_atom_fact(i_atom_fact)*(q/(4*pi))^2);
        end
        f_0 = f_0 + c;
        
        num = xlsread('elements/Wf1f2.xlsx');
        
        for i_Energy = 2:size(num,1)
            if Energy_Bragg > num(i_Energy-1,1)
                if Energy_Bragg <= num(i_Energy,1)
                    f_1 = num(i_Energy,2);
                    f_2 = num(i_Energy,3);
                end
            end
        end
       
    end
    
    if cell_structure == 'dia'
        
        coef = (1 + (-1)^(h_Miller+k_Miller) + (-1)^(h_Miller+l_Miller) + (-1)^(k_Miller+l_Miller)) * (1 + (-1i)^(h_Miller+k_Miller+l_Miller));

        F0 = (Z + f_1 + 1i * f_2) * 8;
        FH = (f_0 + f_1 + 1i * f_2) * abs(coef);
        F_H = (f_0 + f_1 + 1i * f_2) * abs(coef);
        
    elseif cell_structure == 'fcc'
        
        coef = (1 + (-1)^(h_Miller+k_Miller) + (-1)^(h_Miller+l_Miller) + (-1)^(k_Miller+l_Miller));
        F0 = (Z + f_1 + 1i * f_2) * 4;
        FH = (f_0 + f_1 + 1i * f_2) * abs(coef);
        F_H = (f_0 + f_1 + 1i * f_2) * abs(coef);        
        
    elseif cell_structure == 'bcc'
        coef = (1 + (-1)^(h_Miller+k_Miller+l_Miller));

        F0 = (Z + f_1 + 1i * f_2) * 2;
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
        
        
        cell_structure = 'dia'; %crystalline structure

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
        num = xlsread('elements/Sif1f2.xlsx');
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
        
        cell_structure = 'dia'; %crystalline structure
        
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
        num = xlsread('elements/Gef1f2.xlsx');
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
        a_Par = 3.597;
        b_Par = 3.597;
        c_Par = 3.597;

        alpha_Par = 90;
        beta_Par = 90;
        gamma_Par = 90; 
        
        cell_structure = 'fcc'; %crystalline structure
        
        d = 1/sqrt(vector_Miller(1)^2/a_Par^2+vector_Miller(2)^2/b_Par^2+vector_Miller(3)^2/c_Par^2); % d-spacing
        q = 4 * pi/ (2*d); % q vector
        
        a_atom_fact = [13.338,7.1676,5.6158,1.6735];
        b_atom_fact = [3.5828,0.247,11.3966,64.8126];
        c = 1.191;
        
        f_0 = 0;
        for i_atom_fact = 1:4
            f_0 = f_0 + a_atom_fact(i_atom_fact)*exp(-b_atom_fact(i_atom_fact)*(q/(4*pi))^2);
        end
        f_0 = f_0 + c;
        
         
         num = xlsread('elements/Cuf1f2.xlsx');
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
         
    elseif element == 'Fe'
        Z = 26;
        
        a_Par = 2.856;
        b_Par = 2.856;
        c_Par = 2.856;
        
        alpha_Par = 90;
        beta_Par = 90;
        gamma_Par = 90;
        
        cell_structure = 'bcc'; %crystalline structure
        
        d = 1/sqrt(vector_Miller(1)^2/a_Par^2+vector_Miller(2)^2/b_Par^2+vector_Miller(3)^2/c_Par^2); % d-spacing
        q = 4 * pi/ (2*d); % q vector
        
        a_atom_fact = [11.7695,7.3573,3.5222,2.3045];
        b_atom_fact = [4.7611,0.3072,15.3535,76.8805];
        c = 1.0369;
        
        f_0 = 0;
        for i_atom_fact = 1:4
            f_0 = f_0 + a_atom_fact(i_atom_fact)*exp(-b_atom_fact(i_atom_fact)*(q/(4*pi))^2);
        end
        f_0 = f_0 + c;
        
        num = xlsread('elements/Fef1f2.xlsx');
        
        for i_Energy = 2:size(num,1)
            if Energy_Bragg > num(i_Energy-1,1)
                if Energy_Bragg <= num(i_Energy,1)
                    f_1 = num(i_Energy,2);
                    f_2 = num(i_Energy,3);
                end
            end
        end
        
     elseif element == 'Ni'
        Z = 28;
        
        a_Par = 3.499;
        b_Par = 3.499;
        c_Par = 3.499;
        
        alpha_Par = 90;
        beta_Par = 90;
        gamma_Par = 90;
        
        cell_structure = 'fcc'; %crystalline structure
        
        d = 1/sqrt(vector_Miller(1)^2/a_Par^2+vector_Miller(2)^2/b_Par^2+vector_Miller(3)^2/c_Par^2); % d-spacing
        q = 4 * pi/ (2*d); % q vector
        
        a_atom_fact = [12.8376,7.292,4.4438,2.38];
        b_atom_fact = [3.8785,0.2565,12.1763,66.3421];
        c = 1.0341;
        
        f_0 = 0;
        for i_atom_fact = 1:4
            f_0 = f_0 + a_atom_fact(i_atom_fact)*exp(-b_atom_fact(i_atom_fact)*(q/(4*pi))^2);
        end
        f_0 = f_0 + c;
        
        num = xlsread('elements/Nif1f2.xlsx');
        
        for i_Energy = 2:size(num,1)
            if Energy_Bragg > num(i_Energy-1,1)
                if Energy_Bragg <= num(i_Energy,1)
                    f_1 = num(i_Energy,2);
                    f_2 = num(i_Energy,3);
                end
            end
        end
        
     elseif element == 'Au'
        Z = 79;
        
        a_Par = 4.065;
        b_Par = 4.065;
        c_Par = 4.065;
        
        alpha_Par = 90;
        beta_Par = 90;
        gamma_Par = 90;
        
        cell_structure = 'fcc'; %crystalline structure
        
        d = 1/sqrt(vector_Miller(1)^2/a_Par^2+vector_Miller(2)^2/b_Par^2+vector_Miller(3)^2/c_Par^2); % d-spacing
        q = 4 * pi/ (2*d); % q vector
        
        a_atom_fact = [16.8819,18.5913,25.5582,5.86];
        b_atom_fact = [0.4511,8.6216,1.4826,36.3956];
        c = 12.0658;
        
        f_0 = 0;
        for i_atom_fact = 1:4
            f_0 = f_0 + a_atom_fact(i_atom_fact)*exp(-b_atom_fact(i_atom_fact)*(q/(4*pi))^2);
        end
        f_0 = f_0 + c;
        
        num = xlsread('elements/Auf1f2.xlsx');
        
        for i_Energy = 2:size(num,1)
            if Energy_Bragg > num(i_Energy-1,1)
                if Energy_Bragg <= num(i_Energy,1)
                    f_1 = num(i_Energy,2);
                    f_2 = num(i_Energy,3);
                end
            end
        end   
        
        elseif element == 'Pb'
        Z = 82;
        
        a_Par = 4.920;
        b_Par = 4.920;
        c_Par = 4.920;
        
        alpha_Par = 90;
        beta_Par = 90;
        gamma_Par = 90;
        
        cell_structure = 'fcc'; %crystalline structure
        
        d = 1/sqrt(vector_Miller(1)^2/a_Par^2+vector_Miller(2)^2/b_Par^2+vector_Miller(3)^2/c_Par^2); % d-spacing
        q = 4 * pi/ (2*d); % q vector
        
        a_atom_fact = [31.0617,13.0637, 18.442,5.9696];
        b_atom_fact = [0.6902,2.3576,8.618,47.3579];
        c = 13.4118;
        
        f_0 = 0;
        for i_atom_fact = 1:4
            f_0 = f_0 + a_atom_fact(i_atom_fact)*exp(-b_atom_fact(i_atom_fact)*(q/(4*pi))^2);
        end
        f_0 = f_0 + c;
        
        num = xlsread('elements/Pbf1f2.xlsx');
        
        for i_Energy = 2:size(num,1)
            if Energy_Bragg > num(i_Energy-1,1)
                if Energy_Bragg <= num(i_Energy,1)
                    f_1 = num(i_Energy,2);
                    f_2 = num(i_Energy,3);
                end
            end
        end   
        
        elseif element == 'Al'
        Z = 13;
        
        a_Par = 4.0495;
        b_Par = 4.0495;
        c_Par = 4.0495;
        
        alpha_Par = 90;
        beta_Par = 90;
        gamma_Par = 90;
        
        cell_structure = 'fcc'; %crystalline structure
        
        d = 1/sqrt(vector_Miller(1)^2/a_Par^2+vector_Miller(2)^2/b_Par^2+vector_Miller(3)^2/c_Par^2); % d-spacing
        q = 4 * pi/ (2*d); % q vector
        
        a_atom_fact = [6.402,1.9002,1.5936,1.9646];
        b_atom_fact = [3.0387,0.7426,31.5472,85.0886];
        c = 1.1151;
        
        f_0 = 0;
        for i_atom_fact = 1:4
            f_0 = f_0 + a_atom_fact(i_atom_fact)*exp(-b_atom_fact(i_atom_fact)*(q/(4*pi))^2);
        end
        f_0 = f_0 + c;
        
        num = xlsread('elements/Alf1f2.xlsx');
        
        for i_Energy = 2:size(num,1)
            if Energy_Bragg > num(i_Energy-1,1)
                if Energy_Bragg <= num(i_Energy,1)
                    f_1 = num(i_Energy,2);
                    f_2 = num(i_Energy,3);
                end
            end
        end   
        
        elseif element == 'Ag'
        Z = 47;
        
        a_Par = 4.0853;
        b_Par = 4.0853;
        c_Par = 4.0853;
        
        alpha_Par = 90;
        beta_Par = 90;
        gamma_Par = 90;
        
        cell_structure = 'fcc'; %crystalline structure
        
        d = 1/sqrt(vector_Miller(1)^2/a_Par^2+vector_Miller(2)^2/b_Par^2+vector_Miller(3)^2/c_Par^2); % d-spacing
        q = 4 * pi/ (2*d); % q vector
        
        a_atom_fact = [19.2808,16.6885,4.8045,1.0463];
        b_atom_fact = [0.6446,7.4726,24.6605,99.7256];
        c = 5.179;
        
        f_0 = 0;
        for i_atom_fact = 1:4
            f_0 = f_0 + a_atom_fact(i_atom_fact)*exp(-b_atom_fact(i_atom_fact)*(q/(4*pi))^2);
        end
        f_0 = f_0 + c;
        
        num = xlsread('elements/Agf1f2.xlsx');
        
        for i_Energy = 2:size(num,1)
            if Energy_Bragg > num(i_Energy-1,1)
                if Energy_Bragg <= num(i_Energy,1)
                    f_1 = num(i_Energy,2);
                    f_2 = num(i_Energy,3);
                end
            end
        end   
    elseif element == 'Pt'
        Z = 78;
        
        a_Par = 3.9242;
        b_Par = 3.9242;
        c_Par = 3.9242;
        
        alpha_Par = 90;
        beta_Par = 90;
        gamma_Par = 90;
        
        cell_structure = 'fcc'; %crystalline structure
        
        d = 1/sqrt(vector_Miller(1)^2/a_Par^2+vector_Miller(2)^2/b_Par^2+vector_Miller(3)^2/c_Par^2); % d-spacing
        q = 4 * pi/ (2*d); % q vector
        
        a_atom_fact = [27.0059,17.7639,15.7131,5.7837];
        b_atom_fact = [1.51293,8.81174,0.424593,38.6103];
        c = 11.6883;
        
        f_0 = 0;
        for i_atom_fact = 1:4
            f_0 = f_0 + a_atom_fact(i_atom_fact)*exp(-b_atom_fact(i_atom_fact)*(q/(4*pi))^2);
        end
        f_0 = f_0 + c;
        
        num = xlsread('elements/Ptf1f2.xlsx');
        
        for i_Energy = 2:size(num,1)
            if Energy_Bragg > num(i_Energy-1,1)
                if Energy_Bragg <= num(i_Energy,1)
                    f_1 = num(i_Energy,2);
                    f_2 = num(i_Energy,3);
                end
            end
        end
        
    elseif element == 'Cr'
        Z = 24;
        
        a_Par = 2.91;
        b_Par = 2.91;
        c_Par = 2.91;
        
        alpha_Par = 90;
        beta_Par = 90;
        gamma_Par = 90;
        
        cell_structure = 'bcc'; %crystalline structure
        
        d = 1/sqrt(vector_Miller(1)^2/a_Par^2+vector_Miller(2)^2/b_Par^2+vector_Miller(3)^2/c_Par^2); % d-spacing
        q = 4 * pi/ (2*d); % q vector
        
        a_atom_fact = [10.6406,7.3537,3.324,1.4922];
        b_atom_fact = [6.1038,0.392,20.2626,98.7399];
        c = 1.1832;
        
        f_0 = 0;
        for i_atom_fact = 1:4
            f_0 = f_0 + a_atom_fact(i_atom_fact)*exp(-b_atom_fact(i_atom_fact)*(q/(4*pi))^2);
        end
        f_0 = f_0 + c;
        
        num = xlsread('elements/Crf1f2.xlsx');
        
        for i_Energy = 2:size(num,1)
            if Energy_Bragg > num(i_Energy-1,1)
                if Energy_Bragg <= num(i_Energy,1)
                    f_1 = num(i_Energy,2);
                    f_2 = num(i_Energy,3);
                end
            end
        end
        elseif element == 'Co'
        Z = 27;
        
        a_Par = 2.5071;
        b_Par = 2.5071;
        c_Par = 4.0695;
        
        alpha_Par = 90;
        beta_Par = 90;
        gamma_Par = 120;
        
        cell_structure = 'hcp'; %crystalline structure
        
        d = 1/sqrt(4/3 * (vector_Miller(1)^2 + vector_Miller(1)*vector_Miller(2) +vector_Miller(2)^2) / a_Par^2 + vector_Miller(3)^2/c_Par^2); % d-spacing hexagonal
        q = 4 * pi/ (2*d); % q vector
        
        a_atom_fact = [12.2841,7.3409,4.0034,2.3488];
        b_atom_fact = [4.2791,0.2784,13.5359,71.1692];
        c = 1.0118;
        
        f_0 = 0;
        for i_atom_fact = 1:4
            f_0 = f_0 + a_atom_fact(i_atom_fact)*exp(-b_atom_fact(i_atom_fact)*(q/(4*pi))^2);
        end
        f_0 = f_0 + c;
        
        num = xlsread('elements/Cof1f2.xlsx');
        
        for i_Energy = 2:size(num,1)
            if Energy_Bragg > num(i_Energy-1,1)
                if Energy_Bragg <= num(i_Energy,1)
                    f_1 = num(i_Energy,2);
                    f_2 = num(i_Energy,3);
                end
            end
        end
    end
    
    if cell_structure == 'dia'
        
        coef = (1 + (-1)^(h_Miller+k_Miller) + (-1)^(h_Miller+l_Miller) + (-1)^(k_Miller+l_Miller)) * (1 + (-1i)^(h_Miller+k_Miller+l_Miller));
        
        F0 = (Z + f_1 + 1i * f_2) * 8;
        FH = (f_0 + f_1 + 1i * f_2) * abs(coef);
        F_H = (f_0 + f_1 + 1i * f_2) * abs(coef);
        
    elseif cell_structure == 'fcc'
        
        coef = (1 + (-1)^(h_Miller+k_Miller) + (-1)^(h_Miller+l_Miller) + (-1)^(k_Miller+l_Miller));
        F0 = (Z + f_1 + 1i * f_2) * 4;
        FH = (f_0 + f_1 + 1i * f_2) * abs(coef);
        F_H = (f_0 + f_1 + 1i * f_2) * abs(coef);
        
    elseif cell_structure == 'bcc'
        coef = (1 + (-1)^(h_Miller+k_Miller+l_Miller));
        
        F0 = (Z + f_1 + 1i * f_2) * 2;
        FH = (f_0 + f_1 + 1i * f_2) * abs(coef);
        F_H = (f_0 + f_1 + 1i * f_2) * abs(coef);
        
     elseif cell_structure == 'hcp'
        coef = (1 + exp(-1i*2*pi * (2/3*h + 1/3*k + 1/2*l) ));
        
        F0 = (Z + f_1 + 1i * f_2) * 2;
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
        
        num = xlsread('elements/Inf1f2.xlsx');
        for i_Energy = 2:size(num,1)
            if Energy_Bragg > num(i_Energy-1,1)
                if Energy_Bragg <= num(i_Energy,1)
                    f1_1 = num(i_Energy,2);
                    f2_1 = num(i_Energy,3);
                    
                end
            end
        end
        num = xlsread('elements/Sbf1f2.xlsx');
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
        Z = Z1 + Z2;
        
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
            
        num = xlsread('elements/Cdf1f2.xlsx');
        for i_Energy = 2:size(num,1)
            if Energy_Bragg > num(i_Energy-1,1)
                if Energy_Bragg <= num(i_Energy,1)
                    f1_1 = num(i_Energy,2);
                    f2_1 = num(i_Energy,3);
                    
                end
            end
        end
        num = xlsread('elements/Tef1f2.xlsx');
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
            
        num = xlsread('elements/Gaf1f2.xlsx');
        for i_Energy = 2:size(num,1)
            if Energy_Bragg > num(i_Energy-1,1)
                if Energy_Bragg <= num(i_Energy,1)
                    f1_1 = num(i_Energy,2);
                    f2_1 = num(i_Energy,3);
                    
                end
            end
        end
        num = xlsread('elements/Asf1f2.xlsx');
        for i_Energy = 2:size(num,1)
            if Energy_Bragg > num(i_Energy-1,1)
                if Energy_Bragg <= num(i_Energy,1)
                    f1_2 = num(i_Energy,2);
                    f2_2 = num(i_Energy,3);
                end
            end
        end 
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

