   subroutine triples_into_singles_J_doublet_ccsd(wf, rho_ai, FAx_v, FxI_o, LAIxx_ov, LAIxx_vo, LAxxx_voo, LAxxx_vvv, L_ovov, L_voov, LxIxx_ooo, LxxxI_vvo, gAIAI, gAIAx_o, gAIxI_v, gAIxx_ov, gAxAx_vv, gAxxI_vo, gAxxx_oov, gAxxx_voo, gAxxx_vvv, g_ovov, gxIxI_oo, gxIxx_ooo, gxIxx_vov, gxxxI_vvo, rAI, rAx_o, r_vo, rxI_v, tAIAx_o, tAIxI_v, tAIxx_vo, tAxAx_oo, tAxxI_ov, tAxxx_ovo, txIxI_vv, txIxx_vvo, txxxI_vov, uAIxx_vo, uAxxx_ovo, uxIxx_vvo, uxxxI_vov)
!!
!! Generated function
!!
      implicit none
!
      class(doublet_ccsd), intent(in) :: wf
!
      real(dp), dimension(wf%n_v,wf%n_o), intent(inout) :: rho_ai
!
      real(dp), intent(in) :: gAIAI, rAI
      real(dp), dimension(wf%n_o), intent(in) :: FxI_o, gAIAx_o, rAx_o, tAIAx_o
      real(dp), dimension(wf%n_v), intent(in) :: FAx_v, gAIxI_v, rxI_v, tAIxI_v
      real(dp), dimension(wf%n_o,wf%n_o), intent(in) :: gxIxI_oo, tAxAx_oo
      real(dp), dimension(wf%n_o,wf%n_v), intent(in) :: LAIxx_ov, gAIxx_ov, tAxxI_ov
      real(dp), dimension(wf%n_v,wf%n_o), intent(in) :: LAIxx_vo, gAxxI_vo, r_vo, tAIxx_vo, uAIxx_vo
      real(dp), dimension(wf%n_v,wf%n_v), intent(in) :: gAxAx_vv, txIxI_vv
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_o), intent(in) :: LxIxx_ooo, gxIxx_ooo
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_v), intent(in) :: gAxxx_oov
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o), intent(in) :: tAxxx_ovo, uAxxx_ovo
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_o), intent(in) :: LAxxx_voo, gAxxx_voo
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v), intent(in) :: gxIxx_vov, txxxI_vov, uxxxI_vov
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_o), intent(in) :: LxxxI_vvo, gxxxI_vvo, txIxx_vvo, uxIxx_vvo
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_v), intent(in) :: LAxxx_vvv, gAxxx_vvv
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o,wf%n_v), intent(in) :: L_ovov, g_ovov
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_o,wf%n_v), intent(in) :: L_voov
!
      real(dp) :: X3, X7, X22, X31, X35, X39, X70, X108, X111, X135, X149, X175, X183, X186
      real(dp), dimension(:), allocatable :: X1, X2, X4, X5, X6, X8, X9, X10, X26, X27, X29, X30, X33, X34, X42, X44, X45, X46, X48, X49, X56, X61, X65, X67, X73, X74, X86, X89, X91, X93, X101, X104, X134, X148, X215, X217, X220, X226, X232, X233, X239, X245, X251, X252, X258, X262, X270, X271, X277, X281, X291, X294, X297, X300, X309, X310, X316, X319, X326, X327, X333, X336, X345, X346, X352, X356, X368, X371
      real(dp), dimension(:,:), allocatable :: X11, X14, X15, X16, X17, X20, X21, X23, X24, X25, X28, X32, X36, X37, X38, X40, X41, X43, X47, X54, X58, X59, X60, X62, X63, X64, X66, X68, X69, X71, X78, X80, X82, X84, X85, X87, X88, X92, X96, X98, X99, X100, X102, X103, X105, X106, X107, X109, X110, X112, X113, X114, X115, X116, X117, X118, X119, X120, X121, X122, X123, X124, X125, X126, X128, X129, X131, X132, X139, X143, X152, X155, X162, X163, X165, X166, X168, X169, X171, X172, X174, X177, X178, X180, X181, X182, X185, X188, X189, X191, X192, X193, X194, X195, X196, X197, X198, X208, X210, X219, X223, X225, X230, X236, X238, X242, X244, X249, X255, X257, X260, X265, X268, X274, X276, X279, X280, X284, X287, X288, X289, X290, X292, X293, X296, X299, X303, X313, X315, X321, X324, X330, X335, X343, X349, X351, X354, X355, X364, X365, X366, X367, X369, X370
      real(dp), dimension(:,:,:), allocatable :: X12, X13, X18, X19, X50, X51, X52, X53, X55, X57, X72, X75, X76, X77, X79, X81, X83, X90, X94, X95, X97, X127, X130, X133, X136, X137, X138, X141, X142, X145, X146, X147, X150, X151, X154, X156, X157, X158, X159, X160, X200, X201, X203, X204, X206, X211, X212, X213, X214, X216, X222, X228, X229, X231, X234, X235, X241, X247, X248, X250, X253, X254, X261, X264, X267, X269, X272, X273, X283, X286, X302, X304, X305, X306, X307, X308, X311, X312, X318, X320, X322, X323, X325, X328, X329, X331, X332, X337, X338, X339, X340, X342, X344, X347, X348, X357, X358, X359, X360, X361, X363
      real(dp), dimension(:,:,:,:), allocatable :: X140, X144, X153, X161, X164, X167, X170, X173, X176, X179, X184, X187, X190, X199, X202, X205, X207, X209, X218, X221, X224, X227, X237, X240, X243, X246, X256, X259, X263, X266, X275, X278, X282, X285, X295, X298, X301, X314, X317, X334, X341, X350, X353, X362
!
      real(dp), external :: ddot
!
      call daxpy(wf%n_v*wf%n_o, rAI, LAIxx_vo, 1, rho_ai, 1)
      call daxpy(wf%n_v*wf%n_o, gAIAI, r_vo, 1, rho_ai, 1)
!
      call dger(wf%n_v, &
         wf%n_o, &
         -one, &
         rxI_v, 1, &
         gAIAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
!
      call dger(wf%n_v, &
         wf%n_o, &
         -one, &
         gAIxI_v, 1, &
         rAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         rAI, &
         wf%fock_ab, &
         wf%n_v, &
         uAIxx_vo, &
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
         -rAI, &
         uAIxx_vo, &
         wf%n_v, &
         wf%fock_ij, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%alloc(X1, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v, &
         -one, &
         wf%fock_ab, &
         wf%n_v, &
         tAIxI_v, 1, &
         zero, &
         X1, 1)
!
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         X1, 1, &
         rAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X1)
      call mem%alloc(X2, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_o, &
         one, &
         wf%fock_ij, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X2, 1)
!
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         rxI_v, 1, &
         X2, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X2)
      X3 = two * ddot(wf%n_v, FAx_v, 1, tAIxI_v, 1)
      call daxpy(wf%n_v*wf%n_o, X3, r_vo, 1, rho_ai, 1)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         rAI, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         FAx_v, 1, &
         one, &
         rho_ai, 1)
!
      call mem%alloc(X4, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v, &
         -one, &
         txIxI_vv, &
         wf%n_v, &
         FAx_v, 1, &
         zero, &
         X4, 1)
