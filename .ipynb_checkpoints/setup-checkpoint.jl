# Use packages from this notebook's project
using Pkg
Pkg.activate(pwd())

using Distributed
@info "Your Julia is running with $(Threads.nthreads()) threads"
#= FIXME: Enable me
if nprocs() == 1
    # Let's start up some local workers
    if VERSION >= v"1.11-"
        # If you're using Julia >=1.11, then we can safely use multiple threads
        @info "Starting up 2 multi-threaded workers..."
        addprocs(2; exeflags=["--project=$(pwd())", "--threads=3"])
    elseif Threads.nthreads() == 1
        # Julia <1.11 cannot safely mix multiple threads and Distributed workers
        @info "Starting up 2 single-threaded workers..."
        addprocs(2; exeflags="--project=$(pwd())")
    else
        @warn "Can't mix workers and threads, sorry..."
    end
end

if nprocs() > 1
    @everywhere workers() begin
        # Use packages from this notebook's project
        using Pkg
        Pkg.activate(pwd())
    end
end
=#

@everywhere begin 
    # Load our core packages
    using Distributed
    using Revise
    using Dagger
    using DaggerGPU, KernelAbstractions
    import DaggerGPU: Kernel
    using GraphViz, Plots, DataFrames
    using Colors, ColorSchemes
    using Statistics, StatsBase

    # Load some demo packages
    using OrdinaryDiffEq
    
    # Load some utilities that we'll use
    include("utils.jl")

    # TODO: Precompile some things?
end