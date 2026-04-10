"""
TEST models:
"""
function Thomsen_model_test_nowave_onlyheat(; thickness=300, Thickness_Crystal_strain_um=50,
                       step_in_depth_um=0.1, laser_wl=800, Q_l=4e-3, R_l=33,
                       abs_depth_l_nm=200, Factor_tanh=1e9, time_step_ps=800,
                       v_sl=8433, v_st=5800, factor_lt=1,Anisotropic = false,
                       orthogonal_strain_zero = false, bipolar_trans = false, compressive = true)
    # From um to m
    Thickness_Crystal_um = thickness * 1e-6
    Thickness_Crystal_strain = Thickness_Crystal_strain_um * 1e-6
    Thickness_Crystal_nostrain = Thickness_Crystal_um - Thickness_Crystal_strain
    step_in_depth = step_in_depth_um * 1e-6

    # Depth crystal
    steps_depth = Thickness_Crystal_strain / step_in_depth
    n_steps = round(Int, steps_depth) + 1
    z = collect(range(step_in_depth, Thickness_Crystal_strain, n_steps))

    # Thickness_Crystal_strain_um
    thickness_strain = step_in_depth * ones(n_steps)

    # Laser parameters conversion
    hc = 1239.8
    E_p = hc / laser_wl     #E_p = 1.5497;%for 800nm
    ADL = abs_depth_l_nm * 1e-9 #Absoption depth to cm from nm

    # Time to s
    t_step = time_step_ps * 1e-12

    # Si
    C₁ = 1.66 #J/K/cm3 Si
    # vₛ = 8433 # m/s Speed sound Si m/s longitudinal
    #v_s = 5800 # m/s Speed sound Si m/s transversal

    #Anisotrpy
    C11 = 16.6e11 #dm/cm2
    C12 = 6.4e11 #dm/cm2
    # Lings
    ϕβ = 4.08e-5 #K-1 Si %relates to the  linear expansion coeficient
    E_g  = 1.12 #eV Si

    # Thomsen
    Cₘ = 700 #J/kg/K Si
    ρ =  2.33 #g/cm3 Si
    Cᵥ = Cₘ * 1e-3 * ρ #J/K/cm3 Specific heat per unit volume
    β = 7.5e-6 #K-1  the  linear expansion coeficient Si
    η =  0.27 #Poisson ratio Si International System

    strain_f = @. Q_l * ϕβ * (E_p - E_g) / (100 * ADL * C₁ * E_p) #strain pre factor
    # Perpendicular
    strainTH_per = @. strain_f * (exp(-z / ADL) - 0.5 * (exp(-(z + v_sl * t_step)/ADL) + exp(-abs(z - v_sl * t_step) / ADL) * tanh((z - v_sl * t_step) * Factor_tanh)))
    # Parallel
    strainTH_par = @. strain_f * (exp(-z / ADL) - 0.5 * (exp(-(z + v_st * t_step)/ADL) ))
 

    if !orthogonal_strain_zero
        strainTH_par = @. 1 * strainTH_par
    else
        strainTH_par = @. 0 * strainTH_par
    end


    if t_step <= 0
        strainTH_per = strainTH_per.*0
        strainTH_par = strainTH_par .*0
    end



    # Add the layer non strain
    strainTH_per = push!(strainTH_per, 0)
    strainTH_par = push!(strainTH_par, 0)
    push!(z, z[end] + Thickness_Crystal_nostrain)

    thickness_strain[end] = Thickness_Crystal_nostrain
    thickness_strain .*= 1e6

    ISD_a = strainTH_per
    ISD_b = strainTH_par
    ISD_c = strainTH_par
    x_ISD = z

    return (; x_ISD, ISD_a, ISD_b, ISD_c, thickness_strain)
end


#        

function Thomsen_model_test_noheat_monowave(; thickness=300, Thickness_Crystal_strain_um=50,
                       step_in_depth_um=0.1, laser_wl=800, Q_l=4e-3, R_l=33,
                       abs_depth_l_nm=200, Factor_tanh=1e9, time_step_ps=800,
                       v_sl=8433, v_st=5800, factor_lt=1,Anisotropic = false,
                       orthogonal_strain_zero = false, bipolar_trans = false, compressive = true)
    # From um to m
    Thickness_Crystal_um = thickness * 1e-6
    Thickness_Crystal_strain = Thickness_Crystal_strain_um * 1e-6
    Thickness_Crystal_nostrain = Thickness_Crystal_um - Thickness_Crystal_strain
    step_in_depth = step_in_depth_um * 1e-6

    # Depth crystal
    steps_depth = Thickness_Crystal_strain / step_in_depth
    n_steps = round(Int, steps_depth) + 1
    z = collect(range(step_in_depth, Thickness_Crystal_strain, n_steps))

    # Thickness_Crystal_strain_um
    thickness_strain = step_in_depth * ones(n_steps)

    # Laser parameters conversion
    hc = 1239.8
    E_p = hc / laser_wl     #E_p = 1.5497;%for 800nm
    ADL = abs_depth_l_nm * 1e-9 #Absoption depth to cm from nm

    # Time to s
    t_step = time_step_ps * 1e-12

    # Si
    C₁ = 1.66 #J/K/cm3 Si
    # vₛ = 8433 # m/s Speed sound Si m/s longitudinal
    #v_s = 5800 # m/s Speed sound Si m/s transversal

    #Anisotrpy
    C11 = 16.6e11 #dm/cm2
    C12 = 6.4e11 #dm/cm2
    # Lings
    ϕβ = 4.08e-5 #K-1 Si %relates to the  linear expansion coeficient
    E_g  = 1.12 #eV Si

    # Thomsen
    Cₘ = 700 #J/kg/K Si
    ρ =  2.33 #g/cm3 Si
    Cᵥ = Cₘ * 1e-3 * ρ #J/K/cm3 Specific heat per unit volume
    β = 7.5e-6 #K-1  the  linear expansion coeficient Si
    η =  0.27 #Poisson ratio Si International System

    strain_f = @. Q_l * ϕβ * (E_p - E_g) / (100 * ADL * C₁ * E_p) #strain pre factor
    # Perpendicular
    strainTH_per = @. strain_f * (exp(-z / ADL) - 0.5 * (exp(-(z + v_sl * t_step)/ADL) + exp(-abs(z - v_sl * t_step) / ADL) * tanh((z - v_sl * t_step) * Factor_tanh)))
    # Parallel
    if compressive == true
        strainTH_par = @. strain_f * ( 0.5 * ( exp(-abs(z - v_st * t_step) / ADL)))
    else
        strainTH_par = @. strain_f * (- 0.5 * ( exp(-abs(z - v_st * t_step) / ADL)))
    end

    if !orthogonal_strain_zero
        strainTH_par = @. 1 * strainTH_par
    else
        strainTH_par = @. 0 * strainTH_par
    end


    if t_step <= 0
        strainTH_per = strainTH_per.*0
        strainTH_par = strainTH_par .*0
    end



    # Add the layer non strain
    strainTH_per = push!(strainTH_per, 0)
    strainTH_par = push!(strainTH_par, 0)
    push!(z, z[end] + Thickness_Crystal_nostrain)

    thickness_strain[end] = Thickness_Crystal_nostrain
    thickness_strain .*= 1e6

    ISD_a = strainTH_per
    ISD_b = strainTH_par
    ISD_c = strainTH_par
    x_ISD = z

    return (; x_ISD, ISD_a, ISD_b, ISD_c, thickness_strain)
