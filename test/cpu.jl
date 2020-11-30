using CpuId

@testset "cpu_times" begin
    if current_system() isa Linux
        record = PSUtil.cpu_times()
        fields = (:user, :nice, :system, :idle, :iowait, :irq, :softirq, :steal, :guest, :guest_nice)
        @test length(record) == length(fields)
        @test keys(record) == fields
        @test eltype(record) == Int
    else
        @test_broken False
        @info "`cpu_times` is not tested on $(current_system())"
    end
end

@testset "cpu_percent" begin
    if current_system() isa Linux
        record = PSUtil.cpu_percent()
        
        @test 0<= PSUtil.cpu_percent() <= 100
        @test 0<= PSUtil.cpu_percent(1) <= 100
        @test 0<= first(PSUtil.cpu_percent(0, 0)) <= 100
        @test 0<= first(PSUtil.cpu_percent(0, 0, 1)) <= 100

        # test if it actaully blocks the process
        t = @elapsed PSUtil.cpu_percent(;interval=1)
        @test 1< t < 1.5

        # test if the concurrent version only blocks about 1 seconds
        t = @elapsed map(t->t.result,
            @sync map(0:PSUtil.cpu_count()-1) do i
                t = @async PSUtil.cpu_percent(i; interval=1)
            end
        )
        @test 1< t < 1.5

        # test if the non-blocking version doesn't block the routine
        PSUtil.cpu_percent(0, 0) # hit precompilation
        t = @elapsed PSUtil.cpu_percent(0, 0)
        @test t < 0.1

        err_msg = @capture_err PSUtil.cpu_percent(0, 0; interval=1)
        @test occursin("keyword `interval` is not used in non-block version.", err_msg)
    else
        # TODO: cpu_times is only supported on Linux now and thus we can't test this `cpu_percent` on other platforms
        @test_broken False
        @info "`cpu_percent` is not tested on $(current_system())"
    end
end

@testset "cpu_count" begin
    @test PSUtil.cpu_count() == PSUtil.cpu_count(logical=true)
    @test CpuId.cputhreads() == PSUtil.cpu_count(logical=true)
    @test CpuId.cpucores() ==  PSUtil.cpu_count(logical=false)
end
