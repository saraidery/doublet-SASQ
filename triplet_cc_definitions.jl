using SpinAdaptedSecondQuantization
include("doublet_cc_definitions.jl")


function get_triplet_P()

	P_α_1 = get_P_spin(α, 1, 2)
	P_β_1 = get_P_spin(β, 1, 2)

	P_1 = P_β_1 - P_β_1*P_α_1

	P_α_2 = get_P_spin(α, 3, 4)
	P_β_2 = get_P_spin(β, 3, 4)

	P_2 = P_β_2 - P_β_2*P_α_2

	P = P_1*P_2

	return P

end


function get_triplet_projection_manifold(order_bra, P, T1, n_t1, T2)

	bra_op = 1
	if order_bra > 0
		bra_op = χd(order_bra)
	end

	eq = bra_op
    # Hard coded for CCSD for now
    eq = exp_T_on_bra(eq, -T1, 2)
	eq = exp_T_on_bra(eq, -T2, 1)
	eq = act_on_bra(eq * P) |> SpinAdaptedSecondQuantization.simplify
    eq = exp_T_on_bra(eq, T1, n_t1) |> SpinAdaptedSecondQuantization.simplify
	return eq

end

function project_triplet_equation_on_bra(bra, op, ket_order, T2, n_T2)

	ket_op = 1
	if ket_order > 0
		ket_op = χ(ket_order)
	end

	ex = act_on_bra(bra * op) |> SpinAdaptedSecondQuantization.simplify
	ex = exp_T_on_bra(ex, T2, n_T2) |> SpinAdaptedSecondQuantization.simplify
	ex = act_on_bra(ex * ket_op, 0) |> SpinAdaptedSecondQuantization.simplify

	return ex
end