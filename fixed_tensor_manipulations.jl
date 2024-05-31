using SpinAdaptedSecondQuantization
using SymPy

θ = symbols("θ", real=true)
st = sin(θ)
ct = cos(θ)
t1= symbols("t_AI", real=true)
t2 = symbols("t_AIAI", real=true)

function replace_trig_tensors_with_scalar(tensors)

	n_ct = count([t.symbol == "cos(θ)" for t in tensors])
	n_st = count([t.symbol == "sin(θ)" for t in tensors])

	other_tensors = tensors[[(t.symbol != "sin(θ)" && t.symbol != "cos(θ)") for t in tensors]]

	new_scalar = ct^n_ct * st^n_st

	return other_tensors, new_scalar

end

function replace_fixed_tensors_with_scalar(tensors)

	n_t1 = count([t.indices == [2, 1] for t in tensors])
	n_t2 = count([t.indices == [2, 1, 2, 1] for t in tensors])

	other_tensors = tensors[[!(t.indices == [2, 1]) && !(t.indices == [2, 1, 2, 1]) for t in tensors]]

	new_scalar = t1^n_t1 * t2^n_t2

	return other_tensors, new_scalar

end

function put_trig_in_scalar(ex)

	new_terms = SpinAdaptedSecondQuantization.Term[]
	 for t = ex.terms
		tensors, new_scalar = replace_trig_tensors_with_scalar(t.tensors)

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

function put_fixed_tensor_in_scalar(ex)

	new_terms = SpinAdaptedSecondQuantization.Term[]
	 for t = ex.terms

		if !(1 in t.sum_indices) && ! (2 in t.sum_indices)

			tensors, new_scalar = replace_fixed_tensors_with_scalar(t.tensors)

		end

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


function put_fixed_tensor_in_scalar_remove_trig(ex)

	new_terms = SpinAdaptedSecondQuantization.Term[]
	 for t = ex.terms
		tensors, new_scalar = replace_trig_tensors_with_scalar(t.tensors)
		new_scalar = 1.0

		if !(1 in t.sum_indices) && ! (2 in t.sum_indices)

			tensors, new_scalar_ = replace_fixed_tensors_with_scalar(tensors)
			new_scalar = new_scalar * new_scalar_
		end

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

function put_trig_and_fixed_tensor_in_scalar(ex)

	new_terms = SpinAdaptedSecondQuantization.Term[]
	 for t = ex.terms
		tensors, new_scalar = replace_trig_tensors_with_scalar(t.tensors)

		if !(1 in t.sum_indices) && ! (2 in t.sum_indices)

			tensors, new_scalar_ = replace_fixed_tensors_with_scalar(tensors)
			new_scalar = new_scalar * new_scalar_
		end

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

function swap_index_tensor(index, new_index, tensor)
	if !(index in tensor.indices)
		return tensor
	end

	indices = tensor.indices
	indices[indices .== index] .= new_index

	new_tensor = SpinAdaptedSecondQuantization.RealTensor(
		tensor.symbol,
		indices
	)

	return new_tensor

end

function change_summation_indices(eq)

	indices = [1, 2]
	terms = eq.terms

	for index in indices
		new_terms = SpinAdaptedSecondQuantization.Term[]
		for t in terms
			if (index in t.sum_indices)
				new_index = maximum([maximum(t.sum_indices) + 1, 3])
				new_tensors = SpinAdaptedSecondQuantization.Tensor[]
				for tensor in t.tensors
					new_tensor = swap_index_tensor(index, new_index, tensor)
					push!(new_tensors, new_tensor)
				end

				new_sum_indices = t.sum_indices
				new_sum_indices[new_sum_indices.==index] .= new_index

				new_constraints = t.constraints

				constraint = new_constraints[index]
				delete!(new_constraints, index)
				new_constraints[new_index] = constraint

				new_term = SpinAdaptedSecondQuantization.Term(
					t.scalar,
					new_sum_indices,
					t.deltas,
					new_tensors,
					t.operators,
					new_constraints
				)
				push!(new_terms, new_term)

			else
				push!(new_terms, t)
			end
		end
		terms = new_terms
	end
	return SpinAdaptedSecondQuantization.Expression(terms)
end

function get_reduced_tensor(tensor)
	if !(1 in tensor.indices || 2 in tensor.indices)
		return tensor
	end

	name = tensor.symbol
	indices = tensor.indices[[s != 1 && s != 2 for s in tensor.indices]]

	for index in tensor.indices
		if (index == 1)
			name = name * "I"
		elseif (index == 2)
			name = name * "A"
		else
			name = name * "x"
		end
	end
	new_tensor = SpinAdaptedSecondQuantization.RealTensor(name, indices)
	return new_tensor
end

function rename_tensors(eq)

	new_terms = SpinAdaptedSecondQuantization.Term[]
	for term in eq.terms
		new_tensors = SpinAdaptedSecondQuantization.Tensor[]
		for tensor in term.tensors
			new_tensor = get_reduced_tensor(tensor)
			push!(new_tensors, new_tensor)
		end
		new_term = SpinAdaptedSecondQuantization.Term(
			term.scalar,
			term.sum_indices,
			term.deltas,
			new_tensors,
			term.operators,
			term.constraints
		)
		push!(new_terms, new_term)
	end
	return SpinAdaptedSecondQuantization.Expression(new_terms)
end