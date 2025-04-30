using SpinAdaptedSecondQuantization

using Serialization


include("doublet_cc_definitions.jl")
include("fixed_tensor_manipulations.jl")

trans = translate(OccupiedOrbital => 1:2:20, VirtualOrbital => 2:2:20)

P = get_doublet_P()
H = get_H()

T1 = Tn(1)
T2 = Tn(2)
T = T1 + T2

function exp_T_on_ket(ket, operator, order)
    new_ket = ket
    tmp_ket = ket

    for i in 1 : order
        tmp_ket = 1//i * operator * tmp_ket |> act_on_ket |> simplify_heavy
        new_ket = new_ket + tmp_ket
    end

    return new_ket

end


#eq = exp_T_on_ket(1, T2, 1)
#eq = exp_T_on_ket(eq, T1, 2)
#@time eq = act_on_ket(P * eq) |> simplify_heavy
#eq = exp_T_on_ket(eq, -T2, 1)
#eq = exp_T_on_ket(eq, -T1, 2)
#@show eq




@time PT = bch(P, T, 4) |> simplify_heavy
open("PT_BCH4.txt", "w") do io
   println(io, (PT, trans))
end

serialize("PT_BCH4_store", PT)

# eq = PT |> act_on_ket |> simplify_heavy # 5 min
# #open("PT_on_ket.txt", "w") do io
# #    println(io, (eq, trans))
# #end

# eta_0 = get_ex_of_order(eq, 0)
# open("eta_0.txt", "w") do io
#     println(io, (eta_0, trans))
# end

# eta_1 = get_ex_of_order(eq, 1)
# open("eta_1.txt", "w") do io
#     println(io, (eta_1, trans))
# end

# eta_2 = get_ex_of_order(eq, 2)
# open("eta_2.txt", "w") do io
#     println(io, (eta_2, trans))
# end

# eta_3 = get_ex_of_order(eq, 3)
# open("eta_3.txt", "w") do io
#     println(io, (eta_3, trans))
# end

# eta_4 = get_ex_of_order(eq, 4)
# open("eta_4.txt", "w") do io
#     println(io, (eta_4, trans))
# end