!
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         X4, 1, &
         rAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X4)
      call mem%alloc(X5, wf%n_o)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_o, &
         -one, &
         tAIxx_vo, &
         wf%n_v, &
         FAx_v, 1, &
         zero, &
         X5, 1)
!
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         rxI_v, 1, &
         X5, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X5)
      call mem%alloc(X6, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v, &
         -one, &
         tAxxI_ov, &
         wf%n_o, &
         FAx_v, 1, &
         zero, &
         X6, 1)
!
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         rxI_v, 1, &
         X6, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X6)
      X7 = -two * ddot(wf%n_o, FxI_o, 1, tAIAx_o, 1)
      call daxpy(wf%n_v*wf%n_o, X7, r_vo, 1, rho_ai, 1)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -rAI, &
         uAxxx_ovo, &
         wf%n_o, &
         FxI_o, 1, &
         one, &
         rho_ai, 1)
!
      call mem%alloc(X8, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         FxI_o, 1, &
         zero, &
         X8, 1)
!
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         X8, 1, &
         rAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X8)
      call mem%alloc(X9, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         FxI_o, 1, &
         zero, &
         X9, 1)
!
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         X9, 1, &
         rAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X9)
      call mem%alloc(X10, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAxAx_oo, &
         wf%n_o, &
         FxI_o, 1, &
         zero, &
         X10, 1)
!
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         rxI_v, 1, &
         X10, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X10)
      call mem%alloc(X11, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X11, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         rAI, &
         L_voov, &
         wf%n_v*wf%n_o, &
         X11, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X11)
      call mem%alloc(X12, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -one, &
         L_voov, &
         wf%n_v*wf%n_o**2, &
         tAIxI_v, 1, &
         zero, &
         X12, 1)
!
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X12, &
         wf%n_v*wf%n_o, &
         rAx_o, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X12)
      call mem%alloc(X13, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -one, &
         L_voov, &
         wf%n_v*wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X13, 1)
!
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X13, &
         wf%n_v*wf%n_o, &
         tAIAx_o, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X13)
      call mem%alloc(X14, wf%n_v, wf%n_o)
      call sort_to_21(LAIxx_ov, X14, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         rAI, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         X14, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X14)
      call mem%alloc(X15, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v**2, &
         one, &
         LAxxx_vvv, &
         wf%n_v, &
         tAIxI_v, 1, &
         zero, &
         X15, 1)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X15, &
         wf%n_v, &
         r_vo, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X15)
      call mem%alloc(X16, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_o**2, &
         -one, &
         LAxxx_voo, &
         wf%n_v, &
         tAIxI_v, 1, &
         zero, &
         X16, 1)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X16, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X16)
      call mem%alloc(X17, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         LxIxx_ooo, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X17, 1)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X17, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X17)
      call mem%alloc(X18, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(LxxxI_vvo, X18, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X19, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -one, &
         r_vo, &
         wf%n_v, &
         X18, &
         wf%n_v*wf%n_o, &
         zero, &
         X19, &
         wf%n_o)
!
      call mem%dealloc(X18)
      call mem%alloc(X20, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X19, &
         wf%n_v*wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X20, 1)
!
      call mem%dealloc(X19)
      call add_21_to_12(one, X20, rho_ai, wf%n_v, wf%n_o)
      call mem%dealloc(X20)
      call mem%alloc(X21, wf%n_v, wf%n_o)
      call sort_to_21(gAIxx_ov, X21, wf%n_o, wf%n_v)
      X22 = two * ddot(wf%n_v*wf%n_o, X21, 1, uAIxx_vo, 1)
      call mem%dealloc(X21)
      call daxpy(wf%n_v*wf%n_o, X22, r_vo, 1, rho_ai, 1)
      call mem%alloc(X23, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         gAIxx_ov, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X23, &
         wf%n_o)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X23, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X23)
      call mem%alloc(X24, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         gAIxx_ov, &
         wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X24, &
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
         X24, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X24)
      call mem%alloc(X25, wf%n_v, wf%n_o)
      call sort_to_21(gAIxx_ov, X25, wf%n_o, wf%n_v)
      call mem%alloc(X26, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         uxIxx_vvo, &
         wf%n_v, &
         X25, 1, &
         zero, &
         X26, 1)
!
      call mem%dealloc(X25)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         X26, 1, &
         rAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X26)
      call mem%alloc(X27, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v, &
         -one, &
         gAIxx_ov, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X27, 1)
!
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X27, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X27)
      call mem%alloc(X28, wf%n_v, wf%n_o)
      call sort_to_21(gAIxx_ov, X28, wf%n_o, wf%n_v)
      call mem%alloc(X29, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         uAxxx_ovo, &
         wf%n_o, &
         X28, 1, &
         zero, &
         X29, 1)
!
      call mem%dealloc(X28)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         rxI_v, 1, &
         X29, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X29)
      call mem%alloc(X30, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v, &
         -one, &
         gAIxx_ov, &
         wf%n_o, &
         rxI_v, 1, &
         zero, &
         X30, 1)
!
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X30, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X30)
      X31 = ddot(wf%n_v**2, gAxAx_vv, 1, txIxI_vv, 1)
      call daxpy(wf%n_v*wf%n_o, X31, r_vo, 1, rho_ai, 1)
      call mem%alloc(X32, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         gAxAx_vv, &
         wf%n_v, &
         r_vo, &
         wf%n_v, &
         zero, &
         X32, &
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
         X32, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X32)
      call mem%alloc(X33, wf%n_o)
!
      call dgemv('T', &
         wf%n_v**2, &
         wf%n_o, &
         -one, &
         txIxx_vvo, &
         wf%n_v**2, &
         gAxAx_vv, 1, &
         zero, &
         X33, 1)
!
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         rxI_v, 1, &
         X33, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X33)
      call mem%alloc(X34, wf%n_v)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v, &
         one, &
         gAxAx_vv, &
         wf%n_v, &
         rxI_v, 1, &
         zero, &
         X34, 1)
!
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X34, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X34)
      X35 = -two * ddot(wf%n_v*wf%n_o, gAxxI_vo, 1, tAIxx_vo, 1)
      call daxpy(wf%n_v*wf%n_o, X35, r_vo, 1, rho_ai, 1)
      call mem%alloc(X36, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         gAxxI_vo, &
         wf%n_v, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X36, &
         wf%n_o)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X36, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X36)
      call mem%alloc(X37, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         gAxxI_vo, &
         wf%n_v, &
         r_vo, &
         wf%n_v, &
         zero, &
         X37, &
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
         X37, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X37)
      call mem%alloc(X38, wf%n_o, wf%n_v)
      call sort_to_21(gAxxI_vo, X38, wf%n_v, wf%n_o)
      X39 = -two * ddot(wf%n_v*wf%n_o, X38, 1, tAxxI_ov, 1)
      call mem%dealloc(X38)
      call daxpy(wf%n_v*wf%n_o, X39, r_vo, 1, rho_ai, 1)
      call mem%alloc(X40, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         gAxxI_vo, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X40, &
         wf%n_o)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X40, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X40)
      call mem%alloc(X41, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         gAxxI_vo, &
         wf%n_v, &
         r_vo, &
         wf%n_v, &
         zero, &
         X41, &
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
         X41, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X41)
      call mem%alloc(X42, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v, &
         gAxxI_vo, 1, &
         zero, &
         X42, 1)
