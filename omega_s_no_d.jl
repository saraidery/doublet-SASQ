include("../TensorOperation-eT-code/src/omeinsum_impl.jl")
open("omega_s_no_d.F90", "w") do io
s = let
    func = FortranFunction(("omega", String[]))
    L_ovov = ("L_ovov", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    s_vovo = ("wf%s", false)
    update_code!(func, ein"kcld,ckdl->", -1//1, [L_ovov, s_vovo])
    finalize_eT_function(func, "omega_s_no_d", "aug_eccsd")
end

println(io, s)
end
