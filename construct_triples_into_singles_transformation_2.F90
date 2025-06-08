   subroutine construct_triples_into_singles_transformation_2_doublet_ccsd(wf, rho_ai, FAI, FAx_o, FxI_v, LAIxx_oo, LAIxx_vv, LAxxx_vov, LAxxx_vvo, L_ooov, L_vvov, LxIxx_oov, LxxxI_voo, gAIAx_v, gAIxI_o, gAIxx_oo, gAIxx_vv, gAxAx_ov, gAxxI_oo, gAxxI_vv, gAxxx_vov, g_ooov, g_vvov, gxIxI_vo, gxIxx_oov, rAIAI, rAIAx_o, rAIxI_v, rAIxx_vo, rAxAx_oo, rAxxI_ov, rAxxx_ovo, r_vovo, rxIxI_vv, rxIxx_vvo, rxxxI_vov, tAIAx_o, tAIxI_v, tAIxx_vo, tAxAx_oo, tAxxI_ov, tAxxx_ovo, txIxI_vv, txIxx_vvo, txxxI_vov, uAIxx_vo, uAxxx_ovo, u_aibj, uxIxx_vvo, uxxxI_vov)
!!
!! Generated function
!!
      implicit none
!
      class(doublet_ccsd), intent(in) :: wf
!
      real(dp), dimension(wf%n_v,wf%n_o), intent(inout) :: rho_ai
!
      real(dp), intent(in) :: FAI, rAIAI
      real(dp), dimension(wf%n_o), intent(in) :: FAx_o, gAIxI_o, rAIAx_o, tAIAx_o
      real(dp), dimension(wf%n_v), intent(in) :: FxI_v, gAIAx_v, rAIxI_v, tAIxI_v
      real(dp), dimension(wf%n_o,wf%n_o), intent(in) :: LAIxx_oo, gAIxx_oo, gAxxI_oo, rAxAx_oo, tAxAx_oo
      real(dp), dimension(wf%n_o,wf%n_v), intent(in) :: gAxAx_ov, rAxxI_ov, tAxxI_ov
      real(dp), dimension(wf%n_v,wf%n_o), intent(in) :: gxIxI_vo, rAIxx_vo, tAIxx_vo, uAIxx_vo
      real(dp), dimension(wf%n_v,wf%n_v), intent(in) :: LAIxx_vv, gAIxx_vv, gAxxI_vv, rxIxI_vv, txIxI_vv
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_v), intent(in) :: LxIxx_oov, gxIxx_oov
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o), intent(in) :: rAxxx_ovo, tAxxx_ovo, uAxxx_ovo
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_o), intent(in) :: LxxxI_voo
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v), intent(in) :: LAxxx_vov, gAxxx_vov, rxxxI_vov, txxxI_vov, uxxxI_vov
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_o), intent(in) :: LAxxx_vvo, rxIxx_vvo, txIxx_vvo, uxIxx_vvo
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_o,wf%n_v), intent(in) :: L_ooov, g_ooov
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(in) :: r_vovo, u_aibj
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_o,wf%n_v), intent(in) :: L_vvov, g_vvov
!
      real(dp) :: X11, X20, X140, X156, X205, X229
      real(dp), dimension(:), allocatable :: X5, X6, X8, X9, X21, X23, X25, X27, X61, X75, X85, X102, X138, X160, X161, X163, X166, X176, X177, X180, X183, X187, X193, X199, X203, X218, X233, X234, X237, X241, X247, X250, X256, X259, X264, X266
      real(dp), dimension(:,:), allocatable :: X2, X3, X4, X7, X10, X12, X13, X14, X15, X16, X17, X18, X19, X22, X24, X28, X29, X30, X31, X32, X33, X34, X35, X38, X41, X47, X51, X54, X55, X56, X58, X59, X60, X63, X65, X67, X68, X69, X70, X72, X73, X74, X77, X79, X81, X88, X92, X97, X100, X107, X109, X111, X113, X115, X117, X118, X120, X122, X124, X126, X127, X128, X129, X130, X131, X132, X134, X136, X142, X144, X146, X147, X149, X151, X154, X158, X159, X164, X168, X169, X170, X172, X174, X179, X182, X186, X188, X191, X192, X194, X197, X198, X201, X207, X209, X213, X215, X217, X225, X227, X231, X236, X238, X240, X245, X248, X254, X255, X257, X258, X263, X268, X269
      real(dp), dimension(:,:,:), allocatable :: X1, X26, X36, X37, X40, X42, X43, X44, X46, X49, X50, X53, X62, X64, X66, X76, X78, X80, X84, X87, X90, X91, X94, X95, X96, X99, X103, X104, X105, X137, X139, X141, X143, X145, X148, X150, X152, X153, X155, X157, X162, X165, X167, X171, X173, X175, X178, X181, X184, X185, X189, X190, X195, X196, X200, X202, X204, X206, X208, X210, X211, X212, X214, X216, X219, X220, X221, X222, X223, X224, X226, X228, X230, X232, X235, X239, X242, X243, X244, X246, X249, X251, X252, X253, X260, X261, X262, X265, X267
      real(dp), dimension(:,:,:,:), allocatable :: X39, X45, X48, X52, X57, X71, X82, X83, X86, X89, X93, X98, X101, X106, X108, X110, X112, X114, X116, X119, X121, X123, X125, X133, X135
!
      real(dp), external :: ddot
!
      call daxpy(wf%n_v*wf%n_o, rAIAI, wf%fock_ai, 1, rho_ai, 1)
      call daxpy(wf%n_v*wf%n_o, two*FAI, rAIxx_vo, 1, rho_ai, 1)
      call add_21_to_12(-FAI, rAxxI_ov, rho_ai, wf%n_v, wf%n_o)
!
      call dger(wf%n_v, &
         wf%n_o, &
         -one, &
         rAIxI_v, 1, &
         FAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
!
      call dger(wf%n_v, &
         wf%n_o, &
         -one, &
         FxI_v, 1, &
         rAIAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         LAIxx_vv, &
         wf%n_v, &
         rAIxx_vo, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         -one, &
         rAIxx_vo, &
         wf%n_v, &
         LAIxx_oo, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         LAxxx_vvo, &
         wf%n_v, &
         rAIxI_v, 1, &
         one, &
         rho_ai, 1)
!
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         -one, &
         LxxxI_voo, &
         wf%n_v*wf%n_o, &
         rAIAx_o, 1, &
         one, &
         rho_ai, 1)
