using ForestCore
using Test

@testset "ForestCore.jl" begin
    @testset "Basal Area Tests" begin
      dStandard = 30.0
      expectedBasalArea = 0.07068583470577035
      @test basalarea(dStandard) |> ustrip ≈ expectedBasalArea atol = 1e-6
      dZero = 0.0
      @test_throws DomainError basalarea(dZero)
      @test_throws DomainError basalarea(-dStandard)
    end
end
