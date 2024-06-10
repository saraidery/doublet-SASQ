using SpinAdaptedSecondQuantization

include("doublet_cc_definitions.jl")
include("fixed_tensor_manipulations.jl")
include("code_generation_helpers.jl")

# Define translator for nice prints
trans = translate(OccupiedOrbital => 1:2:20, VirtualOrbital => 2:2:20)

# Get operators (T1 transformed)
H = get_H()
P = get_doublet_P()
P = get_bch_operator(1, P, 4) |> SpinAdaptedSecondQuantization.simplify

T2 = Tn(2)

μ_2_4 = SpinAdaptedSecondQuantization.E(3,4)*SpinAdaptedSecondQuantization.E(5,6)*fermiondag(1,α)*fermion(2,α)*fermiondag(1,β)*fermion(2,β)*occupied(1)*occupied(3)*occupied(5)*virtual(2)*virtual(4)*virtual(6)
#
@time Ω_μ2_4 = project_equation_on_bra(μ_2_4, H, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy

println(length(Ω_μ2_4.terms))

@time Ω_μ2_4_s, Ω_μ2_4_ss, Ω_μ2_4_ns = desymmetrize(Ω_μ2_4, make_permutation_mappings([(3,4),(5, 6)]))

@time Ω_μ2_4_s = look_for_tensor_replacements_smart(Ω_μ2_4_s, make_exchange_transformer("t", "u")) |> SpinAdaptedSecondQuantization.simplify
@time Ω_μ2_4_s = look_for_tensor_replacements_smart(Ω_μ2_4_s, make_exchange_transformer("g", "L")) |> SpinAdaptedSecondQuantization.simplify_heavy

@time Ω_μ2_4_ss = look_for_tensor_replacements_smart(Ω_μ2_4_ss, make_exchange_transformer("t", "u")) |> SpinAdaptedSecondQuantization.simplify
@time Ω_μ2_4_ss = look_for_tensor_replacements_smart(Ω_μ2_4_ss, make_exchange_transformer("g", "L")) |> SpinAdaptedSecondQuantization.simplify_heavy

println(length(Ω_μ2_4_s.terms))
println(length(Ω_μ2_4_ss.terms))
println(length(Ω_μ2_4_ns.terms))


@time Ω_μ2_4_s = change_summation_indices(Ω_μ2_4_s)
@time Ω_μ2_4_s = rename_tensors(Ω_μ2_4_s)

@time Ω_μ2_4_ss = change_summation_indices(Ω_μ2_4_ss)
@time Ω_μ2_4_ss = rename_tensors(Ω_μ2_4_ss)

println(length(Ω_μ2_4_s.terms))
println(length(Ω_μ2_4_ss.terms))
println(length(Ω_μ2_4_ns.terms))

# Generate code
generate_eT_code("omega_mu2_4_s", "omega_mu2_4_s", Ω_μ2_4_s, "omega_aibj", [4, 3, 6, 5], trans, "doublet_ccsd")
generate_eT_code("omega_mu2_4_ss", "omega_mu2_4_ss", Ω_μ2_4_ss, "omega_aibj", [4, 3, 6, 5], trans, "doublet_ccsd")