!
      call mem%alloc(X1, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(rxIxx_vvo, X1, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -one, &
         X1, &
         wf%n_v*wf%n_o, &
         gAIAx_v, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X1)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         rxxxI_vov, &
         wf%n_v*wf%n_o, &
         gAIAx_v, 1, &
         one, &
         rho_ai, 1)
!
      call mem%alloc(X2, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         rAxxx_ovo, &
         wf%n_v*wf%n_o, &
         gAIxI_o, 1, &
         zero, &
         X2, 1)
!
      call add_21_to_12(one, X2, rho_ai, wf%n_v, wf%n_o)
      call mem%dealloc(X2)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         rAxxx_ovo, &
         wf%n_o, &
         gAIxI_o, 1, &
         one, &
         rho_ai, 1)
!
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         gAIxx_vv, &
         wf%n_v, &
         rAxxI_ov, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         rAxxI_ov, &
         wf%n_o, &
         gAIxx_oo, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         rxIxI_vv, &
         wf%n_v, &
         gAxAx_ov, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         rAxxI_ov, &
         wf%n_o, &
         gAxxI_oo, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         gAxxI_vv, &
         wf%n_v, &
         rAxxI_ov, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         gxIxI_vo, &
         wf%n_v, &
         rAxAx_oo, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%alloc(X3, wf%n_v, wf%n_o)
      call sort_to_21(wf%fock_ia, X3, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         rAIAI, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X3, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X3)
      call mem%alloc(X4, wf%n_v, wf%n_o)
      call sort_to_21(wf%fock_ia, X4, wf%n_o, wf%n_v)
      call mem%alloc(X5, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         uxIxx_vvo, &
         wf%n_v, &
         X4, 1, &
         zero, &
         X5, 1)
!
      call mem%dealloc(X4)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         X5, 1, &
         rAIAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X5)
      call mem%alloc(X6, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v, &
         -one, &
         wf%fock_ia, &
         wf%n_o, &
         rAIAx_o, 1, &
         zero, &
         X6, 1)
!
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X6, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X6)
      call mem%alloc(X7, wf%n_v, wf%n_o)
      call sort_to_21(wf%fock_ia, X7, wf%n_o, wf%n_v)
      call mem%alloc(X8, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         uAxxx_ovo, &
         wf%n_o, &
         X7, 1, &
         zero, &
         X8, 1)
!
      call mem%dealloc(X7)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         rAIxI_v, 1, &
         X8, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X8)
      call mem%alloc(X9, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v, &
         -one, &
         wf%fock_ia, &
         wf%n_o, &
         rAIxI_v, 1, &
         zero, &
         X9, 1)
!
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X9, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X9)
      call mem%alloc(X10, wf%n_v, wf%n_o)
      call sort_to_21(wf%fock_ia, X10, wf%n_o, wf%n_v)
      X11 = two * ddot(wf%n_v*wf%n_o, X10, 1, uAIxx_vo, 1)
      call mem%dealloc(X10)
      call daxpy(wf%n_v*wf%n_o, X11, rAIxx_vo, 1, rho_ai, 1)
      call mem%alloc(X12, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         wf%fock_ia, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X12, &
         wf%n_o)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         rAIxx_vo, &
         wf%n_v, &
         X12, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X12)
      call mem%alloc(X13, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         wf%fock_ia, &
         wf%n_o, &
         rAIxx_vo, &
         wf%n_v, &
         zero, &
         X13, &
         wf%n_o)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X13, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X13)
      call mem%alloc(X14, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X14, &
         wf%n_o)
!
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X14, &
         wf%n_o, &
         rAxAx_oo, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X14)
      call mem%alloc(X15, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         rAxxI_ov, &
         wf%n_o, &
         zero, &
         X15, &
         wf%n_o)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X15, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X15)
      call mem%alloc(X16, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X16, &
         wf%n_o)
!
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         rAxxI_ov, &
         wf%n_o, &
         X16, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X16)
      call mem%alloc(X17, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         rAxxI_ov, &
         wf%n_o, &
         zero, &
         X17, &
         wf%n_o)
!
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X17, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X17)
      call mem%alloc(X18, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X18, &
         wf%n_o)
!
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         rAxxI_ov, &
         wf%n_o, &
         X18, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X18)
      call mem%alloc(X19, wf%n_v, wf%n_o)
      call sort_to_21(wf%fock_ia, X19, wf%n_o, wf%n_v)
      X20 =  -ddot(wf%n_v*wf%n_o, X19, 1, uAIxx_vo, 1)
      call mem%dealloc(X19)
      call add_21_to_12(X20, rAxxI_ov, rho_ai, wf%n_v, wf%n_o)
      call mem%alloc(X21, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X21, 1)
!
      call mem%alloc(X22, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         rAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X21, 1, &
         zero, &
         X22, 1)
!
      call mem%dealloc(X21)
      call add_21_to_12(one, X22, rho_ai, wf%n_v, wf%n_o)
      call mem%dealloc(X22)
      call mem%alloc(X23, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X23, 1)
!
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         rAxxx_ovo, &
         wf%n_o, &
         X23, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X23)
      call mem%alloc(X24, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         rxIxI_vv, &
         wf%n_v, &
         zero, &
         X24, &
         wf%n_o)
!
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X24, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X24)
      call mem%alloc(X25, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X25, 1)
!
      call mem%alloc(X26, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(rxIxx_vvo, X26, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X26, &
         wf%n_v*wf%n_o, &
         X25, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X25)
      call mem%dealloc(X26)
      call mem%alloc(X27, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X27, 1)
!
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         rxxxI_vov, &
         wf%n_v*wf%n_o, &
         X27, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X27)
      call mem%alloc(X28, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X28, wf%n_v, wf%n_o)
      call mem%alloc(X29, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         one, &
         L_vvov, &
         wf%n_v**2, &
         X28, 1, &
         zero, &
         X29, 1)
