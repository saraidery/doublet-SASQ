include("../TensorOperation-eT-code/src/omeinsum_impl.jl")
open("get_jacobian_difference_singles_singles.F90", "w") do io
s = let
    func = FortranFunction(("diff_aibj", ["v", "o", "v", "o"]))
    F_vo = ("wf%fock_ai", false)
    r_vo = ("r_vo", true)
    F_ov = ("wf%fock_ia", false)
    u_vovo = ("wf%u_aibj", false, [[1, 2, 3, 4], [3, 4, 1, 2]])
    g_vvov = ("g_vvov", true)
    g_ooov = ("g_ooov", true)
    update_code!(func, ein"ai,bj->aibj", 1//1, [F_vo, r_vo])
    update_code!(func, ein"kc,ai,bjck->aibj", 1//1, [F_ov, r_vo, u_vovo])
    update_code!(func, ein"ackd,bj,cidk->aibj", 1//1, [g_vvov, r_vo, u_vovo])
    update_code!(func, ein"kilc,bj,akcl->aibj", -1//1, [g_ooov, r_vo, u_vovo])
    finalize_eT_function(func, "get_jacobian_difference_singles_singles", "doublet_ccsd")
end

println(io, s)
end
