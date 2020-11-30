### BEGIN: cpu_times
"""
    cpu_times(cpu_id=nothing)

Return system CPU times as a named tuple.

If `cpu_id::Integer` is provided, the result is for that specific CPU (logical) core.

# Outputs

Every attribute represents the seconds the CPU has spent in the given mode. The attributes
availability varies depending on the platform:

- `user`: time spent by normal processes executing in user mode; on Linux this also includes guest
  time
- `system`: time spent by processes executing in kernel mode
- `idle`: time spent doing nothing

Platform-specific fields:

- `nice` (UNIX): time spent by niced (prioritized) processes executing in user mode; on Linux this
  also includes guest_nice time
- `iowait` (Linux): time spent waiting for I/O to complete. This is not accounted in idle time
  counter.
- `irq` (Linux, BSD): time spent for servicing hardware interrupts
- `softirq` (Linux): time spent for servicing software interrupts
- `steal` (Linux 2.6.11+): time spent by other operating systems running in a virtualized
  environment
- `guest` (Linux 2.6.24+): time spent running a virtual CPU for guest operating systems under the
  control of the Linux kernel
- `guest_nice` (Linux 3.2.0+): time spent running a niced guest (virtual CPU for guest operating
  systems under the control of the Linux kernel)
- `interrupt` (Windows): time spent for servicing hardware interrupts ( similar to “irq” on UNIX)
- `dpc` (Windows): time spent servicing deferred procedure calls (DPCs); DPCs are interrupts that
  run at a lower priority than standard interrupts.

See also: For detailed explaination of each fields, please refer to `/proc/stat` section in `man
proc`.

# Examples

```julia
julia> using PSUtil

julia> PSUtil.cpu_times()
(user = 5243197, nice = 24218, system = 1518950, idle = 621296540, iowait = 114376, irq = 0, softirq = 491843, steal = 0, guest = 0, guest_nice = 0)
```

To get cpu times stat per thread:

```julia
julia> PSUtil.cpu_times.(0:Sys.CPU_THREADS-1);
```
"""
cpu_times

function cpu_times(::Linux, cpu_id::Union{Nothing, Integer}=nothing)
    if isnothing(cpu_id)
        record = readline("/proc/stat")
    else
        n = Sys.CPU_THREADS
        cpu_id <= n || throw(ArgumentError("cpu_id $cpu_id exceeds the number of CPU cores $n"))
        full_records = readlines("/proc/stat") # Enhancement: This get read multiple times if `cpu_times.(0:4)`
        record = full_records[findfirst(startswith("cpu$cpu_id"), full_records)]
    end

    k = (:user, :nice, :system, :idle, :iowait, :irq, :softirq, :steal, :guest, :guest_nice)
    v = map(x->parse(Int, x), split(record)[2:end])
    return (; zip(k, v)...)
end

### END: cpu_times

### BEGIN: cpu_percent

"""
    cpu_percent(cpu_id=nothing; interval=1) -> percentage
    cpu_percent(last_idle, last_total, cpu_id=nothing)

Return a float representing the current system-wide CPU utilization as a percentage.

# Inputs

To query usage for specific CPU core, you can optionally pass `cpu_id::Integer`.

If `lastidle` and `lasttotal` are provided, it calculates the CPU utilization since when the numbers
are recorded. Otherwise, it will calculate the CPU utilization from now to `interval` seconds later,
which is a blocking routine.

# Examples

```julia
julia> using PSUtil

julia> PSUtil.cpu_percent() # blocks the current thread by `interval` seconds
1.2432656444260282
```

`last_idle` and `last_total` can be book kept so that you can formulate a daemon script, for
example, the following script reports the CPU utilization every 5 seconds:

```julia
last_idle, last_total = 0, 0
while true
    utilization, last_idle, last_total = cpu_percent(last_idle, last_total)
    println(utilization)
    sleep(5)
end
```

To query cpu percentage for all cpus asynchronously (so that the process only get blocked by
`interval` seconds instead of `n * interval` seconds):

```julia
results = map(t->t.result,
    @sync map(0:PSUtil.cpu_count()-1) do i
        t = @async PSUtil.cpu_percent(i; interval=1)
    end
)
```
"""
cpu_percent

function cpu_percent(sys::AbstractSystem, cpu_id=nothing; interval=1)
    _, idle, total = cpu_percent(sys, 0, 0, cpu_id)
    sleep(interval)
    utilization, _, _ = cpu_percent(sys, idle, total)
    return utilization
end

function cpu_percent(::AbstractSystem, last_idle, last_total, cpu_id::Union{Nothing, Integer}=nothing; interval=nothing)
    isnothing(interval) || @warn "keyword `interval` is not used in non-block version."

    records = cpu_times(cpu_id)
    idle, total = records.idle, sum(records)
    Δidle, Δtotal = idle - last_idle, total - last_total

    utlization = 100 * (1 - Δidle/Δtotal)
    return utlization, idle, total
end

### END: cpu_percent

### BEGIN: cpu_count

"""
    cpu_count(;logical=true)

Return the number of logical CPUs in the system (same as `Sys.CPU_THREADS`).

`logical` cores means the number of physical cores multiplied by the number of threads that can run on
each core (this is known as Hyper Threading). If `logical` is `false` return the number of physical
cores only (Hyper Thread CPUs are excluded) or `nothing` if undetermined. 

# Examples

Example on a system having 2 physical hyper-thread CPU cores:

```julia
julia> import psutil
julia> psutil.cpu_count()
4
julia> psutil.cpu_count(logical=false)
2
```

See also: For more detailed CPU information, you can use [`CpuId.jl`](https://github.com/m-j-w/CpuId.jl).
"""

cpu_count(::AbstractSystem; logical=true) = logical ?  CpuId.cputhreads() : CpuId.cpucores()

### END: cpu_count