!
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         X42, 1, &
         rAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X42)
      call mem%alloc(X43, wf%n_o, wf%n_v)
      call sort_to_21(gAxxI_vo, X43, wf%n_v, wf%n_o)
      call mem%alloc(X44, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         txxxI_vov, &
         wf%n_v, &
         X43, 1, &
         zero, &
         X44, 1)
!
      call mem%dealloc(X43)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         X44, 1, &
         rAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X44)
      call mem%alloc(X45, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_o, &
         -one, &
         gAxxI_vo, &
         wf%n_v, &
         rAx_o, 1, &
         zero, &
         X45, 1)
!
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X45, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X45)
      call mem%alloc(X46, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         gAxxI_vo, 1, &
         zero, &
         X46, 1)
!
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         rxI_v, 1, &
         X46, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X46)
      call mem%alloc(X47, wf%n_o, wf%n_v)
      call sort_to_21(gAxxI_vo, X47, wf%n_v, wf%n_o)
      call mem%alloc(X48, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X47, 1, &
         zero, &
         X48, 1)
!
      call mem%dealloc(X47)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         rxI_v, 1, &
         X48, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X48)
      call mem%alloc(X49, wf%n_o)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_o, &
         -one, &
         gAxxI_vo, &
         wf%n_v, &
         rxI_v, 1, &
         zero, &
         X49, 1)
!
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X49, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X49)
      call mem%alloc(X50, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_oov, X50, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -rAI, &
         uxIxx_vvo, &
         wf%n_v, &
         X50, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X50)
      call mem%alloc(X51, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_132(gAxxx_vvv, X51, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v**2, &
         rAI, &
         X51, &
         wf%n_v**2, &
         uxIxx_vvo, &
         wf%n_v**2, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X51)
      call mem%alloc(X52, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_213(gAxxx_voo, X52, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -rAI, &
         uxxxI_vov, &
         wf%n_v, &
         X52, &
         wf%n_v*wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X52)
      call mem%alloc(X53, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_oov, X53, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X54, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X53, &
         wf%n_v*wf%n_o, &
         rAx_o, 1, &
         zero, &
         X54, 1)
!
      call mem%dealloc(X53)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X54, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X54)
      call mem%alloc(X55, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_132(gAxxx_vvv, X55, wf%n_v, wf%n_v, wf%n_v)
      call mem%alloc(X56, wf%n_v)
!
      call dgemv('T', &
         wf%n_v**2, &
         wf%n_v, &
         -one, &
         X55, &
         wf%n_v**2, &
         txIxI_vv, 1, &
         zero, &
         X56, 1)
!
      call mem%dealloc(X55)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         X56, 1, &
         rAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X56)
      call mem%alloc(X57, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(gAxxx_voo, X57, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X58, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X57, &
         wf%n_v*wf%n_o, &
         rAx_o, 1, &
         zero, &
         X58, 1)
!
      call mem%dealloc(X57)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X58, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X58)
      call mem%alloc(X59, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         gAxxx_oov, &
         wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X59, 1)
!
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X59, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X59)
      call mem%alloc(X60, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v, &
         -one, &
         gAxxx_vvv, &
         wf%n_v**2, &
         rxI_v, 1, &
         zero, &
         X60, 1)
!
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X60, &
         wf%n_v, &
         tAIxx_vo, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X60)
      call mem%alloc(X61, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         gAxxx_voo, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, 1, &
         zero, &
         X61, 1)
!
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         rxI_v, 1, &
         X61, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X61)
      call mem%alloc(X62, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         gAxxx_oov, &
         wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X62, 1)
!
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X62, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X62)
      call mem%alloc(X63, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v, &
         -one, &
         gAxxx_vvv, &
         wf%n_v**2, &
         rxI_v, 1, &
         zero, &
         X63, 1)
!
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X63, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X63)
      call mem%alloc(X64, wf%n_v, wf%n_o)
      call sort_to_21(tAxxI_ov, X64, wf%n_o, wf%n_v)
      call mem%alloc(X65, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         gAxxx_voo, &
         wf%n_v*wf%n_o, &
         X64, 1, &
         zero, &
         X65, 1)
!
      call mem%dealloc(X64)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         rxI_v, 1, &
         X65, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X65)
      call mem%alloc(X66, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X66, wf%n_v, wf%n_o)
      call mem%alloc(X67, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         gAxxx_oov, &
         wf%n_o, &
         X66, 1, &
         zero, &
         X67, 1)
!
      call mem%dealloc(X66)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         rxI_v, 1, &
         X67, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X67)
      call mem%alloc(X68, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v**2, &
         one, &
         gAxxx_vvv, &
         wf%n_v, &
         rxI_v, 1, &
         zero, &
         X68, 1)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X68, &
         wf%n_v, &
         uAIxx_vo, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X68)
      call mem%alloc(X69, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_o**2, &
         -one, &
         gAxxx_voo, &
         wf%n_v, &
         rxI_v, 1, &
         zero, &
         X69, 1)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X69, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X69)
      X70 = ddot(wf%n_o**2, gxIxI_oo, 1, tAxAx_oo, 1)
      call daxpy(wf%n_v*wf%n_o, X70, r_vo, 1, rho_ai, 1)
      call mem%alloc(X71, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         -one, &
         gxIxI_oo, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X71, &
         wf%n_o)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X71, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X71)
      call mem%alloc(X72, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X72, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X73, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v, &
         -one, &
         X72, &
         wf%n_o**2, &
         gxIxI_oo, 1, &
         zero, &
         X73, 1)
!
      call mem%dealloc(X72)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         X73, 1, &
         rAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X73)
      call mem%alloc(X74, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_o, &
         one, &
         gxIxI_oo, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X74, 1)
!
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X74, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X74)
      call mem%alloc(X75, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X75, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -rAI, &
         gxIxx_vov, &
         wf%n_v, &
         X75, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X75)
      call mem%alloc(X76, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X76, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o**2, &
         rAI, &
         X76, &
         wf%n_o**2, &
         gxIxx_ooo, &
         wf%n_o**2, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X76)
      call mem%alloc(X77, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         gxIxx_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X77, &
         wf%n_o)
!
      call mem%alloc(X78, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X77, &
         wf%n_v*wf%n_o, &
         rAx_o, 1, &
         zero, &
         X78, 1)
!
      call mem%dealloc(X77)
      call add_21_to_12(one, X78, rho_ai, wf%n_v, wf%n_o)
      call mem%dealloc(X78)
      call mem%alloc(X79, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(gxIxx_ooo, X79, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X80, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_o, &
         -one, &
         X79, &
         wf%n_o**2, &
         rAx_o, 1, &
         zero, &
         X80, 1)
!
      call mem%dealloc(X79)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X80, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X80)
      call mem%alloc(X81, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         gxIxx_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X81, &
         wf%n_o)
!
      call mem%alloc(X82, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X81, &
         wf%n_v*wf%n_o, &
         rAx_o, 1, &
         zero, &
         X82, 1)
