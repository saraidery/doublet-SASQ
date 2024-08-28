using SpinAdaptedSecondQuantization

include("doublet_cc_definitions.jl")
include("fixed_tensor_manipulations.jl")
include("code_generation_helpers.jl")

# Define translator for nice prints
trans = translate(OccupiedOrbital => 1:2:20, VirtualOrbital => 2:2:20)

E(p, q) = SpinAdaptedSecondQuantization.E(p, q)

# Get operators (T1 transformed)
H = get_diagonal_F()
P = get_doublet_P()
P = get_bch_operator(1, P, 4) |> SpinAdaptedSecondQuantization.simplify

T2 = Tn(2)
@show T2

# Define projection manifolds <χ| = <μ| exp(-T2) P
# NOTE: we use annihilation and creation operators and not the singlet E operators.
# This is because we want to count the excitation order

bra_op = 1//2 * E(3,4)*occupied(3)*virtual(4)
ket_op = E(4,3)*occupied(3)*virtual(4)
μ_1 = get_projection_manifold(0, bra_op * P, T2, 1) |> SpinAdaptedSecondQuantization.simplify

H_diag_1 = project_equation_on_bra(μ_1, H * ket_op, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy
S_diag_1 = project_equation_on_bra(μ_1, ket_op, 0, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy

H_diag_1 = look_for_tensor_replacements_smart(H_diag_1, make_exchange_transformer("t", "u")) |> SpinAdaptedSecondQuantization.simplify
S_diag_1 = look_for_tensor_replacements_smart(S_diag_1, make_exchange_transformer("t", "u")) |> SpinAdaptedSecondQuantization.simplify_heavy


H_diag_1 = change_summation_indices(H_diag_1)
H_diag_1 = rename_tensors(H_diag_1)
H_diag_1 = compress_trig(H_diag_1)


S_diag_1 = change_summation_indices(S_diag_1)
S_diag_1 = rename_tensors(S_diag_1)
S_diag_1 = compress_trig(S_diag_1)

#generate_eT_code("H_diag_1", "H_diag_1", H_diag_1, "h_ai", [4, 3], trans, "doublet_ccsd")

println()
println("H = ", (H_diag_1,trans))
println()

H_1, H_2 = split_with_deltas(H_diag_1)

H_2_b, H_2_rest = split_with_delta_index(H_2, 3)
H_2_j, H_2_rest = split_with_delta_index(H_2, 4)
H_2_rest, H_2_bj = split_with_delta_index(H_2_rest, 3)

H_2_b = strip_deltas(H_2_b)
H_2_j = strip_deltas(H_2_j)
H_2_bj = strip_deltas(H_2_bj)

println("\n H_1= ", (H_1, trans))

generate_eT_code("H_diag_1", "H_diag_1", H_1, "h_ai", [4, 3], trans, "doublet_ccsd")
generate_eT_code("H_diag_1_j", "H_diag_1_j", H_2_b, "h_i", [3], trans, "doublet_ccsd")
generate_eT_code("H_diag_1_b", "H_diag_1_b", H_2_j, "h_a", [4], trans, "doublet_ccsd")
generate_eT_code("H_diag_1_bj", "H_diag_1_bj", H_2_bj, "h", [], trans, "doublet_ccsd")

println("\n S = ", (S_diag_1,trans))
