   subroutine omega_μ2_4_ss_ccsd(wf, omega_bjck, gAxAx_vv, g_oooo, g_ovov, g_vvvv, gxIxI_oo, tAIAx_o, tAIxx_vo, tAxAx_oo, tAxxI_ov, tAxxx_ovo, t_vovo, txIxI_vv, txIxx_vvo, txxxI_vov, uAIxx_vo, uAxxx_ovo, uxIxx_vvo, uxxxI_vov)
!!
!! Generated function
!!
      implicit none
!
      class(ccsd), intent(in) :: wf
!
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o,wf%n_v), intent(inout) :: omega_bjck
!
      real(dp), dimension(wf%n_o), intent(in) :: tAIAx_o
      real(dp), dimension(wf%n_o,wf%n_o), intent(in) :: gxIxI_oo, tAxAx_oo
      real(dp), dimension(wf%n_o,wf%n_v), intent(in) :: tAxxI_ov
      real(dp), dimension(wf%n_v,wf%n_o), intent(in) :: tAIxx_vo, uAIxx_vo
      real(dp), dimension(wf%n_v,wf%n_v), intent(in) :: gAxAx_vv, txIxI_vv
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o), intent(in) :: tAxxx_ovo, uAxxx_ovo
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v), intent(in) :: txxxI_vov, uxxxI_vov
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_o), intent(in) :: txIxx_vvo, uxIxx_vvo
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_o,wf%n_o), intent(in) :: g_oooo
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o,wf%n_v), intent(in) :: g_ovov
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(in) :: t_vovo
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_v,wf%n_v), intent(in) :: g_vvvv
!
      real(dp), dimension(:,:), allocatable :: X112, X118, X138, X143, X148, X152, X156, X161
      real(dp), dimension(:,:,:), allocatable :: X24, X25, X26, X28, X29, X31, X32, X34, X35, X36, X37, X39, X41, X42, X44, X45, X46, X47, X49, X50, X52, X53, X54, X96, X98, X99, X101, X102, X103, X106, X107, X108, X109, X113, X114, X115, X119, X120, X123, X124, X125, X128, X129, X130, X133, X134, X135, X139, X140, X144, X145, X146, X149, X153, X157, X158, X162, X163, X164
      real(dp), dimension(:,:,:,:), allocatable :: X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11, X12, X13, X14, X15, X16, X17, X18, X19, X20, X21, X22, X23, X27, X30, X33, X38, X40, X43, X48, X51, X55, X56, X57, X58, X59, X60, X61, X62, X63, X64, X65, X66, X67, X68, X69, X70, X71, X72, X73, X74, X75, X76, X77, X78, X79, X80, X81, X82, X83, X84, X85, X86, X87, X88, X89, X90, X91, X92, X93, X94, X95, X97, X100, X104, X105, X110, X111, X116, X117, X121, X122, X126, X127, X131, X132, X136, X137, X141, X142, X147, X150, X151, X154, X155, X159, X160
!
      call mem%alloc(X1, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**3, &
         wf%n_v, &
         two, &
         tAxxI_ov, &
         wf%n_o, &
         g_vvvv, &
         wf%n_v**3, &
         zero, &
         X1, &
         wf%n_o)
