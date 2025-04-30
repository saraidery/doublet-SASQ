include("../TensorOperation-eT-code/src/omeinsum_impl.jl")
open("L_1_H_1.F90", "w") do io
s = let
    func = FortranFunction(("sigma_ai", ["v", "o"]))
    F_oo = ("wf%fock_ij", false)
    l_vo = ("l_vo", true)
    F_vv = ("wf%fock_ab", false)
    L_ovvo = ("L_ovvo", true)
    L_oooo = ("L_oooo", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    L_ovov = ("L_ovov", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    u_vovo = ("u_aibj", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    g_ovov = ("g_ovov", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    update_code!(func, ein"ij,aj->ai", -2//1, [F_oo, l_vo])
    update_code!(func, ein"ba,bi->ai", 2//1, [F_vv, l_vo])
    update_code!(func, ein"jj,ai->ai", 4//1, [F_oo, l_vo])
    update_code!(func, ein"iabj,bj->ai", 2//1, [L_ovvo, l_vo])
    update_code!(func, ein"jjkk,ai->ai", -2//1, [L_oooo, l_vo])
    update_code!(func, ein"iajb,ck,bjck->ai", 2//1, [L_ovov, l_vo, u_vovo])
    update_code!(func, ein"ibjc,ak,bkcj->ai", -2//1, [g_ovov, l_vo, u_vovo])
    update_code!(func, ein"jakb,ci,bkcj->ai", -2//1, [g_ovov, l_vo, u_vovo])
    update_code!(func, ein"jbkc,ai,bjck->ai", 2//1, [g_ovov, l_vo, u_vovo])
    finalize_eT_function(func, "L_1_H_1", "doublet_ccsd")
end

println(io, s)
end
