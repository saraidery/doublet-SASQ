   module subroutine mu_2_H_nu_1_s_doublet_ccsd(wf, rho_aibj, L_ovoo, L_ovvv, g_oovo, g_ovoo, g_ovvv, g_vvvo, r_vo, &
      u_aibj)
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
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_v,wf%n_o), intent(in) :: g_oovo
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o,wf%n_o), intent(in) :: L_ovoo, g_ovoo
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_v,wf%n_v), intent(in) :: L_ovvv, g_ovvv
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(in) :: u_aibj
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_v,wf%n_o), intent(in) :: g_vvvo
!
      real(dp), dimension(:,:), allocatable :: X7, X10, X11, X12, X13, X14, X16, X17, X20, X21, X36, X40, X49, &
      X57
      real(dp), dimension(:,:,:,:), allocatable :: X1, X2, X3, X4, X5, X6, X8, X9, X15, X18, X19, X22, X23, &
      X24, X25, X26, X27, X28, X29, X30, X31, X32, X33, X34, X35, X37, X38, X39, X41, X42, X43, X44, X45, X46, X47, &
      X48, X50, X51, X52, X53, X54, X55, X56, X58, X59, X60
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
      call mem%alloc(X2, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(g_oovo, X2, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X3, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         two, &
         X2, &
         wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X3, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X2)
      call add_1243_to_1234(one, X3, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X3)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         -four, &
         r_vo, &
         wf%n_v, &
         g_oovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%alloc(X4, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1432(g_vvvo, X4, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         X4, &
         wf%n_v**2*wf%n_o, &
         r_vo, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X4)
      call mem%alloc(X5, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1342(g_vvvo, X5, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X6, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         four, &
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
      call mem%alloc(X10, wf%n_v, wf%n_v)
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
         X10, &
         wf%n_v)
!
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X10, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X10)
      call mem%alloc(X11, wf%n_v, wf%n_o)
      call sort_to_21(wf%fock_ia, X11, wf%n_o, wf%n_v)
      call mem%alloc(X12, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         four, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X11, 1, &
         zero, &
         X12, 1)
!
      call mem%dealloc(X11)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X12, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X12)
      call mem%alloc(X13, wf%n_v, wf%n_o)
      call sort_to_21(wf%fock_ia, X13, wf%n_o, wf%n_v)
      call mem%alloc(X14, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X13, 1, &
         zero, &
         X14, 1)
!
      call mem%dealloc(X13)
      call mem%alloc(X15, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X14, 1, &
         X15, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X14)
      call add_1432_to_1234(one, X15, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X15)
      call mem%alloc(X16, wf%n_o, wf%n_v)
      call sort_to_21(r_vo, X16, wf%n_v, wf%n_o)
      call mem%alloc(X17, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v**2, &
         two, &
         L_ovvv, &
         wf%n_v*wf%n_o, &
         X16, 1, &
         zero, &
         X17, 1)
!
      call mem%dealloc(X16)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X17, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X17)
      call mem%alloc(X18, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
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
         X18, &
         wf%n_v**2*wf%n_o)
