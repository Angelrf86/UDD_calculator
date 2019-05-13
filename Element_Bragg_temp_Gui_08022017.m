function [Z,f_0,f_1,f_2,a_Par,b_Par,c_Par] = Element_Bragg_temp_Gui_08022017(element,vector_Miller,Energy_Bragg)

%Cell Parameters
if element == 'C'
    a_Par = 3.567;
    b_Par = 3.567;
    c_Par = 3.567;
elseif element == 'Si'
    a_Par = 5.431;
    b_Par = 5.431;
    c_Par = 5.431;
elseif element == 'InSb'
    a_Par = 6.479;
    b_Par = 6.479;
    c_Par = 6.479;
end

% Structure Factor
if element == 'C'
    Z = 6;
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
    
elseif element == 'Si'
    Z = 14;
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
    end
elseif element == 'InSb'
    Z = 49+51;
    if vector_Miller == [2,0,0]
        f_0_1 = 42.40000;
        f_0_2 = 43.815621;
    elseif vector_Miller == [0,2,0]
        f_0_1 = 42.40000;
        f_0_2 = 43.815621;        
    elseif vector_Miller == [0,0,2]
        f_0_1 = 42.40000;
        f_0_2 = 43.815621;         
    elseif vector_Miller == [4,0,0]
        f_0_1 = 33.696592;
        f_0_2 = 35.050966;    
    elseif vector_Miller == [0,4,0]
        f_0_1 = 33.696592;
        f_0_2 = 35.050966;
    elseif vector_Miller == [0,0,4]
        f_0_1 = 33.696592;
        f_0_2 = 35.050966;
    elseif vector_Miller == [2,2,0]
        f_0_1 = 38.669840;
        f_0_2 = 39.938413;
    elseif vector_Miller == [0,2,2]
        f_0_1 = 38.669840;
        f_0_2 = 39.938413;
    elseif vector_Miller == [2,0,2]
        f_0_1 = 38.669840;
        f_0_2 = 39.938413;
    elseif vector_Miller == [1,1,1]
        f_0_1 = 43.590670;
        f_0_2 = 45.105922;
    elseif vector_Miller == [3,1,3]
        f_0_1 = 32.297388;
        f_0_2 = 33.691727;
    elseif vector_Miller == [3,3,1]
        f_0_1 = 32.297388;
        f_0_2 = 33.691727;        
    elseif vector_Miller == [1,3,3]
        f_0_1 = 32.297388;
        f_0_2 = 33.691727;    
    elseif vector_Miller == [3,1,1]
        f_0_1 = 36.529839;
        f_0_2 = 37.811479;        
    elseif vector_Miller == [1,3,1]
        f_0_1 = 36.529839;
        f_0_2 = 37.811479;
    elseif vector_Miller == [1,1,3]       
        f_0_1 = 36.529839;
        f_0_2 = 37.811479;    
    end
end

%Resonant factors

if element == 'C'
    num = xlsread('Diamond_f1_f2.xlsx');
    for i_Energy = 2:size(num,1)
        if Energy_Bragg > num(i_Energy-1,1)
            if Energy_Bragg <= num(i_Energy,1)
                f_1 = num(i_Energy,2);
                f_2 = num(i_Energy,3);
            end
        end
    end
    
elseif element == 'Si'
    num = xlsread('Silicon_f1_f2.xlsx');
    for i_Energy = 2:size(num,1)
        if Energy_Bragg > num(i_Energy-1,1)
            if Energy_Bragg <= num(i_Energy,1)
                f_1 = num(i_Energy,2);
                f_2 = num(i_Energy,3);
            end
        end
    end
elseif element == 'InSb'
    num = xlsread('InSb_f1_f2.xlsx');
    for i_Energy = 2:size(num,1)
        if Energy_Bragg > num(i_Energy-1,1)
            if Energy_Bragg <= num(i_Energy,1)
                f_1 = num(i_Energy,2);
                f_2 = num(i_Energy,3);
            end
        end
    end
end

if mod((h_Miller+k_Miller+l_Miller),2) == 0
    coef = 8;
else
    coef = abs(4*(1-1i));
end


F0 = Z+f_1+1i*f_2;
FH = f_0+f_1+1i*f_2;
F_H = f_0+f_1+1i*f_2;


end

