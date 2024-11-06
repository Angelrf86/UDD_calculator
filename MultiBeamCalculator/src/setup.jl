const default_elements_dir = "/gpfs/exfel/exp/MID/202401/p004977/usr/Shared/rodrigfa/Simulations/elements"

function read_element(energy_center, filename="Sif1f2.txt"; elements_dir=default_elements_dir)
    file_data = readdlm("$elements_dir/$filename", '\t', String)
    energies = map(x -> parse(Float32, replace(x, "," => ".")), file_data)

    for i in 1:size(energies)[1]
        if energies[max(1, i - 1), 1] < energy_center <= energies[i, 1]
            return energies[i, 2], energies[i, 3]
        end
    end

    error("No energy found")
end

function structure_factor_si(hkl, energy_center)
    Z = 14

    a_Par = 5.431
    b_Par = 5.431
    c_Par = 5.431
    α_par = 90
    β_par = 90
    γ_par = 90

    f_0 = if hkl in ((5, 1, 3), (5,3,1), (3,5,1), (3,1,5), (1,5,3), (1,3,5))
        5.92227
    elseif hkl in ((3,1,1), (1,3,1), (1,1,3))
        8.2626997
    elseif hkl == (1,1,1)
        10.702846
    elseif hkl in ((2,2,0), (2,0,2), (0,2,2))
        8.8399534
    elseif hkl in ((4,0,0), (0,4,0), (0,0,4))
        7.5887902
    elseif hkl in ((3,3,1), (1,3,3), (3,1,3))
        7.2654482
    elseif hkl in ((4,4,0), (0,4,4), (4,0,4))
        6.143148
    elseif hkl == (3,3,3)
        6.5355327
    elseif hkl == (5,5,5)
        3.8871919
    elseif hkl in ((1,5,5), (5,1,5), (5,5,1))
        4.9354269
    elseif hkl in ((5,5,3), (5,3,5), (3,5,5))
        4.5371446
    elseif hkl in ((3,3,5), (3,5,3), (5,3,3))
        5.3936593
    elseif hkl in ((8,0,0), (0,8,0), (0,0,8))
        4.3147635
    elseif hkl in ((0,4,8), (4,0,8), (8,4,8), (8,4,0), (4,8,0), (0,8,4))
        3.585777
    else
        error("Unsupported Miller indices: $(hkl)")
    end

    f_1, f_2 = read_element(energy_center, "Sif1f2.txt")
    h, k, l = hkl

    coef = (1 + (-1)^(h + k) + (-1)^(h + l) + (-1)^(k + l)) * (1 + (-1im)^(h + k + l))
    F0 = (Z + f_1 + 1im * f_2) * 8
    FH = (f_0 + f_1 + 1im * f_2) * abs(coef)
    F_H = (f_0 + f_1 + 1im * f_2) * abs(coef)

    return (; Z, F0, FH, F_H, a_Par, b_Par, c_Par, α_par, β_par, γ_par)
end

"""
Definition of the strain profile.

- Thickness in micrometers um
- Step_layer is given in angstrom
- Step of the strain net in angstrom
"""
function Bipolar_with_surface_exp(thickness; step_layer=100_000_0,
        Strain_Val_a = 0.0, Strain_Val_b = 0.000, Strain_Val_c = 0.000,
        Interfase_Val_a = 10_000_0, Interfase_Val_b = 10_000_0, Interfase_Val_c = 10_000_0,
        cdepth_a = 500, cdepth_b = 500, cdepth_c = 500, Compressed_strain1 = false,
        Strain_Val_a2 = 0.0, Strain_Val_b2 = 0.0, Strain_Val_c2 = 0.0,
        Interfase_Val_a2 = 10_000_0, Interfase_Val_b2 = 10_000_0, Interfase_Val_c2 = 10_000_0,
        cdepth_a2 = 500, cdepth_b2 = 500, cdepth_c2 = 500, Compressed_strain2 = false)
    thickness_layer = thickness * 10^4  # Thickness to Angstrom

    #First wave
    #Strain_Val_a = 0.0         # Strain in the surface
    #Strain_Val_b = 0.0         # Strain in the surface
    #Strain_Val_c = 0.0         # Strain in the surface
    #Interfase_Val_a = 10_000_0  # Interdace Angstrom
    #Interfase_Val_b = 10_000_0  # Interdace Angstrom
    #Interfase_Val_c = 10_000_0  # Interdace Angstrom
    #cdepth_a = 500             # Center of the strain effect in a
    #cdepth_b = 500             # Center of the strain effect in b
    #cdepth_c = 500             # Center of the strain effect in c

    #Compressed_strain1 = false # Compressive True and Expansive False


    #Second Wave
    #Strain_Val_a2 = 0.0         # Strain in the surface
    #Strain_Val_b2 = 0.0         # Strain in the surface
    #Strain_Val_c2 = 0.0         # Strain in the surface
    #Interfase_Val_a2 = 10_000_0 # Interdace Angstrom
    #Interfase_Val_b2 = 10_000_0 # Interdace Angstrom
    #Interfase_Val_c2 = 10_000_0 # Interdace Angstrom
    #cdepth_a2 = 500             # Center of the strain effect in a
    #cdepth_b2 = 500             # Center of the strain effect in b
    #cdepth_c2 = 500             # Center of the strain effect in c

    #Compressed_strain2 = false  # Compressive True and Expansive False

    n_steps_layers = round(Int, thickness_layer / step_layer) #Calculation of the number of layers

    # generation of the net
    x_ISD = if n_steps_layers == 1
        [thickness_layer]
    else
        range(1, thickness_layer, n_steps_layers)
    end


    #Front Surface
    R_coefficient_exp_a = 1/(10*Interfase_Val_a)
    R_coefficient_exp_b = 1/(10*Interfase_Val_b)
    R_coefficient_exp_c = 1/(10*Interfase_Val_c)

    #Rear surface
    R_coefficient_exp_a2 = 1/(10*Interfase_Val_a2)
    R_coefficient_exp_b2 = 1/(10*Interfase_Val_b2)
    R_coefficient_exp_c2 = 1/(10*Interfase_Val_c2)

    #surface strain thermal
