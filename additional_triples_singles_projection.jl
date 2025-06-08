using SpinAdaptedSecondQuantization
using Serialization

include("doublet_cc_definitions.jl")
include("fixed_tensor_manipulations.jl")


P = get_doublet_P_2()
H = get_H()

T1 = Tn(1)
T2 = Tn(2)
T = T1 + T2
S = Sn


eq = 1//2 * χdag(1)
@time eq = exp_T_on_bra(eq, -T1, 1) |> SpinAdaptedSecondQuantization.simplify # only possible contribution

@time eq = act_on_bra(eq * P) |> SpinAdaptedSecondQuantization.simplify

@time eq = exp_T_on_bra(eq, T1, 3) |> SpinAdaptedSecondQuantization.simplify
@time eq = exp_T_on_bra(eq, T2, 3) |> SpinAdaptedSecondQuantization.simplify
@time eq = exp_T_on_bra(eq, S, 3) |> SpinAdaptedSecondQuantization.simplify


eta = get_ex_of_order(eq, 2)

@time eta = transform_singles_operators(eta)
@time eta = transform_doubles_operators(eta)
@time eta = transform_triples_operators(eta)

@time eta = put_fixed_tensor_in_scalar(eta) |> SpinAdaptedSecondQuantization.simplify
@time eta = put_trig_in_scalar(eta) |> SpinAdaptedSecondQuantization.simplify

@time eta = look_for_tensor_replacements_smart(eta, make_exchange_transformer("x", "U1")) |> SpinAdaptedSecondQuantization.simplify
@time eta = look_for_tensor_replacements_smart(eta, make_exchange_transformer_2("x", "U2")) |> SpinAdaptedSecondQuantization.simplify
@time eta = look_for_tensor_replacements_smart(eta, make_C_p_E_transformer("x", "V1")) |> SpinAdaptedSecondQuantization.simplify
@time eta = look_for_tensor_replacements_smart(eta, make_C_p_E_transformer_2("x", "V2")) |> SpinAdaptedSecondQuantization.simplify
@time eta = look_for_tensor_replacements_smart(eta, make_C_m_E_transformer("x", "W1")) |> SpinAdaptedSecondQuantization.simplify
@time eta = look_for_tensor_replacements_smart(eta, make_C_m_E_transformer_2("x", "W2")) |> SpinAdaptedSecondQuantization.simplify

println(eta)





