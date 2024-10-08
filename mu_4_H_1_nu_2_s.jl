include("../TensorOperation-eT-code/src/omeinsum_impl.jl")
open("mu_4_H_1_nu_2_s.F90", "w") do io
s = let
    func = FortranFunction(("rho_aibj", ["v", "o", "v", "o"]))
    F_vv = ("wf%fock_ab", false)
    rAIAI = ("rAIAI", true)
    u_vovo = ("u_aibj", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    F_oo = ("wf%fock_ij", false)
    rAIAx_o = ("rAIAx_o", true)
    uxIxx_vvo = ("uxIxx_vvo", true)
    uxxxI_vov = ("uxxxI_vov", true)
    rAIxI_v = ("rAIxI_v", true)
    uAxxx_ovo = ("uAxxx_ovo", true)
    rAIxx_vo = ("rAIxx_vo", true)
    uAIxx_vo = ("uAIxx_vo", true)
    rAxAx_oo = ("rAxAx_oo", true)
    txIxI_vv = ("txIxI_vv", true)
    rAxxI_ov = ("rAxxI_ov", true)
    tAIxx_vo = ("tAIxx_vo", true)
    tAxxI_ov = ("tAxxI_ov", true)
    rAxxx_ovo = ("rAxxx_ovo", true)
    tAIxI_v = ("tAIxI_v", true)
    rxIxI_vv = ("rxIxI_vv", true)
    tAxAx_oo = ("tAxAx_oo", true)
    rxIxx_vvo = ("rxIxx_vvo", true)
    tAIAx_o = ("tAIAx_o", true)
    rxxxI_vov = ("rxxxI_vov", true)
    FAx_v = ("FAx_v", true)
    txIxx_vvo = ("txIxx_vvo", true)
    txxxI_vov = ("txxxI_vov", true)
    tAxxx_ovo = ("tAxxx_ovo", true)
    FxI_o = ("FxI_o", true)
    L_voov = ("L_voov", true)
    L_vvoo = ("L_vvoo", true)
    L_oooo = ("L_oooo", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    L_vvvv = ("L_vvvv", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    LAIxx_ov = ("LAIxx_ov", true)
    LAxxx_vvv = ("LAxxx_vvv", true)
    r_vovo = ("r_vovo", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    LAxxx_voo = ("LAxxx_voo", true)
    LAxxx_oov = ("LAxxx_oov", true)
    LxIxx_ooo = ("LxIxx_ooo", true)
    LxIxx_vov = ("LxIxx_vov", true)
    LxxxI_vvo = ("LxxxI_vvo", true)
    g_voov = ("g_voov", true)
    g_vvoo = ("g_vvoo", true)
    g_vvvv = ("g_vvvv", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    g_oooo = ("g_oooo", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    gAIxx_ov = ("gAIxx_ov", true)
    gAxAx_vv = ("gAxAx_vv", true)
    gAxxI_vo = ("gAxxI_vo", true)
    t_vovo = ("t_aibj", true, [[1, 2, 3, 4], [3, 4, 1, 2]])
    gAxxx_oov = ("gAxxx_oov", true)
    gAxxx_vvv = ("gAxxx_vvv", true)
    gAxxx_voo = ("gAxxx_voo", true)
    gxIxI_oo = ("gxIxI_oo", true)
    gxIxx_vov = ("gxIxx_vov", true)
    gxIxx_ooo = ("gxIxx_ooo", true)
    gxxxI_vvo = ("gxxxI_vvo", true)
    update_code!(func, ein"bd,,ckdj->bjck", 2//1, [F_vv, rAIAI, u_vovo])
    update_code!(func, ein"lj,,blck->bjck", -2//1, [F_oo, rAIAI, u_vovo])
    update_code!(func, ein"bd,k,cdj->bjck", -2//1, [F_vv, rAIAx_o, uxIxx_vvo])
    update_code!(func, ein"bd,j,ckd->bjck", -2//1, [F_vv, rAIAx_o, uxxxI_vov])
    update_code!(func, ein"lj,k,blc->bjck", 2//1, [F_oo, rAIAx_o, uxxxI_vov])
    update_code!(func, ein"bd,c,kdj->bjck", -2//1, [F_vv, rAIxI_v, uAxxx_ovo])
    update_code!(func, ein"lj,b,lck->bjck", 2//1, [F_oo, rAIxI_v, uAxxx_ovo])
    update_code!(func, ein"lj,c,kbl->bjck", 2//1, [F_oo, rAIxI_v, uAxxx_ovo])
    update_code!(func, ein"bd,cj,dk->bjck", -2//1, [F_vv, rAIxx_vo, uAIxx_vo])
    update_code!(func, ein"bd,ck,dj->bjck", 4//1, [F_vv, rAIxx_vo, uAIxx_vo])
    update_code!(func, ein"lj,bk,cl->bjck", 2//1, [F_oo, rAIxx_vo, uAIxx_vo])
    update_code!(func, ein"lj,ck,bl->bjck", -4//1, [F_oo, rAIxx_vo, uAIxx_vo])
    update_code!(func, ein"bd,jk,cd->bjck", 2//1, [F_vv, rAxAx_oo, txIxI_vv])
    update_code!(func, ein"bd,jc,dk->bjck", 2//1, [F_vv, rAxxI_ov, tAIxx_vo])
    update_code!(func, ein"lj,kb,cl->bjck", -2//1, [F_oo, rAxxI_ov, tAIxx_vo])
    update_code!(func, ein"bd,jc,kd->bjck", 2//1, [F_vv, rAxxI_ov, tAxxI_ov])
    update_code!(func, ein"lj,kb,lc->bjck", -2//1, [F_oo, rAxxI_ov, tAxxI_ov])
    update_code!(func, ein"bd,kc,dj->bjck", -2//1, [F_vv, rAxxI_ov, uAIxx_vo])
    update_code!(func, ein"lj,kc,bl->bjck", 2//1, [F_oo, rAxxI_ov, uAIxx_vo])
    update_code!(func, ein"bd,jck,d->bjck", -4//1, [F_vv, rAxxx_ovo, tAIxI_v])
    update_code!(func, ein"bd,kcj,d->bjck", 2//1, [F_vv, rAxxx_ovo, tAIxI_v])
    update_code!(func, ein"lj,bc,kl->bjck", -2//1, [F_oo, rxIxI_vv, tAxAx_oo])
    update_code!(func, ein"lj,bck,l->bjck", 4//1, [F_oo, rxIxx_vvo, tAIAx_o])
    update_code!(func, ein"lj,bkc,l->bjck", -2//1, [F_oo, rxxxI_vov, tAIAx_o])
    update_code!(func, ein"d,b,ckdj->bjck", -2//1, [FAx_v, rAIxI_v, u_vovo])
    update_code!(func, ein"d,bj,ckd->bjck", 4//1, [FAx_v, rAIxx_vo, uxxxI_vov])
    update_code!(func, ein"d,bk,cjd->bjck", -2//1, [FAx_v, rAIxx_vo, uxxxI_vov])
    update_code!(func, ein"d,jc,bdk->bjck", 2//1, [FAx_v, rAxxI_ov, txIxx_vvo])
    update_code!(func, ein"d,jc,bkd->bjck", 2//1, [FAx_v, rAxxI_ov, txxxI_vov])
    update_code!(func, ein"d,jb,ckd->bjck", -2//1, [FAx_v, rAxxI_ov, uxxxI_vov])
    update_code!(func, ein"d,jbk,cd->bjck", 2//1, [FAx_v, rAxxx_ovo, txIxI_vv])
    update_code!(func, ein"d,jck,bd->bjck", -4//1, [FAx_v, rAxxx_ovo, txIxI_vv])
    update_code!(func, ein"d,bc,jdk->bjck", 2//1, [FAx_v, rxIxI_vv, tAxxx_ovo])
    update_code!(func, ein"d,bcj,dk->bjck", 2//1, [FAx_v, rxIxx_vvo, tAIxx_vo])
    update_code!(func, ein"d,bck,dj->bjck", -4//1, [FAx_v, rxIxx_vvo, tAIxx_vo])
    update_code!(func, ein"d,bcj,kd->bjck", 2//1, [FAx_v, rxIxx_vvo, tAxxI_ov])
    update_code!(func, ein"d,bck,jd->bjck", -4//1, [FAx_v, rxIxx_vvo, tAxxI_ov])
    update_code!(func, ein"l,j,blck->bjck", 2//1, [FxI_o, rAIAx_o, u_vovo])
    update_code!(func, ein"l,bj,lck->bjck", -4//1, [FxI_o, rAIxx_vo, uAxxx_ovo])
    update_code!(func, ein"l,bk,lcj->bjck", 2//1, [FxI_o, rAIxx_vo, uAxxx_ovo])
    update_code!(func, ein"l,jk,bcl->bjck", -2//1, [FxI_o, rAxAx_oo, txIxx_vvo])
    update_code!(func, ein"l,jc,kbl->bjck", -2//1, [FxI_o, rAxxI_ov, tAxxx_ovo])
    update_code!(func, ein"l,jc,lbk->bjck", -2//1, [FxI_o, rAxxI_ov, tAxxx_ovo])
    update_code!(func, ein"l,jb,lck->bjck", 2//1, [FxI_o, rAxxI_ov, uAxxx_ovo])
    update_code!(func, ein"l,jbk,cl->bjck", -2//1, [FxI_o, rAxxx_ovo, tAIxx_vo])
    update_code!(func, ein"l,jck,bl->bjck", 4//1, [FxI_o, rAxxx_ovo, tAIxx_vo])
    update_code!(func, ein"l,jbk,lc->bjck", -2//1, [FxI_o, rAxxx_ovo, tAxxI_ov])
    update_code!(func, ein"l,jck,lb->bjck", 4//1, [FxI_o, rAxxx_ovo, tAxxI_ov])
    update_code!(func, ein"l,bcj,kl->bjck", -2//1, [FxI_o, rxIxx_vvo, tAxAx_oo])
    update_code!(func, ein"l,bck,jl->bjck", 4//1, [FxI_o, rxIxx_vvo, tAxAx_oo])
    update_code!(func, ein"bjld,,ckdl->bjck", 2//1, [L_voov, rAIAI, u_vovo])
    update_code!(func, ein"bjld,k,cdl->bjck", -2//1, [L_voov, rAIAx_o, uxIxx_vvo])
    update_code!(func, ein"bjld,l,ckd->bjck", -2//1, [L_voov, rAIAx_o, uxxxI_vov])
    update_code!(func, ein"bjld,c,kdl->bjck", -2//1, [L_voov, rAIxI_v, uAxxx_ovo])
    update_code!(func, ein"bjld,d,lck->bjck", -2//1, [L_voov, rAIxI_v, uAxxx_ovo])
    update_code!(func, ein"bjld,ck,dl->bjck", 4//1, [L_voov, rAIxx_vo, uAIxx_vo])
    update_code!(func, ein"bjld,cl,dk->bjck", -2//1, [L_voov, rAIxx_vo, uAIxx_vo])
    update_code!(func, ein"bjld,dk,cl->bjck", -2//1, [L_voov, rAIxx_vo, uAIxx_vo])
    update_code!(func, ein"bkld,cj,dl->bjck", -2//1, [L_voov, rAIxx_vo, uAIxx_vo])
    update_code!(func, ein"bdlk,cl,dj->bjck", -2//1, [L_vvoo, rAIxx_vo, uAIxx_vo])
    update_code!(func, ein"bdlk,dj,cl->bjck", -2//1, [L_vvoo, rAIxx_vo, uAIxx_vo])
    update_code!(func, ein"ljmk,bl,cm->bjck", 2//1, [L_oooo, rAIxx_vo, uAIxx_vo])
    update_code!(func, ein"bjld,kl,cd->bjck", 2//1, [L_voov, rAxAx_oo, txIxI_vv])
    update_code!(func, ein"bjld,kd,cl->bjck", 2//1, [L_voov, rAxxI_ov, tAIxx_vo])
    update_code!(func, ein"bjld,lc,dk->bjck", 2//1, [L_voov, rAxxI_ov, tAIxx_vo])
    update_code!(func, ein"bjld,kd,lc->bjck", 2//1, [L_voov, rAxxI_ov, tAxxI_ov])
    update_code!(func, ein"bjld,lc,kd->bjck", 2//1, [L_voov, rAxxI_ov, tAxxI_ov])
    update_code!(func, ein"bjld,kc,dl->bjck", -2//1, [L_voov, rAxxI_ov, uAIxx_vo])
    update_code!(func, ein"bjld,kcl,d->bjck", 2//1, [L_voov, rAxxx_ovo, tAIxI_v])
    update_code!(func, ein"bjld,lck,d->bjck", -4//1, [L_voov, rAxxx_ovo, tAIxI_v])
    update_code!(func, ein"bkld,lcj,d->bjck", 2//1, [L_voov, rAxxx_ovo, tAIxI_v])
    update_code!(func, ein"bdce,jek,d->bjck", -2//1, [L_vvvv, rAxxx_ovo, tAIxI_v])
    update_code!(func, ein"bdlk,jcl,d->bjck", 2//1, [L_vvoo, rAxxx_ovo, tAIxI_v])
    update_code!(func, ein"bjld,cd,kl->bjck", 2//1, [L_voov, rxIxI_vv, tAxAx_oo])
    update_code!(func, ein"bjld,cdk,l->bjck", 2//1, [L_voov, rxIxx_vvo, tAIAx_o])
    update_code!(func, ein"bdlk,cdj,l->bjck", 2//1, [L_vvoo, rxIxx_vvo, tAIAx_o])
    update_code!(func, ein"ljmk,bcm,l->bjck", -2//1, [L_oooo, rxIxx_vvo, tAIAx_o])
    update_code!(func, ein"bjld,ckd,l->bjck", -4//1, [L_voov, rxxxI_vov, tAIAx_o])
    update_code!(func, ein"bkld,cjd,l->bjck", 2//1, [L_voov, rxxxI_vov, tAIAx_o])
    update_code!(func, ein"ld,bj,ckdl->bjck", 4//1, [LAIxx_ov, rAIxx_vo, u_vovo])
    update_code!(func, ein"ld,bk,cjdl->bjck", -2//1, [LAIxx_ov, rAIxx_vo, u_vovo])
    update_code!(func, ein"ld,bl,ckdj->bjck", -2//1, [LAIxx_ov, rAIxx_vo, u_vovo])
    update_code!(func, ein"ld,dj,blck->bjck", -2//1, [LAIxx_ov, rAIxx_vo, u_vovo])
    update_code!(func, ein"ld,jb,ckdl->bjck", -2//1, [LAIxx_ov, rAxxI_ov, u_vovo])
    update_code!(func, ein"dbe,cjek,d->bjck", -2//1, [LAxxx_vvv, r_vovo, tAIxI_v])
    update_code!(func, ein"dbe,ckej,d->bjck", 4//1, [LAxxx_vvv, r_vovo, tAIxI_v])
    update_code!(func, ein"dlj,bkcl,d->bjck", 2//1, [LAxxx_voo, r_vovo, tAIxI_v])
    update_code!(func, ein"dlj,blck,d->bjck", -4//1, [LAxxx_voo, r_vovo, tAIxI_v])
    update_code!(func, ein"jld,b,ckdl->bjck", -2//1, [LAxxx_oov, rAIxI_v, u_vovo])
    update_code!(func, ein"dbe,d,ckej->bjck", 2//1, [LAxxx_vvv, rAIxI_v, u_vovo])
    update_code!(func, ein"dlj,d,blck->bjck", -2//1, [LAxxx_voo, rAIxI_v, u_vovo])
    update_code!(func, ein"dbe,ej,ckd->bjck", 2//1, [LAxxx_vvv, rAIxx_vo, uxxxI_vov])
    update_code!(func, ein"dlj,bl,ckd->bjck", -2//1, [LAxxx_voo, rAIxx_vo, uxxxI_vov])
    update_code!(func, ein"dbe,kej,cd->bjck", -2//1, [LAxxx_vvv, rAxxx_ovo, txIxI_vv])
    update_code!(func, ein"dlj,kbl,cd->bjck", 2//1, [LAxxx_voo, rAxxx_ovo, txIxI_vv])
    update_code!(func, ein"dbe,cej,dk->bjck", -2//1, [LAxxx_vvv, rxIxx_vvo, tAIxx_vo])
    update_code!(func, ein"dbe,cej,kd->bjck", -2//1, [LAxxx_vvv, rxIxx_vvo, tAxxI_ov])
    update_code!(func, ein"dlj,blc,dk->bjck", 2//1, [LAxxx_voo, rxxxI_vov, tAIxx_vo])
    update_code!(func, ein"dlj,blc,kd->bjck", 2//1, [LAxxx_voo, rxxxI_vov, tAxxI_ov])
    update_code!(func, ein"lmj,bkcm,l->bjck", -2//1, [LxIxx_ooo, r_vovo, tAIAx_o])
    update_code!(func, ein"lmj,bmck,l->bjck", 4//1, [LxIxx_ooo, r_vovo, tAIAx_o])
    update_code!(func, ein"bld,j,ckdl->bjck", -2//1, [LxIxx_vov, rAIAx_o, u_vovo])
    update_code!(func, ein"lmj,l,bmck->bjck", 2//1, [LxIxx_ooo, rAIAx_o, u_vovo])
    update_code!(func, ein"lmj,bm,lck->bjck", 2//1, [LxIxx_ooo, rAIxx_vo, uAxxx_ovo])
    update_code!(func, ein"lmj,kbm,cl->bjck", -2//1, [LxIxx_ooo, rAxxx_ovo, tAIxx_vo])
    update_code!(func, ein"lmj,kbm,lc->bjck", -2//1, [LxIxx_ooo, rAxxx_ovo, tAxxI_ov])
    update_code!(func, ein"lmj,bmc,kl->bjck", -2//1, [LxIxx_ooo, rxxxI_vov, tAxAx_oo])
    update_code!(func, ein"bdl,cjdk,l->bjck", 2//1, [LxxxI_vvo, r_vovo, tAIAx_o])
    update_code!(func, ein"bdl,ckdj,l->bjck", -4//1, [LxxxI_vvo, r_vovo, tAIAx_o])
    update_code!(func, ein"bdl,l,ckdj->bjck", -2//1, [LxxxI_vvo, rAIAx_o, u_vovo])
    update_code!(func, ein"bdl,dj,lck->bjck", -2//1, [LxxxI_vvo, rAIxx_vo, uAxxx_ovo])
    update_code!(func, ein"bdl,kdj,cl->bjck", 2//1, [LxxxI_vvo, rAxxx_ovo, tAIxx_vo])
    update_code!(func, ein"bdl,kdj,lc->bjck", 2//1, [LxxxI_vvo, rAxxx_ovo, tAxxI_ov])
    update_code!(func, ein"bdl,cdj,kl->bjck", 2//1, [LxxxI_vvo, rxIxx_vvo, tAxAx_oo])
    update_code!(func, ein"bkld,,cjdl->bjck", -2//1, [g_voov, rAIAI, u_vovo])
    update_code!(func, ein"bdlk,,cldj->bjck", -2//1, [g_vvoo, rAIAI, u_vovo])
    update_code!(func, ein"bkld,j,cdl->bjck", 2//1, [g_voov, rAIAx_o, uxIxx_vvo])
    update_code!(func, ein"bdce,j,dek->bjck", -2//1, [g_vvvv, rAIAx_o, uxIxx_vvo])
    update_code!(func, ein"bdlk,l,cdj->bjck", 2//1, [g_vvoo, rAIAx_o, uxIxx_vvo])
    update_code!(func, ein"ljmk,l,bcm->bjck", -2//1, [g_oooo, rAIAx_o, uxIxx_vvo])
    update_code!(func, ein"bkld,l,cjd->bjck", 2//1, [g_voov, rAIAx_o, uxxxI_vov])
    update_code!(func, ein"bdlk,j,cld->bjck", 2//1, [g_vvoo, rAIAx_o, uxxxI_vov])
    update_code!(func, ein"bkld,c,jdl->bjck", 2//1, [g_voov, rAIxI_v, uAxxx_ovo])
    update_code!(func, ein"bkld,d,lcj->bjck", 2//1, [g_voov, rAIxI_v, uAxxx_ovo])
    update_code!(func, ein"bdce,d,jek->bjck", -2//1, [g_vvvv, rAIxI_v, uAxxx_ovo])
    update_code!(func, ein"bdlk,c,ldj->bjck", 2//1, [g_vvoo, rAIxI_v, uAxxx_ovo])
    update_code!(func, ein"bdlk,d,jcl->bjck", 2//1, [g_vvoo, rAIxI_v, uAxxx_ovo])
    update_code!(func, ein"ljmk,b,lcm->bjck", -2//1, [g_oooo, rAIxI_v, uAxxx_ovo])
    update_code!(func, ein"bdce,dj,ek->bjck", 4//1, [g_vvvv, rAIxx_vo, uAIxx_vo])
    update_code!(func, ein"bdce,dk,ej->bjck", -2//1, [g_vvvv, rAIxx_vo, uAIxx_vo])
    update_code!(func, ein"bkld,jl,cd->bjck", -2//1, [g_voov, rAxAx_oo, txIxI_vv])
    update_code!(func, ein"bdlk,jl,cd->bjck", -2//1, [g_vvoo, rAxAx_oo, txIxI_vv])
    update_code!(func, ein"bkld,jd,cl->bjck", -2//1, [g_voov, rAxxI_ov, tAIxx_vo])
    update_code!(func, ein"bkld,lc,dj->bjck", -2//1, [g_voov, rAxxI_ov, tAIxx_vo])
    update_code!(func, ein"bdce,je,dk->bjck", 2//1, [g_vvvv, rAxxI_ov, tAIxx_vo])
    update_code!(func, ein"bdlk,jc,dl->bjck", -2//1, [g_vvoo, rAxxI_ov, tAIxx_vo])
    update_code!(func, ein"ljmk,lc,bm->bjck", 2//1, [g_oooo, rAxxI_ov, tAIxx_vo])
    update_code!(func, ein"bkld,jd,lc->bjck", -2//1, [g_voov, rAxxI_ov, tAxxI_ov])
    update_code!(func, ein"bkld,lc,jd->bjck", -2//1, [g_voov, rAxxI_ov, tAxxI_ov])
    update_code!(func, ein"bdce,je,kd->bjck", 2//1, [g_vvvv, rAxxI_ov, tAxxI_ov])
    update_code!(func, ein"bdlk,jc,ld->bjck", -2//1, [g_vvoo, rAxxI_ov, tAxxI_ov])
    update_code!(func, ein"ljmk,lc,mb->bjck", 2//1, [g_oooo, rAxxI_ov, tAxxI_ov])
    update_code!(func, ein"bkld,jc,dl->bjck", 2//1, [g_voov, rAxxI_ov, uAIxx_vo])
    update_code!(func, ein"bdce,jd,ek->bjck", -2//1, [g_vvvv, rAxxI_ov, uAIxx_vo])
    update_code!(func, ein"bdlk,jd,cl->bjck", 2//1, [g_vvoo, rAxxI_ov, uAIxx_vo])
    update_code!(func, ein"bdlk,lc,dj->bjck", 2//1, [g_vvoo, rAxxI_ov, uAIxx_vo])
    update_code!(func, ein"ljmk,lb,cm->bjck", -2//1, [g_oooo, rAxxI_ov, uAIxx_vo])
    update_code!(func, ein"bkld,cd,jl->bjck", -2//1, [g_voov, rxIxI_vv, tAxAx_oo])
    update_code!(func, ein"bdlk,cd,jl->bjck", -2//1, [g_vvoo, rxIxI_vv, tAxAx_oo])
    update_code!(func, ein"ld,bjcl,dk->bjck", -4//1, [gAIxx_ov, r_vovo, uAIxx_vo])
    update_code!(func, ein"ld,bjdk,cl->bjck", -4//1, [gAIxx_ov, r_vovo, uAIxx_vo])
    update_code!(func, ein"ld,bkcl,dj->bjck", 2//1, [gAIxx_ov, r_vovo, uAIxx_vo])
    update_code!(func, ein"ld,bkdj,cl->bjck", 2//1, [gAIxx_ov, r_vovo, uAIxx_vo])
    update_code!(func, ein"ld,jc,bkdl->bjck", 2//1, [gAIxx_ov, rAxxI_ov, u_vovo])
    update_code!(func, ein"ld,jd,blck->bjck", 2//1, [gAIxx_ov, rAxxI_ov, u_vovo])
    update_code!(func, ein"ld,lb,ckdj->bjck", 2//1, [gAIxx_ov, rAxxI_ov, u_vovo])
    update_code!(func, ein"ld,jbk,cdl->bjck", 2//1, [gAIxx_ov, rAxxx_ovo, uxIxx_vvo])
    update_code!(func, ein"ld,jck,bdl->bjck", -4//1, [gAIxx_ov, rAxxx_ovo, uxIxx_vvo])
    update_code!(func, ein"ld,jcl,bdk->bjck", 2//1, [gAIxx_ov, rAxxx_ovo, uxIxx_vvo])
    update_code!(func, ein"ld,jdk,bcl->bjck", 2//1, [gAIxx_ov, rAxxx_ovo, uxIxx_vvo])
    update_code!(func, ein"ld,jbl,ckd->bjck", 2//1, [gAIxx_ov, rAxxx_ovo, uxxxI_vov])
    update_code!(func, ein"ld,lbj,ckd->bjck", -4//1, [gAIxx_ov, rAxxx_ovo, uxxxI_vov])
    update_code!(func, ein"ld,lbk,cjd->bjck", 2//1, [gAIxx_ov, rAxxx_ovo, uxxxI_vov])
    update_code!(func, ein"ld,bcj,kdl->bjck", 2//1, [gAIxx_ov, rxIxx_vvo, uAxxx_ovo])
    update_code!(func, ein"ld,bck,jdl->bjck", -4//1, [gAIxx_ov, rxIxx_vvo, uAxxx_ovo])
    update_code!(func, ein"ld,bcl,jdk->bjck", 2//1, [gAIxx_ov, rxIxx_vvo, uAxxx_ovo])
    update_code!(func, ein"ld,bdj,lck->bjck", 2//1, [gAIxx_ov, rxIxx_vvo, uAxxx_ovo])
    update_code!(func, ein"ld,bdk,jcl->bjck", 2//1, [gAIxx_ov, rxIxx_vvo, uAxxx_ovo])
    update_code!(func, ein"ld,bjd,lck->bjck", -4//1, [gAIxx_ov, rxxxI_vov, uAxxx_ovo])
    update_code!(func, ein"ld,bkd,lcj->bjck", 2//1, [gAIxx_ov, rxxxI_vov, uAxxx_ovo])
    update_code!(func, ein"de,bjdk,ce->bjck", -4//1, [gAxAx_vv, r_vovo, txIxI_vv])
    update_code!(func, ein"de,bkdj,ce->bjck", 2//1, [gAxAx_vv, r_vovo, txIxI_vv])
    update_code!(func, ein"de,bd,ckej->bjck", -2//1, [gAxAx_vv, rxIxI_vv, u_vovo])
    update_code!(func, ein"de,bcj,dek->bjck", 2//1, [gAxAx_vv, rxIxx_vvo, txIxx_vvo])
    update_code!(func, ein"de,bck,dej->bjck", -4//1, [gAxAx_vv, rxIxx_vvo, txIxx_vvo])
    update_code!(func, ein"de,bdk,cej->bjck", 2//1, [gAxAx_vv, rxIxx_vvo, txIxx_vvo])
    update_code!(func, ein"de,bdk,cje->bjck", 2//1, [gAxAx_vv, rxIxx_vvo, txxxI_vov])
    update_code!(func, ein"de,bdj,cke->bjck", -2//1, [gAxAx_vv, rxIxx_vvo, uxxxI_vov])
    update_code!(func, ein"de,bjd,cke->bjck", 4//1, [gAxAx_vv, rxxxI_vov, uxxxI_vov])
    update_code!(func, ein"de,bkd,cje->bjck", -2//1, [gAxAx_vv, rxxxI_vov, uxxxI_vov])
    update_code!(func, ein"dl,bjcl,dk->bjck", 4//1, [gAxxI_vo, r_vovo, tAIxx_vo])
    update_code!(func, ein"dl,bjdk,cl->bjck", 4//1, [gAxxI_vo, r_vovo, tAIxx_vo])
    update_code!(func, ein"dl,bkcl,dj->bjck", -2//1, [gAxxI_vo, r_vovo, tAIxx_vo])
    update_code!(func, ein"dl,bkdj,cl->bjck", -2//1, [gAxxI_vo, r_vovo, tAIxx_vo])
    update_code!(func, ein"dl,bjcl,kd->bjck", 4//1, [gAxxI_vo, r_vovo, tAxxI_ov])
    update_code!(func, ein"dl,bjdk,lc->bjck", 4//1, [gAxxI_vo, r_vovo, tAxxI_ov])
    update_code!(func, ein"dl,bkcl,jd->bjck", -2//1, [gAxxI_vo, r_vovo, tAxxI_ov])
    update_code!(func, ein"dl,bkdj,lc->bjck", -2//1, [gAxxI_vo, r_vovo, tAxxI_ov])
    update_code!(func, ein"dl,jc,bkdl->bjck", -2//1, [gAxxI_vo, rAxxI_ov, t_vovo])
    update_code!(func, ein"dl,jc,bldk->bjck", -2//1, [gAxxI_vo, rAxxI_ov, t_vovo])
    update_code!(func, ein"dl,jd,blck->bjck", 2//1, [gAxxI_vo, rAxxI_ov, u_vovo])
    update_code!(func, ein"dl,lb,ckdj->bjck", 2//1, [gAxxI_vo, rAxxI_ov, u_vovo])
    update_code!(func, ein"dl,jbk,cdl->bjck", -2//1, [gAxxI_vo, rAxxx_ovo, txIxx_vvo])
    update_code!(func, ein"dl,jck,bdl->bjck", 4//1, [gAxxI_vo, rAxxx_ovo, txIxx_vvo])
    update_code!(func, ein"dl,jcl,bdk->bjck", -2//1, [gAxxI_vo, rAxxx_ovo, txIxx_vvo])
    update_code!(func, ein"dl,jdk,bcl->bjck", -2//1, [gAxxI_vo, rAxxx_ovo, txIxx_vvo])
    update_code!(func, ein"dl,jbk,cld->bjck", -2//1, [gAxxI_vo, rAxxx_ovo, txxxI_vov])
    update_code!(func, ein"dl,jck,bld->bjck", 4//1, [gAxxI_vo, rAxxx_ovo, txxxI_vov])
    update_code!(func, ein"dl,jcl,bkd->bjck", -2//1, [gAxxI_vo, rAxxx_ovo, txxxI_vov])
    update_code!(func, ein"dl,jdk,blc->bjck", -2//1, [gAxxI_vo, rAxxx_ovo, txxxI_vov])
    update_code!(func, ein"dl,jbl,ckd->bjck", 2//1, [gAxxI_vo, rAxxx_ovo, uxxxI_vov])
    update_code!(func, ein"dl,lbj,ckd->bjck", -4//1, [gAxxI_vo, rAxxx_ovo, uxxxI_vov])
    update_code!(func, ein"dl,lbk,cjd->bjck", 2//1, [gAxxI_vo, rAxxx_ovo, uxxxI_vov])
    update_code!(func, ein"dl,bcj,kdl->bjck", -2//1, [gAxxI_vo, rxIxx_vvo, tAxxx_ovo])
    update_code!(func, ein"dl,bcj,ldk->bjck", -2//1, [gAxxI_vo, rxIxx_vvo, tAxxx_ovo])
    update_code!(func, ein"dl,bck,jdl->bjck", 4//1, [gAxxI_vo, rxIxx_vvo, tAxxx_ovo])
    update_code!(func, ein"dl,bck,ldj->bjck", 4//1, [gAxxI_vo, rxIxx_vvo, tAxxx_ovo])
    update_code!(func, ein"dl,bcl,jdk->bjck", -2//1, [gAxxI_vo, rxIxx_vvo, tAxxx_ovo])
    update_code!(func, ein"dl,bcl,kdj->bjck", -2//1, [gAxxI_vo, rxIxx_vvo, tAxxx_ovo])
    update_code!(func, ein"dl,bdk,jcl->bjck", -2//1, [gAxxI_vo, rxIxx_vvo, tAxxx_ovo])
    update_code!(func, ein"dl,bdk,lcj->bjck", -2//1, [gAxxI_vo, rxIxx_vvo, tAxxx_ovo])
    update_code!(func, ein"dl,bdj,lck->bjck", 2//1, [gAxxI_vo, rxIxx_vvo, uAxxx_ovo])
    update_code!(func, ein"dl,bjd,lck->bjck", -4//1, [gAxxI_vo, rxxxI_vov, uAxxx_ovo])
    update_code!(func, ein"dl,bkd,lcj->bjck", 2//1, [gAxxI_vo, rxxxI_vov, uAxxx_ovo])
    update_code!(func, ein"jld,c,bkdl->bjck", 2//1, [gAxxx_oov, rAIxI_v, u_vovo])
    update_code!(func, ein"dbe,c,dkej->bjck", -2//1, [gAxxx_vvv, rAIxI_v, u_vovo])
    update_code!(func, ein"dlj,c,bldk->bjck", 2//1, [gAxxx_voo, rAIxI_v, u_vovo])
    update_code!(func, ein"jld,bk,cdl->bjck", 2//1, [gAxxx_oov, rAIxx_vo, uxIxx_vvo])
    update_code!(func, ein"jld,ck,bdl->bjck", -4//1, [gAxxx_oov, rAIxx_vo, uxIxx_vvo])
    update_code!(func, ein"jld,cl,bdk->bjck", 2//1, [gAxxx_oov, rAIxx_vo, uxIxx_vvo])
    update_code!(func, ein"jld,dk,bcl->bjck", 2//1, [gAxxx_oov, rAIxx_vo, uxIxx_vvo])
    update_code!(func, ein"dbe,cj,dek->bjck", -2//1, [gAxxx_vvv, rAIxx_vo, uxIxx_vvo])
    update_code!(func, ein"dbe,ck,dej->bjck", 4//1, [gAxxx_vvv, rAIxx_vo, uxIxx_vvo])
    update_code!(func, ein"dbe,dk,cej->bjck", -2//1, [gAxxx_vvv, rAIxx_vo, uxIxx_vvo])
    update_code!(func, ein"dbe,ek,cjd->bjck", -2//1, [gAxxx_vvv, rAIxx_vo, uxxxI_vov])
    update_code!(func, ein"dlj,bk,cld->bjck", 2//1, [gAxxx_voo, rAIxx_vo, uxxxI_vov])
    update_code!(func, ein"dlj,ck,bld->bjck", -4//1, [gAxxx_voo, rAIxx_vo, uxxxI_vov])
    update_code!(func, ein"dlj,cl,bkd->bjck", 2//1, [gAxxx_voo, rAIxx_vo, uxxxI_vov])
    update_code!(func, ein"dlj,dk,blc->bjck", 2//1, [gAxxx_voo, rAIxx_vo, uxxxI_vov])
    update_code!(func, ein"jld,kd,bcl->bjck", -2//1, [gAxxx_oov, rAxxI_ov, txIxx_vvo])
    update_code!(func, ein"jld,lc,bdk->bjck", -2//1, [gAxxx_oov, rAxxI_ov, txIxx_vvo])
    update_code!(func, ein"dbe,jc,dek->bjck", 2//1, [gAxxx_vvv, rAxxI_ov, txIxx_vvo])
    update_code!(func, ein"dbe,ke,cdj->bjck", 2//1, [gAxxx_vvv, rAxxI_ov, txIxx_vvo])
    update_code!(func, ein"dlj,kb,cdl->bjck", -2//1, [gAxxx_voo, rAxxI_ov, txIxx_vvo])
    update_code!(func, ein"dlj,lc,bdk->bjck", -2//1, [gAxxx_voo, rAxxI_ov, txIxx_vvo])
    update_code!(func, ein"jld,kd,blc->bjck", -2//1, [gAxxx_oov, rAxxI_ov, txxxI_vov])
    update_code!(func, ein"jld,lc,bkd->bjck", -2//1, [gAxxx_oov, rAxxI_ov, txxxI_vov])
    update_code!(func, ein"dbe,jc,dke->bjck", 2//1, [gAxxx_vvv, rAxxI_ov, txxxI_vov])
    update_code!(func, ein"dbe,ke,cjd->bjck", 2//1, [gAxxx_vvv, rAxxI_ov, txxxI_vov])
    update_code!(func, ein"dlj,kb,cld->bjck", -2//1, [gAxxx_voo, rAxxI_ov, txxxI_vov])
    update_code!(func, ein"dlj,lc,bkd->bjck", -2//1, [gAxxx_voo, rAxxI_ov, txxxI_vov])
    update_code!(func, ein"jld,kb,cdl->bjck", 2//1, [gAxxx_oov, rAxxI_ov, uxIxx_vvo])
    update_code!(func, ein"jld,kc,bdl->bjck", 2//1, [gAxxx_oov, rAxxI_ov, uxIxx_vvo])
    update_code!(func, ein"dbe,kc,dej->bjck", -2//1, [gAxxx_vvv, rAxxI_ov, uxIxx_vvo])
    update_code!(func, ein"dbe,kd,cej->bjck", -2//1, [gAxxx_vvv, rAxxI_ov, uxIxx_vvo])
    update_code!(func, ein"jld,lb,ckd->bjck", 2//1, [gAxxx_oov, rAxxI_ov, uxxxI_vov])
    update_code!(func, ein"dbe,jd,cke->bjck", -2//1, [gAxxx_vvv, rAxxI_ov, uxxxI_vov])
    update_code!(func, ein"dbe,je,ckd->bjck", -2//1, [gAxxx_vvv, rAxxI_ov, uxxxI_vov])
    update_code!(func, ein"dlj,kc,bld->bjck", 2//1, [gAxxx_voo, rAxxI_ov, uxxxI_vov])
    update_code!(func, ein"dlj,kd,blc->bjck", 2//1, [gAxxx_voo, rAxxI_ov, uxxxI_vov])
    update_code!(func, ein"dlj,lb,ckd->bjck", 2//1, [gAxxx_voo, rAxxI_ov, uxxxI_vov])
    update_code!(func, ein"jld,kcl,bd->bjck", -2//1, [gAxxx_oov, rAxxx_ovo, txIxI_vv])
    update_code!(func, ein"jld,lbk,cd->bjck", -2//1, [gAxxx_oov, rAxxx_ovo, txIxI_vv])
    update_code!(func, ein"jld,lck,bd->bjck", 4//1, [gAxxx_oov, rAxxx_ovo, txIxI_vv])
    update_code!(func, ein"dbe,jck,de->bjck", -4//1, [gAxxx_vvv, rAxxx_ovo, txIxI_vv])
    update_code!(func, ein"dbe,jdk,ce->bjck", 2//1, [gAxxx_vvv, rAxxx_ovo, txIxI_vv])
    update_code!(func, ein"dbe,jek,cd->bjck", 2//1, [gAxxx_vvv, rAxxx_ovo, txIxI_vv])
    update_code!(func, ein"dbe,kcj,de->bjck", 2//1, [gAxxx_vvv, rAxxx_ovo, txIxI_vv])
    update_code!(func, ein"dlj,kcl,bd->bjck", -2//1, [gAxxx_voo, rAxxx_ovo, txIxI_vv])
    update_code!(func, ein"dlj,lbk,cd->bjck", -2//1, [gAxxx_voo, rAxxx_ovo, txIxI_vv])
    update_code!(func, ein"dlj,lck,bd->bjck", 4//1, [gAxxx_voo, rAxxx_ovo, txIxI_vv])
    update_code!(func, ein"jld,cd,kbl->bjck", -2//1, [gAxxx_oov, rxIxI_vv, tAxxx_ovo])
    update_code!(func, ein"jld,cd,lbk->bjck", -2//1, [gAxxx_oov, rxIxI_vv, tAxxx_ovo])
    update_code!(func, ein"dbe,ce,jdk->bjck", 2//1, [gAxxx_vvv, rxIxI_vv, tAxxx_ovo])
    update_code!(func, ein"dbe,ce,kdj->bjck", 2//1, [gAxxx_vvv, rxIxI_vv, tAxxx_ovo])
    update_code!(func, ein"dlj,bc,kdl->bjck", -2//1, [gAxxx_voo, rxIxI_vv, tAxxx_ovo])
    update_code!(func, ein"dlj,bc,ldk->bjck", -2//1, [gAxxx_voo, rxIxI_vv, tAxxx_ovo])
    update_code!(func, ein"jld,bc,kdl->bjck", 2//1, [gAxxx_oov, rxIxI_vv, uAxxx_ovo])
    update_code!(func, ein"jld,bd,lck->bjck", 2//1, [gAxxx_oov, rxIxI_vv, uAxxx_ovo])
    update_code!(func, ein"dbe,cd,kej->bjck", -2//1, [gAxxx_vvv, rxIxI_vv, uAxxx_ovo])
    update_code!(func, ein"dlj,bd,lck->bjck", 2//1, [gAxxx_voo, rxIxI_vv, uAxxx_ovo])
    update_code!(func, ein"dlj,cd,kbl->bjck", 2//1, [gAxxx_voo, rxIxI_vv, uAxxx_ovo])
    update_code!(func, ein"jld,cdk,bl->bjck", -2//1, [gAxxx_oov, rxIxx_vvo, tAIxx_vo])
    update_code!(func, ein"dbe,cek,dj->bjck", 2//1, [gAxxx_vvv, rxIxx_vvo, tAIxx_vo])
    update_code!(func, ein"dlj,bck,dl->bjck", 4//1, [gAxxx_voo, rxIxx_vvo, tAIxx_vo])
    update_code!(func, ein"dlj,bcl,dk->bjck", -2//1, [gAxxx_voo, rxIxx_vvo, tAIxx_vo])
    update_code!(func, ein"dlj,bdk,cl->bjck", -2//1, [gAxxx_voo, rxIxx_vvo, tAIxx_vo])
    update_code!(func, ein"jld,cdk,lb->bjck", -2//1, [gAxxx_oov, rxIxx_vvo, tAxxI_ov])
    update_code!(func, ein"dbe,cek,jd->bjck", 2//1, [gAxxx_vvv, rxIxx_vvo, tAxxI_ov])
    update_code!(func, ein"dlj,bck,ld->bjck", 4//1, [gAxxx_voo, rxIxx_vvo, tAxxI_ov])
    update_code!(func, ein"dlj,bcl,kd->bjck", -2//1, [gAxxx_voo, rxIxx_vvo, tAxxI_ov])
    update_code!(func, ein"dlj,bdk,lc->bjck", -2//1, [gAxxx_voo, rxIxx_vvo, tAxxI_ov])
    update_code!(func, ein"jld,bck,dl->bjck", -4//1, [gAxxx_oov, rxIxx_vvo, uAIxx_vo])
    update_code!(func, ein"jld,bcl,dk->bjck", 2//1, [gAxxx_oov, rxIxx_vvo, uAIxx_vo])
    update_code!(func, ein"jld,bdk,cl->bjck", 2//1, [gAxxx_oov, rxIxx_vvo, uAIxx_vo])
    update_code!(func, ein"dbe,cdk,ej->bjck", -2//1, [gAxxx_vvv, rxIxx_vvo, uAIxx_vo])
    update_code!(func, ein"dlj,cdk,bl->bjck", 2//1, [gAxxx_voo, rxIxx_vvo, uAIxx_vo])
    update_code!(func, ein"jld,bkd,cl->bjck", -2//1, [gAxxx_oov, rxxxI_vov, tAIxx_vo])
    update_code!(func, ein"jld,ckd,bl->bjck", 4//1, [gAxxx_oov, rxxxI_vov, tAIxx_vo])
    update_code!(func, ein"dbe,cje,dk->bjck", 2//1, [gAxxx_vvv, rxxxI_vov, tAIxx_vo])
    update_code!(func, ein"dbe,cke,dj->bjck", -4//1, [gAxxx_vvv, rxxxI_vov, tAIxx_vo])
    update_code!(func, ein"dlj,bkc,dl->bjck", -2//1, [gAxxx_voo, rxxxI_vov, tAIxx_vo])
    update_code!(func, ein"jld,bkd,lc->bjck", -2//1, [gAxxx_oov, rxxxI_vov, tAxxI_ov])
    update_code!(func, ein"jld,ckd,lb->bjck", 4//1, [gAxxx_oov, rxxxI_vov, tAxxI_ov])
    update_code!(func, ein"dbe,cje,kd->bjck", 2//1, [gAxxx_vvv, rxxxI_vov, tAxxI_ov])
    update_code!(func, ein"dbe,cke,jd->bjck", -4//1, [gAxxx_vvv, rxxxI_vov, tAxxI_ov])
    update_code!(func, ein"dlj,bkc,ld->bjck", -2//1, [gAxxx_voo, rxxxI_vov, tAxxI_ov])
    update_code!(func, ein"jld,bkc,dl->bjck", 2//1, [gAxxx_oov, rxxxI_vov, uAIxx_vo])
    update_code!(func, ein"dbe,cjd,ek->bjck", -2//1, [gAxxx_vvv, rxxxI_vov, uAIxx_vo])
    update_code!(func, ein"dbe,ckd,ej->bjck", 4//1, [gAxxx_vvv, rxxxI_vov, uAIxx_vo])
    update_code!(func, ein"dlj,bkd,cl->bjck", 2//1, [gAxxx_voo, rxxxI_vov, uAIxx_vo])
    update_code!(func, ein"dlj,ckd,bl->bjck", -4//1, [gAxxx_voo, rxxxI_vov, uAIxx_vo])
    update_code!(func, ein"lm,bjcl,km->bjck", -4//1, [gxIxI_oo, r_vovo, tAxAx_oo])
    update_code!(func, ein"lm,bkcl,jm->bjck", 2//1, [gxIxI_oo, r_vovo, tAxAx_oo])
    update_code!(func, ein"lm,jl,bmck->bjck", -2//1, [gxIxI_oo, rAxAx_oo, u_vovo])
    update_code!(func, ein"lm,jbk,lcm->bjck", 2//1, [gxIxI_oo, rAxxx_ovo, tAxxx_ovo])
    update_code!(func, ein"lm,jck,lbm->bjck", -4//1, [gxIxI_oo, rAxxx_ovo, tAxxx_ovo])
    update_code!(func, ein"lm,jcl,kbm->bjck", 2//1, [gxIxI_oo, rAxxx_ovo, tAxxx_ovo])
    update_code!(func, ein"lm,jcl,mbk->bjck", 2//1, [gxIxI_oo, rAxxx_ovo, tAxxx_ovo])
    update_code!(func, ein"lm,jbl,mck->bjck", -2//1, [gxIxI_oo, rAxxx_ovo, uAxxx_ovo])
    update_code!(func, ein"lm,lbj,mck->bjck", 4//1, [gxIxI_oo, rAxxx_ovo, uAxxx_ovo])
    update_code!(func, ein"lm,lbk,mcj->bjck", -2//1, [gxIxI_oo, rAxxx_ovo, uAxxx_ovo])
    update_code!(func, ein"bld,k,cjdl->bjck", 2//1, [gxIxx_vov, rAIAx_o, u_vovo])
    update_code!(func, ein"lmj,k,bmcl->bjck", -2//1, [gxIxx_ooo, rAIAx_o, u_vovo])
    update_code!(func, ein"bld,cj,kdl->bjck", 2//1, [gxIxx_vov, rAIxx_vo, uAxxx_ovo])
    update_code!(func, ein"bld,ck,jdl->bjck", -4//1, [gxIxx_vov, rAIxx_vo, uAxxx_ovo])
    update_code!(func, ein"bld,cl,jdk->bjck", 2//1, [gxIxx_vov, rAIxx_vo, uAxxx_ovo])
    update_code!(func, ein"bld,dk,jcl->bjck", 2//1, [gxIxx_vov, rAIxx_vo, uAxxx_ovo])
    update_code!(func, ein"lmj,bk,lcm->bjck", -2//1, [gxIxx_ooo, rAIxx_vo, uAxxx_ovo])
    update_code!(func, ein"lmj,ck,lbm->bjck", 4//1, [gxIxx_ooo, rAIxx_vo, uAxxx_ovo])
    update_code!(func, ein"lmj,cl,kbm->bjck", -2//1, [gxIxx_ooo, rAIxx_vo, uAxxx_ovo])
    update_code!(func, ein"lmj,cm,lbk->bjck", -2//1, [gxIxx_ooo, rAIxx_vo, uAxxx_ovo])
    update_code!(func, ein"bld,kl,cdj->bjck", -2//1, [gxIxx_vov, rAxAx_oo, txIxx_vvo])
    update_code!(func, ein"lmj,km,bcl->bjck", 2//1, [gxIxx_ooo, rAxAx_oo, txIxx_vvo])
    update_code!(func, ein"bld,kl,cjd->bjck", -2//1, [gxIxx_vov, rAxAx_oo, txxxI_vov])
    update_code!(func, ein"lmj,km,blc->bjck", 2//1, [gxIxx_ooo, rAxAx_oo, txxxI_vov])
    update_code!(func, ein"bld,jk,cdl->bjck", 2//1, [gxIxx_vov, rAxAx_oo, uxIxx_vvo])
    update_code!(func, ein"bld,jl,ckd->bjck", 2//1, [gxIxx_vov, rAxAx_oo, uxxxI_vov])
    update_code!(func, ein"lmj,kl,bmc->bjck", -2//1, [gxIxx_ooo, rAxAx_oo, uxxxI_vov])
    update_code!(func, ein"bld,kd,jcl->bjck", -2//1, [gxIxx_vov, rAxxI_ov, tAxxx_ovo])
    update_code!(func, ein"bld,kd,lcj->bjck", -2//1, [gxIxx_vov, rAxxI_ov, tAxxx_ovo])
    update_code!(func, ein"bld,lc,jdk->bjck", -2//1, [gxIxx_vov, rAxxI_ov, tAxxx_ovo])
    update_code!(func, ein"bld,lc,kdj->bjck", -2//1, [gxIxx_vov, rAxxI_ov, tAxxx_ovo])
    update_code!(func, ein"lmj,kb,lcm->bjck", 2//1, [gxIxx_ooo, rAxxI_ov, tAxxx_ovo])
    update_code!(func, ein"lmj,kb,mcl->bjck", 2//1, [gxIxx_ooo, rAxxI_ov, tAxxx_ovo])
    update_code!(func, ein"lmj,mc,kbl->bjck", 2//1, [gxIxx_ooo, rAxxI_ov, tAxxx_ovo])
    update_code!(func, ein"lmj,mc,lbk->bjck", 2//1, [gxIxx_ooo, rAxxI_ov, tAxxx_ovo])
    update_code!(func, ein"bld,jc,kdl->bjck", 2//1, [gxIxx_vov, rAxxI_ov, uAxxx_ovo])
    update_code!(func, ein"bld,jd,lck->bjck", 2//1, [gxIxx_vov, rAxxI_ov, uAxxx_ovo])
    update_code!(func, ein"bld,kc,jdl->bjck", 2//1, [gxIxx_vov, rAxxI_ov, uAxxx_ovo])
    update_code!(func, ein"lmj,kc,lbm->bjck", -2//1, [gxIxx_ooo, rAxxI_ov, uAxxx_ovo])
    update_code!(func, ein"lmj,lb,mck->bjck", -2//1, [gxIxx_ooo, rAxxI_ov, uAxxx_ovo])
    update_code!(func, ein"lmj,lc,kbm->bjck", -2//1, [gxIxx_ooo, rAxxI_ov, uAxxx_ovo])
    update_code!(func, ein"lmj,mb,lck->bjck", -2//1, [gxIxx_ooo, rAxxI_ov, uAxxx_ovo])
    update_code!(func, ein"bld,kcl,dj->bjck", -2//1, [gxIxx_vov, rAxxx_ovo, tAIxx_vo])
    update_code!(func, ein"bld,lcj,dk->bjck", -2//1, [gxIxx_vov, rAxxx_ovo, tAIxx_vo])
    update_code!(func, ein"bld,lck,dj->bjck", 4//1, [gxIxx_vov, rAxxx_ovo, tAIxx_vo])
    update_code!(func, ein"lmj,kcm,bl->bjck", 2//1, [gxIxx_ooo, rAxxx_ovo, tAIxx_vo])
    update_code!(func, ein"lmj,mbk,cl->bjck", 2//1, [gxIxx_ooo, rAxxx_ovo, tAIxx_vo])
    update_code!(func, ein"lmj,mck,bl->bjck", -4//1, [gxIxx_ooo, rAxxx_ovo, tAIxx_vo])
    update_code!(func, ein"bld,kcl,jd->bjck", -2//1, [gxIxx_vov, rAxxx_ovo, tAxxI_ov])
    update_code!(func, ein"bld,lcj,kd->bjck", -2//1, [gxIxx_vov, rAxxx_ovo, tAxxI_ov])
    update_code!(func, ein"bld,lck,jd->bjck", 4//1, [gxIxx_vov, rAxxx_ovo, tAxxI_ov])
    update_code!(func, ein"lmj,kcm,lb->bjck", 2//1, [gxIxx_ooo, rAxxx_ovo, tAxxI_ov])
    update_code!(func, ein"lmj,mbk,lc->bjck", 2//1, [gxIxx_ooo, rAxxx_ovo, tAxxI_ov])
    update_code!(func, ein"lmj,mck,lb->bjck", -4//1, [gxIxx_ooo, rAxxx_ovo, tAxxI_ov])
    update_code!(func, ein"bld,jck,dl->bjck", -4//1, [gxIxx_vov, rAxxx_ovo, uAIxx_vo])
    update_code!(func, ein"bld,jcl,dk->bjck", 2//1, [gxIxx_vov, rAxxx_ovo, uAIxx_vo])
    update_code!(func, ein"bld,jdk,cl->bjck", 2//1, [gxIxx_vov, rAxxx_ovo, uAIxx_vo])
    update_code!(func, ein"bld,kcj,dl->bjck", 2//1, [gxIxx_vov, rAxxx_ovo, uAIxx_vo])
    update_code!(func, ein"lmj,kcl,bm->bjck", -2//1, [gxIxx_ooo, rAxxx_ovo, uAIxx_vo])
    update_code!(func, ein"lmj,lbk,cm->bjck", -2//1, [gxIxx_ooo, rAxxx_ovo, uAIxx_vo])
    update_code!(func, ein"lmj,lck,bm->bjck", 4//1, [gxIxx_ooo, rAxxx_ovo, uAIxx_vo])
    update_code!(func, ein"bld,cdk,jl->bjck", -2//1, [gxIxx_vov, rxIxx_vvo, tAxAx_oo])
    update_code!(func, ein"lmj,bck,lm->bjck", -4//1, [gxIxx_ooo, rxIxx_vvo, tAxAx_oo])
    update_code!(func, ein"lmj,bcl,km->bjck", 2//1, [gxIxx_ooo, rxIxx_vvo, tAxAx_oo])
    update_code!(func, ein"lmj,bcm,kl->bjck", 2//1, [gxIxx_ooo, rxIxx_vvo, tAxAx_oo])
    update_code!(func, ein"bld,cjd,kl->bjck", -2//1, [gxIxx_vov, rxxxI_vov, tAxAx_oo])
    update_code!(func, ein"bld,ckd,jl->bjck", 4//1, [gxIxx_vov, rxxxI_vov, tAxAx_oo])
    update_code!(func, ein"lmj,bkc,lm->bjck", 2//1, [gxIxx_ooo, rxxxI_vov, tAxAx_oo])
    update_code!(func, ein"bdl,k,cldj->bjck", 2//1, [gxxxI_vvo, rAIAx_o, u_vovo])
    update_code!(func, ein"bdl,cj,ldk->bjck", 2//1, [gxxxI_vvo, rAIxx_vo, uAxxx_ovo])
    update_code!(func, ein"bdl,ck,ldj->bjck", -4//1, [gxxxI_vvo, rAIxx_vo, uAxxx_ovo])
    update_code!(func, ein"bdl,cl,kdj->bjck", 2//1, [gxxxI_vvo, rAIxx_vo, uAxxx_ovo])
    update_code!(func, ein"bdl,dk,lcj->bjck", 2//1, [gxxxI_vvo, rAIxx_vo, uAxxx_ovo])
    update_code!(func, ein"bdl,jk,cdl->bjck", -2//1, [gxxxI_vvo, rAxAx_oo, txIxx_vvo])
    update_code!(func, ein"bdl,jk,cld->bjck", -2//1, [gxxxI_vvo, rAxAx_oo, txxxI_vov])
    update_code!(func, ein"bdl,kl,cdj->bjck", 2//1, [gxxxI_vvo, rAxAx_oo, uxIxx_vvo])
    update_code!(func, ein"bdl,jl,ckd->bjck", 2//1, [gxxxI_vvo, rAxAx_oo, uxxxI_vov])
    update_code!(func, ein"bdl,jc,kdl->bjck", -2//1, [gxxxI_vvo, rAxxI_ov, tAxxx_ovo])
    update_code!(func, ein"bdl,jc,ldk->bjck", -2//1, [gxxxI_vvo, rAxxI_ov, tAxxx_ovo])
    update_code!(func, ein"bdl,kd,jcl->bjck", -2//1, [gxxxI_vvo, rAxxI_ov, tAxxx_ovo])
    update_code!(func, ein"bdl,kd,lcj->bjck", -2//1, [gxxxI_vvo, rAxxI_ov, tAxxx_ovo])
    update_code!(func, ein"bdl,jd,lck->bjck", 2//1, [gxxxI_vvo, rAxxI_ov, uAxxx_ovo])
    update_code!(func, ein"bdl,kc,ldj->bjck", 2//1, [gxxxI_vvo, rAxxI_ov, uAxxx_ovo])
    update_code!(func, ein"bdl,lc,kdj->bjck", 2//1, [gxxxI_vvo, rAxxI_ov, uAxxx_ovo])
    update_code!(func, ein"bdl,jck,dl->bjck", 4//1, [gxxxI_vvo, rAxxx_ovo, tAIxx_vo])
    update_code!(func, ein"bdl,jcl,dk->bjck", -2//1, [gxxxI_vvo, rAxxx_ovo, tAIxx_vo])
    update_code!(func, ein"bdl,jdk,cl->bjck", -2//1, [gxxxI_vvo, rAxxx_ovo, tAIxx_vo])
    update_code!(func, ein"bdl,kcj,dl->bjck", -2//1, [gxxxI_vvo, rAxxx_ovo, tAIxx_vo])
    update_code!(func, ein"bdl,jck,ld->bjck", 4//1, [gxxxI_vvo, rAxxx_ovo, tAxxI_ov])
    update_code!(func, ein"bdl,jcl,kd->bjck", -2//1, [gxxxI_vvo, rAxxx_ovo, tAxxI_ov])
    update_code!(func, ein"bdl,jdk,lc->bjck", -2//1, [gxxxI_vvo, rAxxx_ovo, tAxxI_ov])
    update_code!(func, ein"bdl,kcj,ld->bjck", -2//1, [gxxxI_vvo, rAxxx_ovo, tAxxI_ov])
    update_code!(func, ein"bdl,kcl,dj->bjck", 2//1, [gxxxI_vvo, rAxxx_ovo, uAIxx_vo])
    update_code!(func, ein"bdl,lcj,dk->bjck", 2//1, [gxxxI_vvo, rAxxx_ovo, uAIxx_vo])
    update_code!(func, ein"bdl,lck,dj->bjck", -4//1, [gxxxI_vvo, rAxxx_ovo, uAIxx_vo])
    update_code!(func, ein"bdl,cdk,jl->bjck", -2//1, [gxxxI_vvo, rxIxx_vvo, tAxAx_oo])
    update_code!(func, ein"bdl,cjd,kl->bjck", -2//1, [gxxxI_vvo, rxxxI_vov, tAxAx_oo])
    update_code!(func, ein"bdl,ckd,jl->bjck", 4//1, [gxxxI_vvo, rxxxI_vov, tAxAx_oo])
    finalize_eT_function(func, "mu_4_H_1_nu_2_s", "doublet_ccsd")
end

println(io, s)
end
