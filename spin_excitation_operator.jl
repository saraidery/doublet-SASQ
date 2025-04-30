using SpinAdaptedSecondQuantization


struct SpinExcitationOperator <: SpinAdaptedSecondQuantization.Operator
    p::Int
    q::Int
    spin::SpinAdaptedSecondQuantization.Spin
end

function Base.show(io::IO,
    (
        e, constraints, translation
    )::Tuple{SpinExcitationOperator,SpinAdaptedSecondQuantization.Constraints, SpinAdaptedSecondQuantization.IndexTranslation})
    print(io, "E^")
    print(io, e.spin)
    print(io, "_")
    SpinAdaptedSecondQuantization.print_mo_index(io, constraints, translation, e.p, e.q)
end

function SpinAdaptedSecondQuantization.exchange_indices(e::SpinExcitationOperator, mapping)
    SpinExcitationOperator(
        SpinAdaptedSecondQuantization.exchange_index(e.p, mapping),
        SpinAdaptedSecondQuantization.exchange_index(e.q, mapping),
        e.spin
    )
end

function SpinAdaptedSecondQuantization.get_all_indices(e::SpinExcitationOperator)
    (e.p, e.q)
end

function Base.:(==)(a::SpinExcitationOperator, b::SpinExcitationOperator)
    (a.p, a.q, a.spin) == (b.p, b.q, b.spin)
end

function Base.isless(a::SpinExcitationOperator, b::SpinExcitationOperator)
    (a.p, a.q, a.spin) < (b.p, b.q, b.spin)
end

A(p, q, spin) = SpinAdaptedSecondQuantization.Expression(SpinExcitationOperator(p, q, spin))

function SpinAdaptedSecondQuantization.convert_to_elementary_operators(o::SpinExcitationOperator)
    SpinAdaptedSecondQuantization.Expression(
        (fermiondag(o.p, o.spin)*fermion(o.q, o.spin))[1])
end

function SpinAdaptedSecondQuantization.act_on_ket(op::SpinExcitationOperator)

    SpinAdaptedSecondQuantization.Expression(op) * virtual(op.p) * occupied(op.q) +
    δ(op.p, op.q) * occupied(op.p, op.q)
end

function Base.adjoint(op::SpinExcitationOperator)
    SpinExcitationOperator(op.q, op.p, op.spin)
end

function SpinAdaptedSecondQuantization.reductive_commutator(
    a::SpinExcitationOperator,
    b::SpinExcitationOperator)

    (1, (δ(a.q, b.p) * A(a.p, b.q, a.spin) - δ(a.p, b.q) * A(b.p, a.q, a.spin))*(a.spin == b.spin))
end

function SpinAdaptedSecondQuantization.reductive_commutator(a::SpinExcitationOperator, b::SpinAdaptedSecondQuantization.SingletExcitationOperator)

    (1, δ(a.q, b.p) * A(a.p, b.q, a.spin) - δ(a.p, b.q) * A(b.p, a.q, a.spin))
end

function SpinAdaptedSecondQuantization.reductive_commutator(e::SpinExcitationOperator, a::SpinAdaptedSecondQuantization.FermionOperator)
    p = e.p
    q = e.q
    r = a.p

    (1, if a.dag
        δ(q, r) * fermiondag(p, a.spin)*(e.spin == a.spin)
    else
        -δ(p, r) * fermion(q, a.spin)*(e.spin == a.spin)
    end)
end

function Base.isless(::Type{SpinAdaptedSecondQuantization.FermionOperator}, ::Type{SpinExcitationOperator})
    false
end


function Base.isless(::Type{SpinAdaptedSecondQuantization.SingletExcitationOperator}, ::Type{SpinExcitationOperator})
    false
end
