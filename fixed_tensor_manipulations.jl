using SpinAdaptedSecondQuantization
using SymPy

θ = symbols("θ", real=true)
st = sin(θ)
ct = cos(θ)
t1= symbols("t_AI", real=true)
t2 = symbols("t_AIAI", real=true)

x2 = symbols("x_AIAI", real=true)

function replace_trig_tensors_with_scalar(tensors)

	n_ct = count([t.symbol == "cos(θ)" for t in tensors])
	n_st = count([t.symbol == "sin(θ)" for t in tensors])

	other_tensors = tensors[[(t.symbol != "sin(θ)" && t.symbol != "cos(θ)") for t in tensors]]

	new_scalar = ct^n_ct * st^n_st

	return other_tensors, new_scalar

end

function replace_fixed_tensors_with_scalar(tensors)

	n_t1 = count([t.symbol == "t_AI" for t in tensors])
	n_t2 = count([t.symbol == "t_AIAI" for t in tensors])
	n_x2 = count([t.symbol == "x_AIAI" for t in tensors])

	other_tensors = tensors[[(t.symbol != "t_AI" && t.symbol != "t_AIAI" && t.symbol != "x_AIAI") for t in tensors]]

	new_scalar = t1^n_t1 * t2^n_t2 * x2^n_x2

	return other_tensors, new_scalar

end

function compress_trig_tensors(tensors)

	n_ct = count([t.symbol == "cos(θ)" for t in tensors])
	n_st = count([t.symbol == "sin(θ)" for t in tensors])

	other_tensors = tensors[[(t.symbol != "sin(θ)" && t.symbol != "cos(θ)") for t in tensors]]
	name = ""

	if (n_ct  > 0)
		name = "ct" * string(n_ct)
	end
	if (n_st  > 0 && n_ct > 0)
		name = name * "_"
	end
	if (n_st  > 0)
		 name = name * "st" * string(n_st)
	end

	tens = SpinAdaptedSecondQuantization.RealTensor(name,[])

	push!(other_tensors, tens)

	return other_tensors

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

	ex = rename_fixed_tensors(ex)

	new_terms = SpinAdaptedSecondQuantization.Term[]
	 for t = ex.terms
		tensors, new_scalar = replace_fixed_tensors_with_scalar(t.tensors)

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




function compress_trig(ex)

	new_terms = SpinAdaptedSecondQuantization.Term[]
	 for t = ex.terms
		tensors = compress_trig_tensors(t.tensors)

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
				new_index = maximum([maximum(t.sum_indices) + 1, 5])
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
			name = name * "_"
		end
	end
	new_tensor = SpinAdaptedSecondQuantization.RealTensor(name, indices)
	return new_tensor
end

function get_fixed_tensor(tensor)

	name = tensor.symbol
	if !(name == "t" || name == "x")
		return tensor
	end

	indices = tensor.indices[[s != 1 && s != 2 for s in tensor.indices]]

	if length(indices) != 0
		return tensor
	end

	name = name * "_"
	for index in tensor.indices
		if (index == 1)
			name = name * "I"
		elseif (index == 2)
			name = name * "A"
		end
	end
	new_tensor = SpinAdaptedSecondQuantization.RealTensor(name, indices)
	return new_tensor

end

function rename_fixed_tensors(eq)

	new_terms = SpinAdaptedSecondQuantization.Term[]
	for term in eq.terms
		new_tensors = SpinAdaptedSecondQuantization.Tensor[]
		for tensor in term.tensors
			new_tensor = get_fixed_tensor(tensor)
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

function split_with_deltas(ex)

	new_terms = SpinAdaptedSecondQuantization.Term[]
	old_terms = SpinAdaptedSecondQuantization.Term[]

	 for t in ex.terms
		deltas = t.deltas

		if length(deltas) > 0
			push!(new_terms, t)
		else
			push!(old_terms, t)
		end
	end

	return SpinAdaptedSecondQuantization.Expression(old_terms), SpinAdaptedSecondQuantization.Expression(new_terms)
end

function strip_deltas(ex)

	new_terms = SpinAdaptedSecondQuantization.Term[]

	for t in ex.terms
		deltas =  SpinAdaptedSecondQuantization.KroneckerDelta[]

		new_term = SpinAdaptedSecondQuantization.Term(
			t.scalar,
			t.sum_indices,
			deltas,
			t.tensors,
			t.operators,
			t.constraints
		)
		push!(new_terms, new_term)
	end

	return SpinAdaptedSecondQuantization.Expression(new_terms)

end


function split_with_delta_index(ex, index)

	new_terms = SpinAdaptedSecondQuantization.Term[]
	old_terms = SpinAdaptedSecondQuantization.Term[]

	 for t in ex.terms
		deltas = t.deltas

		n = count([(index in d.indices) for d in deltas])

		if n > 0
			push!(new_terms, t)
		else
			push!(old_terms, t)
		end
	end

	return SpinAdaptedSecondQuantization.Expression(old_terms), SpinAdaptedSecondQuantization.Expression(new_terms)
end