   module subroutine mu_4_H_nu_1_ss_doublet_ccsd(wf, rho_aibj, FAx_v, FxI_o, L_ovov, L_vovo, gAIAI, gAIxx_ov, &
      gAxAx_oo, gAxAx_vv, gAxxI_vo, g_oooo, g_ovov, g_vvvv, gxIxI_oo, gxIxI_vv, rAIAI, rAxAx_oo, r_vovo, rxIxI_vv, &
      tAIAx_o, tAIxI_v, tAIxx_vo, tAxAx_oo, tAxxI_ov, tAxxx_ovo, t_aibj, txIxI_vv, txIxx_vvo, txxxI_vov, uAIxx_vo, &
      uAxxx_ovo, u_aibj, uxIxx_vvo)
!!
!! Generated function
!!
      implicit none
!
      class(doublet_ccsd), intent(in) :: wf
!
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(inout) :: rho_aibj
!
      real(dp), intent(in) :: gAIAI, rAIAI
      real(dp), dimension(wf%n_o), intent(in) :: FxI_o, tAIAx_o
      real(dp), dimension(wf%n_v), intent(in) :: FAx_v, tAIxI_v
      real(dp), dimension(wf%n_o,wf%n_o), intent(in) :: gAxAx_oo, gxIxI_oo, rAxAx_oo, tAxAx_oo
      real(dp), dimension(wf%n_o,wf%n_v), intent(in) :: gAIxx_ov, tAxxI_ov
      real(dp), dimension(wf%n_v,wf%n_o), intent(in) :: gAxxI_vo, tAIxx_vo, uAIxx_vo
      real(dp), dimension(wf%n_v,wf%n_v), intent(in) :: gAxAx_vv, gxIxI_vv, rxIxI_vv, txIxI_vv
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o), intent(in) :: tAxxx_ovo, uAxxx_ovo
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v), intent(in) :: txxxI_vov
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_o), intent(in) :: txIxx_vvo, uxIxx_vvo
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_o,wf%n_o), intent(in) :: g_oooo
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o,wf%n_v), intent(in) :: L_ovov, g_ovov
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(in) :: L_vovo, r_vovo, t_aibj, u_aibj
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_v,wf%n_v), intent(in) :: g_vvvv
!
      real(dp) :: X3, X4, X5, X6, X20, X22, X23, X24, X28, X29, X31, X33, X34, X35, X42, X46, X59, X62, X90, &
      X93, X96, X99, X102, X105, X107, X110, X112, X115
      real(dp), dimension(:), allocatable :: X89, X92, X95, X98
      real(dp), dimension(:,:), allocatable :: X14, X17, X19, X21, X26, X30, X32, X37, X39, X40, X41, X43, &
      X44, X45, X57, X58, X60, X61, X81, X86, X101, X104, X106, X109, X111, X114, X142, X144, X147, X152, X158, &
      X162, X165, X168, X174, X177, X181, X184, X189, X194, X197
      real(dp), dimension(:,:,:), allocatable :: X78, X79, X80, X83, X84, X85, X88, X91, X94, X97, X148, X149, &
      X150,  X153, X154, X155, X157, X161, X166, X169, X176, X180, X185, X186, X187, X190, X191, X195, X198
      real(dp), dimension(:,:,:,:), allocatable :: X1, X2, X7, X8, X9, X10, X11, X12, X13, X15, X16, X18, X25, &
      X27, X36, X38, X47, X48, X49, X50, X51, X52, X53, X54, X55, X56, X63, X64, X65, X66, X67, X68, X69, X70, X71, &
      X72, X73, X74, X75, X76, X77, X82, X87, X100, X103, X108, X113, X116, X117, X118, X119, X120, X121, X122, &
      X123, X124, X125, X126, X127, X128, X129, X130, X131, X132, X133, X134, X135, X136, X137, X138, X139, X140, &
      X141, X143, X145, X146, X151, X156, X159, X160, X163, X164, X167, X170, X171, X172, X173, X175, X178, X179, &
      X182, X183, X188, X192, X193, X196, X199
!
      real(dp), external :: ddot
