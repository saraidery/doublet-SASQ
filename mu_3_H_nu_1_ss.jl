include("../TensorOperation-eT-code/src/omeinsum_impl.jl")
open("mu_3_H_nu_1_ss.F90", "w") do io
s = let
    func = FortranFunction(("rho_aibj", ["v", "o", "v", "o"]))
    L_vovo = ("L_vovo", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    rAI = ("rAI", true)
    g_vvvv = ("g_vvvv", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    u_vovo = ("u_aibj", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    g_oooo = ("g_oooo", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    L_ovov = ("L_ovov", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    t_vovo = ("t_aibj", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    g_ovov = ("g_ovov", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    update_code!(func, ein"bjck,->bjck", 2//1, [L_vovo, rAI])
    update_code!(func, ein"bdce,,djek->bjck", 2//1, [g_vvvv, rAI, u_vovo])
    update_code!(func, ein"ljmk,,blcm->bjck", 2//1, [g_oooo, rAI, u_vovo])
    update_code!(func, ein"ldme,,bjdl,ckem->bjck", 8//1, [L_ovov, rAI, t_vovo, t_vovo])
    update_code!(func, ein"ldme,,bkdl,cjem->bjck", -4//1, [L_ovov, rAI, t_vovo, t_vovo])
    update_code!(func, ein"ldme,,bldj,cmek->bjck", 2//1, [L_ovov, rAI, t_vovo, t_vovo])
    update_code!(func, ein"ldme,,blek,cmdj->bjck", 2//1, [L_ovov, rAI, t_vovo, t_vovo])
    update_code!(func, ein"ldme,,djek,blcm->bjck", 2//1, [g_ovov, rAI, t_vovo, u_vovo])
    finalize_eT_function(func, "mu_4_H_nu_1_ss", "doublet_ccsd")
end

println(io, s)
end