!
      call mem%dealloc(X28)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X29, &
         wf%n_v, &
         rAIxx_vo, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X29)
      call mem%alloc(X30, wf%n_o, wf%n_v)
      call sort_to_21(rAIxx_vo, X30, wf%n_v, wf%n_o)
      call mem%alloc(X31, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         one, &
         L_vvov, &
         wf%n_v**2, &
         X30, 1, &
         zero, &
         X31, 1)
!
      call mem%dealloc(X30)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X31, &
         wf%n_v, &
         uAIxx_vo, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X31)
      call mem%alloc(X32, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X32, wf%n_v, wf%n_o)
      call mem%alloc(X33, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -one, &
         L_ooov, &
         wf%n_o**2, &
         X32, 1, &
         zero, &
         X33, 1)
!
      call mem%dealloc(X32)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         rAIxx_vo, &
         wf%n_v, &
         X33, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X33)
      call mem%alloc(X34, wf%n_o, wf%n_v)
      call sort_to_21(rAIxx_vo, X34, wf%n_v, wf%n_o)
      call mem%alloc(X35, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -one, &
         L_ooov, &
         wf%n_o**2, &
         X34, 1, &
         zero, &
         X35, 1)
!
      call mem%dealloc(X34)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X35, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X35)
      call mem%alloc(X36, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(rAxxx_ovo, X36, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X37, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -one, &
         X36, &
         wf%n_o, &
         L_vvov, &
         wf%n_v**2, &
         zero, &
         X37, &
         wf%n_o)
!
      call mem%dealloc(X36)
      call mem%alloc(X38, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X37, &
         wf%n_v*wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X38, 1)
!
      call mem%dealloc(X37)
      call add_21_to_12(one, X38, rho_ai, wf%n_v, wf%n_o)
      call mem%dealloc(X38)
      call mem%alloc(X39, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(L_vvov, X39, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X40, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -one, &
         rAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X39, &
         wf%n_v**2, &
         zero, &
         X40, &
         wf%n_o)
!
      call mem%dealloc(X39)
      call mem%alloc(X41, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X40, &
         wf%n_v*wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X41, 1)
!
      call mem%dealloc(X40)
      call add_21_to_12(one, X41, rho_ai, wf%n_v, wf%n_o)
      call mem%dealloc(X41)
      call mem%alloc(X42, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**3, &
         wf%n_v, &
         one, &
         L_ooov, &
         wf%n_o**3, &
         tAIxI_v, 1, &
         zero, &
         X42, 1)
!
      call mem%alloc(X43, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_312(X42, X43, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X42)
      call mem%alloc(X44, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(rAxxx_ovo, X44, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X44, &
         wf%n_o**2, &
         X43, &
         wf%n_o**2, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X43)
      call mem%dealloc(X44)
      call mem%alloc(X45, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(L_ooov, X45, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X46, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X45, &
         wf%n_o**2, &
         rxIxx_vvo, &
         wf%n_v, &
         zero, &
         X46, &
         wf%n_o**2)
!
      call mem%dealloc(X45)
      call mem%alloc(X47, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X46, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X47, 1)
!
      call mem%dealloc(X46)
      call add_21_to_12(one, X47, rho_ai, wf%n_v, wf%n_o)
      call mem%dealloc(X47)
      call mem%alloc(X48, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(L_vvov, X48, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X49, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(rxxxI_vov, X49, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X50, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v**2, &
         -one, &
         X49, &
         wf%n_v**2, &
         X48, &
         wf%n_v*wf%n_o, &
         zero, &
         X50, &
         wf%n_o)
!
      call mem%dealloc(X48)
      call mem%dealloc(X49)
      call mem%alloc(X51, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X50, &
         wf%n_v*wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X51, 1)
!
      call mem%dealloc(X50)
      call add_21_to_12(one, X51, rho_ai, wf%n_v, wf%n_o)
      call mem%dealloc(X51)
      call mem%alloc(X52, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(L_ooov, X52, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X53, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         one, &
         rxxxI_vov, &
         wf%n_v, &
         X52, &
         wf%n_v*wf%n_o, &
         zero, &
         X53, &
         wf%n_v)
!
      call mem%dealloc(X52)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X53, &
         wf%n_v*wf%n_o, &
         tAIAx_o, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X53)
      call mem%alloc(X54, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         LAxxx_vov, &
         wf%n_v, &
         tAIxI_v, 1, &
         zero, &
         X54, 1)
!
      call mem%alloc(X55, wf%n_v, wf%n_o)
      call sort_to_21(X54, X55, wf%n_o, wf%n_v)
      call mem%dealloc(X54)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vovo, &
         wf%n_v*wf%n_o, &
         X55, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X55)
      call mem%alloc(X56, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         LAxxx_vov, &
         wf%n_v, &
         tAIxI_v, 1, &
         zero, &
         X56, 1)
!
      call mem%alloc(X57, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(r_vovo, X57, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X57, &
         wf%n_v*wf%n_o, &
         X56, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X56)
      call mem%dealloc(X57)
      call mem%alloc(X58, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         LAxxx_vov, &
         wf%n_v, &
         rAIxI_v, 1, &
         zero, &
         X58, 1)
!
      call mem%alloc(X59, wf%n_v, wf%n_o)
      call sort_to_21(X58, X59, wf%n_o, wf%n_v)
      call mem%dealloc(X58)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X59, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X59)
      call mem%alloc(X60, wf%n_o, wf%n_v)
      call sort_to_21(rAIxx_vo, X60, wf%n_v, wf%n_o)
      call mem%alloc(X61, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         LAxxx_vov, &
         wf%n_v, &
         X60, 1, &
         zero, &
         X61, 1)
!
      call mem%dealloc(X60)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X61, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X61)
      call mem%alloc(X62, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(rAxxx_ovo, X62, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X63, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         LAxxx_vov, &
         wf%n_v, &
         X62, &
         wf%n_o, &
         zero, &
         X63, &
         wf%n_v)
!
      call mem%dealloc(X62)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X63, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X63)
      call mem%alloc(X64, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(LAxxx_vov, X64, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X65, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         X64, &
         wf%n_v, &
         rxIxx_vvo, &
         wf%n_v, &
         zero, &
         X65, &
         wf%n_v)
!
      call mem%dealloc(X64)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X65, &
         wf%n_v, &
         tAIxx_vo, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X65)
      call mem%alloc(X66, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(LAxxx_vov, X66, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X67, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         X66, &
         wf%n_v, &
         rxIxx_vvo, &
         wf%n_v, &
         zero, &
         X67, &
         wf%n_v)
!
      call mem%dealloc(X66)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X67, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X67)
      call mem%alloc(X68, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         LxIxx_oov, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X68, 1)
!
      call mem%alloc(X69, wf%n_v, wf%n_o)
      call sort_to_21(X68, X69, wf%n_o, wf%n_v)
      call mem%dealloc(X68)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vovo, &
         wf%n_v*wf%n_o, &
         X69, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X69)
      call mem%alloc(X70, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         LxIxx_oov, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X70, 1)
!
      call mem%alloc(X71, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(r_vovo, X71, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X71, &
         wf%n_v*wf%n_o, &
         X70, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X70)
      call mem%dealloc(X71)
      call mem%alloc(X72, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         LxIxx_oov, &
         wf%n_o, &
         rAIAx_o, 1, &
         zero, &
         X72, 1)
!
      call mem%alloc(X73, wf%n_v, wf%n_o)
      call sort_to_21(X72, X73, wf%n_o, wf%n_v)
      call mem%dealloc(X72)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X73, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X73)
      call mem%alloc(X74, wf%n_o, wf%n_v)
      call sort_to_21(rAIxx_vo, X74, wf%n_v, wf%n_o)
      call mem%alloc(X75, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         LxIxx_oov, &
         wf%n_o, &
         X74, 1, &
         zero, &
         X75, 1)
!
      call mem%dealloc(X74)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X75, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X75)
      call mem%alloc(X76, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(LxIxx_oov, X76, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X77, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X76, &
         wf%n_o, &
         rAxxx_ovo, &
         wf%n_o, &
         zero, &
         X77, &
         wf%n_o)
!
      call mem%dealloc(X76)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X77, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X77)
      call mem%alloc(X78, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(LxIxx_oov, X78, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X79, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X78, &
         wf%n_o, &
         rAxxx_ovo, &
         wf%n_o, &
         zero, &
         X79, &
         wf%n_o)
!
      call mem%dealloc(X78)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X79, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X79)
      call mem%alloc(X80, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(LxIxx_oov, X80, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X81, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X80, &
         wf%n_o, &
         rxIxx_vvo, &
         wf%n_v, &
         zero, &
         X81, &
         wf%n_o)
!
      call mem%dealloc(X80)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X81, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X81)
      call mem%alloc(X82, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(u_aibj, X82, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         rAIAI, &
         g_vvov, &
         wf%n_v, &
         X82, &
         wf%n_v**2*wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X82)
      call mem%alloc(X83, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1432(g_ooov, X83, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         -rAIAI, &
         u_aibj, &
         wf%n_v, &
         X83, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X83)
      call mem%alloc(X84, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X84, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X85, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v**2*wf%n_o, &
         -one, &
         g_vvov, &
         wf%n_v, &
         X84, 1, &
         zero, &
         X85, 1)
!
      call mem%dealloc(X84)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         X85, 1, &
         rAIAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X85)
      call mem%alloc(X86, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X86, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X87, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X86, &
         wf%n_o**2, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X87, &
         wf%n_o**2)
!
      call mem%dealloc(X86)
      call mem%alloc(X88, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X87, &
         wf%n_o, &
         rAIAx_o, 1, &
         zero, &
         X88, 1)
!
      call mem%dealloc(X87)
      call add_21_to_12(one, X88, rho_ai, wf%n_v, wf%n_o)
      call mem%dealloc(X88)
      call mem%alloc(X89, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X89, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X90, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X90, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X91, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v**2, &
         -one, &
         X90, &
         wf%n_v**2, &
         X89, &
         wf%n_v*wf%n_o, &
         zero, &
         X91, &
         wf%n_o)
!
      call mem%dealloc(X89)
      call mem%dealloc(X90)
      call mem%alloc(X92, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X91, &
         wf%n_v*wf%n_o, &
         rAIAx_o, 1, &
         zero, &
         X92, 1)
!
      call mem%dealloc(X91)
      call add_21_to_12(one, X92, rho_ai, wf%n_v, wf%n_o)
      call mem%dealloc(X92)
      call mem%alloc(X93, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X93, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X94, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         one, &
         uxxxI_vov, &
         wf%n_v, &
         X93, &
         wf%n_v*wf%n_o, &
         zero, &
         X94, &
         wf%n_v)
!
      call mem%dealloc(X93)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X94, &
         wf%n_v*wf%n_o, &
         rAIAx_o, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X94)
      call mem%alloc(X95, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X95, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X96, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -one, &
         X95, &
         wf%n_o, &
         g_vvov, &
         wf%n_v**2, &
         zero, &
         X96, &
         wf%n_o)
!
      call mem%dealloc(X95)
      call mem%alloc(X97, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X96, &
         wf%n_v*wf%n_o, &
         rAIxI_v, 1, &
         zero, &
         X97, 1)
!
      call mem%dealloc(X96)
      call add_21_to_12(one, X97, rho_ai, wf%n_v, wf%n_o)
      call mem%dealloc(X97)
      call mem%alloc(X98, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X98, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X99, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -one, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X98, &
         wf%n_v**2, &
         zero, &
         X99, &
         wf%n_o)
!
      call mem%dealloc(X98)
      call mem%alloc(X100, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X99, &
         wf%n_v*wf%n_o, &
         rAIxI_v, 1, &
         zero, &
         X100, 1)
!
      call mem%dealloc(X99)
      call add_21_to_12(one, X100, rho_ai, wf%n_v, wf%n_o)
      call mem%dealloc(X100)
      call mem%alloc(X101, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1432(g_ooov, X101, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X102, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         X101, &
         wf%n_v*wf%n_o**2, &
         uAxxx_ovo, 1, &
         zero, &
         X102, 1)
!
      call mem%dealloc(X101)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         rAIxI_v, 1, &
         X102, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X102)
      call mem%alloc(X103, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**3, &
         wf%n_v, &
         one, &
         g_ooov, &
         wf%n_o**3, &
         rAIxI_v, 1, &
         zero, &
         X103, 1)
!
      call mem%alloc(X104, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_312(X103, X104, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X103)
      call mem%alloc(X105, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X105, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X105, &
         wf%n_o**2, &
         X104, &
         wf%n_o**2, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X104)
      call mem%dealloc(X105)
      call mem%alloc(X106, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X106, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X107, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v**2, &
         one, &
         X106, &
         wf%n_v*wf%n_o, &
         txIxI_vv, 1, &
         zero, &
         X107, 1)
!
      call mem%dealloc(X106)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X107, &
         wf%n_v, &
         rAxAx_oo, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X107)
      call mem%alloc(X108, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1324(g_ooov, X108, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X109, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -one, &
         X108, &
         wf%n_o**2, &
         rAxAx_oo, 1, &
         zero, &
         X109, 1)
!
      call mem%dealloc(X108)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X109, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X109)
      call mem%alloc(X110, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X110, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X111, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         one, &
         X110, &
         wf%n_v**2, &
         tAIxx_vo, 1, &
         zero, &
         X111, 1)
!
      call mem%dealloc(X110)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X111, &
         wf%n_v, &
         rAxxI_ov, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X111)
      call mem%alloc(X112, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X112, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X113, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         one, &
         X112, &
         wf%n_v**2, &
         rAxxI_ov, 1, &
         zero, &
         X113, 1)
!
      call mem%dealloc(X112)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X113, &
         wf%n_v, &
         tAIxx_vo, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X113)
      call mem%alloc(X114, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X114, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X115, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -one, &
         X114, &
         wf%n_v*wf%n_o, &
         rAxxI_ov, 1, &
         zero, &
         X115, 1)
!
      call mem%dealloc(X114)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X115, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X115)
      call mem%alloc(X116, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X116, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X117, wf%n_o, wf%n_v)
      call sort_to_21(tAIxx_vo, X117, wf%n_v, wf%n_o)
      call mem%alloc(X118, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -one, &
         X116, &
         wf%n_v*wf%n_o, &
         X117, 1, &
         zero, &
         X118, 1)