!
      call mem%dealloc(X81)
      call add_21_to_12(one, X82, rho_ai, wf%n_v, wf%n_o)
      call mem%dealloc(X82)
      call mem%alloc(X83, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(gxIxx_ooo, X83, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X84, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_o, &
         -one, &
         X83, &
         wf%n_o**2, &
         rAx_o, 1, &
         zero, &
         X84, 1)
!
      call mem%dealloc(X83)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X84, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X84)
      call mem%alloc(X85, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X85, wf%n_v, wf%n_o)
      call mem%alloc(X86, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         gxIxx_vov, &
         wf%n_v, &
         X85, 1, &
         zero, &
         X86, 1)
!
      call mem%dealloc(X85)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         X86, 1, &
         rAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X86)
      call mem%alloc(X87, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         gxIxx_ooo, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X87, 1)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X87, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X87)
      call mem%alloc(X88, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         gxIxx_vov, &
         wf%n_v*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X88, 1)
!
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X88, &
         wf%n_v, &
         tAxAx_oo, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X88)
      call mem%alloc(X89, wf%n_o)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_o, &
         -one, &
         gxIxx_ooo, &
         wf%n_o**2, &
         tAxAx_oo, 1, &
         zero, &
         X89, 1)
!
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         rxI_v, 1, &
         X89, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X89)
      call mem%alloc(X90, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(uAxxx_ovo, X90, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -rAI, &
         gxxxI_vvo, &
         wf%n_v, &
         X90, &
         wf%n_v*wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X90)
      call mem%alloc(X91, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         gxxxI_vvo, &
         wf%n_v, &
         tAIxx_vo, 1, &
         zero, &
         X91, 1)
!
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         X91, 1, &
         rAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X91)
      call mem%alloc(X92, wf%n_v, wf%n_o)
      call sort_to_21(tAxxI_ov, X92, wf%n_o, wf%n_v)
      call mem%alloc(X93, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         gxxxI_vvo, &
         wf%n_v, &
         X92, 1, &
         zero, &
         X93, 1)
!
      call mem%dealloc(X92)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         X93, 1, &
         rAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X93)
      call mem%alloc(X94, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(gxxxI_vvo, X94, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X95, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -one, &
         uAIxx_vo, &
         wf%n_v, &
         X94, &
         wf%n_v*wf%n_o, &
         zero, &
         X95, &
         wf%n_o)
!
      call mem%dealloc(X94)
      call mem%alloc(X96, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X95, &
         wf%n_v*wf%n_o, &
         rAx_o, 1, &
         zero, &
         X96, 1)
!
      call mem%dealloc(X95)
      call add_21_to_12(one, X96, rho_ai, wf%n_v, wf%n_o)
      call mem%dealloc(X96)
      call mem%alloc(X97, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(gxxxI_vvo, X97, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X98, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X97, &
         wf%n_v*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X98, 1)
!
      call mem%dealloc(X97)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X98, &
         wf%n_v, &
         tAxAx_oo, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X98)
      call mem%alloc(X99, wf%n_o, wf%n_v)
      call sort_to_21(r_vo, X99, wf%n_v, wf%n_o)
      call mem%alloc(X100, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X99, 1, &
         zero, &
         X100, 1)
!
      call mem%dealloc(X99)
      call mem%alloc(X101, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v, &
         one, &
         X100, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X101, 1)
!
      call mem%dealloc(X100)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X101, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X101)
      call mem%alloc(X102, wf%n_o, wf%n_v)
      call sort_to_21(r_vo, X102, wf%n_v, wf%n_o)
      call mem%alloc(X103, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X102, 1, &
         zero, &
         X103, 1)
!
      call mem%dealloc(X102)
      call mem%alloc(X104, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v, &
         one, &
         X103, &
         wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X104, 1)
!
      call mem%dealloc(X103)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X104, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X104)
      call mem%alloc(X105, wf%n_o, wf%n_v)
      call sort_to_21(tAIxx_vo, X105, wf%n_v, wf%n_o)
      call mem%alloc(X106, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X105, 1, &
         zero, &
         X106, 1)
!
      call mem%dealloc(X105)
      call mem%alloc(X107, wf%n_v, wf%n_o)
      call sort_to_21(X106, X107, wf%n_o, wf%n_v)
      call mem%dealloc(X106)
      X108 = ddot(wf%n_v*wf%n_o, X107, 1, tAIxx_vo, 1)
      call mem%dealloc(X107)
      call daxpy(wf%n_v*wf%n_o, X108, r_vo, 1, rho_ai, 1)
      call mem%alloc(X109, wf%n_o, wf%n_v)
      call sort_to_21(tAIxx_vo, X109, wf%n_v, wf%n_o)
      call mem%alloc(X110, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X109, 1, &
         zero, &
         X110, 1)
!
      call mem%dealloc(X109)
      X111 = ddot(wf%n_v*wf%n_o, X110, 1, tAxxI_ov, 1)
      call mem%dealloc(X110)
      call daxpy(wf%n_v*wf%n_o, X111, r_vo, 1, rho_ai, 1)
      call mem%alloc(X112, wf%n_o, wf%n_v)
      call sort_to_21(r_vo, X112, wf%n_v, wf%n_o)
      call mem%alloc(X113, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X112, 1, &
         zero, &
         X113, 1)
!
      call mem%dealloc(X112)
      call mem%alloc(X114, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X113, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X114, &
         wf%n_o)
!
      call mem%dealloc(X113)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X114, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X114)
      call mem%alloc(X115, wf%n_o, wf%n_v)
      call sort_to_21(r_vo, X115, wf%n_v, wf%n_o)
      call mem%alloc(X116, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X115, 1, &
         zero, &
         X116, 1)
!
      call mem%dealloc(X115)
      call mem%alloc(X117, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X116, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X117, &
         wf%n_o)
!
      call mem%dealloc(X116)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X117, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X117)
      call mem%alloc(X118, wf%n_o, wf%n_v)
      call sort_to_21(r_vo, X118, wf%n_v, wf%n_o)
      call mem%alloc(X119, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X118, 1, &
         zero, &
         X119, 1)
!
      call mem%dealloc(X118)
      call mem%alloc(X120, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X119, &
         wf%n_o, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X120, &
         wf%n_o)
!
      call mem%dealloc(X119)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X120, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X120)
      call mem%alloc(X121, wf%n_o, wf%n_v)
      call sort_to_21(r_vo, X121, wf%n_v, wf%n_o)
      call mem%alloc(X122, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X121, 1, &
         zero, &
         X122, 1)
!
      call mem%dealloc(X121)
      call mem%alloc(X123, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X122, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X123, &
         wf%n_o)
!
      call mem%dealloc(X122)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X123, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X123)
      call mem%alloc(X124, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X124, wf%n_v, wf%n_o)
      call mem%alloc(X125, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X124, 1, &
         zero, &
         X125, 1)
!
      call mem%dealloc(X124)
      call mem%alloc(X126, wf%n_v, wf%n_o)
      call sort_to_21(X125, X126, wf%n_o, wf%n_v)
      call mem%dealloc(X125)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         rAI, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         X126, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X126)
      call mem%alloc(X127, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -one, &
         L_ovov, &
         wf%n_v*wf%n_o**2, &
         tAIxI_v, 1, &
         zero, &
         X127, 1)
