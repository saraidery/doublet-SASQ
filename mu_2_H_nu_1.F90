   subroutine mu_2_H_nu_1_doublet_ccsd(wf, rho_aibj, L_oovo, L_ovoo, L_ovvv, L_vovv, L_vvvo, g_ovoo, g_ovvv, r_vo, u_aibj)
!!
!! Generated function
!!
      implicit none
!
      class(doublet_ccsd), intent(in) :: wf
!
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(inout) :: rho_aibj
!
      real(dp), dimension(wf%n_v,wf%n_o), intent(in) :: r_vo
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_v,wf%n_o), intent(in) :: L_oovo
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o,wf%n_o), intent(in) :: L_ovoo, g_ovoo
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_v,wf%n_v), intent(in) :: L_ovvv, g_ovvv
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(in) :: u_aibj
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_v), intent(in) :: L_vovv
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_v,wf%n_o), intent(in) :: L_vvvo
!
      real(dp), dimension(:,:), allocatable :: X7, X10, X11, X12, X13, X14, X15, X17, X19, X20, X22, X23, X24, X25, X28, X29, X34, X35, X40, X41, X55, X59, X73, X76, X86, X94, X107, X112
      real(dp), dimension(:,:,:,:), allocatable :: X1, X2, X3, X4, X5, X6, X8, X9, X16, X18, X21, X26, X27, X30, X31, X32, X33, X36, X37, X38, X39, X42, X43, X44, X45, X46, X47, X48, X49, X50, X51, X52, X53, X54, X56, X57, X58, X60, X61, X62, X63, X64, X65, X66, X67, X68, X69, X70, X71, X72, X74, X75, X77, X78, X79, X80, X81, X82, X83, X84, X85, X87, X88, X89, X90, X91, X92, X93, X95, X96, X97, X98, X99, X100, X101, X102, X103, X104, X105, X106, X108, X109, X110, X111, X113
!
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         four, &
         wf%fock_ai, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X1, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         wf%fock_ai, 1, &
         r_vo, 1, &
         X1, &
         wf%n_v*wf%n_o)
!
      call add_1432_to_1234(one, X1, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1)
      call mem%alloc(X2, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         r_vo, 1, &
         wf%fock_ai, 1, &
         X2, &
         wf%n_v*wf%n_o)
!
      call add_1432_to_1234(one, X2, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         four, &
         r_vo, 1, &
         wf%fock_ai, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         -two, &
         r_vo, &
         wf%n_v, &
         L_oovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%alloc(X3, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(L_oovo, X3, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X4, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         -two, &
         X3, &
         wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X4, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X3)
      call add_1423_to_1234(one, X4, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X4)
      call mem%alloc(X5, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1342(L_vvvo, X5, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X6, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         X5, &
         wf%n_v**2*wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X6, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X5)
      call add_1342_to_1234(one, X6, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X6)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         L_vovv, &
         wf%n_v**2*wf%n_o, &
         r_vo, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%alloc(X7, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X7, &
         wf%n_o)
!
      call mem%alloc(X8, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X8, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X9, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X8, &
         wf%n_v**2*wf%n_o, &
         X7, &
         wf%n_o, &
         zero, &
         X9, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X7)
      call mem%dealloc(X8)
      call add_1342_to_1234(one, X9, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X9)
      call mem%alloc(X10, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X10, &
         wf%n_o)
!
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v**2*wf%n_o, &
         X10, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X10)
      call mem%alloc(X11, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X11, &
         wf%n_v)
!
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X11, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X11)
      call mem%alloc(X12, wf%n_v, wf%n_o)
      call sort_to_21(wf%fock_ia, X12, wf%n_o, wf%n_v)
      call mem%alloc(X13, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         four, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X12, 1, &
         zero, &
         X13, 1)
!
      call mem%dealloc(X12)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X13, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X13)
      call mem%alloc(X14, wf%n_v, wf%n_o)
      call sort_to_21(wf%fock_ia, X14, wf%n_o, wf%n_v)
      call mem%alloc(X15, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X14, 1, &
         zero, &
         X15, 1)
!
      call mem%dealloc(X14)
      call mem%alloc(X16, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X15, 1, &
         X16, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X15)
      call add_1432_to_1234(one, X16, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X16)
      call mem%alloc(X17, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X17, &
         wf%n_v)
