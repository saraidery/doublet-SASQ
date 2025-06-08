include("../TensorOperation-eT-code/src/omeinsum_impl.jl")
open("omega_a_s_no_d.F90", "w") do io
s = let
    func = FortranFunction(("omega_a", ["v"]))
    LxAxx_oov = ("LxAxx_oov", true)
    U2_vovo = ("wf%u2", false)
    update_code!(func, ein"klc,clbk->b", 1//1, [LxAxx_oov, U2_vovo])
    finalize_eT_function(func, "omega_a_s_no_d", "aug_eccsd")
end

println(io, s)
end