!
      call mem%dealloc(X116)
      call mem%dealloc(X117)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         rAxxI_ov, &
         wf%n_o, &
         X118, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X118)
      call mem%alloc(X119, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X119, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X120, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         one, &
         X119, &
         wf%n_v**2, &
         tAxxI_ov, 1, &
         zero, &
         X120, 1)
!
      call mem%dealloc(X119)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X120, &
         wf%n_v, &
         rAxxI_ov, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X120)
      call mem%alloc(X121, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X121, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X122, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         one, &
         X121, &
         wf%n_v**2, &
         rAxxI_ov, 1, &
         zero, &
         X122, 1)
!
      call mem%dealloc(X121)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X122, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X122)
      call mem%alloc(X123, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X123, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X124, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -one, &
         X123, &
         wf%n_v*wf%n_o, &
         rAxxI_ov, 1, &
         zero, &
         X124, 1)
!
      call mem%dealloc(X123)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X124, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X124)
      call mem%alloc(X125, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X125, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X126, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -one, &
         X125, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X126, 1)
!
      call mem%dealloc(X125)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         rAxxI_ov, &
         wf%n_o, &
         X126, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X126)
      call mem%alloc(X127, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X127, wf%n_v, wf%n_o)
      call mem%alloc(X128, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -one, &
         g_vvov, &
         wf%n_v**2, &
         X127, 1, &
         zero, &
         X128, 1)
