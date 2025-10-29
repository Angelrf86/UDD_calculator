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

# We need to load FFTW and cuFFT to have CPU/GPU backends for doing FFTs
using FFTW: FFTW
using cuFFT: cuFFT
using AbstractFFTs: fft, plan_ifft, fftshift, fftshift!
include("setup.jl")
include("ModelStrainTest.jl")

using LinearAlgebra: LinearAlgebra as LA, mul!
using Statistics: mean
using CUDACore: CuArray
using StaticArrays: SMatrix
using KernelAbstractions: KernelAbstractions as KA, @kernel, @index
using ProgressMeter: Progress, next!
include("simulation.jl")

using StatsBase: fit, uweights, Histogram, Weights
include("scans.jl")

end # module MultiBeamCalculator
