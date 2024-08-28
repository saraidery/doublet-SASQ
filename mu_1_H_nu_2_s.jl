include("../TensorOperation-eT-code/src/omeinsum_impl.jl")
open("mu_1_H_nu_2_s.F90", "w") do io
s = let
    func = FortranFunction(("rho_ai", ["v", "o"]))
    F_ov = ("wf%fock_ia", false)
    r_vovo = ("r_vovo", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    g_ovvv = ("g_ovvv", true)
    g_ovoo = ("g_ovoo", true)
    update_code!(func, ein"ia,aibj->bj", 2//1, [F_ov, r_vovo])
    update_code!(func, ein"ia,ajbi->bj", -1//1, [F_ov, r_vovo])
    update_code!(func, ein"iabc,aicj->bj", 2//1, [g_ovvv, r_vovo])
    update_code!(func, ein"iabc,ajci->bj", -1//1, [g_ovvv, r_vovo])
    update_code!(func, ein"iakj,aibk->bj", -2//1, [g_ovoo, r_vovo])
    update_code!(func, ein"iakj,akbi->bj", 1//1, [g_ovoo, r_vovo])
    finalize_eT_function(func, "mu_1_H_nu_2_s", "doublet_ccsd")
end

println(io, s)
end
