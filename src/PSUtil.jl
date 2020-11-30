module PSUtil

using CpuId

include("utils.jl")
include("traits.jl")
include("cpu.jl")
include("compat.jl")

const CURRENT_SYS = AbstractSystem[UnknownSystem()]

query_functions = [
    # cpu.jl
    :cpu_times, :cpu_percent, :cpu_count
    ]

for f in query_functions
    @eval $f(args...; kwargs...) = $f(current_system(), args...; kwargs...)
    # avoid StackOverflowError
    # reach here only because we haven't implemented `$f(::S, args...; kwargs...)` method
    @eval $f(sys::S, ::S, args...; kwargs...) where {S<:AbstractSystem}= throw(ArgumentError("system $sys is not supported yet."))
end

# no exports

end
