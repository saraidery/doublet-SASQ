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


eq = 1//2 * χd(1)
@time eq = exp_T_on_bra(eq, -T1, 1) |> SpinAdaptedSecondQuantization.simplify # only possible contribution

@time eq = act_on_bra(eq * P) |> SpinAdaptedSecondQuantization.simplify

@time eq = exp_T_on_bra(eq, T1, 3) |> SpinAdaptedSecondQuantization.simplify
@time eq = exp_T_on_bra(eq, T2, 3) |> SpinAdaptedSecondQuantization.simplify
@time eq = exp_T_on_bra(eq, S, 3) |> SpinAdaptedSecondQuantization.simplify

eta_0 = get_ex_of_order(eq, 0)
# println(eta_0)

eta_1 = get_ex_of_order(eq, 1)
println(eta_1) # COMPARE TO DOCUMENT

eta_2 = get_ex_of_order(eq, 2)
# println(eta_2)

eta_3 = get_ex_of_order(eq, 3)
# println(eta_3)




