   subroutine omega_mu2_3_3_s_doublet_ccsd(wf, omega_aibj, LAIxx_oo, LAIxx_vv, LAxxx_vov, LAxxx_vvo, L_ooov, L_vooo, L_vvov, LxIxx_oov, LxxxI_voo, gAxxx_ooo, gAxxx_ovv, gAxxx_vov, gAxxx_vvo, g_ooov, g_vovv, g_vvov, gxIxx_oov, gxIxx_voo, gxIxx_vvv, gxxxI_voo, tAxxx_ovo, t_vovo, txIxx_vvo, txxxI_vov, uAIxx_vo, uAxxx_ovo, uxIxx_vvo, uxxxI_vov)
!!
!! Generated function
!!
      implicit none
!
      class(doublet_ccsd), intent(in) :: wf
!
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(inout) :: omega_aibj
!
      real(dp), dimension(wf%n_o,wf%n_o), intent(in) :: LAIxx_oo
      real(dp), dimension(wf%n_v,wf%n_o), intent(in) :: uAIxx_vo
      real(dp), dimension(wf%n_v,wf%n_v), intent(in) :: LAIxx_vv
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_o), intent(in) :: gAxxx_ooo
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_v), intent(in) :: LxIxx_oov, gxIxx_oov
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o), intent(in) :: tAxxx_ovo, uAxxx_ovo
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_v), intent(in) :: gAxxx_ovv
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_o), intent(in) :: LxxxI_voo, gxIxx_voo, gxxxI_voo
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v), intent(in) :: LAxxx_vov, gAxxx_vov, txxxI_vov, uxxxI_vov
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_o), intent(in) :: LAxxx_vvo, gAxxx_vvo, txIxx_vvo, uxIxx_vvo
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_v), intent(in) :: gxIxx_vvv
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_o,wf%n_v), intent(in) :: L_ooov, g_ooov
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_o,wf%n_o), intent(in) :: L_vooo
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(in) :: t_vovo
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_v), intent(in) :: g_vovv
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_o,wf%n_v), intent(in) :: L_vvov, g_vvov
!
      real(dp), dimension(:,:), allocatable :: X24, X27, X29, X30, X34, X35, X41, X43, X173, X175, X204, X208, X212
      real(dp), dimension(:,:,:), allocatable :: X6, X8, X11, X13, X16, X17, X19, X20, X22, X28, X40, X42, X46, X47, X49, X50, X52, X53, X54, X57, X58, X59, X62, X63, X66, X69, X70, X71, X74, X75, X78, X79, X82, X83, X84, X87, X88, X89, X92, X93, X96, X97, X98, X101, X128, X129, X130, X131, X133, X134, X135, X136, X139, X140, X143, X144, X145, X146, X147, X149, X150, X151, X153, X154, X155, X156, X157, X160, X161, X163, X164, X165, X167, X168, X171, X172, X174, X178, X179, X181, X183, X185, X186, X187, X188, X190, X191, X192, X193, X195, X197, X199, X203, X207, X211
      real(dp), dimension(:,:,:,:), allocatable :: X1, X2, X3, X4, X5, X7, X9, X10, X12, X14, X15, X18, X21, X23, X25, X26, X31, X32, X33, X36, X37, X38, X39, X44, X45, X48, X51, X55, X56, X60, X61, X64, X65, X67, X68, X72, X73, X76, X77, X80, X81, X85, X86, X90, X91, X94, X95, X99, X100, X102, X103, X104, X105, X106, X107, X108, X109, X110, X111, X112, X113, X114, X115, X116, X117, X118, X119, X120, X121, X122, X123, X124, X125, X126, X127, X132, X137, X138, X141, X142, X148, X152, X158, X159, X162, X166, X169, X170, X176, X177, X180, X182, X184, X189, X194, X196, X198, X200, X201, X202, X205, X206, X209, X210
