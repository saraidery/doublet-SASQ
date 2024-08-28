include("../TensorOperation-eT-code/src/omeinsum_impl.jl")
open("mu_2_H_nu_1_ss.F90", "w") do io
s = let
    func = FortranFunction(("rho_aibj", ["v", "o", "v", "o"]))
    update_code!(func, ein"->bjck", 0//1, [])
    finalize_eT_function(func, "mu_2_H_nu_1_ss", "doublet_ccsd")
end

println(io, s)
end
