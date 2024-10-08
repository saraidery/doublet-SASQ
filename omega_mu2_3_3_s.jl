include("../TensorOperation-eT-code/src/omeinsum_impl.jl")
open("omega_mu2_3_3_s.F90", "w") do io
s = let
    func = FortranFunction(("omega_aibj", ["v", "o", "v", "o"]))
    L_vooo = ("L_vooo", true)
    uAIxx_vo = ("uAIxx_vo", true)
    LAIxx_vv = ("LAIxx_vv", true)
    u_vovo = ("wf%u_aibj", false, [[1, 2, 3, 4], [3, 4, 1, 2]])
    LAIxx_oo = ("LAIxx_oo", true)
    LAxxx_vvo = ("LAxxx_vvo", true)
    uxxxI_vov = ("uxxxI_vov", true)
    LxxxI_voo = ("LxxxI_voo", true)
    uAxxx_ovo = ("uAxxx_ovo", true)
    g_vovv = ("g_vovv", true)
    gAxxx_ovv = ("gAxxx_ovv", true)
    uxIxx_vvo = ("uxIxx_vvo", true)
    gAxxx_ooo = ("gAxxx_ooo", true)
    gAxxx_vvo = ("gAxxx_vvo", true)
    gxIxx_vvv = ("gxIxx_vvv", true)
    gxIxx_voo = ("gxIxx_voo", true)
    gxxxI_voo = ("gxxxI_voo", true)
    F_ov = ("wf%fock_ia", false)
    tAxxx_ovo = ("tAxxx_ovo", true)
    L_vvov = ("L_vvov", true)
    L_ooov = ("L_ooov", true)
    LAxxx_vov = ("LAxxx_vov", true)
    txIxx_vvo = ("txIxx_vvo", true)
    txxxI_vov = ("txxxI_vov", true)
    LxIxx_oov = ("LxIxx_oov", true)
    g_vvov = ("g_vvov", true)
    g_ooov = ("g_ooov", true)
    gAxxx_vov = ("gAxxx_vov", true)
    t_vovo = ("t_vovo", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    gxIxx_oov = ("gxIxx_oov", true)
    update_code!(func, ein"bjlk,cl->bjck", -1//1, [L_vooo, uAIxx_vo])
    update_code!(func, ein"bd,ckdj->bjck", 1//1, [LAIxx_vv, u_vovo])
    update_code!(func, ein"lj,blck->bjck", -1//1, [LAIxx_oo, u_vovo])
    update_code!(func, ein"dbj,ckd->bjck", 1//1, [LAxxx_vvo, uxxxI_vov])
    update_code!(func, ein"bjl,lck->bjck", -1//1, [LxxxI_voo, uAxxx_ovo])
    update_code!(func, ein"bjcd,dk->bjck", 2//1, [g_vovv, uAIxx_vo])
    update_code!(func, ein"bkcd,dj->bjck", -1//1, [g_vovv, uAIxx_vo])
    update_code!(func, ein"jcd,bdk->bjck", -1//1, [gAxxx_ovv, uxIxx_vvo])
    update_code!(func, ein"jlk,bcl->bjck", 1//1, [gAxxx_ooo, uxIxx_vvo])
    update_code!(func, ein"dbk,cjd->bjck", -1//1, [gAxxx_vvo, uxxxI_vov])
    update_code!(func, ein"bcd,jdk->bjck", -1//1, [gxIxx_vvv, uAxxx_ovo])
    update_code!(func, ein"blk,jcl->bjck", 1//1, [gxIxx_voo, uAxxx_ovo])
    update_code!(func, ein"bkl,lcj->bjck", 1//1, [gxxxI_voo, uAxxx_ovo])
    update_code!(func, ein"ld,jcl,bdk->bjck", 1//1, [F_ov, tAxxx_ovo, uxIxx_vvo])
    update_code!(func, ein"ld,jdk,bcl->bjck", 1//1, [F_ov, tAxxx_ovo, uxIxx_vvo])
    update_code!(func, ein"ld,lbk,cjd->bjck", 1//1, [F_ov, tAxxx_ovo, uxxxI_vov])
    update_code!(func, ein"ld,blck,dj->bjck", -1//1, [F_ov, u_vovo, uAIxx_vo])
    update_code!(func, ein"ld,ckdj,bl->bjck", -1//1, [F_ov, u_vovo, uAIxx_vo])
    update_code!(func, ein"ld,lbj,ckd->bjck", -1//1, [F_ov, uAxxx_ovo, uxxxI_vov])
    update_code!(func, ein"bdle,ckdj,el->bjck", 1//1, [L_vvov, u_vovo, uAIxx_vo])
    update_code!(func, ein"bdle,ckel,dj->bjck", 1//1, [L_vvov, u_vovo, uAIxx_vo])
    update_code!(func, ein"ljmd,blck,dm->bjck", -1//1, [L_ooov, u_vovo, uAIxx_vo])
    update_code!(func, ein"ljmd,ckdm,bl->bjck", -1//1, [L_ooov, u_vovo, uAIxx_vo])
    update_code!(func, ein"dle,bel,ckdj->bjck", -1//1, [LAxxx_vov, txIxx_vvo, u_vovo])
    update_code!(func, ein"dle,cld,bjek->bjck", -1//1, [LAxxx_vov, txxxI_vov, u_vovo])
    update_code!(func, ein"lmd,lbk,cjdm->bjck", 1//1, [LxIxx_oov, tAxxx_ovo, u_vovo])
    update_code!(func, ein"lmd,ckdm,lbj->bjck", -1//1, [LxIxx_oov, u_vovo, uAxxx_ovo])
    update_code!(func, ein"bdle,cdl,kej->bjck", 1//1, [g_vvov, txIxx_vvo, uAxxx_ovo])
    update_code!(func, ein"bdle,cej,kdl->bjck", 1//1, [g_vvov, txIxx_vvo, uAxxx_ovo])
    update_code!(func, ein"bdle,dek,jcl->bjck", 1//1, [g_vvov, txIxx_vvo, uAxxx_ovo])
    update_code!(func, ein"ljmd,bcm,ldk->bjck", -1//1, [g_ooov, txIxx_vvo, uAxxx_ovo])
    update_code!(func, ein"ljmd,bdk,lcm->bjck", -1//1, [g_ooov, txIxx_vvo, uAxxx_ovo])
    update_code!(func, ein"ljmd,cdl,kbm->bjck", -1//1, [g_ooov, txIxx_vvo, uAxxx_ovo])
    update_code!(func, ein"bdle,cje,ldk->bjck", 1//1, [g_vvov, txxxI_vov, uAxxx_ovo])
    update_code!(func, ein"bdle,cld,jek->bjck", 1//1, [g_vvov, txxxI_vov, uAxxx_ovo])
    update_code!(func, ein"bdle,dke,lcj->bjck", 1//1, [g_vvov, txxxI_vov, uAxxx_ovo])
    update_code!(func, ein"ljmd,bkd,mcl->bjck", -1//1, [g_ooov, txxxI_vov, uAxxx_ovo])
    update_code!(func, ein"ljmd,bmc,kdl->bjck", -1//1, [g_ooov, txxxI_vov, uAxxx_ovo])
    update_code!(func, ein"ljmd,cld,mbk->bjck", -1//1, [g_ooov, txxxI_vov, uAxxx_ovo])
    update_code!(func, ein"bdle,cjel,dk->bjck", -1//1, [g_vvov, u_vovo, uAIxx_vo])
    update_code!(func, ein"bdle,cldj,ek->bjck", -1//1, [g_vvov, u_vovo, uAIxx_vo])
    update_code!(func, ein"bdle,djek,cl->bjck", -1//1, [g_vvov, u_vovo, uAIxx_vo])
    update_code!(func, ein"ljmd,bkdm,cl->bjck", 1//1, [g_ooov, u_vovo, uAIxx_vo])
    update_code!(func, ein"ljmd,blcm,dk->bjck", 1//1, [g_ooov, u_vovo, uAIxx_vo])
    update_code!(func, ein"ljmd,bldk,cm->bjck", 1//1, [g_ooov, u_vovo, uAIxx_vo])
    update_code!(func, ein"bdle,kdj,cel->bjck", -1//1, [g_vvov, uAxxx_ovo, uxIxx_vvo])
    update_code!(func, ein"bdle,kel,cdj->bjck", -1//1, [g_vvov, uAxxx_ovo, uxIxx_vvo])
    update_code!(func, ein"ljmd,kbl,cdm->bjck", 1//1, [g_ooov, uAxxx_ovo, uxIxx_vvo])
    update_code!(func, ein"ljmd,lck,bdm->bjck", 1//1, [g_ooov, uAxxx_ovo, uxIxx_vvo])
    update_code!(func, ein"bdle,jel,ckd->bjck", -1//1, [g_vvov, uAxxx_ovo, uxxxI_vov])
    update_code!(func, ein"bdle,lck,dje->bjck", -1//1, [g_vvov, uAxxx_ovo, uxxxI_vov])
    update_code!(func, ein"bdle,ldj,cke->bjck", -1//1, [g_vvov, uAxxx_ovo, uxxxI_vov])
    update_code!(func, ein"ljmd,kdm,blc->bjck", 1//1, [g_ooov, uAxxx_ovo, uxxxI_vov])
    update_code!(func, ein"ljmd,mbl,ckd->bjck", 1//1, [g_ooov, uAxxx_ovo, uxxxI_vov])
    update_code!(func, ein"ljmd,mck,bld->bjck", 1//1, [g_ooov, uAxxx_ovo, uxxxI_vov])
    update_code!(func, ein"dle,cjdl,bek->bjck", -1//1, [gAxxx_vov, t_vovo, txIxx_vvo])
    update_code!(func, ein"dle,bjdl,cke->bjck", -4//1, [gAxxx_vov, t_vovo, txxxI_vov])
    update_code!(func, ein"dle,bkdl,cje->bjck", 2//1, [gAxxx_vov, t_vovo, txxxI_vov])
    update_code!(func, ein"dle,cldk,bje->bjck", 2//1, [gAxxx_vov, t_vovo, txxxI_vov])
    update_code!(func, ein"dle,bjcl,dek->bjck", -2//1, [gAxxx_vov, t_vovo, uxIxx_vvo])
    update_code!(func, ein"dle,bkcl,dej->bjck", 1//1, [gAxxx_vov, t_vovo, uxIxx_vvo])
    update_code!(func, ein"dle,cldj,bek->bjck", 1//1, [gAxxx_vov, t_vovo, uxIxx_vvo])
    update_code!(func, ein"dle,bcl,djek->bjck", 1//1, [gAxxx_vov, txIxx_vvo, u_vovo])
    update_code!(func, ein"dle,bej,ckdl->bjck", 1//1, [gAxxx_vov, txIxx_vvo, u_vovo])
    update_code!(func, ein"dle,cjel,bkd->bjck", -1//1, [gAxxx_vov, u_vovo, uxxxI_vov])
    update_code!(func, ein"dle,ckel,bjd->bjck", 2//1, [gAxxx_vov, u_vovo, uxxxI_vov])
    update_code!(func, ein"lmd,jcl,bkdm->bjck", -1//1, [gxIxx_oov, tAxxx_ovo, u_vovo])
    update_code!(func, ein"lmd,jcm,bldk->bjck", -1//1, [gxIxx_oov, tAxxx_ovo, u_vovo])
    update_code!(func, ein"lmd,jdk,blcm->bjck", -1//1, [gxIxx_oov, tAxxx_ovo, u_vovo])
    update_code!(func, ein"lmd,blck,jdm->bjck", 1//1, [gxIxx_oov, u_vovo, uAxxx_ovo])
    update_code!(func, ein"lmd,bmck,ldj->bjck", 1//1, [gxIxx_oov, u_vovo, uAxxx_ovo])
    update_code!(func, ein"lmd,ckdj,lbm->bjck", 1//1, [gxIxx_oov, u_vovo, uAxxx_ovo])
    finalize_eT_function(func, "omega_mu2_3_3_s", "doublet_ccsd")
end

println(io, s)
end
