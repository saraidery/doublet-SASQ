using SpinAdaptedSecondQuantization

include("doublet_cc_definitions.jl")
include("fixed_tensor_manipulations.jl")
include("code_generation_helpers.jl")

# Define translator for nice prints
trans = translate(OccupiedOrbital => 1:2:20, VirtualOrbital => 2:2:20)

# Get operators (T1 transformed)
H = get_H()
T2 = Tn(2)

println(T2)

E(p, q) = SpinAdaptedSecondQuantization.E(p, q)

μ_2 = E(3,4)*E(5,6)*occupied(3)*occupied(5)*virtual(4)*virtual(6)

println(μ_2)

R1 = Rn(1)
R2 = Rn(2)

println(R1)

# For the reference and triples contribution, we directly get <μ|H^T|ν>:
op_1 = H * R1
@time r_μ_2_1 = project_equation_on_bra(μ_2, op_1, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy


@time r_μ_2_1 = look_for_tensor_replacements_smart(r_μ_2_1, make_exchange_transformer("t", "u")) |> SpinAdaptedSecondQuantization.simplify
@time r_μ_2_1 = look_for_tensor_replacements_smart(r_μ_2_1, make_exchange_transformer("g", "L")) |> SpinAdaptedSecondQuantization.simplify_heavy

generate_eT_code("mu_2_H_nu_1", "mu_2_H_nu_1", r_μ_2_1, "rho_aibj", [4, 3, 6, 5], trans, "doublet_ccsd")

# @time r_μ_2_1_s, r_μ_2_1_ss, r_μ_2_1_ns = desymmetrize(r_μ_2_1, make_permutation_mappings([(3,4),(5, 6)]))

# println(length(r_μ_2_1_s.terms))
# println(length(r_μ_2_1_ss.terms))
# println(length(r_μ_2_1_ns.terms))

# @time r_μ_2_1_s = look_for_tensor_replacements_smart(r_μ_2_1_s, make_exchange_transformer("t", "u")) |> SpinAdaptedSecondQuantization.simplify
# @time r_μ_2_1_s = look_for_tensor_replacements_smart(r_μ_2_1_s, make_exchange_transformer("g", "L")) |> SpinAdaptedSecondQuantization.simplify_heavy

# @time r_μ_2_1_ss = look_for_tensor_replacements_smart(r_μ_2_1_ss, make_exchange_transformer("t", "u")) |> SpinAdaptedSecondQuantization.simplify
# @time r_μ_2_1_ss = look_for_tensor_replacements_smart(r_μ_2_1_ss, make_exchange_transformer("g", "L")) |> SpinAdaptedSecondQuantization.simplify_heavy

# println(length(r_μ_2_1_s.terms))
# println(length(r_μ_2_1_ss.terms))
# println(length(r_μ_2_1_ns.terms))

# println((r_μ_2_1_s,trans))
# println(r_μ_2_1_ss)
# println(r_μ_2_1_ns)

# # Generate code
# generate_eT_code("mu_2_H_nu_1_s", "mu_2_H_nu_1_s", r_μ_2_1_s, "rho_aibj", [4, 3, 6, 5], trans, "doublet_ccsd")
# generate_eT_code("mu_2_H_nu_1_ss", "mu_2_H_nu_1_ss", r_μ_2_1_ss, "rho_aibj", [4, 3, 6, 5], trans, "doublet_ccsd")


# op_2 = H * R2
# @time r_μ_2_2 = project_equation_on_bra(μ_2, op_2, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy # For doubles

# @time r_μ_2_2_s, r_μ_2_2_ss, r_μ_2_2_ns = desymmetrize(r_μ_2_2, make_permutation_mappings([(3,4),(5, 6)]))


# println(length(r_μ_2_2_s.terms))
# println(length(r_μ_2_2_ss.terms))
# println(length(r_μ_2_2_ns.terms))

# @time r_μ_2_2_s = look_for_tensor_replacements_smart(r_μ_2_2_s, make_exchange_transformer("t", "u")) |> SpinAdaptedSecondQuantization.simplify
# @time r_μ_2_2_s = look_for_tensor_replacements_smart(r_μ_2_2_s, make_exchange_transformer("g", "L")) |> SpinAdaptedSecondQuantization.simplify_heavy

# @time r_μ_2_2_ss = look_for_tensor_replacements_smart(r_μ_2_2_ss, make_exchange_transformer("t", "u")) |> SpinAdaptedSecondQuantization.simplify
# @time r_μ_2_2_ss = look_for_tensor_replacements_smart(r_μ_2_2_ss, make_exchange_transformer("g", "L")) |> SpinAdaptedSecondQuantization.simplify_heavy


# println(length(r_μ_2_2_s.terms))
# println(length(r_μ_2_2_ss.terms))
# println(length(r_μ_2_2_ns.terms))




# println(r_μ_2_2_s)
# println(r_μ_2_2_ss)
# println(r_μ_2_2_ns)

# # Generate code
# generate_eT_code("mu_2_H_nu_2_s", "mu_2_H_nu_2_s", r_μ_2_2_s, "rho_aibj", [4, 3, 6, 5], trans, "doublet_ccsd")
# generate_eT_code("mu_2_H_nu_2_ss", "mu_2_H_nu_2_ss", r_μ_2_2_ss, "rho_aibj", [4, 3, 6, 5], trans, "doublet_ccsd")