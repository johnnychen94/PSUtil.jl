"""
    execute(cmd_or_cmds) -> (stdout, stderr, exitcode)

Run a Cmd/Cmds object, returning the stdout & stderr contents plus the exit code.

# Examples

```julia
out, err, code = execute(`who`)
```

If a pipeline is passed, it captures the stdout, stderr and the exitcode of the last command.

```julia
# query who are logged into the current server
out, err, code = execute(pipeline(`who`, `cut -d" " -f1`, `sort`, `uniq`))
```
"""
function execute(cmd::Cmd)
    # From https://discourse.julialang.org/t/collecting-all-output-from-shell-commands/15592
    out = Pipe()
    err = Pipe()
    
    process = run(pipeline(ignorestatus(cmd), stdout=out, stderr=err))
    close(out.in)
    close(err.in)
    # to avoid deadlock situation inherent in doing IO operations sequentially
    return (
        stdout = String(read(out)),
        stderr = String(read(err)),
        code = process.exitcode
    )
end

function execute(cmds::Base.OrCmds)
    out = Pipe()
    err = Pipe()

    process = run(pipeline(ignorestatus(cmds), stdout=out, stderr=err))
    close(out.in)
    close(err.in)

    # to avoid deadlock situation inherent in doing IO operations sequentially
    return (
        stdout = String(read(out)),
        stderr = String(read(err)),
        code = last(process.processes).exitcode
    )
end


"""
    on_success(f, cmd)

Apply function `f` to the stdout of shell command `cmd`.

# Examples

```julia
on_success(pipeline(`who`, `cut -d" " -f1`, `sort`, `uniq`)) do out
    filtersplit(out, "\n")
end
```
"""
function on_success(f, cmd::Union{Cmd, Base.OrCmds})
    out, err, exitcode = execute(cmd)
    if exitcode != 0
        @error err
        error("None zero exitcode $exitcode when executing `$cmd`.")
    end
    return f(out)
end
