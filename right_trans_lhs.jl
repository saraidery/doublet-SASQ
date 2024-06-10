using SpinAdaptedSecondQuantization

include("doublet_cc_definitions.jl")
include("fixed_tensor_manipulations.jl")
include("code_generation_helpers.jl")

# Define translator for nice prints
trans = translate(OccupiedOrbital => 1:2:20, VirtualOrbital => 2:2:20)

# Get operators (T1 transformed)
H = get_H()
T2 = Tn(2)

E(p, q) = SpinAdaptedSecondQuantization.E(p, q)

μ_0 = 1
μ_1 = 1//2*E(1,2)*occupied(1)*virtual(2)
μ_2 = (1 // 3 * E(1, 2) * E(3, 4) + 1 // 6 * E(1, 4) * E(3, 2))*occupied(1)*virtual(2)*occupied(3)*virtual(4)
μ_3 = 1//2*E(3,4)*fermiondag(1,α)*fermion(2,α)*fermiondag(1,β)*fermion(2,β)*occupied(1)*occupied(3)*virtual(2)*virtual(4)
μ_3_2 = E(3,4)*E(5,6)*fermiondag(1,α)*fermion(2,α)*occupied(1)*occupied(3)*virtual(2)*virtual(4)*occupied(5)*virtual(6)
μ_4 = E(3,4)*E(5,6)*fermiondag(1,α)*fermion(2,α)*fermiondag(1,β)*fermion(2,β)*occupied(1)*occupied(3)*occupied(5)*virtual(2)*virtual(4)*virtual(6)

R1 = Rn(1)
R2 = Rn(2)

# For the reference and triples contribution, we directly get <μ|H^T|ν>:
op_1 = H * R1
@time r_μ_0_1 = project_equation_on_bra(μ_0, op_1, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy
@time r_μ_3_1 = project_equation_on_bra(μ_3, op_1, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy
@time r_μ_3_2_1 = project_equation_on_bra(μ_3_2, op_1, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy # For doubles
@time r_μ_4_1 = project_equation_on_bra(μ_4, op_1, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy


op_1 = H * R2
@time r_μ_0_2 = project_equation_on_bra(μ_0, op_1, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy
@time r_μ_3_2 = project_equation_on_bra(μ_3, op_1, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy
@time r_μ_3_2_2 = project_equation_on_bra(μ_3_2, op_1, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy
@time r_μ_4_2 = project_equation_on_bra(μ_4, op_1, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy

# For singles and doubles, we want to use the Jacobian implementation:
op_2 = R1 * H
@time r_μ_1_1 = project_equation_on_bra(μ_1, op_2, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy
@time r_μ_2_1 = project_equation_on_bra(μ_2, op_2, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy

op_2 = R2 * H
@time r_μ_1_2 = project_equation_on_bra(μ_1, op_2, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy
@time r_μ_2_2 = project_equation_on_bra(μ_2, op_2, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy
