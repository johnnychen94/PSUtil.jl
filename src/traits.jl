abstract type AbstractSystem end
struct UnknownSystem <: AbstractSystem end

struct Linux <: AbstractSystem
    id::String
    version_id::String
    os_name::String
    os_version::String
end

struct MacOS <: AbstractSystem
    version_id::String
end

"""
    current_system() -> AbstractSystem

Query the current system information.
"""
function current_system()
    CURRENT_SYS[1] !== UnknownSystem() && return CURRENT_SYS[1]

    if Sys.islinux()
        info = map(readlines("/etc/os-release")) do line
            k, v = split(line, "=")
            Symbol(lowercase(k)) => v
        end
        info = (; info...)
        CURRENT_SYS[1] = Linux(info.id, info.version_id, info.name, info.version)
    elseif Sys.isapple()
        verson_id = on_success(strip, `sw_vers -productVersion`)
        CURRENT_SYS[1] = MacOS(verson_id)
    else
        error("Current system is not supported yet.")
    end
    return CURRENT_SYS[1]
end