!
      call mem%alloc(X128, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X127, &
         wf%n_v*wf%n_o, &
         rAx_o, 1, &
         zero, &
         X128, 1)
!
      call mem%dealloc(X127)
      call mem%alloc(X129, wf%n_v, wf%n_o)
      call sort_to_21(X128, X129, wf%n_o, wf%n_v)
      call mem%dealloc(X128)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         X129, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X129)
      call mem%alloc(X130, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -one, &
         L_ovov, &
         wf%n_v*wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X130, 1)
!
      call mem%alloc(X131, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X130, &
         wf%n_v*wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X131, 1)
!
      call mem%dealloc(X130)
      call mem%alloc(X132, wf%n_v, wf%n_o)
      call sort_to_21(X131, X132, wf%n_o, wf%n_v)
      call mem%dealloc(X131)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         X132, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X132)
      call mem%alloc(X133, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X133, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X134, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -two, &
         g_ovov, &
         wf%n_o, &
         X133, 1, &
         zero, &
         X134, 1)
!
      call mem%dealloc(X133)
      X135 = ddot(wf%n_o, X134, 1, tAIAx_o, 1)
      call mem%dealloc(X134)
      call daxpy(wf%n_v*wf%n_o, X135, r_vo, 1, rho_ai, 1)
      call mem%alloc(X136, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X136, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X137, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X136, &
         wf%n_v, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X137, &
         wf%n_v)
!
      call mem%dealloc(X136)
      call mem%alloc(X138, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         r_vo, &
         wf%n_v, &
         X137, &
         wf%n_v*wf%n_o, &
         zero, &
         X138, &
         wf%n_o)
!
      call mem%dealloc(X137)
      call mem%alloc(X139, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X138, &
         wf%n_v*wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X139, 1)
!
      call mem%dealloc(X138)
      call add_21_to_12(one, X139, rho_ai, wf%n_v, wf%n_o)
      call mem%dealloc(X139)
      call mem%alloc(X140, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X140, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X141, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X141, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X142, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v**2, &
         one, &
         X141, &
         wf%n_v**2, &
         X140, &
         wf%n_o**2, &
         zero, &
         X142, &
         wf%n_o)
!
      call mem%dealloc(X140)
      call mem%dealloc(X141)
      call mem%alloc(X143, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X142, &
         wf%n_o**2, &
         tAIAx_o, 1, &
         zero, &
         X143, 1)
!
      call mem%dealloc(X142)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X143, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X143)
      call mem%alloc(X144, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X144, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X145, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X144, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v, &
         zero, &
         X145, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X144)
      call mem%alloc(X146, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X145, &
         wf%n_v, &
         r_vo, &
         wf%n_v, &
         zero, &
         X146, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X145)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X146, &
         wf%n_o, &
         tAIAx_o, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X146)
      call mem%alloc(X147, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_321(uAxxx_ovo, X147, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X148, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -two, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         X147, 1, &
         zero, &
         X148, 1)
!
      call mem%dealloc(X147)
      X149 = ddot(wf%n_v, X148, 1, tAIxI_v, 1)
      call mem%dealloc(X148)
      call daxpy(wf%n_v*wf%n_o, X149, r_vo, 1, rho_ai, 1)
      call mem%alloc(X150, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X150, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X151, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X150, &
         wf%n_o, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X151, &
         wf%n_o)
!
      call mem%dealloc(X150)
      call mem%alloc(X152, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X151, &
         wf%n_o**2, &
         tAIxI_v, 1, &
         zero, &
         X152, 1)
!
      call mem%dealloc(X151)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X152, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X152)
      call mem%alloc(X153, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X153, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X154, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X153, &
         wf%n_v*wf%n_o, &
         zero, &
         X154, &
         wf%n_o)
!
      call mem%dealloc(X153)
      call mem%alloc(X155, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X154, &
         wf%n_o**2, &
         tAIxI_v, 1, &
         zero, &
         X155, 1)
!
      call mem%dealloc(X154)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X155, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X155)
      call mem%alloc(X156, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         tAIxI_v, 1, &
         zero, &
         X156, 1)
!
      call mem%alloc(X157, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X156, X157, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X156)
      call mem%alloc(X158, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         r_vo, &
         wf%n_v, &
         X157, &
         wf%n_o**2, &
         zero, &
         X158, &
         wf%n_o)
!
      call mem%dealloc(X157)
      call mem%alloc(X159, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X158, X159, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X158)
      call mem%alloc(X160, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X160, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X160, &
         wf%n_o**2, &
         X159, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X159)
      call mem%dealloc(X160)
      call mem%alloc(X161, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X161, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X162, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X161, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, 1, &
         zero, &
         X162, 1)
!
      call mem%dealloc(X161)
      call mem%alloc(X163, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X162, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X163, &
         wf%n_o)
!
      call mem%dealloc(X162)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X163, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X163)
      call mem%alloc(X164, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X164, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X165, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X164, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X165, 1)
!
      call mem%dealloc(X164)
      call mem%alloc(X166, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X165, &
         wf%n_v, &
         r_vo, &
         wf%n_v, &
         zero, &
         X166, &
         wf%n_o)
!
      call mem%dealloc(X165)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X166, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X166)
      call mem%alloc(X167, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X167, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X168, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X167, &
         wf%n_v*wf%n_o, &
         uAIxx_vo, 1, &
         zero, &
         X168, 1)
!
      call mem%dealloc(X167)
      call mem%alloc(X169, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X168, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X169, &
         wf%n_o)
!
      call mem%dealloc(X168)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X169, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X169)
      call mem%alloc(X170, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X170, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X171, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X170, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, 1, &
         zero, &
         X171, 1)
!
      call mem%dealloc(X170)
      call mem%alloc(X172, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X171, &
         wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X172, &
         wf%n_o)
!
      call mem%dealloc(X171)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X172, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X172)
      call mem%alloc(X173, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X173, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X174, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v**2, &
         one, &
         X173, &
         wf%n_o**2, &
         txIxI_vv, 1, &
         zero, &
         X174, 1)
!
      call mem%dealloc(X173)
      X175 = ddot(wf%n_o**2, X174, 1, tAxAx_oo, 1)
      call mem%dealloc(X174)
      call daxpy(wf%n_v*wf%n_o, X175, r_vo, 1, rho_ai, 1)
      call mem%alloc(X176, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X176, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X177, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v**2, &
         -one, &
         X176, &
         wf%n_o**2, &
         txIxI_vv, 1, &
         zero, &
         X177, 1)
!
      call mem%dealloc(X176)
      call mem%alloc(X178, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X177, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X178, &
         wf%n_o)
!
      call mem%dealloc(X177)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X178, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X178)
      call mem%alloc(X179, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X179, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X180, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v**2, &
         -one, &
         X179, &
         wf%n_o**2, &
         tAxAx_oo, 1, &
         zero, &
         X180, 1)
!
      call mem%dealloc(X179)
      call mem%alloc(X181, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X180, &
         wf%n_v, &
         r_vo, &
         wf%n_v, &
         zero, &
         X181, &
         wf%n_v)
!
      call mem%dealloc(X180)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X181, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X181)
      call mem%alloc(X182, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X182, 1)
