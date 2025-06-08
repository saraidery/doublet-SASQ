include("../TensorOperation-eT-code/src/omeinsum_impl.jl")
open("omega_i_s_no_d.F90", "w") do io
s = let
    func = FortranFunction(("omega_i", ["o"]))
    LIxxx_vov = ("LIxxx_vov", true)
    U1_vovo = ("wf%u1", false)
    update_code!(func, ein"ckd,dkcj->j", 1//1, [LIxxx_vov, U1_vovo])
    finalize_eT_function(func, "omega_i_s_no_d", "aug_eccsd")
end

println(io, s)
end