end

#        
 

function Thomsen_model_test_noheat_bpwave(; thickness=300, Thickness_Crystal_strain_um=50,
                       step_in_depth_um=0.1, laser_wl=800, Q_l=4e-3, R_l=33,
                       abs_depth_l_nm=200, Factor_tanh=1e9, time_step_ps=800,
                       v_sl=8433, v_st=5800, factor_lt=1,Anisotropic = false,
                       orthogonal_strain_zero = false, bipolar_trans = false, compressive = true)
    # From um to m
    Thickness_Crystal_um = thickness * 1e-6
    Thickness_Crystal_strain = Thickness_Crystal_strain_um * 1e-6
    Thickness_Crystal_nostrain = Thickness_Crystal_um - Thickness_Crystal_strain
    step_in_depth = step_in_depth_um * 1e-6

    # Depth crystal
    steps_depth = Thickness_Crystal_strain / step_in_depth
    n_steps = round(Int, steps_depth) + 1
    z = collect(range(step_in_depth, Thickness_Crystal_strain, n_steps))

    # Thickness_Crystal_strain_um
    thickness_strain = step_in_depth * ones(n_steps)

    # Laser parameters conversion
    hc = 1239.8
    E_p = hc / laser_wl     #E_p = 1.5497;%for 800nm
    ADL = abs_depth_l_nm * 1e-9 #Absoption depth to cm from nm

    # Time to s
    t_step = time_step_ps * 1e-12

    # Si
    C₁ = 1.66 #J/K/cm3 Si
    # vₛ = 8433 # m/s Speed sound Si m/s longitudinal
    #v_s = 5800 # m/s Speed sound Si m/s transversal

    #Anisotrpy
    C11 = 16.6e11 #dm/cm2
    C12 = 6.4e11 #dm/cm2
    # Lings
    ϕβ = 4.08e-5 #K-1 Si %relates to the  linear expansion coeficient
    E_g  = 1.12 #eV Si

    # Thomsen
    Cₘ = 700 #J/kg/K Si
    ρ =  2.33 #g/cm3 Si
    Cᵥ = Cₘ * 1e-3 * ρ #J/K/cm3 Specific heat per unit volume
    β = 7.5e-6 #K-1  the  linear expansion coeficient Si
    η =  0.27 #Poisson ratio Si International System

    strain_f = @. Q_l * ϕβ * (E_p - E_g) / (100 * ADL * C₁ * E_p) #strain pre factor
    # Perpendicular
    strainTH_per = @. strain_f * (exp(-z / ADL) - 0.5 * (exp(-(z + v_sl * t_step)/ADL) + exp(-abs(z - v_sl * t_step) / ADL) * tanh((z - v_sl * t_step) * Factor_tanh)))
    
    # Parallel
    if compressive == true
        strainTH_par = @. factor_lt * strain_f * (- 0.5 * ( exp(-abs(z - v_st * t_step) / ADL) * tanh((z - v_st * t_step) * Factor_tanh)))
    else
        strainTH_par = @. factor_lt * strain_f * (0.5 * ( exp(-abs(z - v_st * t_step) / ADL) * tanh((z - v_st * t_step) * Factor_tanh)))
    end

    if !orthogonal_strain_zero
        strainTH_par = @. 1 * strainTH_par
    else
        strainTH_par = @. 0 * strainTH_par
    end


    if t_step <= 0
        strainTH_per = strainTH_per.*0
        strainTH_par = strainTH_par .*0
    end



    # Add the layer non strain
    strainTH_per = push!(strainTH_per, 0)
    strainTH_par = push!(strainTH_par, 0)
    push!(z, z[end] + Thickness_Crystal_nostrain)

    thickness_strain[end] = Thickness_Crystal_nostrain
    thickness_strain .*= 1e6

    ISD_a = strainTH_per
    ISD_b = strainTH_par
    ISD_c = strainTH_par
    x_ISD = z

    return (; x_ISD, ISD_a, ISD_b, ISD_c, thickness_strain)
end

#       