## CPU

|                                                                                        | Linux              | macOS              | Windows            |
|----------------------------------------------------------------------------------------|--------------------|--------------------|--------------------|
| [cpu_times](https://psutil.readthedocs.io/en/latest/#psutil.cpu_times)                 | :heavy_check_mark: |                    |                    |
| [cpu_percent](https://psutil.readthedocs.io/en/latest/#psutil.cpu_percent)             | :heavy_check_mark: |                    |                    |
| [cpu_times_percent](https://psutil.readthedocs.io/en/latest/#psutil.cpu_times_percent) |                    |                    |                    |
| [cpu_count](https://psutil.readthedocs.io/en/latest/#psutil.cpu_count)                 | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
| [cpu_stats](https://psutil.readthedocs.io/en/latest/#psutil.cpu_stats)                 |                    |                    |                    |
| [cpu_freq](https://psutil.readthedocs.io/en/latest/#psutil.cpu_freq)                   |                    |                    |                    |

## CPU

|                                                                                        | Linux              | macOS              | Windows            |
|----------------------------------------------------------------------------------------|--------------------|--------------------|--------------------|
| [cpu_times](https://psutil.readthedocs.io/en/latest/#psutil.cpu_times)                 |                    |                    |                    |
| [cpu_percent](https://psutil.readthedocs.io/en/latest/#psutil.cpu_percent)             |                    |                    |                    |
| [cpu_times_percent](https://psutil.readthedocs.io/en/latest/#psutil.cpu_times_percent) |                    |                    |                    |
| [cpu_count](https://psutil.readthedocs.io/en/latest/#psutil.cpu_count)                 |                    |                    |                    |
| [cpu_stats](https://psutil.readthedocs.io/en/latest/#psutil.cpu_stats)                 |                    |                    |                    |
| [cpu_freq](https://psutil.readthedocs.io/en/latest/#psutil.cpu_freq)                   |                    |                    |                    |

## Disk

|                                                                                      | Linux              | macOS              | Windows |
|--------------------------------------------------------------------------------------|--------------------|--------------------|---------|
| [disk_partitions](https://psutil.readthedocs.io/en/latest/#psutil.disk_partitions)   |                    |                    |         |
| [disk_usage](https://psutil.readthedocs.io/en/latest/#psutil.disk_usage)             |                    |                    |         |
| [disk_io_counters](https://psutil.readthedocs.io/en/latest/#psutil.disk_io_counters) |                    |                    |         |

## Host

|                                                                                    | Linux              | macOS | Windows |
|------------------------------------------------------------------------------------|--------------------|-------|---------|
| [loadavg](https://psutil.readthedocs.io/en/latest/?badge=latest#psutil.getloadavg) |                    |       |         |
| [boot_time](https://psutil.readthedocs.io/en/latest/#psutil.boot_time)             |                    |       |         |
| [users](https://psutil.readthedocs.io/en/latest/#psutil.users)                     |                    |       |         |

## Memory

|                                                                                  | Linux              | macOS              | Windows |
|----------------------------------------------------------------------------------|--------------------|--------------------|---------|
| [virtual_memory](https://psutil.readthedocs.io/en/latest/#psutil.virtual_memory) |                    |                    |         |
| [swap_memory](https://psutil.readthedocs.io/en/latest/#psutil.swap_memory)       |                    |                    |         |

## Network

|                                                                                    | Linux              | macOS              | Windows |
|------------------------------------------------------------------------------------|--------------------|--------------------|---------|
| [net_io_counters](https://psutil.readthedocs.io/en/latest/#psutil.net_io_counters) |                    |                    |         |
| [net_connections](https://psutil.readthedocs.io/en/latest/#psutil.net_connections) |                    |                    |         |
| [net_if_addrs](https://psutil.readthedocs.io/en/latest/#psutil.net_if_addrs)       |                    |                    |         |
| [net_if_stats](https://psutil.readthedocs.io/en/latest/#psutil.net_if_stats)       |                    |                    |         |

## Processes

|                                                                              | Linux              | macOS              | Windows |
|------------------------------------------------------------------------------|--------------------|--------------------|---------|
| [pids](https://psutil.readthedocs.io/en/latest/#psutil.pids)                 |                    |                    |         |
| [process_iter](https://psutil.readthedocs.io/en/latest/#psutil.process_iter) |                    |                    |         |
| [pid_exists](https://psutil.readthedocs.io/en/latest/#psutil.pid_exists)     |                    |                    |         |
| [wait_procs](https://psutil.readthedocs.io/en/latest/#psutil.wait_procs)     |                    |                    |         |

### Per-process

|                                                                                              | Linux              | macOS              | Windows |
|----------------------------------------------------------------------------------------------|--------------------|--------------------|---------|
| [pid](https://psutil.readthedocs.io/en/latest/#psutil.Process.pid)                           |                    |                    |         |
| [ppid](https://psutil.readthedocs.io/en/latest/#psutil.Process.ppid)                         |                    |                    |         |
| [name](https://psutil.readthedocs.io/en/latest/#psutil.Process.name)                         |                    |                    |         |
| [exe](https://psutil.readthedocs.io/en/latest/#psutil.Process.exe)                           |                    |                    |         |
| [cmdline](https://psutil.readthedocs.io/en/latest/#psutil.Process.cmdline)                   |                    |                    |         |
| [environ](https://psutil.readthedocs.io/en/latest/#psutil.Process.environ)                   |                    |                    |         |
| [create_time](https://psutil.readthedocs.io/en/latest/#psutil.Process.create_time)           |                    |                    |         |
| [as_dict](https://psutil.readthedocs.io/en/latest/#psutil.Process.as_dict)                   |                    |                    |         |
| [parent](https://psutil.readthedocs.io/en/latest/#psutil.Process.parent)                     |                    |                    |         |
| [parents](https://psutil.readthedocs.io/en/latest/#psutil.Process.parents)                   |                    |                    |         |
| [status](https://psutil.readthedocs.io/en/latest/#psutil.Process.status)                     |                    |                    |         |
| [cwd](https://psutil.readthedocs.io/en/latest/#psutil.Process.cwd)                           |                    |                    |         |
| [username](https://psutil.readthedocs.io/en/latest/#psutil.Process.username)                 |                    |                    |         |
| [uids](https://psutil.readthedocs.io/en/latest/#psutil.Process.uids)                         |                    |                    |         |
| [gids](https://psutil.readthedocs.io/en/latest/#psutil.Process.gids)                         |                    |                    |         |
| [terminal](https://psutil.readthedocs.io/en/latest/#psutil.Process.terminal)                 |                    |                    |         |
| [nice](https://psutil.readthedocs.io/en/latest/#psutil.Process.nice)                         |                    |                    |         |
| [ionice](https://psutil.readthedocs.io/en/latest/#psutil.Process.ionice)                     |                    |                    |         |
| [rlimit](https://psutil.readthedocs.io/en/latest/#psutil.Process.rlimit)                     |                    |                    |         |
| [io_counters](https://psutil.readthedocs.io/en/latest/#psutil.Process.io_counters)           |                    |                    |         |
| [num_ctx_switches](https://psutil.readthedocs.io/en/latest/#psutil.Process.num_ctx_switches) |                    |                    |         |
| [num_fds](https://psutil.readthedocs.io/en/latest/#psutil.Process.num_fds)                   |                    |                    |         |
| [num_threads](https://psutil.readthedocs.io/en/latest/#psutil.Process.num_threads)           |                    |                    |         |
| [threads](https://psutil.readthedocs.io/en/latest/#psutil.Process.threads)                   |                    |                    |         |
| [cpu_times](https://psutil.readthedocs.io/en/latest/#psutil.Process.cpu_times)               |                    |                    |         |
| [cpu_percent](https://psutil.readthedocs.io/en/latest/#psutil.Process.cpu_percent)           |                    |                    |         |
| [cpu_affinity](https://psutil.readthedocs.io/en/latest/#psutil.Process.cpu_affinity)         |                    |                    |         |
| [cpu_num](https://psutil.readthedocs.io/en/latest/#psutil.Process.cpu_num)                   |                    |                    |         |
| [memory_info](https://psutil.readthedocs.io/en/latest/#psutil.Process.memory_info)           |                    |                    |         |
| [memory_info_full](https://psutil.readthedocs.io/en/latest/#psutil.Process.memory_info_full) |                    |                    |         |
| [memory_percent](https://psutil.readthedocs.io/en/latest/#psutil.Process.memory_percent)     |                    |                    |         |
| [memory_maps](https://psutil.readthedocs.io/en/latest/#psutil.Process.memory_maps)           |                    |                    |         |
| [children](https://psutil.readthedocs.io/en/latest/#psutil.Process.children)                 |                    |                    |         |
| [open_files](https://psutil.readthedocs.io/en/latest/#psutil.Process.open_files)             |                    |                    |         |
| [connections](https://psutil.readthedocs.io/en/latest/#psutil.Process.connections)           |                    |                    |         |
| [is_running](https://psutil.readthedocs.io/en/latest/#psutil.Process.is_running)             |                    |                    |         |
| [send_signal](https://psutil.readthedocs.io/en/latest/#psutil.Process.send_signal)           |                    |                    |         |
| [suspend](https://psutil.readthedocs.io/en/latest/#psutil.Process.suspend)                   |                    |                    |         |
| [resume](https://psutil.readthedocs.io/en/latest/#psutil.Process.resume)                     |                    |                    |         |
| [terminate](https://psutil.readthedocs.io/en/latest/#psutil.Process.terminate)               |                    |                    |         |
| [kill](https://psutil.readthedocs.io/en/latest/#psutil.Process.kill)                         |                    |                    |         |
| [wait](https://psutil.readthedocs.io/en/latest/#psutil.Process.wait)                         |                    |                    |         |

## Sensors

|                                                                                              | Linux              | macOS | Windows |
|----------------------------------------------------------------------------------------------|--------------------|-------|---------|
| [sensors_temperatures](https://psutil.readthedocs.io/en/latest/#psutil.sensors_temperatures) |                    |       |         |
| [sensors_fans](https://psutil.readthedocs.io/en/latest/#psutil.sensors_fans)                 |                    |       |         |