!
      call mem%dealloc(X127)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X128, &
         wf%n_v, &
         rAxxI_ov, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X128)
      call mem%alloc(X129, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -one, &
         g_vvov, &
         wf%n_v**2, &
         rAxxI_ov, 1, &
         zero, &
         X129, 1)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X129, &
         wf%n_v, &
         uAIxx_vo, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X129)
      call mem%alloc(X130, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X130, wf%n_v, wf%n_o)
      call mem%alloc(X131, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         one, &
         g_ooov, &
         wf%n_o**2, &
         X130, 1, &
         zero, &
         X131, 1)
!
      call mem%dealloc(X130)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         rAxxI_ov, &
         wf%n_o, &
         X131, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X131)
      call mem%alloc(X132, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         one, &
         g_ooov, &
         wf%n_o**2, &
         rAxxI_ov, 1, &
         zero, &
         X132, 1)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X132, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X132)
      call mem%alloc(X133, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X133, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X134, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v**2, &
         one, &
         X133, &
         wf%n_v*wf%n_o, &
         rxIxI_vv, 1, &
         zero, &
         X134, 1)
!
      call mem%dealloc(X133)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X134, &
         wf%n_v, &
         tAxAx_oo, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X134)
      call mem%alloc(X135, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1324(g_ooov, X135, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X136, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -one, &
         X135, &
         wf%n_o**2, &
         tAxAx_oo, 1, &
         zero, &
         X136, 1)
!
      call mem%dealloc(X135)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         rxIxI_vv, &
         wf%n_v, &
         X136, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X136)
      call mem%alloc(X137, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_321(gAxxx_vov, X137, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X138, wf%n_o)
!
      call dgemv('T', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         -one, &
         u_aibj, &
         wf%n_v**2*wf%n_o, &
         X137, 1, &
         zero, &
         X138, 1)
!
      call mem%dealloc(X137)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         rAIxI_v, 1, &
         X138, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X138)
      call mem%alloc(X139, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X139, wf%n_v, wf%n_o, wf%n_v)
      X140 = two * ddot(wf%n_v**2*wf%n_o, X139, 1, uxIxx_vvo, 1)
      call mem%dealloc(X139)
      call daxpy(wf%n_v*wf%n_o, X140, rAIxx_vo, 1, rho_ai, 1)
      call mem%alloc(X141, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X141, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X142, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         -one, &
         X141, &
         wf%n_v**2, &
         uxIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X142, &
         wf%n_o)
!
      call mem%dealloc(X141)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         rAIxx_vo, &
         wf%n_v, &
         X142, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X142)
      call mem%alloc(X143, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X143, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X144, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         X143, &
         wf%n_v, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X144, &
         wf%n_v)