!
      call mem%alloc(X18, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X17, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         zero, &
         X18, &
         wf%n_v)
!
      call mem%dealloc(X17)
      call add_3412_to_1234(one, X18, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X18)
      call mem%alloc(X19, wf%n_v, wf%n_o)
      call sort_to_21(wf%fock_ia, X19, wf%n_o, wf%n_v)
      call mem%alloc(X20, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X19, 1, &
         zero, &
         X20, 1)
!
      call mem%dealloc(X19)
      call mem%alloc(X21, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X20, 1, &
         r_vo, 1, &
         X21, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X20)
      call add_1432_to_1234(one, X21, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X21)
      call mem%alloc(X22, wf%n_v, wf%n_o)
      call sort_to_21(wf%fock_ia, X22, wf%n_o, wf%n_v)
      call mem%alloc(X23, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         four, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X22, 1, &
         zero, &
         X23, 1)
!
      call mem%dealloc(X22)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X23, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X23)
      call mem%alloc(X24, wf%n_o, wf%n_v)
      call sort_to_21(r_vo, X24, wf%n_v, wf%n_o)
      call mem%alloc(X25, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v**2, &
         two, &
         L_ovvv, &
         wf%n_v*wf%n_o, &
         X24, 1, &
         zero, &
         X25, 1)
!
      call mem%dealloc(X24)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X25, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X25)
      call mem%alloc(X26, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         L_ovvv, &
         wf%n_v**2*wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X26, &
         wf%n_v**2*wf%n_o)
