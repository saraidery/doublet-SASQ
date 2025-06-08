using SpinAdaptedSecondQuantization
using Serialization


include("doublet_cc_definitions.jl")
include("fixed_tensor_manipulations.jl")
include("code_generation_helpers.jl")


S = Sn
T2 = Tn(2)
H = get_H()

μ_3 = E(1,2)*E(5,6)*E(3,4)*occupied(1,3,5)*virtual(2,4,6)


@time op = μ_3 * commutator(H, S)

@time eq = act_on_bra(op, 0) |> simplify_heavy

serialize("omega_AIvovo_S_no_spin", eq)

@time eq = look_for_tensor_replacements_smart(eq, make_exchange_transformer("t", "u")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_exchange_transformer("g", "L")) |> SpinAdaptedSecondQuantization.simplify_heavy

@time eq = look_for_tensor_replacements_smart(eq, make_exchange_transformer("s", "U1")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_exchange_transformer_2("s", "U2")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_C_p_E_transformer("s", "V1")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_C_p_E_transformer_2("s", "V2")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_C_m_E_transformer("s", "W1")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_C_m_E_transformer_2("s", "W2")) |> SpinAdaptedSecondQuantization.simplify


println(eq)