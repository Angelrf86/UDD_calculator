module MultiBeamCalculator

const newaxis = [CartesianIndex()]
const c_light= 299792458          # Light Speed m/s
const h_planck = 4.13566733e-15   # eV
const hc = 1.2398e-06
const r_e = 2.8179403267e-15
const rho = 5e-4

function squeeze(array)
    dims = tuple(findall(==(1), size(array))...)
    dropdims(array; dims)
end

include("elements.jl")

# We need to load FFTW to have a backend for doing FFTs on a CPU
using FFTW: FFTW
using AbstractFFTs: fft, plan_ifft, fftshift, fftshift!
include("setup.jl")
include("ModelStrainTest.jl")

using LinearAlgebra: mul!
using Statistics: mean
using CUDA: CuArray
using KernelAbstractions: KernelAbstractions as KA, @kernel, @index
using ProgressMeter: Progress, next!
include("simulation.jl")

using StatsBase: fit, uweights, Histogram, Weights
include("scans.jl")

end # module MultiBeamCalculator
