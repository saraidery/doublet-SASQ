using SpinAdaptedSecondQuantization
using Serialization


include("doublet_cc_definitions.jl")
include("fixed_tensor_manipulations.jl")
include("code_generation_helpers.jl")


S = Sn
T2 = Tn(2)
H = get_H()

μ_4 = A(1,2,α)*A(1,2,β)*occupied(1,3,5)*virtual(2,4,6)*E(3,4)*E(5,6)

@time op = μ_4 * commutator(commutator(H, S),S)


@time eq = act_on_bra(op, 0) |> simplify_heavy

serialize("omega_SS_quad", eq)

@time eq, eq_δ = separate_δ(eq)

@time eq = look_for_tensor_replacements_smart(eq, make_exchange_transformer("t", "u")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_exchange_transformer("g", "L")) |> SpinAdaptedSecondQuantization.simplify_heavy

@time eq = look_for_tensor_replacements_smart(eq, make_exchange_transformer("s", "U1")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_exchange_transformer_2("s", "U2")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_C_p_E_transformer("s", "V1")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_C_p_E_transformer_2("s", "V2")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_C_m_E_transformer("s", "W1")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_C_m_E_transformer_2("s", "W2")) |> SpinAdaptedSecondQuantization.simplify


@time eq_s, eq_ss, eq_ns = desymmetrize(eq, make_permutation_mappings([(3,4),(5, 6)]))


println(eq_s)
println(eq_ns)
println(eq_ss)