!
      call mem%dealloc(X143)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X144, &
         wf%n_v, &
         rAIxx_vo, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X144)
      call mem%alloc(X145, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X145, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X146, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X145, &
         wf%n_v, &
         zero, &
         X146, &
         wf%n_v)
!
      call mem%dealloc(X145)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X146, &
         wf%n_v, &
         rAIxx_vo, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X146)
      call mem%alloc(X147, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X147, &
         wf%n_v)
!
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X147, &
         wf%n_v, &
         rAxxI_ov, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X147)
      call mem%alloc(X148, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X148, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X149, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X148, &
         wf%n_v**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X149, &
         wf%n_o)
!
      call mem%dealloc(X148)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         rAxxI_ov, &
         wf%n_o, &
         X149, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X149)
      call mem%alloc(X150, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X150, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X151, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X150, &
         wf%n_v, &
         zero, &
         X151, &
         wf%n_v)
!
      call mem%dealloc(X150)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X151, &
         wf%n_v, &
         rAxxI_ov, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X151)
      call mem%alloc(X152, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X152, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X153, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X153, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X154, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X152, &
         wf%n_v**2, &
         X153, &
         wf%n_v**2, &
         zero, &
         X154, &
         wf%n_o)
!
      call mem%dealloc(X152)
      call mem%dealloc(X153)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         rAxxI_ov, &
         wf%n_o, &
         X154, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X154)
      call mem%alloc(X155, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X155, wf%n_v, wf%n_o, wf%n_v)
      X156 =  -ddot(wf%n_v**2*wf%n_o, X155, 1, uxIxx_vvo, 1)
      call mem%dealloc(X155)
      call add_21_to_12(X156, rAxxI_ov, rho_ai, wf%n_v, wf%n_o)
      call mem%alloc(X157, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X157, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X158, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         X157, &
         wf%n_v, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X158, &
         wf%n_v)
!
      call mem%dealloc(X157)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X158, &
         wf%n_v, &
         rAxxI_ov, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X158)
      call mem%alloc(X159, wf%n_v, wf%n_o)
      call sort_to_21(rAxxI_ov, X159, wf%n_o, wf%n_v)
      call mem%alloc(X160, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -one, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X159, 1, &
         zero, &
         X160, 1)
!
      call mem%dealloc(X159)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X160, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X160)
      call mem%alloc(X161, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         gAxxx_vov, &
         wf%n_v, &
         rAxxI_ov, 1, &
         zero, &
         X161, 1)
!
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X161, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X161)
      call mem%alloc(X162, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X162, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X163, wf%n_o)
!
      call dgemv('T', &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X162, &
         wf%n_v**2, &
         txIxI_vv, 1, &
         zero, &
         X163, 1)
!
      call mem%dealloc(X162)
      call mem%alloc(X164, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         rAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X163, 1, &
         zero, &
         X164, 1)
!
      call mem%dealloc(X163)
      call add_21_to_12(one, X164, rho_ai, wf%n_v, wf%n_o)
      call mem%dealloc(X164)
      call mem%alloc(X165, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X165, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X166, wf%n_o)
!
      call dgemv('T', &
         wf%n_v**2, &
         wf%n_o, &
         -two, &
         X165, &
         wf%n_v**2, &
         txIxI_vv, 1, &
         zero, &
         X166, 1)
!
      call mem%dealloc(X165)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         rAxxx_ovo, &
         wf%n_o, &
         X166, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X166)
      call mem%alloc(X167, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(rAxxx_ovo, X167, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X168, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X167, &
         wf%n_v*wf%n_o, &
         zero, &
         X168, &
         wf%n_v)
!
      call mem%dealloc(X167)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X168, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X168)
      call mem%alloc(X169, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         gAxxx_vov, &
         wf%n_v, &
         rAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X169, &
         wf%n_v)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X169, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X169)
      call mem%alloc(X170, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X170, &
         wf%n_v)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         rxIxI_vv, &
         wf%n_v, &
         X170, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X170)
      call mem%alloc(X171, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(tAxxx_ovo, X171, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X172, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X171, &
         wf%n_v*wf%n_o, &
         zero, &
         X172, &
         wf%n_v)
!
      call mem%dealloc(X171)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         rxIxI_vv, &
         wf%n_v, &
         X172, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X172)
      call mem%alloc(X173, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X173, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X174, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         gAxxx_vov, &
         wf%n_v, &
         X173, &
         wf%n_o, &
         zero, &
         X174, &
         wf%n_v)
!
      call mem%dealloc(X173)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         rxIxI_vv, &
         wf%n_v, &
         X174, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X174)
      call mem%alloc(X175, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X175, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X176, wf%n_o)
!
      call dgemv('T', &
         wf%n_v**2, &
         wf%n_o, &
         -one, &
         X175, &
         wf%n_v**2, &
         rxIxI_vv, 1, &
         zero, &
         X176, 1)
!
      call mem%dealloc(X175)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X176, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X176)
      call mem%alloc(X177, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, 1, &
         zero, &
         X177, 1)
!
      call mem%alloc(X178, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(rxIxx_vvo, X178, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X178, &
         wf%n_v*wf%n_o, &
         X177, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X177)
      call mem%dealloc(X178)
      call mem%alloc(X179, wf%n_v, wf%n_o)
      call sort_to_21(tAxxI_ov, X179, wf%n_o, wf%n_v)
      call mem%alloc(X180, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X179, 1, &
         zero, &
         X180, 1)
!
      call mem%dealloc(X179)
      call mem%alloc(X181, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(rxIxx_vvo, X181, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X181, &
         wf%n_v*wf%n_o, &
         X180, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X180)
      call mem%dealloc(X181)
      call mem%alloc(X182, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X182, wf%n_v, wf%n_o)
      call mem%alloc(X183, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         gAxxx_vov, &
         wf%n_v, &
         X182, 1, &
         zero, &
         X183, 1)
!
      call mem%dealloc(X182)
      call mem%alloc(X184, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(rxIxx_vvo, X184, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X184, &
         wf%n_v*wf%n_o, &
         X183, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X183)
      call mem%dealloc(X184)
      call mem%alloc(X185, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X185, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X186, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         -one, &
         X185, &
         wf%n_v**2, &
         rxIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X186, &
         wf%n_o)
!
      call mem%dealloc(X185)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X186, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X186)
      call mem%alloc(X187, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, 1, &
         zero, &
         X187, 1)
!
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         rxxxI_vov, &
         wf%n_v*wf%n_o, &
         X187, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X187)
      call mem%alloc(X188, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         gAxxx_vov, &
         wf%n_v, &
         rxxxI_vov, &
         wf%n_v, &
         zero, &
         X188, &
         wf%n_v)
!
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X188, &
         wf%n_v, &
         tAIxx_vo, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X188)
      call mem%alloc(X189, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X189, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X190, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(rxxxI_vov, X190, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X191, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X189, &
         wf%n_v**2, &
         X190, &
         wf%n_v**2, &
         zero, &
         X191, &
         wf%n_o)
!
      call mem%dealloc(X189)
      call mem%dealloc(X190)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X191, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X191)
      call mem%alloc(X192, wf%n_v, wf%n_o)
      call sort_to_21(tAxxI_ov, X192, wf%n_o, wf%n_v)
      call mem%alloc(X193, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X192, 1, &
         zero, &
         X193, 1)
