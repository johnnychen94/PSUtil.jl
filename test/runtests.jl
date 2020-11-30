using PSUtil
using Test, Suppressor

using PSUtil: current_system, Linux, MacOS

@testset "PSUtil.jl" begin
    include("cpu.jl")
end
