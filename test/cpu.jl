@testset "cpu_times" begin
    if current_system() isa Linux
        record = PSUtil.cpu_times()
        fields = (:user, :nice, :system, :idle, :iowait, :irq, :softirq, :steal, :guest, :guest_nice)
        @test length(record) == length(fields)
        @test keys(record) == fields
    else
        @test_broken False
        @info "`cpu_times` is not tested on $(current_system())"
    end
end
