include("../TensorOperation-eT-code/src/omeinsum_impl.jl")
open("omega_mu2_3_3_ss.F90", "w") do io
s = let
    func = FortranFunction(("omega_aibj", ["v", "o", "v", "o"]))
    update_code!(func, ein"->bjck", 0//1, [])
    finalize_eT_function(func, "omega_mu2_3_3_ss", "doublet_ccsd")
end

println(io, s)
end
