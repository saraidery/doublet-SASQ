using SpinAdaptedSecondQuantization


function get_P()

	st = real_tensor("sin(θ)")
	ct = real_tensor("cos(θ)")

	P_α = st*st*fermiondag(1, α)*fermion(1, α)*occupied(1) + ct*ct*fermiondag(2, α)*fermion(2, α)*virtual(2) - st*ct*(fermiondag(1, α)*fermion(2, α) + fermiondag(2, α)*fermion(1, α))*virtual(2)*occupied(1)
	P_β = st*st*fermiondag(1, β)*fermion(1, β)*occupied(1) + ct*ct*fermiondag(2, β)*fermion(2, β)*virtual(2) - st*ct*(fermiondag(1, β)*fermion(2, β) + fermiondag(2, β)*fermion(1, β))*virtual(2)*occupied(1)

	# Doublet projector
	P = P_β - P_β*P_α

	return P

end

function get_sim_P(n, bch_order)

	P = get_P()
	T = sum(Tn(i) for i = 1:n)
	return bch(P, T, bch_order)

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

function get_sim_H(n, bch_order)

	H = get_H()
	if (n == 1)
		return H
	else
		T = sum(Tn(i) for i = 2:n)
		return bch(H, T, bch_order)
	end
end

χ(n) = prod(SpinAdaptedSecondQuantization.E(2i-1,2i) for i = 2:n+1) * occupied(4:2:2(n+1)...) * virtual(3:2:2(n+1)...)
Tn(n) = 1 // factorial(n) * ∑(psym_tensor("t", 3:2(n+1)...) * χ(n), 3:2(n+1))
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


function get_projection_manifold(order_bra, P, T2, n_t2=1)
	# n_t2 is the order we need in exp(-T2) for the original projection manifold
	# For CCSD, this means n_t2 <= 1, for CCSDTQ, n_t2 <= 2, etc.

	bra_op = 1
	if order_bra > 0
		bra_op = χd(order_bra)
	end

	eq = bra_op
	eq = exp_T_on_bra(eq, -T2, n_t2)
	eq = act_on_bra(eq * P) |> simplify_heavy

	return eq

end

function get_ex_of_order(ex, exci_order)

	return SpinAdaptedSecondQuantization.Expression(ex.terms[[length(t.operators) == 2*exci_order for t in ex.terms]])

end


function project_equation_on_bra(bra, op, ket_order, T2, n_T2)

	ket_op = 1
	if ket_order > 0
		ket_op = χ(ket_order)
	end

	ex = act_on_bra(bra * op) |> SpinAdaptedSecondQuantization.simplify
	ex = exp_T_on_bra(ex, T2, n_T2) |> SpinAdaptedSecondQuantization.simplify
	ex = act_on_bra(ex * ket_op, 0) |> SpinAdaptedSecondQuantization.simplify

	return ex
end