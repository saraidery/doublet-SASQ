using SpinAdaptedSecondQuantization



include("doublet_cc_definitions.jl")
include("fixed_tensor_manipulations.jl")
include("code_generation_helpers.jl")

# Define translator for nice prints
trans = translate(OccupiedOrbital => 2:2:20, VirtualOrbital => 1:2:20)

# Get operators (T1 transformed)
H = get_H()
T2 = Tn(2)

E(p, q) = SpinAdaptedSecondQuantization.E(p, q)

# Left excitation operator
@show L1 = Ln(1)


eq = project_equation_on_bra(L1, H, 1, T2, 3) |> SpinAdaptedSecondQuantization.simplify_heavy

@time eq = look_for_tensor_replacements_smart(eq, make_exchange_transformer("t", "u")) |> SpinAdaptedSecondQuantization.simplify
@time eq = look_for_tensor_replacements_smart(eq, make_exchange_transformer("g", "L")) |> SpinAdaptedSecondQuantization.simplify_heavy


println((eq,trans))

generate_eT_code("L_1_H_1", "L_1_H_1", eq, "sigma_ai", [1, 2], trans, "doublet_ccsd")

