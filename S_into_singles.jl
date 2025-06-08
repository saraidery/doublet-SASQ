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

H = get_H()
S = Sn

bra = 1//2*χdag(1)
op = commutator(H, S)
eq = act_on_ket(bra * op, 0) |> SpinAdaptedSecondQuantization.simplify

@time eq = look_for_tensor_replacements_smart(eq, make_exchange_transformer("g", "L")) |> SpinAdaptedSecondQuantization.simplify


@time eq = look_for_tensor_replacements_smart(eq, make_exchange_transformer_2("x", "U2")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_C_p_E_transformer("x", "V1")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_C_p_E_transformer_2("x", "V2")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_C_m_E_transformer("x", "W1")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_C_m_E_transformer_2("x", "W2")) |> SpinAdaptedSecondQuantization.simplify

println(eq)

bra = χdag(2)
op = commutator(H, S)|> SpinAdaptedSecondQuantization.simplify
eq = act_on_ket(bra * op, 0) |> SpinAdaptedSecondQuantization.simplify

@time eq = look_for_tensor_replacements_smart(eq, make_exchange_transformer("g", "L")) |> SpinAdaptedSecondQuantization.simplify


@time eq = look_for_tensor_replacements_smart(eq, make_exchange_transformer_2("x", "U2")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_C_p_E_transformer("x", "V1")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_C_p_E_transformer_2("x", "V2")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_C_m_E_transformer("x", "W1")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_C_m_E_transformer_2("x", "W2")) |> SpinAdaptedSecondQuantization.simplify

