if VERSION < v"1.1"
    isnothing(x) = x === nothing
end

if VERSION < v"1.2"
    startswith(msg, x) = Base.startswith(msg, x)
    startswith(x) = msg->startswith(msg, x)
end