#    if get(h.Compressed_strain,'value') == 1: #compressed
#        ISD_a = - 2 * Strain_Val_a * np.exp(-R_coefficient_exp_a * x_ISD)
#        ISD_b = - 2 * Strain_Val_b * np.exp(-R_coefficient_exp_b * x_ISD)
#        ISD_c = - 2 * Strain_Val_c * np.exp(-R_coefficient_exp_c * x_ISD)

#    else: #expansive strain
    ISD_a = @. 2 * Strain_Val_a * exp(-R_coefficient_exp_a * x_ISD)
    ISD_b = @. 2 * Strain_Val_b * exp(-R_coefficient_exp_b * x_ISD)
    ISD_c = @. 2 * Strain_Val_c * exp(-R_coefficient_exp_c * x_ISD)


#####For the future is the laser hits in the back of the crystal
    #surface strain thermal
#    if get(h.Compressed_strain2,'value') == 1: #compressed
#        ISD_a = ISD_a - 2*Strain_Val_a2 * np.exp(-R_coefficient_exp_a2 * flip(x_ISD))
#        ISD_b = ISD_b - 2*Strain_Val_b2 * np.exp(-R_coefficient_exp_b2 * flip(x_ISD))
#        ISD_c = ISD_c - 2*Strain_Val_c2 * np.exp(-R_coefficient_exp_c2 * flip(x_ISD))
#    else: #expansive strain
#        ISD_a = ISD_a + 2*Strain_Val_a2 * np.exp(-R_coefficient_exp_a2 * flip(x_ISD))
#        ISD_b = ISD_b + 2*Strain_Val_b2 * np.exp(-R_coefficient_exp_b2 * flip(x_ISD))
#        ISD_c = ISD_c + 2*Strain_Val_c2 * np.exp(-R_coefficient_exp_c2 * flip(x_ISD))


    #Bipolar waves
    #First wave
    R_coefficient_a = Interfase_Val_a/2
    R_coefficient_b = Interfase_Val_b/2
    R_coefficient_c = Interfase_Val_c/2

    #second wave
    R_coefficient_a2 = Interfase_Val_a2/2
    R_coefficient_b2 = Interfase_Val_b2/2
    R_coefficient_c2 = Interfase_Val_c2/2

    # Bipolar wave:
    if Compressed_strain1 #compressed
        ISD_a = @. ISD_a - Strain_Val_a * exp(- (x_ISD - cdepth_a + Interfase_Val_a/2)^2 / (2 * R_coefficient_a^2))
        ISD_a = @. ISD_a + Strain_Val_a * exp(- (x_ISD - cdepth_a - Interfase_Val_a/2)^2 / (2 * R_coefficient_a^2))
        ISD_b = @. ISD_b - Strain_Val_b * exp(- (x_ISD - cdepth_b + Interfase_Val_b/2)^2 / (2 * R_coefficient_b^2))
        ISD_b = @. ISD_b + Strain_Val_b * exp(- (x_ISD - cdepth_b - Interfase_Val_b/2)^2 / (2 * R_coefficient_b^2))
        ISD_c = @. ISD_c - Strain_Val_c * exp(- (x_ISD - cdepth_c + Interfase_Val_c/2)^2 / (2 * R_coefficient_c^2))
        ISD_c = @. ISD_c + Strain_Val_c * exp(- (x_ISD - cdepth_c - Interfase_Val_c/2)^2 / (2 * R_coefficient_c^2))
    else #expansive strain
        ISD_a = @. ISD_a + Strain_Val_a * exp(- (x_ISD - cdepth_a + Interfase_Val_a/2)^2 / (2 * R_coefficient_a^2))
        ISD_a = @. ISD_a - Strain_Val_a * exp(- (x_ISD - cdepth_a - Interfase_Val_a/2)^2 / (2 * R_coefficient_a^2))
        ISD_b = @. ISD_b + Strain_Val_b * exp(- (x_ISD - cdepth_b + Interfase_Val_b/2)^2 / (2 * R_coefficient_b^2))
        ISD_b = @. ISD_b - Strain_Val_b * exp(- (x_ISD - cdepth_b - Interfase_Val_b/2)^2 / (2 * R_coefficient_b^2))
        ISD_c = @. ISD_c + Strain_Val_c * exp(- (x_ISD - cdepth_c + Interfase_Val_c/2)^2 / (2 * R_coefficient_c^2))
        ISD_c = @. ISD_c - Strain_Val_c * exp(- (x_ISD - cdepth_c - Interfase_Val_c/2)^2 / (2 * R_coefficient_c^2))
    end

    #second wave
    if Compressed_strain2 #compressed
        ISD_a = @. ISD_a - Strain_Val_a2 * exp(- (x_ISD - cdepth_a2 + Interfase_Val_a2/2)^2 / (2 * R_coefficient_a2^2))
        ISD_b = @. ISD_b - Strain_Val_b2 * exp(- (x_ISD - cdepth_b2 + Interfase_Val_b2/2)^2 / (2 * R_coefficient_b2^2))
        ISD_c = @. ISD_c - Strain_Val_c2 * exp(- (x_ISD - cdepth_c2 + Interfase_Val_c2/2)^2 / (2 * R_coefficient_c2^2))
        ISD_a = @. ISD_a + Strain_Val_a2 * exp(- (x_ISD - cdepth_a2 - Interfase_Val_a2/2)^2 / (2 * R_coefficient_a2^2))
        ISD_b = @. ISD_b + Strain_Val_b2 * exp(- (x_ISD - cdepth_b2 - Interfase_Val_b2/2)^2 / (2 * R_coefficient_b2^2))
        ISD_c = @. ISD_c + Strain_Val_c2 * exp(- (x_ISD - cdepth_c2 - Interfase_Val_c2/2)^2 / (2 * R_coefficient_c2^2))
    else #expansive strain
        ISD_a = @. ISD_a + Strain_Val_a2 * exp(- (x_ISD - cdepth_a2 + Interfase_Val_a2/2)^2 / (2 * R_coefficient_a2^2))
        ISD_b = @. ISD_b + Strain_Val_b2 * exp(- (x_ISD - cdepth_b2 + Interfase_Val_b2/2)^2 / (2 * R_coefficient_b2^2))
        ISD_c = @. ISD_c + Strain_Val_c2 * exp(- (x_ISD - cdepth_c2 + Interfase_Val_c2/2)^2 / (2 * R_coefficient_c2^2))
        ISD_a = @. ISD_a - Strain_Val_a2 * exp(- (x_ISD - cdepth_a2 - Interfase_Val_a2/2)^2 / (2 * R_coefficient_a2^2))
        ISD_b = @. ISD_b - Strain_Val_b2 * exp(- (x_ISD - cdepth_b2 - Interfase_Val_b2/2)^2 / (2 * R_coefficient_b2^2))
        ISD_c = @. ISD_c - Strain_Val_c2 * exp(- (x_ISD - cdepth_c2 - Interfase_Val_c2/2)^2 / (2 * R_coefficient_c2^2))
    end

    ISD_steps = step_layer * ones(n_steps_layers)
    ISD_steps *= 1e-4

    return (; x_ISD, ISD_a, ISD_b, ISD_c, thickness_strain=ISD_steps)
