using SpinAdaptedSecondQuantization

include("spin_excitation_operator.jl")



function get_P_spin(spin, p, q)

	st = real_tensor("sin(θ)")
	ct = real_tensor("cos(θ)")

	P_spin = st*st*fermiondag(p, spin)*fermion(p, spin)*occupied(p) + ct*ct*fermiondag(q, spin)*fermion(q, spin)*virtual(q) - st*ct*(fermiondag(p, spin)*fermion(q, spin) + fermiondag(q, spin)*fermion(p, spin))*virtual(q)*occupied(p)

	return P_spin

end

function get_P_spin_2(spin, p, q)

	st = real_tensor("sin(θ)")
	ct = real_tensor("cos(θ)")

	P_spin = (st*st*A(p, p, spin)*occupied(p)
		   + ct*ct*A(q, q, spin)*virtual(q)
		   - st*ct*(A(p, q, spin) + A(q, p, spin))*virtual(q)*occupied(p))

	return P_spin

end

function get_P_spin_fixed(spin, p, q)

	st = sin(1//4)
	ct = cos(1//4)

	P_spin = st*st*fermiondag(p, spin)*fermion(p, spin)*occupied(p) + ct*ct*fermiondag(q, spin)*fermion(q, spin)*virtual(q) - st*ct*(fermiondag(p, spin)*fermion(q, spin) + fermiondag(q, spin)*fermion(p, spin))*virtual(q)*occupied(p)

	return P_spin

end

function get_doublet_P_2()

	P_β = get_P_spin_2(β, 1, 2)
	st = real_tensor("sin(θ)")
	ct = real_tensor("cos(θ)")

	P = (P_β - ct*ct*ct*ct*A(2, 2, β)A(2, 2, α)*virtual(2)
			 + 2*ct*ct*ct*st*A(2, 2, β)A(1, 2, α)*virtual(2)*occupied(1)
			 + 2*ct*ct*ct*st*A(2, 2, β)A(2, 1, α)*virtual(2)*occupied(1)
			 - 2*ct*ct*st*st*A(1, 1, β)A(2, 2, α)*virtual(2)*occupied(1)
			 - ct*ct*st*st*A(1, 2, β)A(1, 2, α)*virtual(2)*occupied(1)
			 - ct*ct*st*st*A(2, 1, β)A(2, 1, α)*virtual(2)*occupied(1)
			 - 2*ct*ct*st*st*A(2, 1, β)A(1, 2, α)*virtual(2)*occupied(1)
			 + 2*ct*st*st*st*A(1, 1, β)A(1, 2, α)*virtual(2)*occupied(1)
			 + 2*ct*st*st*st*A(1, 1, β)A(2, 1, α)*virtual(2)*occupied(1)
			 - st*st*st*st*A(1, 1, β)A(1, 1, α)*occupied(1))


	return P

end

function get_doublet_P()

	P_α = get_P_spin(α, 1, 2)
	P_β = get_P_spin(β, 1, 2)

	P = P_β - P_β*P_α

	return P

end

function get_doublet_P_fixed()

	P_α = get_P_spin_fixed(α, 1, 2)
	P_β = get_P_spin_fixed(β, 1, 2)

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

#Sn = ∑(real_tensor("s", 3:6...)*E(4,3)*E(6,1)*E(2,5), 3:6...)

χ(n) = prod(SpinAdaptedSecondQuantization.E(i-1,i) for i = 4:2:2*n+2) * occupied(4:2:2*n+2...) * virtual(3:2:2*n+2...)
Tn(n) = 1 // factorial(n) * ∑(psym_tensor("t", 3:2*n+2...) * χ(n), 3:2*n+2)
Sn = ∑(real_tensor("x", 4,3,6,5)*E(4,3)*E(6,1)*E(2,5)*occupied(1,3,5)*virtual(2,4,6), 3:6)
Rn(n) = 1 // factorial(n) * ∑(psym_tensor("r", 1:2*n...) * χ(n), 1:2*n)
Ln(n) = 1 // factorial(n) * ∑(psym_tensor("l", 1:2*n...) * χdag(n), 1:2*n)
χd(n) = prod((fermiondag(2i-1,α)*fermion(2i,α) + fermiondag(2i-1,β)*fermion(2i,β)) for i = 2:n+1) * occupied(3:2:2(n+1)...) * virtual(4:2:2(n+1)...)
χdag(n) = prod(SpinAdaptedSecondQuantization.E(i,i-1) for i = 4:2:2*n+2) * occupied(4:2:2*n+2...) * virtual(3:2:2*n+2...)


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

	ex = SpinAdaptedSecondQuantization.Expression(ex.terms[[length(t.operators) == exci_order for t in ex.terms]])
	ex = simplify_heavy(ex)
	return ex

end

function is_legal_operator(term)

	if length(term.operators) < 3
		return true
	end

	for (i, op) in enumerate(term.operators)
		indices_i = (op.p, op.q)
		for j in i+1:length(term.operators)
			indices_j = (term.operators[j].p, term.operators[j].q)
			for k in j+1:length(term.operators)
				indices_k = (term.operators[k].p, term.operators[k].q)
				if (1 in indices_i && 1 in indices_j && 1 in indices_k) ||
				   (2 in indices_i && 2 in indices_j && 2 in indices_k)
				    println(op, term.operators[j], term.operators[k])
					return false
				end
			end
		end
	end

	return true

end

function is_legal_amplitude(tensors)

	relevant_tensors = tensors[[length(t.indices) == 4 for t in tensors]]
	relevant_tensors = relevant_tensors[[(t.symbol == "x") || (t.symbol == "t") for t in relevant_tensors]]

	for t in relevant_tensors

		indices = t.indices[[s != 1 for s in t.indices]]

		if length(indices) < 3
			println(t.symbol, t.indices)
			return false
		end

		indices = t.indices[[s != 2 for s in t.indices]]

		if length(indices) < 3
			println(t.symbol, t.indices)
			return false
		end

	end

	return true

end

function is_legal_delta(deltas)

	for d in deltas

		indices = d.indices[[s != 1 && s!= 2 for s in d.indices]]

		if length(indices) == 2
			println(indices)
			return false
		end

	end

	return true

end

function remove_illegal_operators(eq)

	new_terms = SpinAdaptedSecondQuantization.Term[]
	for term in eq.terms
		if (is_legal_operator(term))
			new_term = SpinAdaptedSecondQuantization.Term(
				term.scalar,
				term.sum_indices,
				term.deltas,
				term.tensors,
				term.operators,
				term.constraints
			)
			push!(new_terms, new_term)
		end
	end
	return SpinAdaptedSecondQuantization.Expression(new_terms)
end

function remove_illegal_deltas(eq)

	new_terms = SpinAdaptedSecondQuantization.Term[]
	for term in eq.terms
		if (is_legal_delta(term.deltas))
			new_term = SpinAdaptedSecondQuantization.Term(
				term.scalar,
				term.sum_indices,
				term.deltas,
				term.tensors,
				term.operators,
				term.constraints
			)
			push!(new_terms, new_term)
		end
	end
	return SpinAdaptedSecondQuantization.Expression(new_terms)
end

function remove_illegal_amplitudes(eq)

	new_terms = SpinAdaptedSecondQuantization.Term[]
	for term in eq.terms
		if (is_legal_amplitude(term.tensors))
			new_term = SpinAdaptedSecondQuantization.Term(
				term.scalar,
				term.sum_indices,
				term.deltas,
				term.tensors,
				term.operators,
				term.constraints
			)
			push!(new_terms, new_term)
		end
	end
	return SpinAdaptedSecondQuantization.Expression(new_terms)
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



function make_C_p_E_transformer(from, to)
    function g2L_transformer(t::T) where {T<:SpinAdaptedSecondQuantization.Tensor}
        if length(SpinAdaptedSecondQuantization.get_indices(t)) != 4 || SpinAdaptedSecondQuantization.get_symbol(t) != from
            return
        end

        1, SpinAdaptedSecondQuantization.reorder_indices(t, [1, 4, 3, 2]), 1, T(to, SpinAdaptedSecondQuantization.get_indices(t))
    end

    g2L_transformer
end

function make_C_m_E_transformer(from, to)
    function g2L_transformer(t::T) where {T<:SpinAdaptedSecondQuantization.Tensor}
        if length(SpinAdaptedSecondQuantization.get_indices(t)) != 4 || SpinAdaptedSecondQuantization.get_symbol(t) != from
            return
        end

        -1, SpinAdaptedSecondQuantization.reorder_indices(t, [1, 4, 3, 2]), 1, T(to, SpinAdaptedSecondQuantization.get_indices(t))
    end

    g2L_transformer
end

function make_exchange_transformer_2(from, to)
    function g2L_transformer(t::T) where {T<:SpinAdaptedSecondQuantization.Tensor}
        if length(SpinAdaptedSecondQuantization.get_indices(t)) != 4 || SpinAdaptedSecondQuantization.get_symbol(t) != from
            return
        end

        -1//2, SpinAdaptedSecondQuantization.reorder_indices(t, [3, 2, 1, 4]), 1//2, T(to, SpinAdaptedSecondQuantization.get_indices(t))
    end

    g2L_transformer
end

function make_C_p_E_transformer_2(from, to)
    function g2L_transformer(t::T) where {T<:SpinAdaptedSecondQuantization.Tensor}
        if length(SpinAdaptedSecondQuantization.get_indices(t)) != 4 || SpinAdaptedSecondQuantization.get_symbol(t) != from
            return
        end

        1, SpinAdaptedSecondQuantization.reorder_indices(t, [3, 2, 1, 4]), 1, T(to, SpinAdaptedSecondQuantization.get_indices(t))
    end

    g2L_transformer
end

function make_C_m_E_transformer_2(from, to)
    function g2L_transformer(t::T) where {T<:SpinAdaptedSecondQuantization.Tensor}
        if length(SpinAdaptedSecondQuantization.get_indices(t)) != 4 || SpinAdaptedSecondQuantization.get_symbol(t) != from
            return
        end

        -1, SpinAdaptedSecondQuantization.reorder_indices(t, [3, 2, 1, 4]), 1, T(to, SpinAdaptedSecondQuantization.get_indices(t))
    end

    g2L_transformer
end

function transform_singles_operators(eq)

	if length(get_ex_of_order(eq, 1).terms) != length(eq.terms)
		println("Terms are not all singles. Will not transform!")
		return eq
	end

	new_terms = SpinAdaptedSecondQuantization.Term[]
	for term in eq.terms
		factor, new_operators = transform_operator(term.operators[1])

			new_term = SpinAdaptedSecondQuantization.Term(
				term.scalar*factor,
				term.sum_indices,
				term.deltas,
				term.tensors,
				new_operators,
				term.constraints
			)
			push!(new_terms, new_term)
	end

	return SpinAdaptedSecondQuantization.Expression(new_terms)

end

function transform_operator(op)

	if ! isa(op, SpinExcitationOperator)
		return 1, [op]
	end

	p = op.p
	q = op.q
	op = SpinAdaptedSecondQuantization.SingletExcitationOperator(p, q)

	return 1//2, [op]

end

function swap_spin_operator(op)

	if ! isa(op, SpinExcitationOperator)
		return 1, [op]
	end

	p = op.p
	q = op.q
	spin = op.spin
	op = SpinExcitationOperator(p, q, spin == α ? β : α)

	return op

end


function transform_doubles_operators(eq)

	if length(get_ex_of_order(eq, 2).terms) != length(eq.terms)
		println("Terms are not all doubles. Will not transform!")
		return eq
	end

	new_terms = SpinAdaptedSecondQuantization.Term[]
	for term in eq.terms

		if (isa(term.operators[1], SpinExcitationOperator) # Assuming operators are ordered.
			&& isa(term.operators[2], SpinAdaptedSecondQuantization.SingletExcitationOperator))

			factor, new_operators = transform_operator(term.operators[1])
			push!(new_operators, term.operators[2])

		elseif (isa(term.operators[1], SpinExcitationOperator)
				&& isa(term.operators[2], SpinExcitationOperator)
				&& term.operators[1].spin == α)

			op_1 = swap_spin_operator(term.operators[1])
			op_2 = swap_spin_operator(term.operators[2])
			new_operators = [op_1, op_2]
			factor = 1

		else
			factor = 1
			new_operators = term.operators
		end

			new_term = SpinAdaptedSecondQuantization.Term(
				term.scalar*factor,
				term.sum_indices,
				term.deltas,
				term.tensors,
				new_operators,
				term.constraints
			)
			push!(new_terms, new_term)
	end

	return SpinAdaptedSecondQuantization.Expression(new_terms)

end

function transform_triples_operators(eq)

	if length(get_ex_of_order(eq, 3).terms) != length(eq.terms)
		println("Terms are not all triples. Will not transform!")
		return eq
	end

	new_terms = SpinAdaptedSecondQuantization.Term[]
	for term in eq.terms

		if (isa(term.operators[1], SpinExcitationOperator)
			&& isa(term.operators[2], SpinAdaptedSecondQuantization.SingletExcitationOperator)
			&& isa(term.operators[3], SpinAdaptedSecondQuantization.SingletExcitationOperator))

			factor, new_operators = transform_operator(term.operators[1])
			push!(new_operators, term.operators[2], term.operators[3])

		elseif (isa(term.operators[1], SpinExcitationOperator)
				&& isa(term.operators[2], SpinExcitationOperator)
				&& term.operators[1].spin == α)

			op_1 = swap_spin_operator(term.operators[1])
			op_2 = swap_spin_operator(term.operators[2])
			new_operators = [op_1, op_2, term.operators[3]]
			factor = 1

		else
			factor = 1
			new_operators = term.operators
		end

			new_term = SpinAdaptedSecondQuantization.Term(
				term.scalar*factor,
				term.sum_indices,
				term.deltas,
				term.tensors,
				new_operators,
				term.constraints
			)
			push!(new_terms, new_term)
	end

	return SpinAdaptedSecondQuantization.Expression(new_terms)

end