!
      call mem%alloc(X27, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1243(u_aibj, X27, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X26, &
         wf%n_v*wf%n_o, &
         X27, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X26)
      call mem%dealloc(X27)
      call mem%alloc(X28, wf%n_o, wf%n_v)
      call sort_to_21(r_vo, X28, wf%n_v, wf%n_o)
      call mem%alloc(X29, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v**2, &
         two, &
         L_ovvv, &
         wf%n_v*wf%n_o, &
         X28, 1, &
         zero, &
         X29, 1)
!
      call mem%dealloc(X28)
      call mem%alloc(X30, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1243(u_aibj, X30, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X31, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X30, &
         wf%n_v*wf%n_o**2, &
         X29, &
         wf%n_v, &
         zero, &
         X31, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X29)
      call mem%dealloc(X30)
      call add_1243_to_1234(one, X31, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X31)
      call mem%alloc(X32, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         L_ovvv, &
         wf%n_v**2*wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X32, &
         wf%n_v**2*wf%n_o)
!
      call mem%alloc(X33, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1243(u_aibj, X33, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X33, &
         wf%n_v*wf%n_o, &
         X32, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X32)
      call mem%dealloc(X33)
      call mem%alloc(X34, wf%n_o, wf%n_v)
      call sort_to_21(r_vo, X34, wf%n_v, wf%n_o)
      call mem%alloc(X35, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -two, &
         L_ovoo, &
         wf%n_v*wf%n_o, &
         X34, 1, &
         zero, &
         X35, 1)
!
      call mem%dealloc(X34)
      call mem%alloc(X36, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X36, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
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
      call add_1342_to_1234(one, X37, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X37)
      call mem%alloc(X38, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_2134(L_ovoo, X38, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X39, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X38, &
         wf%n_v*wf%n_o, &
         u_aibj, &
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
         r_vo, &
         wf%n_v, &
         X39, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X39)
      call mem%alloc(X40, wf%n_o, wf%n_v)
      call sort_to_21(r_vo, X40, wf%n_v, wf%n_o)
      call mem%alloc(X41, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -two, &
         L_ovoo, &
         wf%n_v*wf%n_o, &
         X40, 1, &
         zero, &
         X41, 1)
!
      call mem%dealloc(X40)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v**2*wf%n_o, &
         X41, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X41)
      call mem%alloc(X42, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_2143(L_ovoo, X42, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X43, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -two, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X42, &
         wf%n_v*wf%n_o, &
         zero, &
         X43, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X42)
      call mem%alloc(X44, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X43, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X44, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X43)
      call add_1243_to_1234(one, X44, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X44)
      call mem%alloc(X45, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_1432(g_ovvv, X45, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call mem%alloc(X46, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         X45, &
         wf%n_v**2*wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X46, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X45)
      call mem%alloc(X47, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(u_aibj, X47, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X48, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X46, &
         wf%n_v*wf%n_o, &
         X47, &
         wf%n_v*wf%n_o, &
         zero, &
         X48, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X46)
      call mem%dealloc(X47)
      call add_1432_to_1234(one, X48, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X48)
      call mem%alloc(X49, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovvv, X49, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call mem%alloc(X50, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X50, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X51, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v**2, &
         -two, &
         X49, &
         wf%n_v*wf%n_o, &
         X50, &
         wf%n_v**2, &
         zero, &
         X51, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X49)
      call mem%dealloc(X50)
      call mem%alloc(X52, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X51, &
         wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X52, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X51)
      call add_1423_to_1234(one, X52, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X52)
      call mem%alloc(X53, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_1243(g_ovvv, X53, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call mem%alloc(X54, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_2134(u_aibj, X54, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X55, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -two, &
         X53, &
         wf%n_v**2*wf%n_o, &
         X54, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X55, &
         wf%n_v)
!
      call mem%dealloc(X53)
      call mem%dealloc(X54)
      call mem%alloc(X56, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X55, 1, &
         r_vo, 1, &
         X56, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X55)
      call add_1432_to_1234(one, X56, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X56)
      call mem%alloc(X57, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_1243(g_ovvv, X57, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call mem%alloc(X58, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_2134(u_aibj, X58, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X59, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         four, &
         X57, &
         wf%n_v**2*wf%n_o, &
         X58, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X59, &
         wf%n_v)
!
      call mem%dealloc(X57)
      call mem%dealloc(X58)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X59, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X59)
      call mem%alloc(X60, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         g_ovvv, &
         wf%n_v**2*wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X60, &
         wf%n_v**2*wf%n_o)
!
      call mem%alloc(X61, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1243(u_aibj, X61, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X62, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X60, &
         wf%n_v*wf%n_o, &
         X61, &
         wf%n_v*wf%n_o, &
         zero, &
         X62, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X60)
      call mem%dealloc(X61)
      call add_1432_to_1234(one, X62, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X62)
      call mem%alloc(X63, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_1432(g_ovvv, X63, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call mem%alloc(X64, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         X63, &
         wf%n_v**2*wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X64, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X63)
      call mem%alloc(X65, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(u_aibj, X65, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X66, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X65, &
         wf%n_v*wf%n_o, &
         X64, &
         wf%n_v*wf%n_o, &
         zero, &
         X66, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X64)
      call mem%dealloc(X65)
      call add_1432_to_1234(one, X66, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X66)
      call mem%alloc(X67, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovvv, X67, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call mem%alloc(X68, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X68, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X69, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v**2, &
         -two, &
         X68, &
         wf%n_v**2, &
         X67, &
         wf%n_v*wf%n_o, &
         zero, &
         X69, &
         wf%n_o**2)
!
      call mem%dealloc(X67)
      call mem%dealloc(X68)
      call mem%alloc(X70, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(X69, X70, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X69)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X70, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X70)
      call mem%alloc(X71, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_1243(g_ovvv, X71, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call mem%alloc(X72, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_2134(u_aibj, X72, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X73, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         four, &
         X71, &
         wf%n_v**2*wf%n_o, &
         X72, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X73, &
         wf%n_v)
!
      call mem%dealloc(X71)
      call mem%dealloc(X72)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X73, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X73)
      call mem%alloc(X74, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_1243(g_ovvv, X74, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call mem%alloc(X75, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_2134(u_aibj, X75, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X76, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -two, &
         X74, &
         wf%n_v**2*wf%n_o, &
         X75, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X76, &
         wf%n_v)
!
      call mem%dealloc(X74)
      call mem%dealloc(X75)
      call mem%alloc(X77, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X76, 1, &
         X77, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X76)
      call add_1432_to_1234(one, X77, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X77)
      call mem%alloc(X78, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -two, &
         r_vo, &
         wf%n_v, &
         g_ovvv, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X78, &
         wf%n_o)
!
      call mem%alloc(X79, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1432(X78, X79, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call mem%dealloc(X78)
      call mem%alloc(X80, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X79, &
         wf%n_v*wf%n_o, &
         zero, &
         X80, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X79)
      call add_1423_to_1234(one, X80, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X80)
      call mem%alloc(X81, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1342(g_ovoo, X81, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X82, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**3, &
         wf%n_o, &
         wf%n_v, &
         two, &
         X81, &
         wf%n_o**3, &
         r_vo, &
         wf%n_v, &
         zero, &
         X82, &
         wf%n_o**3)
!
      call mem%dealloc(X81)
      call mem%alloc(X83, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X83, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X84, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o**2, &
         one, &
         X83, &
         wf%n_v**2, &
         X82, &
         wf%n_o**2, &
         zero, &
         X84, &
         wf%n_v**2)
!
      call mem%dealloc(X82)
      call mem%dealloc(X83)
      call add_1324_to_1234(one, X84, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X84)
      call mem%alloc(X85, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_3214(g_ovoo, X85, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X86, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         two, &
         X85, &
         wf%n_v*wf%n_o**2, &
         u_aibj, &
         wf%n_v, &
         zero, &
         X86, &
         wf%n_o)
!
      call mem%dealloc(X85)
      call mem%alloc(X87, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X86, 1, &
         X87, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X86)
      call add_1423_to_1234(one, X87, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X87)
      call mem%alloc(X88, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovoo, X88, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X89, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(u_aibj, X89, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X90, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         two, &
         X89, &
         wf%n_v*wf%n_o, &
         X88, &
         wf%n_o**2, &
         zero, &
         X90, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X88)
      call mem%dealloc(X89)
      call mem%alloc(X91, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1243(X90, X91, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X90)
      call mem%alloc(X92, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X91, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X92, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X91)
      call add_1423_to_1234(one, X92, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X92)
      call mem%alloc(X93, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_3214(g_ovoo, X93, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X94, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         -four, &
         u_aibj, &
         wf%n_v, &
         X93, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X94, &
         wf%n_v)
!
      call mem%dealloc(X93)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X94, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X94)
      call mem%alloc(X95, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_2143(g_ovoo, X95, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X96, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         two, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X95, &
         wf%n_v*wf%n_o, &
         zero, &
         X96, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X95)
      call mem%alloc(X97, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X96, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X97, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X96)
      call add_1423_to_1234(one, X97, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X97)
      call mem%alloc(X98, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1342(g_ovoo, X98, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X99, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**3, &
         wf%n_o, &
         wf%n_v, &
         two, &
         X98, &
         wf%n_o**3, &
         r_vo, &
         wf%n_v, &
         zero, &
         X99, &
         wf%n_o**3)
!
      call mem%dealloc(X98)
      call mem%alloc(X100, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X100, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X101, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o**2, &
         one, &
         X100, &
         wf%n_v**2, &
         X99, &
         wf%n_o**2, &
         zero, &
         X101, &
         wf%n_v**2)
!
      call mem%dealloc(X99)
      call mem%dealloc(X100)
      call add_1342_to_1234(one, X101, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X101)
      call mem%alloc(X102, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovoo, X102, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X103, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(u_aibj, X103, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X104, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         two, &
         X103, &
         wf%n_v*wf%n_o, &
         X102, &
         wf%n_o**2, &
         zero, &
         X104, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X102)
      call mem%dealloc(X103)
      call mem%alloc(X105, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1243(X104, X105, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X104)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X105, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X105)
      call mem%alloc(X106, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_3214(g_ovoo, X106, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X107, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         -four, &
         u_aibj, &
         wf%n_v, &
         X106, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X107, &
         wf%n_v)
!
      call mem%dealloc(X106)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X107, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X107)
      call mem%alloc(X108, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_2134(g_ovoo, X108, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X109, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X108, &
         wf%n_v*wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X109, &
         wf%n_o**2)
!
      call mem%dealloc(X108)
      call mem%alloc(X110, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(X109, X110, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X109)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X110, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X110)
      call mem%alloc(X111, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_3214(g_ovoo, X111, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X112, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         two, &
         u_aibj, &
         wf%n_v, &
         X111, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X112, &
         wf%n_v)
!
      call mem%dealloc(X111)
      call mem%alloc(X113, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X112, 1, &
         r_vo, 1, &
         X113, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X112)
      call add_1432_to_1234(one, X113, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X113)
!
   end subroutine mu_2_H_nu_1_doublet_ccsd