!
      X183 = ddot(wf%n_v*wf%n_o, X182, 1, tAxxI_ov, 1)
      call mem%dealloc(X182)
      call daxpy(wf%n_v*wf%n_o, X183, r_vo, 1, rho_ai, 1)
      call mem%alloc(X184, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X184, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X185, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X184, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X185, 1)
!
      call mem%dealloc(X184)
      X186 = ddot(wf%n_v*wf%n_o, X185, 1, tAxxI_ov, 1)
      call mem%dealloc(X185)
      call daxpy(wf%n_v*wf%n_o, X186, r_vo, 1, rho_ai, 1)
      call mem%alloc(X187, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X187, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X188, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X187, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X188, 1)
!
      call mem%dealloc(X187)
      call mem%alloc(X189, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X188, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X189, &
         wf%n_o)
!
      call mem%dealloc(X188)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X189, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X189)
      call mem%alloc(X190, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X190, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X191, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X190, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X191, 1)
!
      call mem%dealloc(X190)
      call mem%alloc(X192, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X191, &
         wf%n_v, &
         r_vo, &
         wf%n_v, &
         zero, &
         X192, &
         wf%n_o)
!
      call mem%dealloc(X191)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X192, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X192)
      call mem%alloc(X193, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X193, wf%n_v, wf%n_o)
      call mem%alloc(X194, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X193, 1, &
         zero, &
         X194, 1)
!
      call mem%dealloc(X193)
      call mem%alloc(X195, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X194, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X195, &
         wf%n_o)
!
      call mem%dealloc(X194)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X195, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X195)
      call mem%alloc(X196, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X196, wf%n_v, wf%n_o)
      call mem%alloc(X197, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X196, 1, &
         zero, &
         X197, 1)
!
      call mem%dealloc(X196)
      call mem%alloc(X198, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X197, &
         wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X198, &
         wf%n_o)
!
      call mem%dealloc(X197)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X198, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X198)
      call mem%alloc(X199, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X199, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X200, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X200, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X201, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X199, &
         wf%n_v*wf%n_o, &
         X200, &
         wf%n_o, &
         zero, &
         X201, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X199)
      call mem%dealloc(X200)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         rAI, &
         txIxx_vvo, &
         wf%n_v, &
         X201, &
         wf%n_v*wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X201)
      call mem%alloc(X202, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X202, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X203, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X202, &
         wf%n_o**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X203, &
         wf%n_o**2)
!
      call mem%dealloc(X202)
      call mem%alloc(X204, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X204, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o**2, &
         rAI, &
         X204, &
         wf%n_o**2, &
         X203, &
         wf%n_o**2, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X203)
      call mem%dealloc(X204)
      call mem%alloc(X205, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X205, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X206, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X205, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X206, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X205)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         rAI, &
         txxxI_vov, &
         wf%n_v, &
         X206, &
         wf%n_v*wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X206)
      call mem%alloc(X207, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X207, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X208, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         -one, &
         X207, &
         wf%n_v*wf%n_o**2, &
         wf%u_aibj, &
         wf%n_v, &
         zero, &
         X208, &
         wf%n_v)
!
      call mem%dealloc(X207)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         rAI, &
         X208, &
         wf%n_v, &
         uAIxx_vo, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X208)
      call mem%alloc(X209, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(wf%u_aibj, X209, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X210, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -one, &
         g_ovov, &
         wf%n_o, &
         X209, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X210, &
         wf%n_o)
!
      call mem%dealloc(X209)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         rAI, &
         uAIxx_vo, &
         wf%n_v, &
         X210, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X210)
      call mem%alloc(X211, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X211, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X212, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X211, &
         wf%n_o, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X212, &
         wf%n_o)
!
      call mem%dealloc(X211)
      call mem%alloc(X213, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X212, X213, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X212)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         rAI, &
         uxIxx_vvo, &
         wf%n_v, &
         X213, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X213)
      call mem%alloc(X214, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X214, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X215, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -one, &
         g_ovov, &
         wf%n_o, &
         X214, 1, &
         zero, &
         X215, 1)
!
      call mem%dealloc(X214)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         rAI, &
         uAxxx_ovo, &
         wf%n_o, &
         X215, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X215)
      call mem%alloc(X216, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_321(uAxxx_ovo, X216, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X217, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -one, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         X216, 1, &
         zero, &
         X217, 1)
!
      call mem%dealloc(X216)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         rAI, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X217, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X217)
      call mem%alloc(X218, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X218, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X219, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         X218, &
         wf%n_v*wf%n_o**2, &
         wf%u_aibj, &
         wf%n_v, &
         zero, &
         X219, &
         wf%n_v)
!
      call mem%dealloc(X218)
      call mem%alloc(X220, wf%n_v)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v, &
         one, &
         X219, &
         wf%n_v, &
         tAIxI_v, 1, &
         zero, &
         X220, 1)
!
      call mem%dealloc(X219)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         X220, 1, &
         rAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X220)
      call mem%alloc(X221, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X221, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X222, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         X221, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X222, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X221)
      call mem%alloc(X223, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X222, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X223, 1)
!
      call mem%dealloc(X222)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X223, &
         wf%n_v, &
         tAIxx_vo, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X223)
      call mem%alloc(X224, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X224, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X225, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X224, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, 1, &
         zero, &
         X225, 1)
!
      call mem%dealloc(X224)
      call mem%alloc(X226, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         txxxI_vov, &
         wf%n_v, &
         X225, 1, &
         zero, &
         X226, 1)
!
      call mem%dealloc(X225)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         X226, 1, &
         rAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X226)
      call mem%alloc(X227, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X227, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X228, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X228, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X229, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v**2, &
         -one, &
         X227, &
         wf%n_o**2, &
         X228, &
         wf%n_v**2, &
         zero, &
         X229, &
         wf%n_o**2)
!
      call mem%dealloc(X227)
      call mem%dealloc(X228)
      call mem%alloc(X230, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X229, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X230, 1)
!
      call mem%dealloc(X229)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X230, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X230)
      call mem%alloc(X231, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X231, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X232, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         one, &
         g_ovov, &
         wf%n_o, &
         X231, 1, &
         zero, &
         X232, 1)
!
      call mem%dealloc(X231)
      call mem%alloc(X233, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X232, 1, &
         zero, &
         X233, 1)
!
      call mem%dealloc(X232)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         X233, 1, &
         rAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X233)
      call mem%alloc(X234, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X234, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X235, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X234, &
         wf%n_v, &
         zero, &
         X235, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X234)
      call mem%alloc(X236, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X235, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X236, 1)
!
      call mem%dealloc(X235)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X236, &
         wf%n_v, &
         tAIxx_vo, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X236)
      call mem%alloc(X237, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X237, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X238, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X237, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, 1, &
         zero, &
         X238, 1)
!
      call mem%dealloc(X237)
      call mem%alloc(X239, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v, &
         one, &
         X238, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X239, 1)
!
      call mem%dealloc(X238)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X239, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X239)
      call mem%alloc(X240, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X240, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X241, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         X240, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X241, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X240)
      call mem%alloc(X242, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X241, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X242, 1)
!
      call mem%dealloc(X241)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X242, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X242)
      call mem%alloc(X243, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X243, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X244, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X243, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X244, 1)
!
      call mem%dealloc(X243)
      call mem%alloc(X245, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         txxxI_vov, &
         wf%n_v, &
         X244, 1, &
         zero, &
         X245, 1)