end

function compute_beam(fwhm_x=0.5e-6, fwhm_y=0.5e-6; steps_x=40, steps_y=1000)
    # Definition of the two Gaussians for x and y of the incomming beam
    I_range_x = 1
    I_range_y = 500
    x0_array = 0
    y0_array = 0

    x_array = range(-I_range_x/2, I_range_x/2, steps_x) .* 10^-6
    y_array = range(-I_range_y/2, I_range_y/2, steps_y) .* 10^-6
    sigma_x = fwhm_x / 2.355
    sigma_y = fwhm_y / 2.355

    Gaussian_x = @. exp(-((x_array - x0_array)/sigma_x)^2 / 2)
    Gaussian_y = @. exp(-((y_array - y0_array)/sigma_y)^2 / 2)

    # Calculation of the ky_array and the kx_array vectors
    dx = x_array[2] - x_array[1]
    dy = y_array[2] - y_array[1]

    dkx = 2*pi/(steps_x * dx)
    dky = 2*pi/(steps_y * dy)

    kx_array = dkx * range(-steps_x/2, steps_x/2, steps_x)
    ky_array = dky * range(-steps_y/2, steps_y/2, steps_y)

    Gaussian_kx = FFTW.fftshift(FFTW.fft(Gaussian_x))
    Gaussian_ky = FFTW.fftshift(FFTW.fft(Gaussian_y))

    return (; x_array, y_array,
              Gaussian_x, Gaussian_y,
              kx_array, ky_array,
              Gaussian_kx, Gaussian_ky)
end
