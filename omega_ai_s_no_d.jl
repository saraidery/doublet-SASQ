include("../TensorOperation-eT-code/src/omeinsum_impl.jl")
open("omega_ai_s_no_d.F90", "w") do io
s = let
    func = FortranFunction(("omega_ai", ["v", "o"]))
    LIAxx_ov = ("LIAxx_ov", true)
    s_vovo = ("wf%s", false)
    LIxxA_vo = ("LIxxA_vo", true)
    U1_vovo = ("wf%u1", false)
    update_code!(func, ein"kc,ckbj->bj", -1//1, [LIAxx_ov, s_vovo])
    update_code!(func, ein"ck,bjck->bj", 1//1, [LIxxA_vo, U1_vovo])
    update_code!(func, ein"ck,cjbk->bj", -1//1, [LIxxA_vo, s_vovo])
    finalize_eT_function(func, "omega_ai_s_no_d", "aug_eccsd")
end

println(io, s)
end
