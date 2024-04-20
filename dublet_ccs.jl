using SpinAdaptedSecondQuantization

include("doublet_cc_definitions.jl")

trans = translate(OccupiedOrbital => 1:2:10, VirtualOrbital => 2:2:10)

H = get_H()
P = get_sim_P(1,3)

# Evaluate all blocks needed for CCS equations
@time E_ = evaluate_equation(P*H, 1, 1)
@time E_S = evaluate_equation(P, 1, 1)

@time Ω = evaluate_equation(P*H, 1//2*χd(1), 1)
@time Ω_S = evaluate_equation(P, 1//2*χd(1), 1)

@time η = evaluate_equation(P*H, 1, χ(1))
@time η_S = evaluate_equation(P, 1, χ(1))

@time J = evaluate_equation(P*H, 1//2*χd(1), χ(1))
@time J_S = evaluate_equation(P, 1//2*χd(1), χ(1))


#
## "Eta" blocks
@time η_S_1 = evaluate_equation_2(P, 0, 1, T)
@time η_S_2 = evaluate_equation_2(P, 0, 2, T)
@time η_1 = evaluate_equation_2(P*H, 0, 1, T)
@time η_2 = evaluate_equation_2(P*H, 0, 2, T)

## "Jacobian" blocks
@time J_S_1_1 = evaluate_equation_2(1//2*P, 1, 1, T)
@time J_S_1_2 = evaluate_equation_2(1//2*P, 1, 2, T)
@time J_S_2_1 = evaluate_equation_2(P, 2, 1, T)
@time J_S_2_2 = evaluate_equation_2(P, 2, 2, T)
@time J_1_1 = evaluate_equation_2(1//2*P*H, 1, 1, T)
@time J_1_2 = evaluate_equation_2(1//2*P*H, 1, 2, T)
@time J_2_1 = evaluate_equation_2(P*H, 2, 1, T)
@time J_2_2 = evaluate_equation_2(P*H, 2, 2, T)