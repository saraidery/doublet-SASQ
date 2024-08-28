using SpinAdaptedSecondQuantization


function get_P_spin(spin, p, q)

	st = real_tensor("sin(θ)")
	ct = real_tensor("cos(θ)")

	P_spin = st*st*fermiondag(p, spin)*fermion(p, spin)*occupied(p) + ct*ct*fermiondag(q, spin)*fermion(q, spin)*virtual(q) - st*ct*(fermiondag(p, spin)*fermion(q, spin) + fermiondag(q, spin)*fermion(p, spin))*virtual(q)*occupied(p)

	return P_spin

end

function get_doublet_P()

	P_α = get_P_spin(α, 1, 2)
	P_β = get_P_spin(β, 1, 2)

	P = P_β - P_β*P_α

	return P

end


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

function get_bch_operator(n, op, bch_order)

	T = sum(Tn(i) for i = 1:n)
	return bch(op, T, bch_order)

end


function get_H()

	# Define Hamiltonian in terms of F and g
	Φ = 1//2 * ∑(psym_tensor("g", 1,2,3,4) * e(1,2,3,4), 1:4) +
      	∑(-2 * psym_tensor("g", 1,2,3,3) * SpinAdaptedSecondQuantization.E(1,2) * occupied(3), 1:3) +
      	∑( 1 * psym_tensor("g", 1,3,3,2) * SpinAdaptedSecondQuantization.E(1,2) * occupied(3), 1:3)

	F = ∑(real_tensor("F", 1, 2) * SpinAdaptedSecondQuantization.E(1, 2), 1:2)

	H = F + Φ

	return H

end

function get_diagonal_F()

	F = ∑(real_tensor("F", 1, 1) * SpinAdaptedSecondQuantization.E(1, 1), 1)

	return F

end

function get_sim_H(n, bch_order)

	H = get_H()
	if (n == 1)
		return H
	else
		T = sum(Tn(i) for i = 2:n)
		return bch(H, T, bch_order)
	end
end

χ(n) = prod(SpinAdaptedSecondQuantization.E(i-1,i) for i = 2:2:2*n) * occupied(2:2:2*n...) * virtual(1:2:2*n...)
Tn(n) = 1 // factorial(n) * ∑(psym_tensor("t", 1:2*n...) * χ(n), 1:2*n)
Rn(n) = 1 // factorial(n) * ∑(psym_tensor("r", 1:2*n...) * χ(n), 1:2*n)
χd(n) = prod((fermiondag(2i-1,α)*fermion(2i,α) + fermiondag(2i-1,β)*fermion(2i,β)) for i = 2:n+1) * occupied(3:2:2(n+1)...) * virtual(4:2:2(n+1)...)


function exp_T_on_bra(bra, operator, order)

	new_bra = bra
	tmp_bra = bra

	for i in 1 : order
		tmp_bra = 1//i * tmp_bra * operator |> act_on_bra |> SpinAdaptedSecondQuantization.simplify
		new_bra = new_bra + tmp_bra
	end

    return new_bra

end

act_on_bra(x, max_ops=Inf) = act_on_ket(x', max_ops)'


function get_projection_manifold(order_bra, P, T2, n_t2)
	# n_t2 is the order we need in exp(-T2) for the original projection manifold
	# For CCSD, this means n_t2 <= 1, for CCSDTQ, n_t2 <= 2, etc.

	bra_op = 1
	if order_bra > 0
		bra_op = χd(order_bra)
	end

	eq = bra_op
	eq = exp_T_on_bra(eq, -T2, 1) # Hard coded for CCSD for now
	eq = act_on_bra(eq * P) |> SpinAdaptedSecondQuantization.simplify
	eq = exp_T_on_bra(eq, T2, n_t2) |> simplify_heavy

	return eq

end

function get_ex_of_order(ex, exci_order)

	ex = SpinAdaptedSecondQuantization.Expression(ex.terms[[length(t.operators) == 2*exci_order for t in ex.terms]])
	ex = simplify_heavy(ex)
	return ex

end


function project_equation_on_bra(bra, op, ket_order, T2, n_T2)

	ket_op = 1
	if ket_order > 0
		ket_op = χ(ket_order)
	end

	ex = exp_T_on_bra(bra, -T2, n_T2) |> SpinAdaptedSecondQuantization.simplify
	ex = act_on_bra(ex * op) |> SpinAdaptedSecondQuantization.simplify
	ex = exp_T_on_bra(ex, T2, n_T2) |> SpinAdaptedSecondQuantization.simplify
	ex = act_on_bra(ex * ket_op, 0) |> SpinAdaptedSecondQuantization.simplify

	return ex
end

function project_op_on_bra(bra, op, ket_order)

	ket_op = 1
	if ket_order > 0
		ket_op = χ(ket_order)
	end

	ex = act_on_bra(bra * op * ket_op, 0) |> SpinAdaptedSecondQuantization.simplify_heavy

	return ex
end