!
      call daxpy(wf%n_v**2*wf%n_o**2, two*rAIAI, L_vovo, 1, rho_aibj, 1)
      call daxpy(wf%n_v**2*wf%n_o**2, four*gAIAI, r_vovo, 1, rho_aibj, 1)
      call add_1432_to_1234(-two*gAIAI, r_vovo, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2, &
         wf%n_o**2, &
         two, &
         rxIxI_vv, 1, &
         gAxAx_oo, 1, &
         X1, &
         wf%n_v**2)
!
      call add_1324_to_1234(one, X1, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1)
      call mem%alloc(X2, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2, &
         wf%n_o**2, &
         two, &
         gxIxI_vv, 1, &
         rAxAx_oo, 1, &
         X2, &
         wf%n_v**2)
!
      call add_1324_to_1234(one, X2, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2)
      X3 = eight * ddot(wf%n_v, FAx_v, 1, tAIxI_v, 1)
      call daxpy(wf%n_v**2*wf%n_o**2, X3, r_vovo, 1, rho_aibj, 1)
      X4 = -four * ddot(wf%n_v, FAx_v, 1, tAIxI_v, 1)
      call add_1432_to_1234(X4, r_vovo, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      X5 = -eight * ddot(wf%n_o, FxI_o, 1, tAIAx_o, 1)
      call daxpy(wf%n_v**2*wf%n_o**2, X5, r_vovo, 1, rho_aibj, 1)
      X6 = four * ddot(wf%n_o, FxI_o, 1, tAIAx_o, 1)
      call add_1432_to_1234(X6, r_vovo, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X7, wf%n_v, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvvv, X7, wf%n_v, wf%n_v, wf%n_v, wf%n_v)
      call mem%alloc(X8, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X8, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X9, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_v**2, &
         two*rAIAI, &
         X7, &
         wf%n_v**2, &
         X8, &
         wf%n_v**2, &
         zero, &
         X9, &
         wf%n_v**2)
!
      call mem%dealloc(X7)
      call mem%dealloc(X8)
      call add_1324_to_1234(rAIAI, X9, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X9)
      call mem%alloc(X10, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1324(g_oooo, X10, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X11, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X11, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X12, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o**2, &
         two*rAIAI, &
         X11, &
         wf%n_v**2, &
         X10, &
         wf%n_o**2, &
         zero, &
         X12, &
         wf%n_v**2)
!
      call mem%dealloc(X10)
      call mem%dealloc(X11)
      call add_1324_to_1234(rAIAI, X12, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X12)
      call mem%alloc(X13, wf%n_v, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvvv, X13, wf%n_v, wf%n_v, wf%n_v, wf%n_v)
      call mem%alloc(X14, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v**2, &
         two, &
         X13, &
         wf%n_v**2, &
         txIxI_vv, 1, &
         zero, &
         X14, 1)
!
      call mem%dealloc(X13)
      call mem%alloc(X15, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2, &
         wf%n_o**2, &
         one, &
         X14, 1, &
         rAxAx_oo, 1, &
         X15, &
         wf%n_v**2)
!
      call mem%dealloc(X14)
      call add_1324_to_1234(one, X15, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X15)
      call mem%alloc(X16, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1324(g_oooo, X16, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X17, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_o**2, &
         two, &
         X16, &
         wf%n_o**2, &
         tAxAx_oo, 1, &
         zero, &
         X17, 1)
!
      call mem%dealloc(X16)
      call mem%alloc(X18, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2, &
         wf%n_o**2, &
         one, &
         rxIxI_vv, 1, &
         X17, 1, &
         X18, &
         wf%n_v**2)
!
      call mem%dealloc(X17)
      call add_1324_to_1234(one, X18, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X18)
      call mem%alloc(X19, wf%n_v, wf%n_o)
      call sort_to_21(gAIxx_ov, X19, wf%n_o, wf%n_v)
      X20 = eight * ddot(wf%n_v*wf%n_o, X19, 1, uAIxx_vo, 1)
      call mem%dealloc(X19)
      call daxpy(wf%n_v**2*wf%n_o**2, X20, r_vovo, 1, rho_aibj, 1)
      call mem%alloc(X21, wf%n_v, wf%n_o)
      call sort_to_21(gAIxx_ov, X21, wf%n_o, wf%n_v)
      X22 = -four * ddot(wf%n_v*wf%n_o, X21, 1, uAIxx_vo, 1)
      call mem%dealloc(X21)
      call add_1432_to_1234(X22, r_vovo, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      X23 = four * ddot(wf%n_v**2, gAxAx_vv, 1, txIxI_vv, 1)
      call daxpy(wf%n_v**2*wf%n_o**2, X23, r_vovo, 1, rho_aibj, 1)
      X24 = -two * ddot(wf%n_v**2, gAxAx_vv, 1, txIxI_vv, 1)
      call add_1432_to_1234(X24, r_vovo, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X25, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(t_aibj, X25, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X26, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v**2, &
         wf%n_o**2, &
         two, &
         X25, &
         wf%n_v**2, &
         gAxAx_vv, 1, &
         zero, &
         X26, 1)
!
      call mem%dealloc(X25)
      call mem%alloc(X27, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2, &
         wf%n_o**2, &
         one, &
         rxIxI_vv, 1, &
         X26, 1, &
         X27, &
         wf%n_v**2)
!
      call mem%dealloc(X26)
      call add_1324_to_1234(one, X27, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X27)
      X28 = -eight * ddot(wf%n_v*wf%n_o, gAxxI_vo, 1, tAIxx_vo, 1)
      call daxpy(wf%n_v**2*wf%n_o**2, X28, r_vovo, 1, rho_aibj, 1)
      X29 = four * ddot(wf%n_v*wf%n_o, gAxxI_vo, 1, tAIxx_vo, 1)
      call add_1432_to_1234(X29, r_vovo, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X30, wf%n_o, wf%n_v)
      call sort_to_21(gAxxI_vo, X30, wf%n_v, wf%n_o)
      X31 = -eight * ddot(wf%n_v*wf%n_o, X30, 1, tAxxI_ov, 1)
      call mem%dealloc(X30)
      call daxpy(wf%n_v**2*wf%n_o**2, X31, r_vovo, 1, rho_aibj, 1)
      call mem%alloc(X32, wf%n_o, wf%n_v)
      call sort_to_21(gAxxI_vo, X32, wf%n_v, wf%n_o)
      X33 = four * ddot(wf%n_v*wf%n_o, X32, 1, tAxxI_ov, 1)
      call mem%dealloc(X32)
      call add_1432_to_1234(X33, r_vovo, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      X34 = four * ddot(wf%n_o**2, gxIxI_oo, 1, tAxAx_oo, 1)
      call daxpy(wf%n_v**2*wf%n_o**2, X34, r_vovo, 1, rho_aibj, 1)
      X35 = -two * ddot(wf%n_o**2, gxIxI_oo, 1, tAxAx_oo, 1)
      call add_1432_to_1234(X35, r_vovo, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X36, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(t_aibj, X36, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X37, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_o**2, &
         two, &
         X36, &
         wf%n_v**2, &
         gxIxI_oo, 1, &
         zero, &
         X37, 1)
!
      call mem%dealloc(X36)
      call mem%alloc(X38, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2, &
         wf%n_o**2, &
         one, &
         X37, 1, &
         rAxAx_oo, 1, &
         X38, &
         wf%n_v**2)
!
      call mem%dealloc(X37)
      call add_1324_to_1234(one, X38, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X38)
      call mem%alloc(X39, wf%n_o, wf%n_v)
      call sort_to_21(tAIxx_vo, X39, wf%n_v, wf%n_o)
      call mem%alloc(X40, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         eight, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X39, 1, &
         zero, &
         X40, 1)
!
      call mem%dealloc(X39)
      call mem%alloc(X41, wf%n_v, wf%n_o)
      call sort_to_21(X40, X41, wf%n_o, wf%n_v)
      call mem%dealloc(X40)
      X42 = ddot(wf%n_v*wf%n_o, X41, 1, tAIxx_vo, 1)
      call mem%dealloc(X41)
      call daxpy(wf%n_v**2*wf%n_o**2, X42, r_vovo, 1, rho_aibj, 1)
      call mem%alloc(X43, wf%n_o, wf%n_v)
      call sort_to_21(tAIxx_vo, X43, wf%n_v, wf%n_o)
      call mem%alloc(X44, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -four, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X43, 1, &
         zero, &
         X44, 1)
!
      call mem%dealloc(X43)
      call mem%alloc(X45, wf%n_v, wf%n_o)
      call sort_to_21(X44, X45, wf%n_o, wf%n_v)
      call mem%dealloc(X44)
      X46 = ddot(wf%n_v*wf%n_o, X45, 1, tAIxx_vo, 1)
      call mem%dealloc(X45)
      call add_1432_to_1234(X46, r_vovo, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X47, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         four, &
         tAIxx_vo, &
         wf%n_v, &
         L_ovov, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X47, &
         wf%n_o)
!
      call mem%alloc(X48, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(X47, X48, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X47)
      call mem%alloc(X49, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**3, &
         wf%n_v, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X48, &
         wf%n_o**3, &
         zero, &
         X49, &
         wf%n_o)
!
      call mem%dealloc(X48)
      call mem%alloc(X50, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(r_vovo, X50, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X51, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o**2, &
         one, &
         X50, &
         wf%n_v**2, &
         X49, &
         wf%n_o**2, &
         zero, &
         X51, &
         wf%n_v**2)
!
      call mem%dealloc(X49)
      call mem%dealloc(X50)
      call add_1342_to_1234(one, X51, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X51)
      call mem%alloc(X52, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(L_ovov, X52, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X53, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(r_vovo, X53, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X54, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v**2, &
         four, &
         X53, &
         wf%n_v**2, &
         X52, &
         wf%n_o**2, &
         zero, &
         X54, &
         wf%n_o**2)
!
      call mem%dealloc(X52)
      call mem%dealloc(X53)
      call mem%alloc(X55, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**3, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X54, &
         wf%n_o**3, &
         zero, &
         X55, &
         wf%n_v)
!
      call mem%dealloc(X54)
      call mem%alloc(X56, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X55, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X56, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X55)
      call add_1243_to_1234(one, X56, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X56)
      call mem%alloc(X57, wf%n_o, wf%n_v)
      call sort_to_21(tAIxx_vo, X57, wf%n_v, wf%n_o)
      call mem%alloc(X58, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -eight, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X57, 1, &
         zero, &
         X58, 1)
!
      call mem%dealloc(X57)
      X59 = ddot(wf%n_v*wf%n_o, X58, 1, tAxxI_ov, 1)
      call mem%dealloc(X58)
      call daxpy(wf%n_v**2*wf%n_o**2, X59, r_vovo, 1, rho_aibj, 1)
      call mem%alloc(X60, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         four, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X60, 1)
!
      call mem%alloc(X61, wf%n_v, wf%n_o)
      call sort_to_21(X60, X61, wf%n_o, wf%n_v)
      call mem%dealloc(X60)
      X62 = ddot(wf%n_v*wf%n_o, X61, 1, tAIxx_vo, 1)
      call mem%dealloc(X61)
      call add_1432_to_1234(X62, r_vovo, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X63, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1243(L_ovov, X63, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X64, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         eight, &
         t_aibj, &
         wf%n_v*wf%n_o, &
         X63, &
         wf%n_v*wf%n_o, &
         zero, &
         X64, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X63)
      call mem%alloc(X65, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(X64, X65, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X64)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         rAIAI, &
         t_aibj, &
         wf%n_v*wf%n_o, &
         X65, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X65)
      call mem%alloc(X66, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1243(t_aibj, X66, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X67, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -four, &
         X66, &
         wf%n_v*wf%n_o, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X67, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X66)
      call mem%alloc(X68, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(X67, X68, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X67)
      call mem%alloc(X69, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         rAIAI, &
         X68, &
         wf%n_v*wf%n_o, &
         t_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X69, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X68)
      call add_1432_to_1234(rAIAI, X69, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X69)
      call mem%alloc(X70, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(t_aibj, X70, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X71, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X70, &
         wf%n_v*wf%n_o, &
         zero, &
         X71, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X70)
      call mem%alloc(X72, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(t_aibj, X72, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         rAIAI, &
         X72, &
         wf%n_v*wf%n_o, &
         X71, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X71)
      call mem%dealloc(X72)
      call mem%alloc(X73, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(L_ovov, X73, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X74, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(t_aibj, X74, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X75, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X73, &
         wf%n_v*wf%n_o, &
         X74, &
         wf%n_v*wf%n_o, &
         zero, &
         X75, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X73)
      call mem%dealloc(X74)
      call mem%alloc(X76, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(t_aibj, X76, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X77, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         rAIAI, &
         X76, &
         wf%n_v*wf%n_o, &
         X75, &
         wf%n_v*wf%n_o, &
         zero, &
         X77, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X75)
      call mem%dealloc(X76)
      call add_1432_to_1234(rAIAI, X77, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X77)
      call mem%alloc(X78, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X78, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X79, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         four, &
         X78, &
         wf%n_v, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X79, &
         wf%n_v)
!
      call mem%dealloc(X78)
      call mem%alloc(X80, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(X79, X80, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X79)
      call mem%alloc(X81, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v, &
         X80, &
         wf%n_v, &
         zero, &
         X81, &
         wf%n_v)
!
      call mem%dealloc(X80)
      call mem%alloc(X82, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2, &
         wf%n_o**2, &
         one, &
         X81, 1, &
         rAxAx_oo, 1, &
         X82, &
         wf%n_v**2)
!
      call mem%dealloc(X81)
      call add_1324_to_1234(one, X82, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X82)
      call mem%alloc(X83, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X83, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X84, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         four, &
         X83, &
         wf%n_o, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X84, &
         wf%n_o)
!
      call mem%dealloc(X83)
      call mem%alloc(X85, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X84, X85, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X84)
      call mem%alloc(X86, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X85, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X86, &
         wf%n_o)
!
      call mem%dealloc(X85)
      call mem%alloc(X87, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2, &
         wf%n_o**2, &
         one, &
         rxIxI_vv, 1, &
         X86, 1, &
         X87, &
         wf%n_v**2)
!
      call mem%dealloc(X86)
      call add_1342_to_1234(one, X87, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X87)
      call mem%alloc(X88, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X88, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X89, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -eight, &
         g_ovov, &
         wf%n_o, &
         X88, 1, &
         zero, &
         X89, 1)
!
      call mem%dealloc(X88)
      X90 = ddot(wf%n_o, X89, 1, tAIAx_o, 1)
      call mem%dealloc(X89)
      call daxpy(wf%n_v**2*wf%n_o**2, X90, r_vovo, 1, rho_aibj, 1)
      call mem%alloc(X91, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X91, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X92, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         four, &
         g_ovov, &
         wf%n_o, &
         X91, 1, &
         zero, &
         X92, 1)
!
      call mem%dealloc(X91)
      X93 = ddot(wf%n_o, X92, 1, tAIAx_o, 1)
      call mem%dealloc(X92)
      call add_1432_to_1234(X93, r_vovo, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X94, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_321(uAxxx_ovo, X94, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X95, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -eight, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         X94, 1, &
         zero, &
         X95, 1)
!
      call mem%dealloc(X94)
      X96 = ddot(wf%n_v, X95, 1, tAIxI_v, 1)
      call mem%dealloc(X95)
      call daxpy(wf%n_v**2*wf%n_o**2, X96, r_vovo, 1, rho_aibj, 1)
      call mem%alloc(X97, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_321(uAxxx_ovo, X97, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X98, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         four, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         X97, 1, &
         zero, &
         X98, 1)
!
      call mem%dealloc(X97)
      X99 = ddot(wf%n_v, X98, 1, tAIxI_v, 1)
      call mem%dealloc(X98)
      call add_1432_to_1234(X99, r_vovo, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X100, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X100, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X101, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v**2, &
         four, &
         X100, &
         wf%n_o**2, &
         txIxI_vv, 1, &
         zero, &
         X101, 1)
!
      call mem%dealloc(X100)
      X102 = ddot(wf%n_o**2, X101, 1, tAxAx_oo, 1)
      call mem%dealloc(X101)
      call daxpy(wf%n_v**2*wf%n_o**2, X102, r_vovo, 1, rho_aibj, 1)
      call mem%alloc(X103, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X103, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X104, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v**2, &
         -two, &
         X103, &
         wf%n_o**2, &
         txIxI_vv, 1, &
         zero, &
         X104, 1)
!
      call mem%dealloc(X103)
      X105 = ddot(wf%n_o**2, X104, 1, tAxAx_oo, 1)
      call mem%dealloc(X104)
      call add_1432_to_1234(X105, r_vovo, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X106, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         four, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X106, 1)
!
      X107 = ddot(wf%n_v*wf%n_o, X106, 1, tAxxI_ov, 1)
      call mem%dealloc(X106)
      call daxpy(wf%n_v**2*wf%n_o**2, X107, r_vovo, 1, rho_aibj, 1)
      call mem%alloc(X108, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X108, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X109, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         four, &
         X108, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X109, 1)
!
      call mem%dealloc(X108)
      X110 = ddot(wf%n_v*wf%n_o, X109, 1, tAxxI_ov, 1)
      call mem%dealloc(X109)
      call daxpy(wf%n_v**2*wf%n_o**2, X110, r_vovo, 1, rho_aibj, 1)
      call mem%alloc(X111, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X111, 1)
!
      X112 = ddot(wf%n_v*wf%n_o, X111, 1, tAxxI_ov, 1)
      call mem%dealloc(X111)
      call add_1432_to_1234(X112, r_vovo, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X113, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X113, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X114, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X113, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X114, 1)
!
      call mem%dealloc(X113)
      X115 = ddot(wf%n_v*wf%n_o, X114, 1, tAxxI_ov, 1)
      call mem%dealloc(X114)
      call add_1432_to_1234(X115, r_vovo, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X116, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         two, &
         tAxxI_ov, &
         wf%n_o, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X116, &
         wf%n_o)
!
      call mem%alloc(X117, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(X116, X117, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X116)
      call mem%alloc(X118, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**3, &
         wf%n_v, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X117, &
         wf%n_o**3, &
         zero, &
         X118, &
         wf%n_o)
!
      call mem%dealloc(X117)
      call mem%alloc(X119, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(r_vovo, X119, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X120, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o**2, &
         one, &
         X119, &
         wf%n_v**2, &
         X118, &
         wf%n_o**2, &
         zero, &
         X120, &
         wf%n_v**2)
!
      call mem%dealloc(X118)
      call mem%dealloc(X119)
      call add_1342_to_1234(one, X120, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X120)
      call mem%alloc(X121, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         two, &
         tAxxI_ov, &
         wf%n_o, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X121, &
         wf%n_o)
!
      call mem%alloc(X122, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(X121, X122, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X121)
      call mem%alloc(X123, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**3, &
         wf%n_v, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X122, &
         wf%n_o**3, &
         zero, &
         X123, &
         wf%n_o)
!
      call mem%dealloc(X122)
      call mem%alloc(X124, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(r_vovo, X124, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X125, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o**2, &
         one, &
         X124, &
         wf%n_v**2, &
         X123, &
         wf%n_o**2, &
         zero, &
         X125, &
         wf%n_v**2)
!
      call mem%dealloc(X123)
      call mem%dealloc(X124)
      call add_1324_to_1234(one, X125, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X125)
      call mem%alloc(X126, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X126, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X127, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(r_vovo, X127, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X128, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v**2, &
         two, &
         X127, &
         wf%n_v**2, &
         X126, &
         wf%n_o**2, &
         zero, &
         X128, &
         wf%n_o**2)
!
      call mem%dealloc(X126)
      call mem%dealloc(X127)
      call mem%alloc(X129, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X128, &
         wf%n_o**3, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X129, &
         wf%n_o**3)
!
      call mem%dealloc(X128)
      call mem%alloc(X130, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(X129, X130, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X129)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X130, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X130)
      call mem%alloc(X131, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X131, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X132, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(r_vovo, X132, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X133, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v**2, &
         two, &
         X131, &
         wf%n_o**2, &
         X132, &
         wf%n_v**2, &
         zero, &
         X133, &
         wf%n_o**2)
!
      call mem%dealloc(X131)
      call mem%dealloc(X132)
      call mem%alloc(X134, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X133, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X134, &
         wf%n_o**3)
!
      call mem%dealloc(X133)
      call mem%alloc(X135, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(X134, X135, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X134)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X135, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X135)
      call mem%alloc(X136, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X136, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X137, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(t_aibj, X137, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X138, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v**2, &
         two, &
         X136, &
         wf%n_o**2, &
         X137, &
         wf%n_v**2, &
         zero, &
         X138, &
         wf%n_o**2)
!
      call mem%dealloc(X136)
      call mem%dealloc(X137)
      call mem%alloc(X139, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X139, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X140, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o**2, &
         rAIAI, &
         X139, &
         wf%n_v**2, &
         X138, &
         wf%n_o**2, &
         zero, &
         X140, &
         wf%n_v**2)
!
      call mem%dealloc(X138)
      call mem%dealloc(X139)
      call add_1324_to_1234(rAIAI, X140, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X140)
      call mem%alloc(X141, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X141, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X142, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v**2, &
         two, &
         X141, &
         wf%n_o**2, &
         txIxI_vv, 1, &
         zero, &
         X142, 1)
!
      call mem%dealloc(X141)
      call mem%alloc(X143, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(t_aibj, X143, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X144, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_o**2, &
         one, &
         X143, &
         wf%n_v**2, &
         X142, 1, &
         zero, &
         X144, 1)
!
      call mem%dealloc(X142)
      call mem%dealloc(X143)
      call mem%alloc(X145, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2, &
         wf%n_o**2, &
         one, &
         X144, 1, &
         rAxAx_oo, 1, &
         X145, &
         wf%n_v**2)
!
      call mem%dealloc(X144)
      call add_1324_to_1234(one, X145, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X145)
      call mem%alloc(X146, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X146, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X147, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v**2, &
         two, &
         X146, &
         wf%n_o**2, &
         rAxAx_oo, 1, &
         zero, &
         X147, 1)
!
      call mem%dealloc(X146)
      call mem%alloc(X148, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X148, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X149, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X147, &
         wf%n_v, &
         X148, &
         wf%n_v*wf%n_o, &
         zero, &
         X149, &
         wf%n_v)
!
      call mem%dealloc(X147)
      call mem%dealloc(X148)
      call mem%alloc(X150, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X150, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X150, &
         wf%n_v*wf%n_o, &
         X149, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X149)
      call mem%dealloc(X150)
      call mem%alloc(X151, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X151, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X152, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v**2, &
         two, &
         X151, &
         wf%n_o**2, &
         rAxAx_oo, 1, &
         zero, &
         X152, 1)
!
      call mem%dealloc(X151)
      call mem%alloc(X153, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X153, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X154, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X152, &
         wf%n_v, &
         X153, &
         wf%n_v*wf%n_o, &
         zero, &
         X154, &
         wf%n_v)
!
      call mem%dealloc(X152)
      call mem%dealloc(X153)
      call mem%alloc(X155, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X155, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X156, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X155, &
         wf%n_v*wf%n_o, &
         X154, &
         wf%n_v, &
         zero, &
         X156, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X154)
      call mem%dealloc(X155)
      call add_1432_to_1234(one, X156, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X156)
      call mem%alloc(X157, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X157, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X158, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X157, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X158, &
         wf%n_v)
!
      call mem%dealloc(X157)
      call mem%alloc(X159, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2, &
         wf%n_o**2, &
         one, &
         X158, 1, &
         rAxAx_oo, 1, &
         X159, &
         wf%n_v**2)
!
      call mem%dealloc(X158)
      call add_1324_to_1234(one, X159, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X159)
      call mem%alloc(X160, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X160, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X161, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         X160, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X161, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X160)
      call mem%alloc(X162, wf%n_v, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         txxxI_vov, &
         wf%n_v, &
         X161, &
         wf%n_v*wf%n_o, &
         zero, &
         X162, &
         wf%n_v)
!
      call mem%dealloc(X161)
      call mem%alloc(X163, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2, &
         wf%n_o**2, &
         one, &
         X162, 1, &
         rAxAx_oo, 1, &
         X163, &
         wf%n_v**2)
!
      call mem%dealloc(X162)
      call add_1324_to_1234(one, X163, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X163)
      call mem%alloc(X164, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X164, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X165, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v**2, &
         eight, &
         X164, &
         wf%n_o**2, &
         rAxAx_oo, 1, &
         zero, &
         X165, 1)
!
      call mem%dealloc(X164)
      call mem%alloc(X166, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X165, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X166, &
         wf%n_v)
!
      call mem%dealloc(X165)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X166, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X166)
      call mem%alloc(X167, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X167, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X168, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v**2, &
         -four, &
         X167, &
         wf%n_o**2, &
         rAxAx_oo, 1, &
         zero, &
         X168, 1)
!
      call mem%dealloc(X167)
      call mem%alloc(X169, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X168, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X169, &
         wf%n_v)
!
      call mem%dealloc(X168)
      call mem%alloc(X170, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         X169, &
         wf%n_v, &
         zero, &
         X170, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X169)
      call add_1432_to_1234(one, X170, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X170)
      call mem%alloc(X171, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X171, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X172, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(t_aibj, X172, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X173, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v**2, &
         two, &
         X171, &
         wf%n_o**2, &
         X172, &
         wf%n_v**2, &
         zero, &
         X173, &
         wf%n_o**2)
!
      call mem%dealloc(X171)
      call mem%dealloc(X172)
      call mem%alloc(X174, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_o**2, &
         one, &
         X173, &
         wf%n_o**2, &
         tAxAx_oo, 1, &
         zero, &
         X174, 1)
!
      call mem%dealloc(X173)
      call mem%alloc(X175, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2, &
         wf%n_o**2, &
         one, &
         rxIxI_vv, 1, &
         X174, 1, &
         X175, &
         wf%n_v**2)
!
      call mem%dealloc(X174)
      call add_1324_to_1234(one, X175, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X175)
      call mem%alloc(X176, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X176, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X177, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X176, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X177, &
         wf%n_o)
!
      call mem%dealloc(X176)
      call mem%alloc(X178, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2, &
         wf%n_o**2, &
         one, &
         rxIxI_vv, 1, &
         X177, 1, &
         X178, &
         wf%n_v**2)
!
      call mem%dealloc(X177)
      call add_1342_to_1234(one, X178, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X178)
      call mem%alloc(X179, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X179, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X180, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X179, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X180, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X179)
      call mem%alloc(X181, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X180, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X181, &
         wf%n_o)
!
      call mem%dealloc(X180)
      call mem%alloc(X182, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2, &
         wf%n_o**2, &
         one, &
         rxIxI_vv, 1, &
         X181, 1, &
         X182, &
         wf%n_v**2)
!
      call mem%dealloc(X181)
      call add_1324_to_1234(one, X182, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X182)
      call mem%alloc(X183, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X183, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X184, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v**2, &
         two, &
         X183, &
         wf%n_o**2, &
         rxIxI_vv, 1, &
         zero, &
         X184, 1)
!
      call mem%dealloc(X183)
      call mem%alloc(X185, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X184, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X185, &
         wf%n_o)
!
      call mem%dealloc(X184)
      call mem%alloc(X186, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X185, X186, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X185)
      call mem%alloc(X187, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(tAxxx_ovo, X187, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X187, &
         wf%n_v*wf%n_o, &
         X186, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X186)
      call mem%dealloc(X187)
      call mem%alloc(X188, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X188, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X189, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v**2, &
         two, &
         X188, &
         wf%n_o**2, &
         rxIxI_vv, 1, &
         zero, &
         X189, 1)
!
      call mem%dealloc(X188)
      call mem%alloc(X190, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X189, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X190, &
         wf%n_o)
!
      call mem%dealloc(X189)
      call mem%alloc(X191, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X190, X191, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X190)
      call mem%alloc(X192, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X191, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X192, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X191)
      call add_1423_to_1234(one, X192, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X192)
      call mem%alloc(X193, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X193, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X194, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v**2, &
         eight, &
         X193, &
         wf%n_o**2, &
         rxIxI_vv, 1, &
         zero, &
         X194, 1)
!
      call mem%dealloc(X193)
      call mem%alloc(X195, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X194, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X195, &
         wf%n_o)
!
      call mem%dealloc(X194)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X195, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X195)
      call mem%alloc(X196, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X196, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X197, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v**2, &
         -four, &
         X196, &
         wf%n_o**2, &
         rxIxI_vv, 1, &
         zero, &
         X197, 1)
!
      call mem%dealloc(X196)
      call mem%alloc(X198, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X197, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X198, &
         wf%n_o)
!
      call mem%dealloc(X197)
      call mem%alloc(X199, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X198, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X199, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X198)
      call add_1432_to_1234(one, X199, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X199)
!
   end subroutine mu_4_H_nu_1_ss_doublet_ccsd

