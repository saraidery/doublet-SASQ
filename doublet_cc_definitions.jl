using SpinAdaptedSecondQuantization
using SymPy

function get_P()

	st_sq = real_tensor("sin(θ)^2")
	ct_sq = real_tensor("cos(θ)^2")
	st_ct = real_tensor("sin(θ)cos(θ)")

	P_α = st_sq*fermiondag(1, α)*fermion(1, α)*occupied(1) + ct_sq*fermiondag(2, α)*fermion(2, α)*virtual(2) - st_ct*(fermiondag(1, α)*fermion(2, α) + fermiondag(2, α)*fermion(1, α))*virtual(2)*occupied(1)
	P_β = st_sq*fermiondag(1, β)*fermion(1, β)*occupied(1) + ct_sq*fermiondag(2, β)*fermion(2, β)*virtual(2) - st_ct*(fermiondag(1, β)*fermion(2, β) + fermiondag(2, β)*fermion(1, β))*virtual(2)*occupied(1)

	# Doublet projector
	P = P_β - P_β*P_α

	return P

end

function get_triplet_P()

	st_sq = real_tensor("sin(θ)^2")
	ct_sq = real_tensor("cos(θ)^2")
	st_ct = real_tensor("sin(θ)cos(θ)")

	P1_α = st_sq*fermiondag(1, α)*fermion(1, α)*occupied(1) + ct_sq*fermiondag(2, α)*fermion(2, α)*virtual(2) - st_ct*(fermiondag(1, α)*fermion(2, α) + fermiondag(2, α)*fermion(1, α))*virtual(2)*occupied(1)
	P1_β = st_sq*fermiondag(1, β)*fermion(1, β)*occupied(1) + ct_sq*fermiondag(2, β)*fermion(2, β)*virtual(2) - st_ct*(fermiondag(1, β)*fermion(2, β) + fermiondag(2, β)*fermion(1, β))*virtual(2)*occupied(1)

	P2_α = st_sq*fermiondag(3, α)*fermion(3, α)*occupied(3) + ct_sq*fermiondag(4, α)*fermion(4, α)*virtual(4) - st_ct*(fermiondag(3, α)*fermion(4, α) + fermiondag(4, α)*fermion(3, α))*virtual(4)*occupied(3)
	P2_β = st_sq*fermiondag(3, β)*fermion(3, β)*occupied(3) + ct_sq*fermiondag(4, β)*fermion(4, β)*virtual(4) - st_ct*(fermiondag(3, β)*fermion(4, β) + fermiondag(4, β)*fermion(3, β))*virtual(4)*occupied(3)

	# Doublet projector
	P1 = P1_β - P1_β*P1_α
	P2 = P2_β - P2_β*P2_α

	P = P1 * P2

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
χd(n) = prod(SpinAdaptedSecondQuantization.E(2i-1, 2i) for i = 2:n+1) * occupied(3:2:2(n+1)...) * virtual(4:2:2(n+1)...)


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

function evaluate_equation(op, order_bra, order_ket, T=1)

	bra_op = 1
	if order_bra > 0
		bra_op = χd(order_bra)
	end

	ket_op = 1
	if order_ket > 0
		ket_op = χ(order_ket)
	end

	if (T == 1)

		eq = bra_op * op |> act_on_bra |> SpinAdaptedSecondQuantization.simplify
		ex = simplify_heavy(act_on_bra(eq * ket_op, 0))

	else

		eq = exp_T_on_bra(bra_op, -T, 1)
		eq = eq * op |> act_on_bra |> SpinAdaptedSecondQuantization.simplify
		eq = exp_T_on_bra(eq, T, 3)
		eq = eq * ket_op |> act_on_bra |> SpinAdaptedSecondQuantization.simplify
		ex = simplify_heavy(act_on_bra(eq, 0))
	end

    return ex

end


function evaluate_projected_equation(projector, op, order_bra, order_ket, T=1)

	bra_op = 1
	if order_bra > 0
		bra_op = χd(order_bra)
	end

	ket_op = 1
	if order_ket > 0
		ket_op = χ(order_ket)
	end

	if (T == 1)

		eq = bra_op * projector |> act_on_bra |> SpinAdaptedSecondQuantization.simplify
		eq = eq * op |> act_on_bra |> SpinAdaptedSecondQuantization.simplify
		ex = simplify_heavy(act_on_bra(eq * ket_op, 0))

	else

		eq = exp_T_on_bra(bra_op, -T, 1)
		eq = SpinAdaptedSecondQuantization.simplify(act_on_bra(eq * projector, 4))
		#eq = eq * op |> act_on_bra |> simplify
		eq = SpinAdaptedSecondQuantization.simplify(act_on_bra(eq * op, 6))
		eq = exp_T_on_bra(eq, T, 3)
		eq = eq * ket_op |> act_on_bra |> SpinAdaptedSecondQuantization.simplify
		ex = simplify_heavy(act_on_bra(eq, 0))
	end

    return ex

end


