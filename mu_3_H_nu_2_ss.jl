include("../TensorOperation-eT-code/src/omeinsum_impl.jl")
open("mu_3_H_nu_2_ss.F90", "w") do io
s = let
    func = FortranFunction(("rho_aibj", ["v", "o", "v", "o"]))
    FAI = ("FAI", true)
    r_vovo = ("r_vovo", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    F_ov = ("wf%fock_ia", false)
    uAIxx_vo = ("uAIxx_vo", true)
    gAxxx_vov = ("gAxxx_vov", true)
    uxIxx_vvo = ("uxIxx_vvo", true)
    gxIxx_oov = ("gxIxx_oov", true)
    uAxxx_ovo = ("uAxxx_ovo", true)
    update_code!(func, ein",bjck->bjck", 4//1, [FAI, r_vovo])
    update_code!(func, ein",bkcj->bjck", -2//1, [FAI, r_vovo])
    update_code!(func, ein"ld,bjck,dl->bjck", 4//1, [F_ov, r_vovo, uAIxx_vo])
    update_code!(func, ein"ld,bkcj,dl->bjck", -2//1, [F_ov, r_vovo, uAIxx_vo])
    update_code!(func, ein"dle,bjck,del->bjck", 4//1, [gAxxx_vov, r_vovo, uxIxx_vvo])
    update_code!(func, ein"dle,bkcj,del->bjck", -2//1, [gAxxx_vov, r_vovo, uxIxx_vvo])
    update_code!(func, ein"lmd,bjck,ldm->bjck", -4//1, [gxIxx_oov, r_vovo, uAxxx_ovo])
    update_code!(func, ein"lmd,bkcj,ldm->bjck", 2//1, [gxIxx_oov, r_vovo, uAxxx_ovo])
    finalize_eT_function(func, "mu_4_H_nu_2_ss", "doublet_ccsd")
end

println(io, s)
end