!
      call mem%alloc(X19, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1243(u_aibj, X19, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X18, &
         wf%n_v*wf%n_o, &
         X19, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X18)
      call mem%dealloc(X19)
      call mem%alloc(X20, wf%n_o, wf%n_v)
      call sort_to_21(r_vo, X20, wf%n_v, wf%n_o)
      call mem%alloc(X21, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -two, &
         L_ovoo, &
         wf%n_v*wf%n_o, &
         X20, 1, &
         zero, &
         X21, 1)
!
      call mem%dealloc(X20)
      call mem%alloc(X22, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X22, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X23, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X22, &
         wf%n_v**2*wf%n_o, &
         X21, &
         wf%n_o, &
         zero, &
         X23, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X21)
      call mem%dealloc(X22)
      call add_1342_to_1234(one, X23, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X23)
      call mem%alloc(X24, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_2134(L_ovoo, X24, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X25, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X24, &
         wf%n_v*wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X25, &
         wf%n_o**2)
!
      call mem%dealloc(X24)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X25, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X25)
      call mem%alloc(X26, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_1432(g_ovvv, X26, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call mem%alloc(X27, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         X26, &
         wf%n_v**2*wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X27, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X26)
      call mem%alloc(X28, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(u_aibj, X28, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X29, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X27, &
         wf%n_v*wf%n_o, &
         X28, &
         wf%n_v*wf%n_o, &
         zero, &
         X29, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X27)
      call mem%dealloc(X28)
      call add_1432_to_1234(one, X29, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X29)
      call mem%alloc(X30, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovvv, X30, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call mem%alloc(X31, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X31, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X32, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v**2, &
         -two, &
         X30, &
         wf%n_v*wf%n_o, &
         X31, &
         wf%n_v**2, &
         zero, &
         X32, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X30)
      call mem%dealloc(X31)
      call mem%alloc(X33, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X32, &
         wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X33, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X32)
      call add_1423_to_1234(one, X33, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X33)
      call mem%alloc(X34, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_1243(g_ovvv, X34, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call mem%alloc(X35, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_2134(u_aibj, X35, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X36, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -two, &
         X34, &
         wf%n_v**2*wf%n_o, &
         X35, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X36, &
         wf%n_v)
!
      call mem%dealloc(X34)
      call mem%dealloc(X35)
      call mem%alloc(X37, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X36, 1, &
         r_vo, 1, &
         X37, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X36)
      call add_1432_to_1234(one, X37, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X37)
      call mem%alloc(X38, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_1243(g_ovvv, X38, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call mem%alloc(X39, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_2134(u_aibj, X39, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X40, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         four, &
         X38, &
         wf%n_v**2*wf%n_o, &
         X39, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X40, &
         wf%n_v)
!
      call mem%dealloc(X38)
      call mem%dealloc(X39)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X40, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X40)
      call mem%alloc(X41, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
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
         X41, &
         wf%n_v**2*wf%n_o)
!
      call mem%alloc(X42, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1243(u_aibj, X42, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X43, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X41, &
         wf%n_v*wf%n_o, &
         X42, &
         wf%n_v*wf%n_o, &
         zero, &
         X43, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X41)
      call mem%dealloc(X42)
      call add_1432_to_1234(one, X43, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X43)
      call mem%alloc(X44, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1342(g_ovoo, X44, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X45, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**3, &
         wf%n_o, &
         wf%n_v, &
         two, &
         X44, &
         wf%n_o**3, &
         r_vo, &
         wf%n_v, &
         zero, &
         X45, &
         wf%n_o**3)
!
      call mem%dealloc(X44)
      call mem%alloc(X46, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X46, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X47, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o**2, &
         one, &
         X46, &
         wf%n_v**2, &
         X45, &
         wf%n_o**2, &
         zero, &
         X47, &
         wf%n_v**2)
!
      call mem%dealloc(X45)
      call mem%dealloc(X46)
      call add_1324_to_1234(one, X47, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X47)
      call mem%alloc(X48, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_3214(g_ovoo, X48, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X49, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         two, &
         X48, &
         wf%n_v*wf%n_o**2, &
         u_aibj, &
         wf%n_v, &
         zero, &
         X49, &
         wf%n_o)
!
      call mem%dealloc(X48)
      call mem%alloc(X50, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X49, 1, &
         X50, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X49)
      call add_1423_to_1234(one, X50, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X50)
      call mem%alloc(X51, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovoo, X51, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X52, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(u_aibj, X52, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X53, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         two, &
         X52, &
         wf%n_v*wf%n_o, &
         X51, &
         wf%n_o**2, &
         zero, &
         X53, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X51)
      call mem%dealloc(X52)
      call mem%alloc(X54, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1243(X53, X54, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X53)
      call mem%alloc(X55, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X54, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X55, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X54)
      call add_1423_to_1234(one, X55, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X55)
      call mem%alloc(X56, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_3214(g_ovoo, X56, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X57, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         -four, &
         u_aibj, &
         wf%n_v, &
         X56, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X57, &
         wf%n_v)
!
      call mem%dealloc(X56)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X57, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X57)
      call mem%alloc(X58, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_2143(g_ovoo, X58, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X59, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         two, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X58, &
         wf%n_v*wf%n_o, &
         zero, &
         X59, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X58)
      call mem%alloc(X60, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X59, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X60, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X59)
      call add_1423_to_1234(one, X60, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X60)
!
   end subroutine mu_2_H_nu_1_s_doublet_ccsd

