using SpinAdaptedSecondQuantization

include("doublet_cc_definitions.jl")
include("fixed_tensor_manipulations.jl")
include("code_generation_helpers.jl")

# Define translator for nice prints
trans = translate(OccupiedOrbital => 1:2:20, VirtualOrbital => 2:2:20)

# Get operators (T1 transformed)
H = get_H()
T2 = 0 #Tn(2)

E(p, q) = SpinAdaptedSecondQuantization.E(p, q)

μ_1 = 1//2*E(3,4)*occupied(3)*virtual(4)

R1 = Rn(1)
R2 = Rn(2)

println(R2)

println((μ_1,trans))

# For the reference and triples contribution, we directly get <μ|H^T|ν>:
op_1 = H * R1
@time r_μ_1_1 = project_equation_on_bra(μ_1, op_1, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy

println((r_μ_1_1, trans))


# Generate code
generate_eT_code("mu_1_H_nu_1", "mu_1_H_nu_1", r_μ_1_1, "rho_ai", [4, 3], trans, "doublet_ccsd")


op_2 = H * R2
@time r_μ_1_2 = project_equation_on_bra(μ_1, op_2, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy # For doubles


# Generate code
generate_eT_code("mu_1_H_nu_2", "mu_1_H_nu_2", r_μ_1_2, "rho_ai", [4, 3], trans, "doublet_ccsd")