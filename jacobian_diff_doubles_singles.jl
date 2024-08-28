include("../TensorOperation-eT-code/src/omeinsum_impl.jl")
open("jacobian_diff_doubles_singles.F90", "w") do io
s = let
    func = FortranFunction(("rho_aibj", ["v", "o", "v", "o"]))
    update_code!(func, ein"->bjck", 0//1, [])
    finalize_eT_function(func, "jacobian_diff_doubles_singles", "doublet_ccsd")
end

println(io, s)
end