function evaluate_projected_equation_wo_T1(projector, op, order_bra, order_ket, T1, T2)

	bra_op = 1
	if order_bra > 0
		bra_op = χd(order_bra)
	end

	ket_op = 1
	if order_ket > 0
		ket_op = χ(order_ket)
	end

	eq = bra_op
	if bra_op > 0
		eq = exp_T_on_bra(eq, -T2, 1)
		eq = exp_T_on_bra(eq, -T1, 2)
	end
	eq = SpinAdaptedSecondQuantization.simplify(act_on_bra(eq * projector))
	eq = exp_T_on_bra(eq, T1, 4)
	eq = eq * op |> act_on_bra |> SpinAdaptedSecondQuantization.simplify
	eq = exp_T_on_bra(eq, T2, 3)
	eq = eq * ket_op |> act_on_bra |> SpinAdaptedSecondQuantization.simplify
	ex = simplify_heavy(act_on_bra(eq, 0))

    return ex

end

function replace_trig_tensors!(tensors)

	s_2 = [t.symbol == "sin(θ)^2" for t in tensors]
	c_2 = [t.symbol == "cos(θ)^2" for t in tensors]
	s_c = [t.symbol == "sin(θ)cos(θ)" for t in tensors]

	other_tensors = tensors[[(t.symbol != "sin(θ)^2" && t.symbol != "cos(θ)^2" && t.symbol != "sin(θ)cos(θ)" ) for t in tensors]]

	if (count(s_2) == 2)
		t = SpinAdaptedSecondQuantization.RealTensor("sin(θ)^4",[])
		other_tensors = push!(other_tensors, t)
	elseif (count(c_2) == 2)
		t = SpinAdaptedSecondQuantization.RealTensor("cos(θ)^4",[])
		other_tensors = push!(other_tensors, t)
	elseif (count(s_2) == 1 && count(c_2) == 1)
		t = SpinAdaptedSecondQuantization.RealTensor("sin(θ)^2cos(θ)^2",[])
		other_tensors = push!(other_tensors, t)
	elseif (count(s_c) == 2)
		t = SpinAdaptedSecondQuantization.RealTensor("sin(θ)^2cos(θ)^2",[])
		other_tensors = push!(other_tensors, t)
	elseif (count(c_2) == 1 && count(s_c) == 1)
		t = SpinAdaptedSecondQuantization.RealTensor("cos(θ)^3sin(θ)",[])
		other_tensors = push!(other_tensors, t)
	elseif (count(s_2) == 1 && count(s_c) == 1)
		t = SpinAdaptedSecondQuantization.RealTensor("sin(θ)^3cos(θ)",[])
		other_tensors = push!(other_tensors, t)
	else
		other_tensors = tensors
	end

	return other_tensors

end

function replace_trig(ex)
	new_terms = SpinAdaptedSecondQuantization.Term[]
	for (i, t) = enumerate(ex.terms)
		tensors = replace_trig_tensors!(t.tensors)

		new_term = SpinAdaptedSecondQuantization.Term(
                t.scalar,
                t.sum_indices,
                t.deltas,
                tensors,
                t.operators,
                t.constraints
            )

		push!(new_terms, new_term)

	end
	return SpinAdaptedSecondQuantization.Expression(new_terms)
end


function replace_trig_tensors_with_scalar!(tensors)
	θ = symbols("θ")
	c2 = cos(θ)^2
	s2 = sin(θ)^2
	sc = sin(θ)*cos(θ)

	n_c2 = count([t.symbol == "cos(θ)^2" for t in tensors])
	n_sc = count([t.symbol == "sin(θ)cos(θ)" for t in tensors])
	n_s2 = count([t.symbol == "sin(θ)^2" for t in tensors])

	other_tensors = tensors[[(t.symbol != "sin(θ)^2" && t.symbol != "cos(θ)^2" && t.symbol != "sin(θ)cos(θ)" ) for t in tensors]]

	new_scalar = c2^n_c2 * s2^n_s2 * sc^n_sc

	return other_tensors, new_scalar

end

function put_trig_in_scalar(ex)
	new_terms = SpinAdaptedSecondQuantization.Term[]
	for (i, t) = enumerate(ex.terms)
		tensors, new_scalar = replace_trig_tensors_with_scalar!(t.tensors)

		new_term = SpinAdaptedSecondQuantization.Term(
                t.scalar * new_scalar,
                t.sum_indices,
                t.deltas,
                tensors,
                t.operators,
                t.constraints
            )

		push!(new_terms, new_term)

	end
	return SpinAdaptedSecondQuantization.Expression(new_terms)
end

function replace_fixed_tensors_with_scalar!(tensors)
	t1 = symbols("t_ai")
	t2 = symbols("t_aiai")
	n_t1 = count([t.indices == [2, 1] for t in tensors])
	n_t2 = count([t.indices == [2, 1, 2, 1] for t in tensors])

	other_tensors = tensors[[!(t.indices == [2, 1]) && !(t.indices == [2, 1, 2, 1]) for t in tensors]]

	new_scalar = t1^n_t1 * t2^n_t2

	return other_tensors, new_scalar

end

function put_fixed_tensor_in_scalar(ex)
	new_terms = SpinAdaptedSecondQuantization.Term[]
	for (i, t) = enumerate(ex.terms)
		if !(1 in t.sum_indices) && ! (2 in t.sum_indices)

			tensors, new_scalar = replace_fixed_tensors_with_scalar!(t.tensors)

			new_term = SpinAdaptedSecondQuantization.Term(
			        t.scalar * new_scalar,
			        t.sum_indices,
			        t.deltas,
			        tensors,
			        t.operators,
			        t.constraints
			    )

			push!(new_terms, new_term)
		end
	end
	return SpinAdaptedSecondQuantization.Expression(new_terms)
end