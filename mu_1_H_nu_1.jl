include("../TensorOperation-eT-code/src/omeinsum_impl.jl")
open("mu_1_H_nu_1.F90", "w") do io
s = let
    func = FortranFunction(("rho_ai", ["v", "o"]))
    F_oo = ("wf%fock_ij", false)
    r_vo = ("r_vo", true)
    F_vv = ("wf%fock_ab", false)
    g_oooo = ("g_oooo", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    g_ovvo = ("g_ovvo", true)
    g_oovv = ("g_oovv", true)
    update_code!(func, ein"ii,bj->bj", 2//1, [F_oo, r_vo])
    update_code!(func, ein"ij,bi->bj", -1//1, [F_oo, r_vo])
    update_code!(func, ein"ba,aj->bj", 1//1, [F_vv, r_vo])
    update_code!(func, ein"iikk,bj->bj", -2//1, [g_oooo, r_vo])
    update_code!(func, ein"ikki,bj->bj", 1//1, [g_oooo, r_vo])
    update_code!(func, ein"iabj,ai->bj", 2//1, [g_ovvo, r_vo])
    update_code!(func, ein"ijba,ai->bj", -1//1, [g_oovv, r_vo])
    finalize_eT_function(func, "mu_1_H_nu_1", "doublet_ccsd")
end

println(io, s)
end
