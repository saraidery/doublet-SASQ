using SpinAdaptedSecondQuantization
using Serialization


include("doublet_cc_definitions.jl")
include("fixed_tensor_manipulations.jl")
include("code_generation_helpers.jl")


trans = translate(OccupiedOrbital => 1:2:20, VirtualOrbital => 2:2:20)

S = Sn
H = get_H()
μ_1 = 1//2*E(3,4)*occupied(3)*virtual(4)

op = μ_1 * commutator(H, S)

eq = act_on_ket(op, 0) |> simplify_heavy
@time eq = look_for_tensor_replacements_smart(eq, make_exchange_transformer("g", "L")) |> SpinAdaptedSecondQuantization.simplify_heavy

@time eq = look_for_tensor_replacements_smart(eq, make_exchange_transformer("s", "U1")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_exchange_transformer_2("s", "U2")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_C_p_E_transformer("s", "V1")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_C_p_E_transformer_2("s", "V2")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_C_m_E_transformer("s", "W1")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_C_m_E_transformer_2("s", "W2")) |> SpinAdaptedSecondQuantization.simplify

@time eq = rename_tensors(eq)
@time eq, eq_δ = separate_δ(eq)

@time eq = change_summation_indices(eq)
@time eq_δ = change_summation_indices(eq_δ)

generate_eT_code("omega_ai_s_no_d", "omega_ai_s_no_d", eq, "omega_ai", [4, 3], trans, "aug_eccsd")

eq_δ_A = extract_δ(eq_δ, 2, 4)
eq_δ_A = strip_δ(eq_δ_A)

generate_eT_code("omega_i_s_no_d", "omega_i_s_no_d", eq_δ_A, "omega_i", [3], trans, "aug_eccsd")

eq_δ_I = extract_δ(eq_δ, 1, 3)
eq_δ_I = strip_δ(eq_δ_I)

generate_eT_code("omega_a_s_no_d", "omega_a_s_no_d", eq_δ_I, "omega_a", [4], trans, "aug_eccsd")

eq_δ_AI = extract_δ(eq_δ, 1, 3, 2, 4)
eq_δ_AI = strip_δ(eq_δ_AI)

generate_eT_code("omega_s_no_d", "omega_s_no_d", eq_δ_AI, "omega", [], trans, "aug_eccsd")
