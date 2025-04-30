using SpinAdaptedSecondQuantization

include("doublet_cc_definitions.jl")
include("fixed_tensor_manipulations.jl")
include("code_generation_helpers.jl")

# Define translator for nice prints
trans = translate(OccupiedOrbital => 1:2:20, VirtualOrbital => 2:2:20)

# Get operators (T1 transformed)
P = get_doublet_P()

tau = SpinAdaptedSecondQuantization.E(6, 5) * SpinAdaptedSecondQuantization.E(8, 7) * occupied(5) * occupied(7) * virtual(8) * virtual(6)
P_comm = commutator(P, tau)

tau_d = SpinAdaptedSecondQuantization.E(5, 6) * SpinAdaptedSecondQuantization.E(7, 8) * occupied(5) * occupied(7) * virtual(8) * virtual(6)

op = tau_d*P_comm

res = act_on_ket(op, 0)
res = put_trig_in_scalar(res) |> simplify_heavy

#println((res, trans))

# SINGLES


tau = SpinAdaptedSecondQuantization.E(6, 5) * occupied(5) * virtual(6)
P_comm = commutator(P, tau)

tau_d = SpinAdaptedSecondQuantization.E(5, 6) * occupied(5) * virtual(6)

op = tau_d*P_comm

res = act_on_ket(op, 0)
res = put_trig_in_scalar(res) |> simplify_heavy


#println((res, trans))

# SINGLES WITH F

F = ∑(real_tensor("F", 1, 2) * SpinAdaptedSecondQuantization.E(1, 2), 1:2)

tau = SpinAdaptedSecondQuantization.E(6, 5) * occupied(5) * virtual(6)
tau_d = 1//2*SpinAdaptedSecondQuantization.E(5, 6) * occupied(5) * virtual(6)

P_comm = commutator(F, tau)

op = tau_d*P_comm

res = act_on_ket(op, 0)
res = put_trig_in_scalar(res) |> simplify_heavy


println((res, trans))

# Doubles WITH F

F = ∑(real_tensor("F", 1, 1) * SpinAdaptedSecondQuantization.E(1, 1), 1)

tau = SpinAdaptedSecondQuantization.E(6, 5) * SpinAdaptedSecondQuantization.E(8, 7) * occupied(5) * occupied(7) * virtual(8) * virtual(6)
tau_d = SpinAdaptedSecondQuantization.E(5, 6) * SpinAdaptedSecondQuantization.E(7, 8) * occupied(5) * occupied(7) * virtual(8) * virtual(6)

P_comm = commutator(F, tau)

op = tau_d*P_comm

res = act_on_ket(op, 0)
res = put_trig_in_scalar(res) |> simplify_heavy


println((res, trans))