!
      call mem%dealloc(X244)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         X245, 1, &
         rAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X245)
      call mem%alloc(X246, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X246, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X247, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X247, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X248, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v**2, &
         -one, &
         X246, &
         wf%n_o**2, &
         X247, &
         wf%n_v**2, &
         zero, &
         X248, &
         wf%n_o**2)
!
      call mem%dealloc(X246)
      call mem%dealloc(X247)
      call mem%alloc(X249, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X248, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X249, 1)
!
      call mem%dealloc(X248)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X249, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X249)
      call mem%alloc(X250, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X250, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X251, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         one, &
         g_ovov, &
         wf%n_o, &
         X250, 1, &
         zero, &
         X251, 1)
!
      call mem%dealloc(X250)
      call mem%alloc(X252, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X251, 1, &
         zero, &
         X252, 1)
!
      call mem%dealloc(X251)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         X252, 1, &
         rAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X252)
      call mem%alloc(X253, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X253, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X254, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X253, &
         wf%n_v, &
         zero, &
         X254, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X253)
      call mem%alloc(X255, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X254, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X255, 1)
!
      call mem%dealloc(X254)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X255, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X255)
      call mem%alloc(X256, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X256, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X257, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X256, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X257, 1)
!
      call mem%dealloc(X256)
      call mem%alloc(X258, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v, &
         one, &
         X257, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X258, 1)
!
      call mem%dealloc(X257)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X258, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X258)
      call mem%alloc(X259, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X259, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X260, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v**2, &
         -one, &
         X259, &
         wf%n_o**2, &
         txIxI_vv, 1, &
         zero, &
         X260, 1)
!
      call mem%dealloc(X259)
      call mem%alloc(X261, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X261, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X262, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X261, &
         wf%n_o**2, &
         X260, 1, &
         zero, &
         X262, 1)
!
      call mem%dealloc(X260)
      call mem%dealloc(X261)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         X262, 1, &
         rAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X262)
      call mem%alloc(X263, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X263, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X264, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X263, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X264, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X263)
      call mem%alloc(X265, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X264, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X265, 1)
!
      call mem%dealloc(X264)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X265, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X265)
      call mem%alloc(X266, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X266, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X267, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X266, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X267, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X266)
      call mem%alloc(X268, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X267, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X268, 1)
!
      call mem%dealloc(X267)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X268, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X268)
      call mem%alloc(X269, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_321(uAxxx_ovo, X269, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X270, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         X269, 1, &
         zero, &
         X270, 1)
!
      call mem%dealloc(X269)
      call mem%alloc(X271, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X270, 1, &
         zero, &
         X271, 1)
!
      call mem%dealloc(X270)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         X271, 1, &
         rAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X271)
      call mem%alloc(X272, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X272, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X273, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X272, &
         wf%n_o, &
         zero, &
         X273, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X272)
      call mem%alloc(X274, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X273, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X274, 1)
!
      call mem%dealloc(X273)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X274, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X274)
      call mem%alloc(X275, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X275, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X276, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v**2, &
         one, &
         X275, &
         wf%n_o**2, &
         txIxI_vv, 1, &
         zero, &
         X276, 1)
!
      call mem%dealloc(X275)
      call mem%alloc(X277, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_o, &
         one, &
         X276, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X277, 1)
!
      call mem%dealloc(X276)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X277, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X277)
      call mem%alloc(X278, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X278, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X279, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X279, wf%n_v, wf%n_o)
      call mem%alloc(X280, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X278, &
         wf%n_v*wf%n_o, &
         X279, 1, &
         zero, &
         X280, 1)
!
      call mem%dealloc(X278)
      call mem%dealloc(X279)
      call mem%alloc(X281, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v, &
         X280, 1, &
         zero, &
         X281, 1)
!
      call mem%dealloc(X280)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         X281, 1, &
         rAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X281)
      call mem%alloc(X282, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X282, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X283, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X282, &
         wf%n_o**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X283, &
         wf%n_o**2)
!
      call mem%dealloc(X282)
      call mem%alloc(X284, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X283, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X284, 1)
!
      call mem%dealloc(X283)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X284, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X284)
      call mem%alloc(X285, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X285, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X286, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X285, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X286, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X285)
      call mem%alloc(X287, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X286, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X287, 1)
!
      call mem%dealloc(X286)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X287, &
         wf%n_v, &
         uAIxx_vo, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X287)
      call mem%alloc(X288, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X288, wf%n_v, wf%n_o)
      call mem%alloc(X289, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X288, 1, &
         zero, &
         X289, 1)
!
      call mem%dealloc(X288)
      call mem%alloc(X290, wf%n_v, wf%n_o)
      call sort_to_21(X289, X290, wf%n_o, wf%n_v)
      call mem%dealloc(X289)
      call mem%alloc(X291, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         uxIxx_vvo, &
         wf%n_v, &
         X290, 1, &
         zero, &
         X291, 1)
!
      call mem%dealloc(X290)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         X291, 1, &
         rAx_o, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X291)
      call mem%alloc(X292, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X292, wf%n_v, wf%n_o)
      call mem%alloc(X293, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X292, 1, &
         zero, &
         X293, 1)
!
      call mem%dealloc(X292)
      call mem%alloc(X294, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v, &
         one, &
         X293, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X294, 1)
!
      call mem%dealloc(X293)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X294, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X294)
      call mem%alloc(X295, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(wf%u_aibj, X295, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X296, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         one, &
         g_ovov, &
         wf%n_o, &
         X295, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X296, &
         wf%n_o)
!
      call mem%dealloc(X295)
      call mem%alloc(X297, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_o, &
         one, &
         X296, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X297, 1)
!
      call mem%dealloc(X296)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         rxI_v, 1, &
         X297, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X297)
      call mem%alloc(X298, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X298, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X299, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X298, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, 1, &
         zero, &
         X299, 1)
!
      call mem%dealloc(X298)
      call mem%alloc(X300, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X299, 1, &
         zero, &
         X300, 1)
!
      call mem%dealloc(X299)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         rxI_v, 1, &
         X300, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X300)
      call mem%alloc(X301, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X301, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X302, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         tAxxx_ovo, &
         wf%n_o, &
         X301, &
         wf%n_v*wf%n_o, &
         zero, &
         X302, &
         wf%n_o)
!
      call mem%dealloc(X301)
      call mem%alloc(X303, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X302, &
         wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X303, 1)
!
      call mem%dealloc(X302)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X303, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X303)
      call mem%alloc(X304, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -one, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X304, 1)
!
      call mem%alloc(X305, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X304, X305, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X304)
      call mem%alloc(X306, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X305, &
         wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X306, &
         wf%n_o**2)
!
      call mem%dealloc(X305)
      call mem%alloc(X307, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X307, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X307, &
         wf%n_o**2, &
         X306, &
         wf%n_o**2, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X306)
      call mem%dealloc(X307)
      call mem%alloc(X308, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_321(uAxxx_ovo, X308, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X309, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         X308, 1, &
         zero, &
         X309, 1)
!
      call mem%dealloc(X308)
      call mem%alloc(X310, wf%n_o)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X309, 1, &
         zero, &
         X310, 1)