!
      call mem%dealloc(X192)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         rxxxI_vov, &
         wf%n_v*wf%n_o, &
         X193, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X193)
      call mem%alloc(X194, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         gAxxx_vov, &
         wf%n_v, &
         rxxxI_vov, &
         wf%n_v, &
         zero, &
         X194, &
         wf%n_v)
!
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X194, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X194)
      call mem%alloc(X195, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X195, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X196, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(rxxxI_vov, X196, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X197, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X195, &
         wf%n_v**2, &
         X196, &
         wf%n_v**2, &
         zero, &
         X197, &
         wf%n_o)
!
      call mem%dealloc(X195)
      call mem%dealloc(X196)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X197, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X197)
      call mem%alloc(X198, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X198, wf%n_v, wf%n_o)
      call mem%alloc(X199, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         gAxxx_vov, &
         wf%n_v, &
         X198, 1, &
         zero, &
         X199, 1)
!
      call mem%dealloc(X198)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         rxxxI_vov, &
         wf%n_v*wf%n_o, &
         X199, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X199)
      call mem%alloc(X200, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(rxxxI_vov, X200, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X201, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X200, &
         wf%n_v, &
         zero, &
         X201, &
         wf%n_v)
!
      call mem%dealloc(X200)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X201, &
         wf%n_v, &
         uAIxx_vo, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X201)
      call mem%alloc(X202, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X202, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X203, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         u_aibj, &
         wf%n_v, &
         X202, 1, &
         zero, &
         X203, 1)
!
      call mem%dealloc(X202)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         X203, 1, &
         rAIAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X203)
      call mem%alloc(X204, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X204, wf%n_o, wf%n_o, wf%n_v)
      X205 = -two * ddot(wf%n_v*wf%n_o**2, X204, 1, uAxxx_ovo, 1)
      call mem%dealloc(X204)
      call daxpy(wf%n_v*wf%n_o, X205, rAIxx_vo, 1, rho_ai, 1)
      call mem%alloc(X206, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X206, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X207, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X206, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X207, &
         wf%n_o)
!
      call mem%dealloc(X206)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         rAIxx_vo, &
         wf%n_v, &
         X207, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X207)
      call mem%alloc(X208, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X208, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X209, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X208, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X209, &
         wf%n_o)
!
      call mem%dealloc(X208)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         rAIxx_vo, &
         wf%n_v, &
         X209, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X209)
      call mem%alloc(X210, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         gxIxx_oov, &
         wf%n_o**2, &
         rAIxx_vo, &
         wf%n_v, &
         zero, &
         X210, &
         wf%n_o**2)
!
      call mem%alloc(X211, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X211, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X211, &
         wf%n_o**2, &
         X210, &
         wf%n_o**2, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X210)
      call mem%dealloc(X211)
      call mem%alloc(X212, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_312(gxIxx_oov, X212, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X213, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         X212, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X213, &
         wf%n_o)
!
      call mem%dealloc(X212)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X213, &
         wf%n_o, &
         rAxAx_oo, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X213)
      call mem%alloc(X214, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X214, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X215, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         X214, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X215, &
         wf%n_o)
!
      call mem%dealloc(X214)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X215, &
         wf%n_o, &
         rAxAx_oo, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X215)
      call mem%alloc(X216, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X216, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X217, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X216, &
         wf%n_o, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X217, &
         wf%n_o)
!
      call mem%dealloc(X216)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X217, &
         wf%n_o, &
         rAxAx_oo, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X217)
      call mem%alloc(X218, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         gxIxx_oov, &
         wf%n_o**2, &
         rAxAx_oo, 1, &
         zero, &
         X218, 1)
!
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X218, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X218)
      call mem%alloc(X219, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         gxIxx_oov, &
         wf%n_o**2, &
         rAxxI_ov, &
         wf%n_o, &
         zero, &
         X219, &
         wf%n_o**2)
!
      call mem%alloc(X220, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X220, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X220, &
         wf%n_o**2, &
         X219, &
         wf%n_o**2, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X219)
      call mem%dealloc(X220)
      call mem%alloc(X221, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         -one, &
         rAxxI_ov, &
         wf%n_o, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X221, &
         wf%n_o)
!
      call mem%alloc(X222, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X221, X222, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X221)
      call mem%alloc(X223, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X223, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X223, &
         wf%n_o**2, &
         X222, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X222)
      call mem%dealloc(X223)
      call mem%alloc(X224, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_312(gxIxx_oov, X224, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X225, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X224, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X225, &
         wf%n_o)
!
      call mem%dealloc(X224)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         rAxxI_ov, &
         wf%n_o, &
         X225, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X225)
      call mem%alloc(X226, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X226, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X227, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X226, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X227, &
         wf%n_o)
!
      call mem%dealloc(X226)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         rAxxI_ov, &
         wf%n_o, &
         X227, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X227)
      call mem%alloc(X228, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X228, wf%n_o, wf%n_o, wf%n_v)
      X229 = ddot(wf%n_v*wf%n_o**2, X228, 1, uAxxx_ovo, 1)
      call mem%dealloc(X228)
      call add_21_to_12(X229, rAxxI_ov, rho_ai, wf%n_v, wf%n_o)
      call mem%alloc(X230, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X230, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X231, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X230, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X231, &
         wf%n_o)