!
      call mem%alloc(X1, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1243(L_vooo, X1, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X2, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         -one, &
         X1, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X2, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1)
      call add_1243_to_1234(one, X2, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         LAIxx_vv, &
         wf%n_v, &
         wf%u_aibj, &
         wf%n_v, &
         one, &
         omega_aibj, &
         wf%n_v)
!
      call mem%alloc(X3, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(wf%u_aibj, X3, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X4, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         -one, &
         X3, &
         wf%n_v**2*wf%n_o, &
         LAIxx_oo, &
         wf%n_o, &
         zero, &
         X4, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X3)
      call add_1342_to_1234(one, X4, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X4)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         LAxxx_vvo, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         omega_aibj, &
         wf%n_v*wf%n_o)
!
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         -one, &
         LxxxI_voo, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         omega_aibj, &
         wf%n_v*wf%n_o)
!
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         g_vovv, &
         wf%n_v**2*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         one, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%alloc(X5, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         g_vovv, &
         wf%n_v**2*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X5, &
         wf%n_v**2*wf%n_o)
!
      call add_1432_to_1234(one, X5, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X5)
      call mem%alloc(X6, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X6, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X7, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -one, &
         X6, &
         wf%n_v*wf%n_o, &
         gAxxx_ovv, &
         wf%n_v*wf%n_o, &
         zero, &
         X7, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X6)
      call add_1423_to_1234(one, X7, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X7)
      call mem%alloc(X8, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(gAxxx_ooo, X8, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X9, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         uxIxx_vvo, &
         wf%n_v**2, &
         X8, &
         wf%n_o**2, &
         zero, &
         X9, &
         wf%n_v**2)
!
      call mem%dealloc(X8)
      call add_1324_to_1234(one, X9, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X9)
      call mem%alloc(X10, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -one, &
         gAxxx_vvo, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X10, &
         wf%n_v*wf%n_o)
!
      call add_1432_to_1234(one, X10, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X10)
      call mem%alloc(X11, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X11, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X12, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_v, &
         -one, &
         gxIxx_vvv, &
         wf%n_v**2, &
         X11, &
         wf%n_o**2, &
         zero, &
         X12, &
         wf%n_v**2)
!
      call mem%dealloc(X11)
      call add_1324_to_1234(one, X12, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X12)
      call mem%alloc(X13, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(gxIxx_voo, X13, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X14, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X13, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X14, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X13)
      call add_1423_to_1234(one, X14, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X14)
      call mem%alloc(X15, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         gxxxI_voo, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X15, &
         wf%n_v*wf%n_o)
!
      call add_1432_to_1234(one, X15, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X15)
      call mem%alloc(X16, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X16, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X17, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         X16, &
         wf%n_v*wf%n_o, &
         zero, &
         X17, &
         wf%n_o)
!
      call mem%dealloc(X16)
      call mem%alloc(X18, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X17, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X18, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X17)
      call add_1423_to_1234(one, X18, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X18)
      call mem%alloc(X19, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X19, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X20, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         X19, &
         wf%n_o**2, &
         zero, &
         X20, &
         wf%n_o)
!
      call mem%dealloc(X19)
      call mem%alloc(X21, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         uxIxx_vvo, &
         wf%n_v**2, &
         X20, &
         wf%n_o, &
         zero, &
         X21, &
         wf%n_v**2)
!
      call mem%dealloc(X20)
      call add_1324_to_1234(one, X21, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X21)
      call mem%alloc(X22, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X22, &
         wf%n_o)
!
      call mem%alloc(X23, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X22, &
         wf%n_o, &
         zero, &
         X23, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X22)
      call add_1432_to_1234(one, X23, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X23)
      call mem%alloc(X24, wf%n_o, wf%n_o)
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
         X24, &
         wf%n_o)
!
      call mem%alloc(X25, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(wf%u_aibj, X25, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X26, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X25, &
         wf%n_v**2*wf%n_o, &
         X24, &
         wf%n_o, &
         zero, &
         X26, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X24)
      call mem%dealloc(X25)
      call add_1342_to_1234(one, X26, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X26)
      call mem%alloc(X27, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o, &
         -one, &
         wf%fock_ia, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X27, &
         wf%n_v)
!
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X27, &
         wf%n_v, &
         wf%u_aibj, &
         wf%n_v, &
         one, &
         omega_aibj, &
         wf%n_v)
!
      call mem%dealloc(X27)
      call mem%alloc(X28, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -one, &
         wf%fock_ia, &
         wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X28, &
         wf%n_o)
!
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X28, &
         wf%n_o, &
         one, &
         omega_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X28)
      call mem%alloc(X29, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X29, wf%n_v, wf%n_o)
      call mem%alloc(X30, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         one, &
         L_vvov, &
         wf%n_v**2, &
         X29, 1, &
         zero, &
         X30, 1)
