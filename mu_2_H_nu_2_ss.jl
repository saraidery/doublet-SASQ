include("../TensorOperation-eT-code/src/omeinsum_impl.jl")
open("mu_2_H_nu_2_ss.F90", "w") do io
s = let
    func = FortranFunction(("rho_aibj", ["v", "o", "v", "o"]))
    F_oo = ("wf%fock_ij", false)
    r_vovo = ("r_vovo", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    L_oooo = ("L_oooo", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    L_vvvv = ("L_vvvv", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    g_ovov = ("g_ovov", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    u_vovo = ("u_aibj", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    update_code!(func, ein"ii,bjck->bjck", 8//1, [F_oo, r_vovo])
    update_code!(func, ein"ii,bkcj->bjck", -4//1, [F_oo, r_vovo])
    update_code!(func, ein"iill,bjck->bjck", -4//1, [L_oooo, r_vovo])
    update_code!(func, ein"iill,bkcj->bjck", 2//1, [L_oooo, r_vovo])
    update_code!(func, ein"ijlk,bicl->bjck", 2//1, [L_oooo, r_vovo])
    update_code!(func, ein"bacd,ajdk->bjck", 2//1, [L_vvvv, r_vovo])
    update_code!(func, ein"iald,ajdk,bicl->bjck", 2//1, [g_ovov, r_vovo, u_vovo])
    update_code!(func, ein"iald,bicl,ajdk->bjck", 2//1, [g_ovov, r_vovo, u_vovo])
    update_code!(func, ein"iald,bjck,aidl->bjck", 4//1, [g_ovov, r_vovo, u_vovo])
    update_code!(func, ein"iald,bkcj,aidl->bjck", -2//1, [g_ovov, r_vovo, u_vovo])
    finalize_eT_function(func, "mu_2_H_nu_2_ss", "doublet_ccsd")
end

println(io, s)
end
