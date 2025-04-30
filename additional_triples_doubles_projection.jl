using SpinAdaptedSecondQuantization
using Serialization

include("doublet_cc_definitions.jl")
include("fixed_tensor_manipulations.jl")


P = get_doublet_P()
H = get_H()

T1 = Tn(1)
T2 = Tn(2)
T = T1 + T2
S = Sn


eq = χd(2)
@time eq = exp_T_on_bra(eq, -T1, 2) |> SpinAdaptedSecondQuantization.simplify
@time eq = exp_T_on_bra(eq, -T2, 1) |> SpinAdaptedSecondQuantization.simplify

@time eq = act_on_bra(eq * P) |> SpinAdaptedSecondQuantization.simplify

@time eq = exp_T_on_bra(eq, T1, 4) |> SpinAdaptedSecondQuantization.simplify
@time eq = exp_T_on_bra(eq, T2, 2) |> SpinAdaptedSecondQuantization.simplify
@time eq = exp_T_on_bra(eq, S, 1) |> SpinAdaptedSecondQuantization.simplify

@time eta_0 = get_ex_of_order(eq, 0)
# println(eta_0)

@time eta_1 = get_ex_of_order(eq, 1)
# println(eta_1)

@time eta_2 = get_ex_of_order(eq, 2)
# println(eta_2) # No contributions

@time eta_3 = get_ex_of_order(eq, 3)
# println(eta_3) # No contributions