!
      call mem%dealloc(X230)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         rAxxI_ov, &
         wf%n_o, &
         X231, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X231)
      call mem%alloc(X232, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X232, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X233, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X232, &
         wf%n_v*wf%n_o, &
         rAxxI_ov, 1, &
         zero, &
         X233, 1)
!
      call mem%dealloc(X232)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X233, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X233)
      call mem%alloc(X234, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         gxIxx_oov, &
         wf%n_o, &
         rAxxI_ov, 1, &
         zero, &
         X234, 1)
!
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X234, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X234)
      call mem%alloc(X235, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X235, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X236, wf%n_o, wf%n_v)
      call sort_to_21(tAIxx_vo, X236, wf%n_v, wf%n_o)
      call mem%alloc(X237, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         -one, &
         X235, &
         wf%n_v*wf%n_o, &
         X236, 1, &
         zero, &
         X237, 1)
!
      call mem%dealloc(X235)
      call mem%dealloc(X236)
      call mem%alloc(X238, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         rAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X237, 1, &
         zero, &
         X238, 1)
!
      call mem%dealloc(X237)
      call add_21_to_12(one, X238, rho_ai, wf%n_v, wf%n_o)
      call mem%dealloc(X238)
      call mem%alloc(X239, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X239, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X240, wf%n_o, wf%n_v)
      call sort_to_21(tAIxx_vo, X240, wf%n_v, wf%n_o)
      call mem%alloc(X241, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         two, &
         X239, &
         wf%n_v*wf%n_o, &
         X240, 1, &
         zero, &
         X241, 1)
!
      call mem%dealloc(X239)
      call mem%dealloc(X240)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         rAxxx_ovo, &
         wf%n_o, &
         X241, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X241)
      call mem%alloc(X242, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         -one, &
         tAIxx_vo, &
         wf%n_v, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X242, &
         wf%n_o)
!
      call mem%alloc(X243, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X242, X243, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X242)
      call mem%alloc(X244, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(rAxxx_ovo, X244, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X244, &
         wf%n_o**2, &
         X243, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X243)
      call mem%dealloc(X244)
      call mem%alloc(X245, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         gxIxx_oov, &
         wf%n_o, &
         rAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X245, &
         wf%n_o)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X245, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X245)
      call mem%alloc(X246, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X246, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X247, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         -one, &
         X246, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X247, 1)
!
      call mem%dealloc(X246)
      call mem%alloc(X248, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         rAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X247, 1, &
         zero, &
         X248, 1)
!
      call mem%dealloc(X247)
      call add_21_to_12(one, X248, rho_ai, wf%n_v, wf%n_o)
      call mem%dealloc(X248)
      call mem%alloc(X249, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X249, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X250, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         two, &
         X249, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X250, 1)
!
      call mem%dealloc(X249)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         rAxxx_ovo, &
         wf%n_o, &
         X250, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X250)
      call mem%alloc(X251, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         -one, &
         tAxxI_ov, &
         wf%n_o, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X251, &
         wf%n_o)
!
      call mem%alloc(X252, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X251, X252, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X251)
      call mem%alloc(X253, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(rAxxx_ovo, X253, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X253, &
         wf%n_o**2, &
         X252, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X252)
      call mem%dealloc(X253)
      call mem%alloc(X254, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         gxIxx_oov, &
         wf%n_o, &
         rAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X254, &
         wf%n_o)
!
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X254, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X254)
      call mem%alloc(X255, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X255, wf%n_v, wf%n_o)
      call mem%alloc(X256, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         gxIxx_oov, &
         wf%n_o, &
         X255, 1, &
         zero, &
         X256, 1)
!
      call mem%dealloc(X255)
      call mem%alloc(X257, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         rAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X256, 1, &
         zero, &
         X257, 1)
!
      call mem%dealloc(X256)
      call add_21_to_12(one, X257, rho_ai, wf%n_v, wf%n_o)
      call mem%dealloc(X257)
      call mem%alloc(X258, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X258, wf%n_v, wf%n_o)
      call mem%alloc(X259, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         gxIxx_oov, &
         wf%n_o, &
         X258, 1, &
         zero, &
         X259, 1)
!
      call mem%dealloc(X258)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         rAxxx_ovo, &
         wf%n_o, &
         X259, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X259)
      call mem%alloc(X260, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         gxIxx_oov, &
         wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X260, &
         wf%n_o**2)
!
      call mem%alloc(X261, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(rAxxx_ovo, X261, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X261, &
         wf%n_o**2, &
         X260, &
         wf%n_o**2, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X260)
      call mem%dealloc(X261)
      call mem%alloc(X262, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X262, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X263, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X262, &
         wf%n_v*wf%n_o, &
         rAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X263, &
         wf%n_o)
!
      call mem%dealloc(X262)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X263, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X263)
      call mem%alloc(X264, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v, &
         -one, &
         gxIxx_oov, &
         wf%n_o**2, &
         tAxAx_oo, 1, &
         zero, &
         X264, 1)
!
      call mem%alloc(X265, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(rxIxx_vvo, X265, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X265, &
         wf%n_v*wf%n_o, &
         X264, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X264)
      call mem%dealloc(X265)
      call mem%alloc(X266, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v, &
         two, &
         gxIxx_oov, &
         wf%n_o**2, &
         tAxAx_oo, 1, &
         zero, &
         X266, 1)
!
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         rxxxI_vov, &
         wf%n_v*wf%n_o, &
         X266, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X266)
      call mem%alloc(X267, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X267, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X268, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         X267, &
         wf%n_v*wf%n_o, &
         rxxxI_vov, &
         wf%n_v, &
         zero, &
         X268, &
         wf%n_o)
!
      call mem%dealloc(X267)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X268, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X268)
      call mem%alloc(X269, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         gxIxx_oov, &
         wf%n_o, &
         rxxxI_vov, &
         wf%n_v, &
         zero, &
         X269, &
         wf%n_o)
!
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X269, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X269)
!
   end subroutine construct_triples_into_singles_transformation_2_doublet_ccsd