!
      call mem%dealloc(X309)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         rxI_v, 1, &
         X310, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X310)
      call mem%alloc(X311, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X311, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X312, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X311, &
         wf%n_o, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X312, &
         wf%n_o)
!
      call mem%dealloc(X311)
      call mem%alloc(X313, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X312, &
         wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X313, 1)
!
      call mem%dealloc(X312)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X313, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X313)
      call mem%alloc(X314, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X314, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X315, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X314, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, 1, &
         zero, &
         X315, 1)
!
      call mem%dealloc(X314)
      call mem%alloc(X316, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v, &
         one, &
         X315, &
         wf%n_o, &
         rxI_v, 1, &
         zero, &
         X316, 1)
!
      call mem%dealloc(X315)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X316, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X316)
      call mem%alloc(X317, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X317, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X318, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v**2, &
         -one, &
         X317, &
         wf%n_o**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X318, &
         wf%n_o**2)
!
      call mem%dealloc(X317)
      call mem%alloc(X319, wf%n_o)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X318, &
         wf%n_o**2, &
         tAxAx_oo, 1, &
         zero, &
         X319, 1)
!
      call mem%dealloc(X318)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         rxI_v, 1, &
         X319, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X319)
      call mem%alloc(X320, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -one, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X320, 1)
!
      call mem%alloc(X321, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X320, &
         wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X321, &
         wf%n_o)
!
      call mem%dealloc(X320)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X321, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X321)
      call mem%alloc(X322, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -one, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X322, 1)
!
      call mem%alloc(X323, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X322, X323, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X322)
      call mem%alloc(X324, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X323, &
         wf%n_o, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X324, &
         wf%n_o)
!
      call mem%dealloc(X323)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X324, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X324)
      call mem%alloc(X325, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X325, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X326, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         one, &
         g_ovov, &
         wf%n_o, &
         X325, 1, &
         zero, &
         X326, 1)
!
      call mem%dealloc(X325)
      call mem%alloc(X327, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAxAx_oo, &
         wf%n_o, &
         X326, 1, &
         zero, &
         X327, 1)
!
      call mem%dealloc(X326)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         rxI_v, 1, &
         X327, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X327)
      call mem%alloc(X328, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X328, 1)
!
      call mem%alloc(X329, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(X328, X329, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X328)
      call mem%alloc(X330, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X329, &
         wf%n_v*wf%n_o, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X330, &
         wf%n_o)
!
      call mem%dealloc(X329)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X330, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X330)
      call mem%alloc(X331, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X331, 1)
!
      call mem%alloc(X332, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(X331, X332, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X331)
      call mem%alloc(X333, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X332, &
         wf%n_o**2, &
         tAxAx_oo, 1, &
         zero, &
         X333, 1)
!
      call mem%dealloc(X332)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X333, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X333)
      call mem%alloc(X334, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X334, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X335, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X334, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X335, 1)
!
      call mem%dealloc(X334)
      call mem%alloc(X336, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X335, 1, &
         zero, &
         X336, 1)
!
      call mem%dealloc(X335)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         rxI_v, 1, &
         X336, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X336)
      call mem%alloc(X337, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -one, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X337, 1)
!
      call mem%alloc(X338, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X337, X338, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X337)
      call mem%alloc(X339, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X338, &
         wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X339, &
         wf%n_o**2)
!
      call mem%dealloc(X338)
      call mem%alloc(X340, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X340, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X340, &
         wf%n_o**2, &
         X339, &
         wf%n_o**2, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X339)
      call mem%dealloc(X340)
      call mem%alloc(X341, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X341, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X342, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         tAxxx_ovo, &
         wf%n_o, &
         X341, &
         wf%n_v*wf%n_o, &
         zero, &
         X342, &
         wf%n_o)
!
      call mem%dealloc(X341)
      call mem%alloc(X343, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X342, &
         wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X343, 1)
!
      call mem%dealloc(X342)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X343, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X343)
      call mem%alloc(X344, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_321(uAxxx_ovo, X344, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X345, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         X344, 1, &
         zero, &
         X345, 1)
!
      call mem%dealloc(X344)
      call mem%alloc(X346, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X345, 1, &
         zero, &
         X346, 1)
!
      call mem%dealloc(X345)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         rxI_v, 1, &
         X346, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X346)
      call mem%alloc(X347, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X347, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X348, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X347, &
         wf%n_o, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X348, &
         wf%n_o)
!
      call mem%dealloc(X347)
      call mem%alloc(X349, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X348, &
         wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X349, 1)
!
      call mem%dealloc(X348)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X349, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X349)
      call mem%alloc(X350, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X350, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X351, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X350, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X351, 1)
!
      call mem%dealloc(X350)
      call mem%alloc(X352, wf%n_o)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_o, &
         one, &
         X351, &
         wf%n_v, &
         rxI_v, 1, &
         zero, &
         X352, 1)
!
      call mem%dealloc(X351)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X352, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X352)
      call mem%alloc(X353, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X353, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X354, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X354, wf%n_v, wf%n_o)
      call mem%alloc(X355, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X353, &
         wf%n_v*wf%n_o, &
         X354, 1, &
         zero, &
         X355, 1)
!
      call mem%dealloc(X353)
      call mem%dealloc(X354)
      call mem%alloc(X356, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X355, 1, &
         zero, &
         X356, 1)
!
      call mem%dealloc(X355)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         rxI_v, 1, &
         X356, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X356)
      call mem%alloc(X357, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X357, 1)
!
      call mem%alloc(X358, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X357, X358, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X357)
      call mem%alloc(X359, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X358, &
         wf%n_o**2, &
         zero, &
         X359, &
         wf%n_o)
!
      call mem%dealloc(X358)
      call mem%alloc(X360, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X359, X360, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X359)
      call mem%alloc(X361, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X361, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X361, &
         wf%n_o**2, &
         X360, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X360)
      call mem%dealloc(X361)
      call mem%alloc(X362, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X362, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X363, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X362, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X363, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X362)
      call mem%alloc(X364, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X363, &
         wf%n_v, &
         rxI_v, 1, &
         zero, &
         X364, 1)
!
      call mem%dealloc(X363)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X364, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X364)
      call mem%alloc(X365, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X365, wf%n_v, wf%n_o)
      call mem%alloc(X366, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X365, 1, &
         zero, &
         X366, 1)
!
      call mem%dealloc(X365)
      call mem%alloc(X367, wf%n_v, wf%n_o)
      call sort_to_21(X366, X367, wf%n_o, wf%n_v)
      call mem%dealloc(X366)
      call mem%alloc(X368, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X367, 1, &
         zero, &
         X368, 1)
!
      call mem%dealloc(X367)
!
      call dger(wf%n_v, &
         wf%n_o, &
         one, &
         rxI_v, 1, &
         X368, 1, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X368)
      call mem%alloc(X369, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X369, wf%n_v, wf%n_o)
      call mem%alloc(X370, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X369, 1, &
         zero, &
         X370, 1)
!
      call mem%dealloc(X369)
      call mem%alloc(X371, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v, &
         one, &
         X370, &
         wf%n_o, &
         rxI_v, 1, &
         zero, &
         X371, 1)
!
      call mem%dealloc(X370)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X371, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X371)
!
   end subroutine triples_into_singles_J_doublet_ccsd

