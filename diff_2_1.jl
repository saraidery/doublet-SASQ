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

μ_2 = E(5, 6) * E(3, 4)*occupied(5)*virtual(6)*occupied(3)*virtual(4)

R1 = Rn(1)
R2 = Rn(2)

# For the reference and triples contribution, we directly get <μ|H^T|ν>:
op_1 = R1 * H
@time r_μ_2_1_diff = project_equation_on_bra(μ_2, op_1, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy


@time r_μ_2_1_diff_s, r_μ_2_1_diff_ss, r_μ_2_1_diff_ns = desymmetrize(r_μ_2_1_diff, make_permutation_mappings([(3,4),(5, 6)]))


println(length(r_μ_2_1_diff_s.terms))
println(length(r_μ_2_1_diff_ss.terms))
println(length(r_μ_2_1_diff_ns.terms))

@time r_μ_2_1_diff_s = look_for_tensor_replacements_smart(r_μ_2_1_diff_s, make_exchange_transformer("t", "u")) |> SpinAdaptedSecondQuantization.simplify
@time r_μ_2_1_diff_s = look_for_tensor_replacements_smart(r_μ_2_1_diff_s, make_exchange_transformer("g", "L")) |> SpinAdaptedSecondQuantization.simplify_heavy

@time r_μ_2_1_diff_ss = look_for_tensor_replacements_smart(r_μ_2_1_diff_ss, make_exchange_transformer("t", "u")) |> SpinAdaptedSecondQuantization.simplify
@time r_μ_2_1_diff_ss = look_for_tensor_replacements_smart(r_μ_2_1_diff_ss, make_exchange_transformer("g", "L")) |> SpinAdaptedSecondQuantization.simplify_heavy


println(length(r_μ_2_1_diff_s.terms))
println(length(r_μ_2_1_diff_ss.terms))
println(length(r_μ_2_1_diff_ns.terms))

# @time r_μ_2_1_diff_s = change_summation_indices(r_μ_2_1_diff_s)
# @time r_μ_2_1_diff_s = rename_tensors(r_μ_2_1_diff_s)

# @time r_μ_2_1_diff_ss = change_summation_indices(r_μ_2_1_diff_ss)
# @time r_μ_2_1_diff_ss = rename_tensors(r_μ_2_1_diff_ss)

println(length(r_μ_2_1_diff_s.terms))
println(length(r_μ_2_1_diff_ss.terms))
println(length(r_μ_2_1_diff_ns.terms))

println(r_μ_2_1_diff_s)

# Generate code
# generate_eT_code("mu_3_H_nu_1_s", "mu_4_H_nu_1_s", r_μ_2_1_diff_s, "rho_aibj", [4, 3, 6, 5], trans, "doublet_ccsd")
generate_eT_code("jacobian_diff_doubles_singles", "jacobian_diff_doubles_singles", r_μ_2_1_diff_s, "rho_aibj", [4, 3, 6, 5], trans, "doublet_ccsd")
