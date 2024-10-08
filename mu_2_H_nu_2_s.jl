include("../TensorOperation-eT-code/src/omeinsum_impl.jl")
open("mu_2_H_nu_2_s.F90", "w") do io
s = let
    func = FortranFunction(("rho_aibj", ["v", "o", "v", "o"]))
    F_oo = ("wf%fock_ij", false)
    r_vovo = ("r_vovo", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    F_vv = ("wf%fock_ab", false)
    L_ovvo = ("L_ovvo", true)
    g_ovvo = ("g_ovvo", true)
    g_oovv = ("g_oovv", true)
    L_ovov = ("L_ovov", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    u_vovo = ("u_aibj", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    g_ovov = ("g_ovov", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    update_code!(func, ein"ij,bick->bjck", -4//1, [F_oo, r_vovo])
    update_code!(func, ein"ij,bkci->bjck", 2//1, [F_oo, r_vovo])
    update_code!(func, ein"ba,ajck->bjck", 4//1, [F_vv, r_vovo])
    update_code!(func, ein"ba,akcj->bjck", -2//1, [F_vv, r_vovo])
    update_code!(func, ein"iabj,aick->bjck", 4//1, [L_ovvo, r_vovo])
    update_code!(func, ein"iabj,akci->bjck", -2//1, [L_ovvo, r_vovo])
    update_code!(func, ein"iabk,aicj->bjck", -4//1, [g_ovvo, r_vovo])
    update_code!(func, ein"iabk,ajci->bjck", 2//1, [g_ovvo, r_vovo])
    update_code!(func, ein"ijca,aibk->bjck", 2//1, [g_oovv, r_vovo])
    update_code!(func, ein"ijca,akbi->bjck", -4//1, [g_oovv, r_vovo])
    update_code!(func, ein"iald,aibj,ckdl->bjck", 4//1, [L_ovov, r_vovo, u_vovo])
    update_code!(func, ein"iald,aibk,cjdl->bjck", -2//1, [L_ovov, r_vovo, u_vovo])
    update_code!(func, ein"iald,aibl,ckdj->bjck", -2//1, [L_ovov, r_vovo, u_vovo])
    update_code!(func, ein"iald,aidj,blck->bjck", -2//1, [L_ovov, r_vovo, u_vovo])
    update_code!(func, ein"iald,ajbi,ckdl->bjck", -2//1, [L_ovov, r_vovo, u_vovo])
    update_code!(func, ein"iald,ajbk,cidl->bjck", 2//1, [g_ovov, r_vovo, u_vovo])
    update_code!(func, ein"iald,ajci,bkdl->bjck", 2//1, [g_ovov, r_vovo, u_vovo])
    update_code!(func, ein"iald,ajck,bidl->bjck", -4//1, [g_ovov, r_vovo, u_vovo])
    update_code!(func, ein"iald,ajcl,bidk->bjck", 2//1, [g_ovov, r_vovo, u_vovo])
    update_code!(func, ein"iald,bicj,akdl->bjck", 2//1, [g_ovov, r_vovo, u_vovo])
    update_code!(func, ein"iald,bick,ajdl->bjck", -4//1, [g_ovov, r_vovo, u_vovo])
    finalize_eT_function(func, "mu_2_H_nu_2_s", "doublet_ccsd")
end

println(io, s)
end
