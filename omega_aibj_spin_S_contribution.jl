using SpinAdaptedSecondQuantization
using Serialization


include("doublet_cc_definitions.jl")
include("fixed_tensor_manipulations.jl")
include("code_generation_helpers.jl")


S = Sn
H = get_H()
μ_2 = A(3,4,α)*A(5,6,β)*occupied(3,5)*virtual(4,6)

op = μ_2 * commutator(H, S)

eq = act_on_ket(op, 0) |> simplify_heavy

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