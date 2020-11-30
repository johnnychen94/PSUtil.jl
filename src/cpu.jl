### BEGIN: cpu_times
"""
    cpu_times(cpu_id=nothing)

Return system CPU times as a named tuple.

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
(user = "5155237", nice = "19599", system = "1484534", idle = "613900742", iowait = "111170", irq = "0", softirq = "482710", steal = "0", guest = "0", guest_nice = "0")
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
    v = @view split(record)[2:end]
    return (; zip(k, v)...)
end

### END: cpu_times
