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

# Projections from singles manifold
μ_1_3 = 1//2*SpinAdaptedSecondQuantization.E(3,4)*fermiondag(1,α)*fermion(2,α)*fermiondag(1,β)*fermion(2,β)*occupied(1)*occupied(3)*virtual(2)*virtual(4)

# Projections from doubles manifold
μ_2_3_3 =  SpinAdaptedSecondQuantization.E(3,4)*SpinAdaptedSecondQuantization.E(5,6)*fermiondag(1,α)*fermion(2,α)*occupied(1)*occupied(3)*virtual(2)*virtual(4)*occupied(5)*virtual(6)

# Evaluate equation < χ| H exp(T2) |ν >:
@time Ω_μ1_3 = project_equation_on_bra(μ_1_3, H, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy
@time Ω_μ2_3_3 = project_equation_on_bra(μ_2_3_3, H, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy

@time Ω_μ1_3 = look_for_tensor_replacements_smart(Ω_μ1_3, make_exchange_transformer("t", "u")) |> SpinAdaptedSecondQuantization.simplify
@time Ω_μ1_3 = look_for_tensor_replacements_smart(Ω_μ1_3, make_exchange_transformer("g", "L")) |> SpinAdaptedSecondQuantization.simplify_heavy

@time Ω_μ1_3 = change_summation_indices(Ω_μ1_3)
@time Ω_μ1_3 = rename_tensors(Ω_μ1_3)

# Prepare for code generation
@time Ω_μ2_3_3_s, Ω_μ2_3_3_ss, Ω_μ2_3_3_ns = desymmetrize(Ω_μ2_3_3, make_permutation_mappings([(3,4),(5, 6)]))


@time Ω_μ2_3_3_s = look_for_tensor_replacements_smart(Ω_μ2_3_3_s, make_exchange_transformer("t", "u")) |> SpinAdaptedSecondQuantization.simplify
@time Ω_μ2_3_3_s = look_for_tensor_replacements_smart(Ω_μ2_3_3_s, make_exchange_transformer("g", "L")) |> SpinAdaptedSecondQuantization.simplify_heavy


@time Ω_μ2_3_3_s = change_summation_indices(Ω_μ2_3_3_s)
@time Ω_μ2_3_3_s = rename_tensors(Ω_μ2_3_3_s)

# Generate code
generate_eT_code("omega_mu2_3_3_s", "omega_mu2_3_3_s", Ω_μ2_3_3_s, "omega_aibj", [4, 3, 6, 5], trans, "doublet_ccsd")
generate_eT_code("omega_mu1_3", "omega_mu1_3", Ω_μ1_3, "omega_ai", [4, 3], trans, "doublet_ccsd")