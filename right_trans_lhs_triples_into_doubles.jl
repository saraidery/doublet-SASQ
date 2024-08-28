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

μ_3_2 = E(3,4)*E(5,6)*fermiondag(1,α)*fermion(2,α)*occupied(1)*occupied(3)*occupied(5)*virtual(2)*virtual(4)*virtual(6)

R1 = Rn(1)
R2 = Rn(2)

# For the reference and triples contribution, we directly get <μ|H^T|ν>:
op_1 = H * R1
@time r_μ_3_2_1 = project_equation_on_bra(μ_3_2, op_1, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy # For doubles

@time r_μ_3_2_1_s, r_μ_3_2_1_ss, r_μ_3_2_1_ns = desymmetrize(r_μ_3_2_1, make_permutation_mappings([(3,4),(5, 6)]))


println(length(r_μ_3_2_1_s.terms))
println(length(r_μ_3_2_1_ss.terms))
println(length(r_μ_3_2_1_ns.terms))

@time r_μ_3_2_1_s = look_for_tensor_replacements_smart(r_μ_3_2_1_s, make_exchange_transformer("t", "u")) |> SpinAdaptedSecondQuantization.simplify
@time r_μ_3_2_1_s = look_for_tensor_replacements_smart(r_μ_3_2_1_s, make_exchange_transformer("g", "L")) |> SpinAdaptedSecondQuantization.simplify_heavy

@time r_μ_3_2_1_ss = look_for_tensor_replacements_smart(r_μ_3_2_1_ss, make_exchange_transformer("t", "u")) |> SpinAdaptedSecondQuantization.simplify
@time r_μ_3_2_1_ss = look_for_tensor_replacements_smart(r_μ_3_2_1_ss, make_exchange_transformer("g", "L")) |> SpinAdaptedSecondQuantization.simplify_heavy


println(length(r_μ_3_2_1_s.terms))
println(length(r_μ_3_2_1_ss.terms))
println(length(r_μ_3_2_1_ns.terms))

@time r_μ_3_2_1_s = change_summation_indices(r_μ_3_2_1_s)
@time r_μ_3_2_1_s = rename_tensors(r_μ_3_2_1_s)

@time r_μ_3_2_1_ss = change_summation_indices(r_μ_3_2_1_ss)
@time r_μ_3_2_1_ss = rename_tensors(r_μ_3_2_1_ss)

println(length(r_μ_3_2_1_s.terms))
println(length(r_μ_3_2_1_ss.terms))
println(length(r_μ_3_2_1_ns.terms))

# Generate code
generate_eT_code("mu_3_H_nu_1_s", "mu_4_H_nu_1_s", r_μ_3_2_1_s, "rho_aibj", [4, 3, 6, 5], trans, "doublet_ccsd")
generate_eT_code("mu_3_H_nu_1_ss", "mu_4_H_nu_1_ss", r_μ_3_2_1_ss, "rho_aibj", [4, 3, 6, 5], trans, "doublet_ccsd")


op_2 = H * R2
@time r_μ_3_2_2 = project_equation_on_bra(μ_3_2, op_2, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy # For doubles

@time r_μ_3_2_2_s, r_μ_3_2_2_ss, r_μ_3_2_2_ns = desymmetrize(r_μ_3_2_2, make_permutation_mappings([(3,4),(5, 6)]))


println(length(r_μ_3_2_2_s.terms))
println(length(r_μ_3_2_2_ss.terms))
println(length(r_μ_3_2_2_ns.terms))

@time r_μ_3_2_2_s = look_for_tensor_replacements_smart(r_μ_3_2_2_s, make_exchange_transformer("t", "u")) |> SpinAdaptedSecondQuantization.simplify
@time r_μ_3_2_2_s = look_for_tensor_replacements_smart(r_μ_3_2_2_s, make_exchange_transformer("g", "L")) |> SpinAdaptedSecondQuantization.simplify_heavy

@time r_μ_3_2_2_ss = look_for_tensor_replacements_smart(r_μ_3_2_2_ss, make_exchange_transformer("t", "u")) |> SpinAdaptedSecondQuantization.simplify
@time r_μ_3_2_2_ss = look_for_tensor_replacements_smart(r_μ_3_2_2_ss, make_exchange_transformer("g", "L")) |> SpinAdaptedSecondQuantization.simplify_heavy


println(length(r_μ_3_2_2_s.terms))
println(length(r_μ_3_2_2_ss.terms))
println(length(r_μ_3_2_2_ns.terms))

@time r_μ_3_2_2_s = change_summation_indices(r_μ_3_2_2_s)
@time r_μ_3_2_2_s = rename_tensors(r_μ_3_2_2_s)

@time r_μ_3_2_2_ss = change_summation_indices(r_μ_3_2_2_ss)
@time r_μ_3_2_2_ss = rename_tensors(r_μ_3_2_2_ss)

println(length(r_μ_3_2_2_s.terms))
println(length(r_μ_3_2_2_ss.terms))
println(length(r_μ_3_2_2_ns.terms))

# Generate code
generate_eT_code("mu_3_H_nu_2_s", "mu_4_H_nu_2_s", r_μ_3_2_2_s, "rho_aibj", [4, 3, 6, 5], trans, "doublet_ccsd")
generate_eT_code("mu_3_H_nu_2_ss", "mu_4_H_nu_2_ss", r_μ_3_2_2_ss, "rho_aibj", [4, 3, 6, 5], trans, "doublet_ccsd")