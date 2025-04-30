using SpinAdaptedSecondQuantization
using Serialization

# eq = SpinAdaptedSecondQuantization.E(1,2)*SpinAdaptedSecondQuantization.E(1,4)*
#      SpinAdaptedSecondQuantization.E(1,3)*occupied(2)*occupied(3)*occupied(4)*virtual(1)

# eq = act_on_ket(eq) |> SpinAdaptedSecondQuantization.simplify_heavy
# println(eq)

# eq = fermion(1,α)*fermion(1,α)*occupied(1)
# eq = act_on_ket(eq) |> SpinAdaptedSecondQuantization.simplify_heavy
# println(eq)

include("doublet_cc_definitions.jl")
include("fixed_tensor_manipulations.jl")
include("spin_excitation_operator.jl")


# P = get_doublet_P_2()


# T1 = Tn(1)
# T2 = Tn(2)
# T = T1 + T2
# S = Sn


# eq = (SpinAdaptedSecondQuantization.E(3,4)*
#      SpinAdaptedSecondQuantization.E(1,6)*
#      SpinAdaptedSecondQuantization.E(5,2)*
#      occupied(1)*occupied(3)*occupied(5)*
#      virtual(2)*virtual(4)*virtual(6))


# @time eq = exp_T_on_bra(eq, -T1, 3) |> SpinAdaptedSecondQuantization.simplify
# @time eq = exp_T_on_bra(eq, -T2, 1) |> SpinAdaptedSecondQuantization.simplify
# @time eq = exp_T_on_bra(eq, -S, 1) |> SpinAdaptedSecondQuantization.simplify


# @time eq = act_on_bra(eq * P) |> SpinAdaptedSecondQuantization.simplify

# println("RMOVAL")
# @time eq = remove_illegal_operators(eq)

# @time eq = exp_T_on_bra(eq, S, 1) |> SpinAdaptedSecondQuantization.simplify
# @time eq = exp_T_on_bra(eq, T2, 2) |> SpinAdaptedSecondQuantization.simplify
# @time eq = exp_T_on_bra(eq, T1, 4) |> SpinAdaptedSecondQuantization.simplify

# println("RMOVAL")
# @time eq = remove_illegal_amplitudes(eq)
# @time eq = remove_illegal_deltas(eq)

# serialize("additional_t_t_store", eq)

eq = deserialize("additional_t_t_store")


@time eta = get_ex_of_order(eq, 4)

@time eta = transform_singles_operators(eta)
@time eta = transform_doubles_operators(eta)
@time eta = transform_triples_operators(eta)

@time eta = look_for_tensor_replacements_smart(eta, make_exchange_transformer("t", "u")) |> SpinAdaptedSecondQuantization.simplify
@time eta = look_for_tensor_replacements_smart(eta, make_C_p_E_transformer("t", "v")) |> SpinAdaptedSecondQuantization.simplify
@time eta = look_for_tensor_replacements_smart(eta, make_C_m_E_transformer("t", "w")) |> SpinAdaptedSecondQuantization.simplify

@time eta = look_for_tensor_replacements_smart(eta, make_exchange_transformer("x", "U1")) |> SpinAdaptedSecondQuantization.simplify
@time eta = look_for_tensor_replacements_smart(eta, make_exchange_transformer_2("x", "U2")) |> SpinAdaptedSecondQuantization.simplify
@time eta = look_for_tensor_replacements_smart(eta, make_C_p_E_transformer("x", "V1")) |> SpinAdaptedSecondQuantization.simplify
@time eta = look_for_tensor_replacements_smart(eta, make_C_p_E_transformer_2("x", "V2")) |> SpinAdaptedSecondQuantization.simplify
@time eta = look_for_tensor_replacements_smart(eta, make_C_m_E_transformer("x", "W1")) |> SpinAdaptedSecondQuantization.simplify
@time eta = look_for_tensor_replacements_smart(eta, make_C_m_E_transformer_2("x", "W2")) |> SpinAdaptedSecondQuantization.simplify

@time eta = put_fixed_tensor_in_scalar(eta) |> SpinAdaptedSecondQuantization.simplify
@time eta = put_trig_in_scalar(eta) |> SpinAdaptedSecondQuantization.simplify

disable_color()
open("eta_4.txt", "w") do io
     println(io, eta)
end


