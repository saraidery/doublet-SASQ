using SpinAdaptedSecondQuantization

include("doublet_cc_definitions.jl")

# Get operators
H = get_H()
P = get_P()

# Defining cluster operator
T2 = Tn(2)
T1 = Tn(1)

# Define translator for nice prints
trans = translate(OccupiedOrbital => 1:2:20, VirtualOrbital => 2:2:20)

# Energy equation
@time E_S = evaluate_projected_equation_wo_T1(P, 1, 0, 0, T1, T2)
@time E_H = evaluate_projected_equation_wo_T1(P, H, 0, 0, T1, T2)


E_H = look_for_tensor_replacements_smart(E_H, make_exchange_transformer("t", "u")) |> SpinAdaptedSecondQuantization.simplify
E_H = look_for_tensor_replacements_smart(E_H, make_exchange_transformer("g", "L")) |> simplify_heavy
E_H = put_trig_in_scalar(E_H)|> SpinAdaptedSecondQuantization.simplify
E_H = put_fixed_tensor_in_scalar(E_H) |> SpinAdaptedSecondQuantization.simplify

@show (E_H, trans)

# # Ω blocks
# @time Ω_S_1 = evaluate_projected_equation_wo_T1(1//2*P, 1, 1, 0, T1, T2)
# @time Ω_H_1 = evaluate_projected_equation_wo_T1(1//2*P, H, 1, 0, T1, T2)

# @time Ω_S_2 = evaluate_projected_equation_wo_T1(P, 1, 2, 0, T1, T2)
# @time Ω_H_2 = evaluate_projected_equation_wo_T1(P, H, 2, 0, T1, T2)

# Ω_H_2 = look_for_tensor_replacements_smart(Ω_H_2, make_exchange_transformer("t", "u")) |> SpinAdaptedSecondQuantization.simplify
# Ω_H_2 = look_for_tensor_replacements_smart(Ω_H_2, make_exchange_transformer("g", "L")) |> simplify_heavy
# Ω_H_2 = look_for_tensor_replacements_smart(Ω_H_2, make_exchange_transformer("t", "u")) |> simplify_heavy

# # Find symmetries
# Ω_H_2_s, Ω_H_2_ss, Ω_H_2_ns = desymmetrize(Ω_H_2, make_permutation_mappings([(3,4),(5, 6)]))

# Ω_H_2_s = put_trig_in_scalar(Ω_H_2_s)|> SpinAdaptedSecondQuantization.simplify
# Ω_H_2_ss = put_trig_in_scalar(Ω_H_2_ss)|> SpinAdaptedSecondQuantization.simplify


# open("dublet_omega_doubles.txt", "w") do io
#     println(io, "\nΩ_H_2_s = ")
#     println(io, (Ω_H_2_s, trans))
#     println(io, "\nΩ_H_2_s = ")
#     println(io, (Ω_H_2_ss, trans))
# end

# # η blocks
# @time η_S_1 = evaluate_equation(P, 0, 1, T)
# @time η_H_1 = evaluate_equation(P*H, 0, 1, T)

# @time η_S_2 = evaluate_equation(P, 0, 2, T)
# @time η_H_2 = evaluate_equation(P*H, 0, 2, T)

# # J blocks
# @time J_S_1_1 = evaluate_equation(1//2*P, 1, 1, T)
# @time J_H_1_1 = evaluate_equation(1//2*P*H, 1, 1, T)

# @time J_S_1_2 = evaluate_equation(1//2*P, 1, 2, T)
# @time J_H_1_2 = evaluate_equation(1//2*P*H, 1, 2, T)

# @time J_S_2_1 = evaluate_equation(P, 2, 1, T)
# @time J_H_2_1 = evaluate_equation(P*H, 2, 1, T)
# @time J_S_2_2 = evaluate_equation(P, 2, 2, T)
# @time J_H_2_2 = evaluate_equation(P*H, 2, 2, T