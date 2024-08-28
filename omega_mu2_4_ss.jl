include("../TensorOperation-eT-code/src/omeinsum_impl.jl")
open("omega_mu2_4_ss.F90", "w") do io
s = let
    func = FortranFunction(("omega_bjck", ["o", "v", "o", "v"]))
    gAxxx_vov = ("gAxxx_vov", true)
    txIxx_vvo = ("txIxx_vvo", true)
    xAx_o = ("xAx_o", true)
    uxxxI_vov = ("uxxxI_vov", true)
    txxxI_vov = ("txxxI_vov", true)
    uxIxx_vvo = ("uxIxx_vvo", true)
    update_code!(func, ein"dle,bek,cdl,j->jbkc", 1//1, [gAxxx_vov, txIxx_vvo, txIxx_vvo, xAx_o])
    update_code!(func, ein"dle,cej,bld,k->jbkc", -1//1, [gAxxx_vov, txIxx_vvo, uxxxI_vov, xAx_o])
    update_code!(func, ein"dle,bld,cje,k->jbkc", 1//1, [gAxxx_vov, txxxI_vov, txxxI_vov, xAx_o])
    update_code!(func, ein"dle,cld,bek,j->jbkc", -1//1, [gAxxx_vov, txxxI_vov, uxIxx_vvo, xAx_o])
    finalize_eT_function(func, "omega_μ2_4_ss", "doublet_ccsd")
end

println(io, s)
end