!
      call mem%dealloc(X29)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X30, &
         wf%n_v, &
         wf%u_aibj, &
         wf%n_v, &
         one, &
         omega_aibj, &
         wf%n_v)
!
      call mem%dealloc(X30)
      call mem%alloc(X31, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(L_vvov, X31, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X32, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X31, &
         wf%n_v**2*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X32, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X31)
      call mem%alloc(X33, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(X32, X33, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X32)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X33, &
         wf%n_v*wf%n_o, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         one, &
         omega_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X33)
      call mem%alloc(X34, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X34, wf%n_v, wf%n_o)
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
      call mem%alloc(X36, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(wf%u_aibj, X36, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X37, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X36, &
         wf%n_v**2*wf%n_o, &
         X35, &
         wf%n_o, &
         zero, &
         X37, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X35)
      call mem%dealloc(X36)
      call add_1342_to_1234(one, X37, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X37)
      call mem%alloc(X38, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(L_ooov, X38, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X39, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X38, &
         wf%n_o**2, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X39, &
         wf%n_o**2)
!
      call mem%dealloc(X38)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X39, &
         wf%n_o, &
         one, &
         omega_aibj, &
         wf%n_v)
!
      call mem%dealloc(X39)
      call mem%alloc(X40, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(LAxxx_vov, X40, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X41, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         X40, &
         wf%n_v, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X41, &
         wf%n_v)
!
      call mem%dealloc(X40)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X41, &
         wf%n_v, &
         wf%u_aibj, &
         wf%n_v, &
         one, &
         omega_aibj, &
         wf%n_v)
!
      call mem%dealloc(X41)
      call mem%alloc(X42, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X42, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X43, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         LAxxx_vov, &
         wf%n_v*wf%n_o, &
         X42, &
         wf%n_v, &
         zero, &
         X43, &
         wf%n_v)
!
      call mem%dealloc(X42)
      call mem%alloc(X44, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1243(wf%u_aibj, X44, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X45, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X44, &
         wf%n_v*wf%n_o**2, &
         X43, &
         wf%n_v, &
         zero, &
         X45, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X43)
      call mem%dealloc(X44)
      call add_1243_to_1234(one, X45, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X45)
      call mem%alloc(X46, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(LxIxx_oov, X46, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X47, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X46, &
         wf%n_o, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X47, &
         wf%n_o)
!
      call mem%dealloc(X46)
      call mem%alloc(X48, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X47, &
         wf%n_o, &
         zero, &
         X48, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X47)
      call add_1432_to_1234(one, X48, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X48)
      call mem%alloc(X49, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(LxIxx_oov, X49, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X50, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X49, &
         wf%n_o, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X50, &
         wf%n_o)
!
      call mem%dealloc(X49)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X50, &
         wf%n_o, &
         one, &
         omega_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X50)
      call mem%alloc(X51, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X51, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X52, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X51, &
         wf%n_v**2, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X52, &
         wf%n_v**2)
!
      call mem%dealloc(X51)
      call mem%alloc(X53, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_132(X52, X53, wf%n_v, wf%n_v, wf%n_v)
      call mem%dealloc(X52)
      call mem%alloc(X54, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X54, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X55, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X53, &
         wf%n_v**2, &
         X54, &
         wf%n_o**2, &
         zero, &
         X55, &
         wf%n_v**2)
!
      call mem%dealloc(X53)
      call mem%dealloc(X54)
      call add_1342_to_1234(one, X55, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X55)
      call mem%alloc(X56, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X56, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X57, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X56, &
         wf%n_v**2, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X57, &
         wf%n_v**2)
!
      call mem%dealloc(X56)
      call mem%alloc(X58, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X57, X58, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X57)
      call mem%alloc(X59, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X59, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X60, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X58, &
         wf%n_v*wf%n_o, &
         X59, &
         wf%n_v*wf%n_o, &
         zero, &
         X60, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X58)
      call mem%dealloc(X59)
      call add_1432_to_1234(one, X60, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X60)
      call mem%alloc(X61, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X61, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X62, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X61, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X62, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X61)
      call mem%alloc(X63, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X62, X63, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X62)
      call mem%alloc(X64, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X63, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X64, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X63)
      call add_1423_to_1234(one, X64, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X64)
      call mem%alloc(X65, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X65, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X66, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -one, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X65, &
         wf%n_v*wf%n_o, &
         zero, &
         X66, &
         wf%n_o)
!
      call mem%dealloc(X65)
      call mem%alloc(X67, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X66, &
         wf%n_o**2, &
         zero, &
         X67, &
         wf%n_v**2)
!
      call mem%dealloc(X66)
      call add_1342_to_1234(one, X67, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X67)
      call mem%alloc(X68, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1324(g_ooov, X68, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X69, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X69, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X70, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -one, &
         X69, &
         wf%n_o**2, &
         X68, &
         wf%n_o**2, &
         zero, &
         X70, &
         wf%n_v)
!
      call mem%dealloc(X68)
      call mem%dealloc(X69)
      call mem%alloc(X71, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X71, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X72, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X71, &
         wf%n_v*wf%n_o, &
         X70, &
         wf%n_v*wf%n_o, &
         zero, &
         X72, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X70)
      call mem%dealloc(X71)
      call add_1432_to_1234(one, X72, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X72)
      call mem%alloc(X73, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_4123(g_ooov, X73, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X74, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -one, &
         txIxx_vvo, &
         wf%n_v, &
         X73, &
         wf%n_v*wf%n_o, &
         zero, &
         X74, &
         wf%n_v)
!
      call mem%dealloc(X73)
      call mem%alloc(X75, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(uAxxx_ovo, X75, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X76, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X75, &
         wf%n_v*wf%n_o, &
         X74, &
         wf%n_v*wf%n_o, &
         zero, &
         X76, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X74)
      call mem%dealloc(X75)
      call add_1432_to_1234(one, X76, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X76)
      call mem%alloc(X77, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X77, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X78, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X77, &
         wf%n_v**2, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X78, &
         wf%n_v**2)
!
      call mem%dealloc(X77)
      call mem%alloc(X79, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X78, X79, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X78)
      call mem%alloc(X80, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X79, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X80, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X79)
      call add_1432_to_1234(one, X80, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X80)
      call mem%alloc(X81, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X81, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X82, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X81, &
         wf%n_v**2, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X82, &
         wf%n_v**2)
!
      call mem%dealloc(X81)
      call mem%alloc(X83, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_132(X82, X83, wf%n_v, wf%n_v, wf%n_v)
      call mem%dealloc(X82)
      call mem%alloc(X84, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X84, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X85, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X83, &
         wf%n_v**2, &
         X84, &
         wf%n_o**2, &
         zero, &
         X85, &
         wf%n_v**2)
!
      call mem%dealloc(X83)
      call mem%dealloc(X84)
      call add_1324_to_1234(one, X85, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X85)
      call mem%alloc(X86, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X86, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X87, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X87, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X88, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X86, &
         wf%n_v*wf%n_o, &
         X87, &
         wf%n_v**2, &
         zero, &
         X88, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X86)
      call mem%dealloc(X87)
      call mem%alloc(X89, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X88, X89, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X88)
      call mem%alloc(X90, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X89, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X90, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X89)
      call add_1432_to_1234(one, X90, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X90)
      call mem%alloc(X91, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1324(g_ooov, X91, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X92, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(uAxxx_ovo, X92, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X93, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -one, &
         X92, &
         wf%n_o**2, &
         X91, &
         wf%n_o**2, &
         zero, &
         X93, &
         wf%n_v)
!
      call mem%dealloc(X91)
      call mem%dealloc(X92)
      call mem%alloc(X94, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         X93, &
         wf%n_v*wf%n_o, &
         zero, &
         X94, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X93)
      call add_1432_to_1234(one, X94, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X94)
      call mem%alloc(X95, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X95, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X96, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X96, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X97, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -one, &
         X96, &
         wf%n_o, &
         X95, &
         wf%n_v*wf%n_o, &
         zero, &
         X97, &
         wf%n_o)
!
      call mem%dealloc(X95)
      call mem%dealloc(X96)
      call mem%alloc(X98, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X98, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X99, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X98, &
         wf%n_v**2, &
         X97, &
         wf%n_o**2, &
         zero, &
         X99, &
         wf%n_v**2)
!
      call mem%dealloc(X97)
      call mem%dealloc(X98)
      call add_1342_to_1234(one, X99, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X99)
      call mem%alloc(X100, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X100, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X101, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -one, &
         txxxI_vov, &
         wf%n_v, &
         X100, &
         wf%n_v*wf%n_o, &
         zero, &
         X101, &
         wf%n_v)
!
      call mem%dealloc(X100)
      call mem%alloc(X102, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X101, &
         wf%n_v*wf%n_o, &
         zero, &
         X102, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X101)
      call add_1432_to_1234(one, X102, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X102)
      call mem%alloc(X103, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_vvov, X103, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X104, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         X103, &
         wf%n_v**2*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X104, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X103)
      call mem%alloc(X105, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(X104, X105, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X104)
      call mem%alloc(X106, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X105, &
         wf%n_v*wf%n_o, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X106, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X105)
      call add_1432_to_1234(one, X106, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X106)
      call mem%alloc(X107, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X107, &
         wf%n_v**2*wf%n_o)
!
      call mem%alloc(X108, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1432(X107, X108, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X107)
      call mem%alloc(X109, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(wf%u_aibj, X109, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X110, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X108, &
         wf%n_v*wf%n_o, &
         X109, &
         wf%n_v*wf%n_o, &
         zero, &
         X110, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X108)
      call mem%dealloc(X109)
      call add_1432_to_1234(one, X110, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X110)
      call mem%alloc(X111, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X111, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X112, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(wf%u_aibj, X112, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X113, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v**2, &
         -one, &
         X111, &
         wf%n_v*wf%n_o, &
         X112, &
         wf%n_v**2, &
         zero, &
         X113, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X111)
      call mem%dealloc(X112)
      call mem%alloc(X114, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X113, X114, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X113)
      call mem%alloc(X115, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X114, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X115, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X114)
      call add_1243_to_1234(one, X115, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X115)
      call mem%alloc(X116, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X116, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X117, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         one, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         X116, &
         wf%n_o**2, &
         zero, &
         X117, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X116)
      call mem%alloc(X118, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1243(X117, X118, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X117)
      call mem%alloc(X119, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X118, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X119, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X118)
      call add_1423_to_1234(one, X119, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X119)
      call mem%alloc(X120, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**3, &
         wf%n_o, &
         wf%n_v, &
         one, &
         g_ooov, &
         wf%n_o**3, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X120, &
         wf%n_o**3)
!
      call mem%alloc(X121, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1324(X120, X121, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X120)
      call mem%alloc(X122, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(wf%u_aibj, X122, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X123, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o**2, &
         one, &
         X122, &
         wf%n_v**2, &
         X121, &
         wf%n_o**2, &
         zero, &
         X123, &
         wf%n_v**2)
!
      call mem%dealloc(X121)
      call mem%dealloc(X122)
      call add_1324_to_1234(one, X123, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X123)
      call mem%alloc(X124, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X124, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X125, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(wf%u_aibj, X125, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X126, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         one, &
         X125, &
         wf%n_v*wf%n_o, &
         X124, &
         wf%n_v*wf%n_o, &
         zero, &
         X126, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X124)
      call mem%dealloc(X125)
      call mem%alloc(X127, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X126, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X127, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X126)
      call add_1423_to_1234(one, X127, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X127)
      call mem%alloc(X128, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X128, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X129, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         g_vvov, &
         wf%n_v**2, &
         X128, &
         wf%n_v, &
         zero, &
         X129, &
         wf%n_v**2)
!
      call mem%dealloc(X128)
      call mem%alloc(X130, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_132(X129, X130, wf%n_v, wf%n_v, wf%n_v)
      call mem%dealloc(X129)
      call mem%alloc(X131, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X131, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X132, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X130, &
         wf%n_v**2, &
         X131, &
         wf%n_o**2, &
         zero, &
         X132, &
         wf%n_v**2)
!
      call mem%dealloc(X130)
      call mem%dealloc(X131)
      call add_1342_to_1234(one, X132, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X132)
      call mem%alloc(X133, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X133, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X134, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         g_vvov, &
         wf%n_v**2, &
         X133, &
         wf%n_o, &
         zero, &
         X134, &
         wf%n_v**2)
!
      call mem%dealloc(X133)
      call mem%alloc(X135, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X134, X135, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X134)
      call mem%alloc(X136, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X136, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X137, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X135, &
         wf%n_v*wf%n_o, &
         X136, &
         wf%n_v*wf%n_o, &
         zero, &
         X137, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X135)
      call mem%dealloc(X136)
      call add_1432_to_1234(one, X137, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X137)
      call mem%alloc(X138, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X138, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X139, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X138, &
         wf%n_o**2, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X139, &
         wf%n_o**2)
!
      call mem%dealloc(X138)
      call mem%alloc(X140, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(uAxxx_ovo, X140, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X141, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X140, &
         wf%n_v*wf%n_o, &
         X139, &
         wf%n_o, &
         zero, &
         X141, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X139)
      call mem%dealloc(X140)
      call add_1423_to_1234(one, X141, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X141)
      call mem%alloc(X142, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X142, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X143, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         one, &
         uxIxx_vvo, &
         wf%n_v, &
         X142, &
         wf%n_o**2, &
         zero, &
         X143, &
         wf%n_v)
!
      call mem%dealloc(X142)
      call mem%alloc(X144, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X143, X144, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X143)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X144, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         omega_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X144)
      call mem%alloc(X145, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X145, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X146, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         g_vvov, &
         wf%n_v**2, &
         X145, &
         wf%n_o, &
         zero, &
         X146, &
         wf%n_v**2)
!
      call mem%dealloc(X145)
      call mem%alloc(X147, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X146, X147, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X146)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X147, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         omega_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X147)
      call mem%alloc(X148, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X148, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X149, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X149, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X150, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         -one, &
         X148, &
         wf%n_v*wf%n_o, &
         X149, &
         wf%n_v**2, &
         zero, &
         X150, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X148)
      call mem%dealloc(X149)
      call mem%alloc(X151, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X150, X151, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X150)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X151, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         omega_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X151)
      call mem%alloc(X152, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X152, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X153, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X152, &
         wf%n_v**2, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X153, &
         wf%n_v**2)
!
      call mem%dealloc(X152)
      call mem%alloc(X154, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X153, X154, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X153)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X154, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         omega_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X154)
      call mem%alloc(X155, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X155, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X156, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         g_ooov, &
         wf%n_o**2, &
         X155, &
         wf%n_o, &
         zero, &
         X156, &
         wf%n_o**2)
!
      call mem%dealloc(X155)
      call mem%alloc(X157, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X157, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X158, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X157, &
         wf%n_v**2, &
         X156, &
         wf%n_o, &
         zero, &
         X158, &
         wf%n_v**2)
!
      call mem%dealloc(X156)
      call mem%dealloc(X157)
      call add_1324_to_1234(one, X158, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X158)
      call mem%alloc(X159, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1324(g_ooov, X159, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X160, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(uAxxx_ovo, X160, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X161, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         one, &
         X160, &
         wf%n_o**2, &
         X159, &
         wf%n_o**2, &
         zero, &
         X161, &
         wf%n_v)
!
      call mem%dealloc(X159)
      call mem%dealloc(X160)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X161, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         omega_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X161)
      call mem%alloc(X162, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X162, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X163, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         one, &
         uxxxI_vov, &
         wf%n_v, &
         X162, &
         wf%n_v*wf%n_o, &
         zero, &
         X163, &
         wf%n_v)
!
      call mem%dealloc(X162)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X163, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         omega_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X163)
      call mem%alloc(X164, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         t_vovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X164, &
         wf%n_v)
!
      call mem%alloc(X165, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X165, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X166, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X165, &
         wf%n_v*wf%n_o, &
         X164, &
         wf%n_v, &
         zero, &
         X166, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X164)
      call mem%dealloc(X165)
      call add_1432_to_1234(one, X166, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X166)
      call mem%alloc(X167, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -four, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         t_vovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X167, &
         wf%n_v)
!
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X167, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         omega_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X167)
      call mem%alloc(X168, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         t_vovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X168, &
         wf%n_v)
!
      call mem%alloc(X169, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X168, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X169, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X168)
      call add_1432_to_1234(one, X169, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X169)
      call mem%alloc(X170, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(t_vovo, X170, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X171, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X170, &
         wf%n_v*wf%n_o, &
         zero, &
         X171, &
         wf%n_v)
!
      call mem%dealloc(X170)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         X171, &
         wf%n_v, &
         one, &
         omega_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X171)
      call mem%alloc(X172, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X172, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X173, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         -two, &
         X172, &
         wf%n_v**2, &
         uxIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X173, &
         wf%n_o)
!
      call mem%dealloc(X172)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         t_vovo, &
         wf%n_v**2*wf%n_o, &
         X173, &
         wf%n_o, &
         one, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X173)
      call mem%alloc(X174, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X174, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X175, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X174, &
         wf%n_v**2, &
         uxIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X175, &
         wf%n_o)
!
      call mem%dealloc(X174)
      call mem%alloc(X176, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         t_vovo, &
         wf%n_v**2*wf%n_o, &
         X175, &
         wf%n_o, &
         zero, &
         X176, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X175)
      call add_1432_to_1234(one, X176, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X176)
      call mem%alloc(X177, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(t_vovo, X177, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X178, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X177, &
         wf%n_v*wf%n_o, &
         zero, &
         X178, &
         wf%n_v)
!
      call mem%dealloc(X177)
      call mem%alloc(X179, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X179, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X180, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X179, &
         wf%n_v*wf%n_o, &
         X178, &
         wf%n_v, &
         zero, &
         X180, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X178)
      call mem%dealloc(X179)
      call add_1432_to_1234(one, X180, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X180)
      call mem%alloc(X181, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X181, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X182, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(wf%u_aibj, X182, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X183, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v**2, &
         one, &
         X181, &
         wf%n_v**2, &
         X182, &
         wf%n_v**2, &
         zero, &
         X183, &
         wf%n_o)
!
      call mem%dealloc(X181)
      call mem%dealloc(X182)
      call mem%alloc(X184, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X183, &
         wf%n_o, &
         zero, &
         X184, &
         wf%n_v**2)
!
      call mem%dealloc(X183)
      call add_1324_to_1234(one, X184, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X184)
      call mem%alloc(X185, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X185, &
         wf%n_v)
!
      call mem%alloc(X186, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X186, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X186, &
         wf%n_v*wf%n_o, &
         X185, &
         wf%n_v, &
         one, &
         omega_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X185)
      call mem%dealloc(X186)
      call mem%alloc(X187, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X187, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X188, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X187, &
         wf%n_v, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X188, &
         wf%n_v)
!
      call mem%dealloc(X187)
      call mem%alloc(X189, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X188, &
         wf%n_v, &
         zero, &
         X189, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X188)
      call add_1432_to_1234(one, X189, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X189)
      call mem%alloc(X190, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X190, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X191, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X190, &
         wf%n_v, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X191, &
         wf%n_v)
!
      call mem%dealloc(X190)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X191, &
         wf%n_v, &
         one, &
         omega_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X191)
      call mem%alloc(X192, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X192, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X193, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X192, &
         wf%n_o, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X193, &
         wf%n_o)
!
      call mem%dealloc(X192)
      call mem%alloc(X194, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X193, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X194, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X193)
      call add_1423_to_1234(one, X194, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X194)
      call mem%alloc(X195, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X195, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X196, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(wf%u_aibj, X196, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X197, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X195, &
         wf%n_v*wf%n_o, &
         X196, &
         wf%n_v*wf%n_o, &
         zero, &
         X197, &
         wf%n_o)
!
      call mem%dealloc(X195)
      call mem%dealloc(X196)
      call mem%alloc(X198, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X197, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X198, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X197)
      call add_1423_to_1234(one, X198, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X198)
      call mem%alloc(X199, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X199, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X200, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v, &
         -one, &
         gxIxx_oov, &
         wf%n_o**2, &
         X199, &
         wf%n_o**2, &
         zero, &
         X200, &
         wf%n_o**2)
!
      call mem%dealloc(X199)
      call mem%alloc(X201, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(wf%u_aibj, X201, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X202, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o**2, &
         one, &
         X201, &
         wf%n_v**2, &
         X200, &
         wf%n_o**2, &
         zero, &
         X202, &
         wf%n_v**2)
!
      call mem%dealloc(X200)
      call mem%dealloc(X201)
      call add_1324_to_1234(one, X202, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X202)
      call mem%alloc(X203, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X203, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X204, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X203, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X204, &
         wf%n_o)
!
      call mem%dealloc(X203)
      call mem%alloc(X205, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(wf%u_aibj, X205, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X206, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X205, &
         wf%n_v**2*wf%n_o, &
         X204, &
         wf%n_o, &
         zero, &
         X206, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X204)
      call mem%dealloc(X205)
      call add_1342_to_1234(one, X206, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X206)
      call mem%alloc(X207, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X207, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X208, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X207, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X208, &
         wf%n_o)
!
      call mem%dealloc(X207)
      call mem%alloc(X209, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(wf%u_aibj, X209, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X210, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X209, &
         wf%n_v**2*wf%n_o, &
         X208, &
         wf%n_o, &
         zero, &
         X210, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X208)
      call mem%dealloc(X209)
      call add_1342_to_1234(one, X210, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X210)
      call mem%alloc(X211, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X211, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X212, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         gxIxx_oov, &
         wf%n_o**2, &
         X211, &
         wf%n_o**2, &
         zero, &
         X212, &
         wf%n_v)
!
      call mem%dealloc(X211)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X212, &
         wf%n_v, &
         wf%u_aibj, &
         wf%n_v, &
         one, &
         omega_aibj, &
         wf%n_v)
!
      call mem%dealloc(X212)
!
   end subroutine omega_mu2_3_3_s_doublet_ccsd

