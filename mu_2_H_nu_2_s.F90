   subroutine mu_2_H_nu_2_s_doublet_ccsd(wf, rho_aibj, L_ovov, L_ovvo, g_oovv, g_ovov, g_ovvo, r_vovo, u_aibj)
!!
!! Generated function
!!
      implicit none
!
      class(doublet_ccsd), intent(in) :: wf
!
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(inout) :: rho_aibj
!
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_v,wf%n_v), intent(in) :: g_oovv
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o,wf%n_v), intent(in) :: L_ovov, g_ovov
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_v,wf%n_o), intent(in) :: L_ovvo, g_ovvo
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(in) :: r_vovo, u_aibj
!
      real(dp), dimension(:,:), allocatable :: X24, X26, X33, X40, X47, X50
      real(dp), dimension(:,:,:,:), allocatable :: X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11, X12, X13, X14, X15, X16, X17, X18, X19, X20, X21, X22, X23, X25, X27, X28, X29, X30, X31, X32, X34, X35, X36, X37, X38, X39, X41, X42, X43, X44, X45, X46, X48, X49, X51, X52
!
      call mem%alloc(X1, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(r_vovo, X1, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         -four, &
         X1, &
         wf%n_v**2*wf%n_o, &
         wf%fock_ij, &
         wf%n_o, &
         zero, &
         X2, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1)
      call add_1342_to_1234(one, X2, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2)
      call mem%alloc(X3, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         two, &
         r_vovo, &
         wf%n_v**2*wf%n_o, &
         wf%fock_ij, &
         wf%n_o, &
         zero, &
         X3, &
         wf%n_v**2*wf%n_o)
!
      call add_1432_to_1234(one, X3, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X3)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         four, &
         wf%fock_ab, &
         wf%n_v, &
         r_vovo, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%alloc(X4, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -two, &
         wf%fock_ab, &
         wf%n_v, &
         r_vovo, &
         wf%n_v, &
         zero, &
         X4, &
         wf%n_v)
!
      call add_1432_to_1234(one, X4, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X4)
      call mem%alloc(X5, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1243(r_vovo, X5, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         four, &
         L_ovvo, &
         wf%n_v*wf%n_o, &
         X5, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X5)
      call mem%alloc(X6, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(r_vovo, X6, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         L_ovvo, &
         wf%n_v*wf%n_o, &
         X6, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X6)
      call mem%alloc(X7, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1243(r_vovo, X7, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X8, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -four, &
         g_ovvo, &
         wf%n_v*wf%n_o, &
         X7, &
         wf%n_v*wf%n_o, &
         zero, &
         X8, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X7)
      call add_1432_to_1234(one, X8, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X8)
      call mem%alloc(X9, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(r_vovo, X9, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X10, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         g_ovvo, &
         wf%n_v*wf%n_o, &
         X9, &
         wf%n_v*wf%n_o, &
         zero, &
         X10, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X9)
      call add_1432_to_1234(one, X10, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X10)
      call mem%alloc(X11, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_4123(g_oovv, X11, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call mem%alloc(X12, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         r_vovo, &
         wf%n_v*wf%n_o, &
         X11, &
         wf%n_v*wf%n_o, &
         zero, &
         X12, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X11)
      call add_1423_to_1234(one, X12, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X12)
      call mem%alloc(X13, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1423(g_oovv, X13, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call mem%alloc(X14, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(r_vovo, X14, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X15, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -four, &
         X14, &
         wf%n_v*wf%n_o, &
         X13, &
         wf%n_v*wf%n_o, &
         zero, &
         X15, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X13)
      call mem%dealloc(X14)
      call add_1423_to_1234(one, X15, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X15)
      call mem%alloc(X16, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1243(L_ovov, X16, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X17, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         four, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X16, &
         wf%n_v*wf%n_o, &
         zero, &
         X17, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X16)
      call mem%alloc(X18, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(X17, X18, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X17)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vovo, &
         wf%n_v*wf%n_o, &
         X18, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X18)
      call mem%alloc(X19, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1243(L_ovov, X19, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X20, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X19, &
         wf%n_v*wf%n_o, &
         zero, &
         X20, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X19)
      call mem%alloc(X21, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(X20, X21, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X20)
      call mem%alloc(X22, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vovo, &
         wf%n_v*wf%n_o, &
         X21, &
         wf%n_v*wf%n_o, &
         zero, &
         X22, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X21)
      call add_1432_to_1234(one, X22, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X22)
      call mem%alloc(X23, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(r_vovo, X23, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X24, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         -two, &
         L_ovov, &
         wf%n_v*wf%n_o**2, &
         X23, &
         wf%n_v, &
         zero, &
         X24, &
         wf%n_v)
!
      call mem%dealloc(X23)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X24, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X24)
      call mem%alloc(X25, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(L_ovov, X25, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X26, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -two, &
         X25, &
         wf%n_o, &
         r_vovo, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X26, &
         wf%n_o)
!
      call mem%dealloc(X25)
      call mem%alloc(X27, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X27, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X28, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X27, &
         wf%n_v**2*wf%n_o, &
         X26, &
         wf%n_o, &
         zero, &
         X28, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X26)
      call mem%dealloc(X27)
      call add_1342_to_1234(one, X28, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X28)
      call mem%alloc(X29, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(r_vovo, X29, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X30, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X29, &
         wf%n_v*wf%n_o, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X30, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X29)
      call mem%alloc(X31, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(X30, X31, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X30)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X31, &
         wf%n_v*wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X31)
      call mem%alloc(X32, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X32, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X33, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         two, &
         X32, &
         wf%n_v*wf%n_o**2, &
         u_aibj, &
         wf%n_v, &
         zero, &
         X33, &
         wf%n_v)
!
      call mem%dealloc(X32)
      call mem%alloc(X34, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X33, &
         wf%n_v, &
         r_vovo, &
         wf%n_v, &
         zero, &
         X34, &
         wf%n_v)
!
      call mem%dealloc(X33)
      call add_3214_to_1234(one, X34, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X34)
      call mem%alloc(X35, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1243(g_ovov, X35, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X36, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X35, &
         wf%n_v*wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X36, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X35)
      call mem%alloc(X37, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(r_vovo, X37, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X38, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X36, &
         wf%n_v*wf%n_o, &
         X37, &
         wf%n_v*wf%n_o, &
         zero, &
         X38, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X36)
      call mem%dealloc(X37)
      call add_1432_to_1234(one, X38, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X38)
      call mem%alloc(X39, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X39, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X40, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         -four, &
         X39, &
         wf%n_v*wf%n_o**2, &
         u_aibj, &
         wf%n_v, &
         zero, &
         X40, &
         wf%n_v)
!
      call mem%dealloc(X39)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X40, &
         wf%n_v, &
         r_vovo, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X40)
      call mem%alloc(X41, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X41, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X42, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(u_aibj, X42, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X43, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
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
      call mem%alloc(X44, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(r_vovo, X44, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X45, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X43, &
         wf%n_v*wf%n_o, &
         X44, &
         wf%n_v*wf%n_o, &
         zero, &
         X45, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X43)
      call mem%dealloc(X44)
      call add_1423_to_1234(one, X45, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X45)
      call mem%alloc(X46, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(u_aibj, X46, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X47, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         two, &
         g_ovov, &
         wf%n_o, &
         X46, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X47, &
         wf%n_o)
!
      call mem%dealloc(X46)
      call mem%alloc(X48, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(r_vovo, X48, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X48, &
         wf%n_v**2*wf%n_o, &
         X47, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X47)
      call mem%dealloc(X48)
      call mem%alloc(X49, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(u_aibj, X49, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X50, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -four, &
         g_ovov, &
         wf%n_o, &
         X49, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X50, &
         wf%n_o)
!
      call mem%dealloc(X49)
      call mem%alloc(X51, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(r_vovo, X51, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X52, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X51, &
         wf%n_v**2*wf%n_o, &
         X50, &
         wf%n_o, &
         zero, &
         X52, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X50)
      call mem%dealloc(X51)
      call add_1342_to_1234(one, X52, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X52)
!
   end subroutine mu_2_H_nu_2_s_doublet_ccsd

