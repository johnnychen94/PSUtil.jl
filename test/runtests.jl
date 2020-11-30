using PSUtil
using Test

using PSUtil: current_system, Linux, MacOS

@testset "PSUtil.jl" begin
    include("cpu.jl")
end
