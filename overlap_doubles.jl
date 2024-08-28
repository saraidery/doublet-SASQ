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

μ_1 = 1//2*E(3, 4)*occupied(3)*virtual(4)
μ_2 = E(5, 6)*E(3, 4)*occupied(5)*virtual(6)*occupied(3)*virtual(4)

R1 = Rn(1)
R2 = Rn(2)

op_1 = R2
@time r_μ_2_2= project_equation_on_bra(μ_2, op_1, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy
println(r_μ_2_2)

op_1 = R1
@time r_μ_1_1= project_equation_on_bra(μ_1, op_1, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy
println(r_μ_1_1)

