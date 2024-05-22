using SpinAdaptedSecondQuantization

include("triplet_cc_definitions.jl")
include("fixed_tensor_manipulations.jl")

# Define translator for nice prints
trans = translate(OccupiedOrbital => 1:2:20, VirtualOrbital => 2:2:20)

# Get operators (T1 transformed)
H = get_H()
P = get_triplet_P()

T1 = Tn(1)
T2 = Tn(2)

# Using export JULIA_NUM_THREADS=4
@time μ_0 = get_triplet_projection_manifold(0, P, T1, 4, T2) |> SpinAdaptedSecondQuantization.simplify
@time μ_1 = get_triplet_projection_manifold(1, P, T1, 5, T2) |> SpinAdaptedSecondQuantization.simplify
@time μ_2 = get_triplet_projection_manifold(2, P, T1, 6, T2) |> SpinAdaptedSecondQuantization.simplify

# Projections from doubles manifold
μ_2_0 = get_ex_of_order(μ_2, 0)
μ_2_1 = get_ex_of_order(μ_2, 1)
μ_2_2 = get_ex_of_order(μ_2, 2)
μ_2_3 = get_ex_of_order(μ_2, 3)
μ_2_4 = get_ex_of_order(μ_2, 4)
μ_2_5 = get_ex_of_order(μ_2, 5)
μ_2_6 = get_ex_of_order(μ_2, 6)

@time Ω_μ1 = project_triplet_equation_on_bra(μ_1, H, 0, T2, 2) |> SpinAdaptedSecondQuantization.simplify
@time Ω_μ2_0 = project_triplet_equation_on_bra(μ_2_0, H, 0, T2, 1) |> SpinAdaptedSecondQuantization.simplify # 32s
@time Ω_μ2_1 = project_triplet_equation_on_bra(μ_2_1, H, 0, T2, 1) |> SpinAdaptedSecondQuantization.simplify # 10392
@time Ω_μ2_2 = project_triplet_equation_on_bra(μ_2_2, H, 0, T2, 2) |> SpinAdaptedSecondQuantization.simplify # 17261
@time Ω_μ2_3 = project_triplet_equation_on_bra(μ_2_3, H, 0, T2, 2) |> SpinAdaptedSecondQuantization.simplify #
@time Ω_μ2_4 = project_triplet_equation_on_bra(μ_2_4, H, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify #
@time Ω_μ2_5 = project_triplet_equation_on_bra(μ_2_5, H, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify #
@time Ω_μ2_6 = project_triplet_equation_on_bra(μ_2_6, H, 0, T2, 4) |> SpinAdaptedSecondQuantization.simplify #