!
      call mem%alloc(X2, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_1243(X1, X2, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call mem%dealloc(X1)
      call mem%alloc(X3, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X2, &
         wf%n_v**2*wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X3, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2)
      call add_1243_to_1234(one, X3, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X3)
      call mem%alloc(X4, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1324(g_oooo, X4, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X5, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_o, &
         two, &
         X4, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X5, &
         wf%n_o**3)
!
      call mem%dealloc(X4)
      call mem%alloc(X6, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X5, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X6, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X5)
      call add_1342_to_1234(one, X6, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X6)
      call mem%alloc(X7, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**3, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         g_vvvv, &
         wf%n_v**3, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X7, &
         wf%n_v**3)
!
      call mem%alloc(X8, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1342(X7, X8, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X7)
      call mem%alloc(X9, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X8, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X9, &
         wf%n_o)
!
      call mem%dealloc(X8)
      call add_1423_to_1234(one, X9, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X9)
      call mem%alloc(X10, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1243(g_oooo, X10, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X11, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_o, &
         -two, &
         X10, &
         wf%n_o**3, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X11, &
         wf%n_o**3)
!
      call mem%dealloc(X10)
      call mem%alloc(X12, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(X11, X12, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X11)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X12, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X12)
      call mem%alloc(X13, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**3, &
         wf%n_o, &
         wf%n_v, &
         two, &
         g_vvvv, &
         wf%n_v**3, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X13, &
         wf%n_v**3)
!
      call mem%alloc(X14, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1342(X13, X14, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X13)
      call mem%alloc(X15, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X14, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X15, &
         wf%n_o)
!
      call mem%dealloc(X14)
      call add_1423_to_1234(one, X15, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X15)
      call mem%alloc(X16, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1243(g_oooo, X16, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X17, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_o, &
         two, &
         X16, &
         wf%n_o**3, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X17, &
         wf%n_o**3)
!
      call mem%dealloc(X16)
      call mem%alloc(X18, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(X17, X18, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X17)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X18, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X18)
      call mem%alloc(X19, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**3, &
         wf%n_v, &
         two, &
         uAIxx_vo, &
         wf%n_v, &
         g_vvvv, &
         wf%n_v**3, &
         zero, &
         X19, &
         wf%n_o)
!
      call mem%alloc(X20, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_1243(X19, X20, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call mem%dealloc(X19)
      call mem%alloc(X21, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X20, &
         wf%n_v**2*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X21, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X20)
      call add_1423_to_1234(one, X21, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X21)
      call mem%alloc(X22, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_o, &
         two, &
         g_oooo, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X22, &
         wf%n_o**3)
!
      call mem%alloc(X23, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1432(X22, X23, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X22)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X23, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X23)
      call mem%alloc(X24, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X24, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X25, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         gAxAx_vv, &
         wf%n_v, &
         X24, &
         wf%n_v*wf%n_o, &
         zero, &
         X25, &
         wf%n_v)
!
      call mem%dealloc(X24)
      call mem%alloc(X26, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(txIxx_vvo, X26, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X27, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X26, &
         wf%n_v*wf%n_o, &
         X25, &
         wf%n_v, &
         zero, &
         X27, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X25)
      call mem%dealloc(X26)
      call add_1423_to_1234(one, X27, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X27)
      call mem%alloc(X28, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(txIxx_vvo, X28, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X29, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         gAxAx_vv, &
         wf%n_v, &
         X28, &
         wf%n_v*wf%n_o, &
         zero, &
         X29, &
         wf%n_v)
!
      call mem%dealloc(X28)
      call mem%alloc(X30, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X29, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X30, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X29)
      call add_1423_to_1234(one, X30, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X30)
      call mem%alloc(X31, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         gAxAx_vv, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X31, &
         wf%n_v)
!
      call mem%alloc(X32, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_213(txxxI_vov, X32, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X33, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X32, &
         wf%n_v*wf%n_o, &
         X31, &
         wf%n_v, &
         zero, &
         X33, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X31)
      call mem%dealloc(X32)
      call add_1423_to_1234(one, X33, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X33)
      call mem%alloc(X34, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         gAxAx_vv, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X34, &
         wf%n_v)
!
      call mem%alloc(X35, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X34, X35, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X34)
      call mem%alloc(X36, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_213(uxxxI_vov, X36, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X35, &
         wf%n_v, &
         X36, &
         wf%n_v*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X35)
      call mem%dealloc(X36)
      call mem%alloc(X37, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         two, &
         gxIxI_oo, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X37, &
         wf%n_o)
!
      call mem%alloc(X38, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X37, &
         wf%n_o, &
         zero, &
         X38, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X37)
      call add_1432_to_1234(one, X38, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X38)
      call mem%alloc(X39, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         two, &
         gxIxI_oo, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X39, &
         wf%n_o)
!
      call mem%alloc(X40, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X39, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X40, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X39)
      call add_1423_to_1234(one, X40, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X40)
      call mem%alloc(X41, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         -two, &
         gxIxI_oo, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X41, &
         wf%n_o)
!
      call mem%alloc(X42, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X42, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X43, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X42, &
         wf%n_o, &
         X41, &
         wf%n_o, &
         zero, &
         X43, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X41)
      call mem%dealloc(X42)
      call add_1423_to_1234(one, X43, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X43)
      call mem%alloc(X44, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X44, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X45, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         two, &
         gxIxI_oo, &
         wf%n_o, &
         X44, &
         wf%n_o, &
         zero, &
         X45, &
         wf%n_o)
!
      call mem%dealloc(X44)
      call mem%alloc(X46, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X46, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X45, &
         wf%n_o, &
         X46, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X45)
      call mem%dealloc(X46)
      call mem%alloc(X47, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -two, &
         g_ovov, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X47, 1)
!
      call mem%alloc(X48, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(t_vovo, X48, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X49, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X47, &
         wf%n_v*wf%n_o, &
         X48, &
         wf%n_v*wf%n_o, &
         zero, &
         X49, &
         wf%n_v)
!
      call mem%dealloc(X47)
      call mem%dealloc(X48)
      call mem%alloc(X50, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X50, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X51, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X49, &
         wf%n_v, &
         X50, &
         wf%n_v*wf%n_o, &
         zero, &
         X51, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X49)
      call mem%dealloc(X50)
      call add_1423_to_1234(one, X51, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X51)
      call mem%alloc(X52, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -two, &
         g_ovov, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X52, 1)
!
      call mem%alloc(X53, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X52, &
         wf%n_v*wf%n_o, &
         t_vovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X53, &
         wf%n_v)
!
      call mem%dealloc(X52)
      call mem%alloc(X54, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X53, X54, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X53)
      call mem%alloc(X55, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X54, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X55, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X54)
      call add_1423_to_1234(one, X55, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X55)
      call mem%alloc(X56, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
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
         X56, &
         wf%n_o)
!
      call mem%alloc(X57, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(X56, X57, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X56)
      call mem%alloc(X58, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**3, &
         wf%n_v, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X57, &
         wf%n_o**3, &
         zero, &
         X58, &
         wf%n_o)
!
      call mem%dealloc(X57)
      call mem%alloc(X59, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(t_vovo, X59, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X60, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o**2, &
         one, &
         X58, &
         wf%n_o**2, &
         X59, &
         wf%n_v**2, &
         zero, &
         X60, &
         wf%n_o**2)
!
      call mem%dealloc(X58)
      call mem%dealloc(X59)
      call add_1324_to_1234(one, X60, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X60)
      call mem%alloc(X61, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_ovov, X61, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X62, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(t_vovo, X62, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X63, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v**2, &
         two, &
         X61, &
         wf%n_o**2, &
         X62, &
         wf%n_v**2, &
         zero, &
         X63, &
         wf%n_o**2)
!
      call mem%dealloc(X61)
      call mem%dealloc(X62)
      call mem%alloc(X64, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X63, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X64, &
         wf%n_o**3)
!
      call mem%dealloc(X63)
      call mem%alloc(X65, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X64, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X65, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X64)
      call add_1342_to_1234(one, X65, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X65)
      call mem%alloc(X66, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X66, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X67, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1342(X66, X67, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X66)
      call mem%alloc(X68, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**3, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X67, &
         wf%n_o**3, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X68, &
         wf%n_o**3)
!
      call mem%dealloc(X67)
      call mem%alloc(X69, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(t_vovo, X69, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X70, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o**2, &
         one, &
         X68, &
         wf%n_o**2, &
         X69, &
         wf%n_v**2, &
         zero, &
         X70, &
         wf%n_o**2)
!
      call mem%dealloc(X68)
      call mem%dealloc(X69)
      call add_1324_to_1234(one, X70, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X70)
      call mem%alloc(X71, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X71, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X72, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(t_vovo, X72, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X73, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v**2, &
         -two, &
         X72, &
         wf%n_v**2, &
         X71, &
         wf%n_o**2, &
         zero, &
         X73, &
         wf%n_o**2)
!
      call mem%dealloc(X71)
      call mem%dealloc(X72)
      call mem%alloc(X74, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X73, &
         wf%n_o**3, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X74, &
         wf%n_o**3)
!
      call mem%dealloc(X73)
      call mem%alloc(X75, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(X74, X75, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X74)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X75, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X75)
      call mem%alloc(X76, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
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
         X76, &
         wf%n_o)
!
      call mem%alloc(X77, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(X76, X77, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X76)
      call mem%alloc(X78, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**3, &
         wf%n_v, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X77, &
         wf%n_o**3, &
         zero, &
         X78, &
         wf%n_o)
!
      call mem%dealloc(X77)
      call mem%alloc(X79, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(t_vovo, X79, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X80, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o**2, &
         one, &
         X78, &
         wf%n_o**2, &
         X79, &
         wf%n_v**2, &
         zero, &
         X80, &
         wf%n_o**2)
!
      call mem%dealloc(X78)
      call mem%dealloc(X79)
      call add_1324_to_1234(one, X80, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X80)
      call mem%alloc(X81, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X81, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X82, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(t_vovo, X82, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X83, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v**2, &
         two, &
         X81, &
         wf%n_o**2, &
         X82, &
         wf%n_v**2, &
         zero, &
         X83, &
         wf%n_o**2)
!
      call mem%dealloc(X81)
      call mem%dealloc(X82)
      call mem%alloc(X84, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X83, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X84, &
         wf%n_o**3)
!
      call mem%dealloc(X83)
      call mem%alloc(X85, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(X84, X85, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X84)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X85, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X85)
      call mem%alloc(X86, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         two, &
         uAIxx_vo, &
         wf%n_v, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X86, &
         wf%n_o)
!
      call mem%alloc(X87, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1243(X86, X87, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X86)
      call mem%alloc(X88, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**3, &
         wf%n_v, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X87, &
         wf%n_o**3, &
         zero, &
         X88, &
         wf%n_o)
!
      call mem%dealloc(X87)
      call mem%alloc(X89, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(t_vovo, X89, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X90, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o**2, &
         one, &
         X88, &
         wf%n_o**2, &
         X89, &
         wf%n_v**2, &
         zero, &
         X90, &
         wf%n_o**2)
!
      call mem%dealloc(X88)
      call mem%dealloc(X89)
      call add_1324_to_1234(one, X90, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X90)
      call mem%alloc(X91, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_ovov, X91, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X92, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(t_vovo, X92, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X93, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v**2, &
         two, &
         X91, &
         wf%n_o**2, &
         X92, &
         wf%n_v**2, &
         zero, &
         X93, &
         wf%n_o**2)
!
      call mem%dealloc(X91)
      call mem%dealloc(X92)
      call mem%alloc(X94, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X93, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X94, &
         wf%n_o**3)
!
      call mem%dealloc(X93)
      call mem%alloc(X95, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X94, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X95, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X94)
      call add_1342_to_1234(one, X95, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X95)
      call mem%alloc(X96, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -two, &
         g_ovov, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X96, 1)
!
      call mem%alloc(X97, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(wf%u_aibj, X97, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X98, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X96, &
         wf%n_v*wf%n_o, &
         X97, &
         wf%n_v*wf%n_o, &
         zero, &
         X98, &
         wf%n_v)
!
      call mem%dealloc(X96)
      call mem%dealloc(X97)
      call mem%alloc(X99, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(txIxx_vvo, X99, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X100, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X99, &
         wf%n_v*wf%n_o, &
         X98, &
         wf%n_v, &
         zero, &
         X100, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X98)
      call mem%dealloc(X99)
      call add_1423_to_1234(one, X100, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X100)
      call mem%alloc(X101, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -two, &
         g_ovov, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X101, 1)
!
      call mem%alloc(X102, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X101, &
         wf%n_v*wf%n_o, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X102, &
         wf%n_v)
!
      call mem%dealloc(X101)
      call mem%alloc(X103, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_213(txxxI_vov, X103, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X104, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X103, &
         wf%n_v*wf%n_o, &
         X102, &
         wf%n_v, &
         zero, &
         X104, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X102)
      call mem%dealloc(X103)
      call add_1423_to_1234(one, X104, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X104)
      call mem%alloc(X105, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X105, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X106, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         X105, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X106, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X105)
      call mem%alloc(X107, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         tAxAx_oo, &
         wf%n_o, &
         X106, &
         wf%n_o, &
         zero, &
         X107, &
         wf%n_o)
!
      call mem%dealloc(X106)
      call mem%alloc(X108, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_132(X107, X108, wf%n_o, wf%n_v, wf%n_v)
      call mem%dealloc(X107)
      call mem%alloc(X109, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X109, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X110, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
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
      call add_1423_to_1234(one, X110, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X110)
      call mem%alloc(X111, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X111, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X112, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v**2, &
         two, &
         X111, &
         wf%n_o**2, &
         tAxAx_oo, 1, &
         zero, &
         X112, 1)
!
      call mem%dealloc(X111)
      call mem%alloc(X113, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X113, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X114, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X112, &
         wf%n_v, &
         X113, &
         wf%n_v*wf%n_o, &
         zero, &
         X114, &
         wf%n_v)
!
      call mem%dealloc(X112)
      call mem%dealloc(X113)
      call mem%alloc(X115, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(txIxx_vvo, X115, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X116, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X115, &
         wf%n_v*wf%n_o, &
         X114, &
         wf%n_v, &
         zero, &
         X116, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X114)
      call mem%dealloc(X115)
      call add_1423_to_1234(one, X116, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X116)
      call mem%alloc(X117, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X117, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X118, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v**2, &
         two, &
         X117, &
         wf%n_o**2, &
         tAxAx_oo, 1, &
         zero, &
         X118, 1)
!
      call mem%dealloc(X117)
      call mem%alloc(X119, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(txIxx_vvo, X119, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X120, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X118, &
         wf%n_v, &
         X119, &
         wf%n_v*wf%n_o, &
         zero, &
         X120, &
         wf%n_v)
!
      call mem%dealloc(X118)
      call mem%dealloc(X119)
      call mem%alloc(X121, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X120, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X121, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X120)
      call add_1423_to_1234(one, X121, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X121)
      call mem%alloc(X122, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X122, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X123, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         X122, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v, &
         zero, &
         X123, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X122)
      call mem%alloc(X124, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X123, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X124, &
         wf%n_v**2)
!
      call mem%dealloc(X123)
      call mem%alloc(X125, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(txIxx_vvo, X125, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X126, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X125, &
         wf%n_v*wf%n_o, &
         X124, &
         wf%n_v, &
         zero, &
         X126, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X124)
      call mem%dealloc(X125)
      call add_1423_to_1234(one, X126, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X126)
      call mem%alloc(X127, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X127, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X128, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         X127, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X128, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X127)
      call mem%alloc(X129, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X128, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X129, &
         wf%n_v**2)
!
      call mem%dealloc(X128)
      call mem%alloc(X130, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_213(txxxI_vov, X130, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X131, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X130, &
         wf%n_v*wf%n_o, &
         X129, &
         wf%n_v, &
         zero, &
         X131, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X129)
      call mem%dealloc(X130)
      call add_1423_to_1234(one, X131, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X131)
      call mem%alloc(X132, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X132, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X133, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         txxxI_vov, &
         wf%n_v, &
         X132, &
         wf%n_v*wf%n_o, &
         zero, &
         X133, &
         wf%n_v)
!
      call mem%dealloc(X132)
      call mem%alloc(X134, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         tAxAx_oo, &
         wf%n_o, &
         X133, &
         wf%n_v**2, &
         zero, &
         X134, &
         wf%n_o)
!
      call mem%dealloc(X133)
      call mem%alloc(X135, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X135, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X136, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X134, &
         wf%n_v*wf%n_o, &
         X135, &
         wf%n_v*wf%n_o, &
         zero, &
         X136, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X134)
      call mem%dealloc(X135)
      call add_1423_to_1234(one, X136, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X136)
      call mem%alloc(X137, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X137, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X138, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v**2, &
         -two, &
         X137, &
         wf%n_o**2, &
         tAxAx_oo, 1, &
         zero, &
         X138, 1)
!
      call mem%dealloc(X137)
      call mem%alloc(X139, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X138, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X139, &
         wf%n_v)
!
      call mem%dealloc(X138)
      call mem%alloc(X140, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X139, X140, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X139)
      call mem%alloc(X141, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X140, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X141, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X140)
      call add_1423_to_1234(one, X141, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X141)
      call mem%alloc(X142, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X142, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X143, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v**2, &
         two, &
         X142, &
         wf%n_o**2, &
         tAxAx_oo, 1, &
         zero, &
         X143, 1)
!
      call mem%dealloc(X142)
      call mem%alloc(X144, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X143, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X144, &
         wf%n_v)
!
      call mem%dealloc(X143)
      call mem%alloc(X145, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X144, X145, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X144)
      call mem%alloc(X146, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_213(uxxxI_vov, X146, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X145, &
         wf%n_v, &
         X146, &
         wf%n_v*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X145)
      call mem%dealloc(X146)
      call mem%alloc(X147, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X147, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X148, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v**2, &
         two, &
         X147, &
         wf%n_o**2, &
         txIxI_vv, 1, &
         zero, &
         X148, 1)
!
      call mem%dealloc(X147)
      call mem%alloc(X149, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X148, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X149, &
         wf%n_o)
!
      call mem%dealloc(X148)
      call mem%alloc(X150, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X149, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X150, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X149)
      call add_1432_to_1234(one, X150, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X150)
      call mem%alloc(X151, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X151, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X152, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v**2, &
         two, &
         X151, &
         wf%n_o**2, &
         txIxI_vv, 1, &
         zero, &
         X152, 1)
!
      call mem%dealloc(X151)
      call mem%alloc(X153, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X152, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X153, &
         wf%n_o)
!
      call mem%dealloc(X152)
      call mem%alloc(X154, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X153, &
         wf%n_o, &
         zero, &
         X154, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X153)
      call add_1423_to_1234(one, X154, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X154)
      call mem%alloc(X155, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X155, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X156, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v**2, &
         -two, &
         X155, &
         wf%n_o**2, &
         txIxI_vv, 1, &
         zero, &
         X156, 1)
!
      call mem%dealloc(X155)
      call mem%alloc(X157, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X156, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X157, &
         wf%n_o)
!
      call mem%dealloc(X156)
      call mem%alloc(X158, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X158, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X159, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X158, &
         wf%n_o, &
         X157, &
         wf%n_o, &
         zero, &
         X159, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X157)
      call mem%dealloc(X158)
      call add_1423_to_1234(one, X159, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X159)
      call mem%alloc(X160, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X160, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X161, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v**2, &
         two, &
         X160, &
         wf%n_o**2, &
         txIxI_vv, 1, &
         zero, &
         X161, 1)
!
      call mem%dealloc(X160)
      call mem%alloc(X162, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X162, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X163, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X161, &
         wf%n_o, &
         X162, &
         wf%n_o, &
         zero, &
         X163, &
         wf%n_o)
!
      call mem%dealloc(X161)
      call mem%dealloc(X162)
      call mem%alloc(X164, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X164, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X164, &
         wf%n_o, &
         X163, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X163)
      call mem%dealloc(X164)
!
   end subroutine omega_μ2_4_ss_ccsd

