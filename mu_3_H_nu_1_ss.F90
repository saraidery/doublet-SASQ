   subroutine mu_4_H_nu_1_ss_doublet_ccsd(wf, rho_aibj, L_ovov, L_vovo, g_oooo, g_ovov, g_vvvv, rAI, t_aibj, u_aibj)
!!
!! Generated function
!!
      implicit none
!
      class(doublet_ccsd), intent(in) :: wf
!
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(inout) :: rho_aibj
!
      real(dp), intent(in) :: rAI
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_o,wf%n_o), intent(in) :: g_oooo
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o,wf%n_v), intent(in) :: L_ovov, g_ovov
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(in) :: L_vovo, t_aibj, u_aibj
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_v,wf%n_v), intent(in) :: g_vvvv
!
      real(dp), dimension(:,:,:,:), allocatable :: X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11, X12, X13, X14, X15, X16, X17, X18, X19, X20, X21, X22, X23, X24, X25, X26
!
      call daxpy(wf%n_v**2*wf%n_o**2, two*rAI, L_vovo, 1, rho_aibj, 1)
      call mem%alloc(X1, wf%n_v, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvvv, X1, wf%n_v, wf%n_v, wf%n_v, wf%n_v)
      call mem%alloc(X2, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X2, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X3, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_v**2, &
         two*rAI, &
         X1, &
         wf%n_v**2, &
         X2, &
         wf%n_v**2, &
         zero, &
         X3, &
         wf%n_v**2)
!
      call mem%dealloc(X1)
      call mem%dealloc(X2)
      call add_1324_to_1234(rAI, X3, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X3)
      call mem%alloc(X4, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1324(g_oooo, X4, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X5, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X5, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X6, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o**2, &
         two*rAI, &
         X5, &
         wf%n_v**2, &
         X4, &
         wf%n_o**2, &
         zero, &
         X6, &
         wf%n_v**2)
!
      call mem%dealloc(X4)
      call mem%dealloc(X5)
      call add_1324_to_1234(rAI, X6, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X6)
      call mem%alloc(X7, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1243(t_aibj, X7, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X8, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         eight, &
         X7, &
         wf%n_v*wf%n_o, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X8, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X7)
      call mem%alloc(X9, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(X8, X9, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X8)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         rAI, &
         X9, &
         wf%n_v*wf%n_o, &
         t_aibj, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X9)
      call mem%alloc(X10, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1243(L_ovov, X10, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X11, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -four, &
         t_aibj, &
         wf%n_v*wf%n_o, &
         X10, &
         wf%n_v*wf%n_o, &
         zero, &
         X11, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X10)
      call mem%alloc(X12, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(X11, X12, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X11)
      call mem%alloc(X13, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         rAI, &
         t_aibj, &
         wf%n_v*wf%n_o, &
         X12, &
         wf%n_v*wf%n_o, &
         zero, &
         X13, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X12)
      call add_1432_to_1234(rAI, X13, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X13)
      call mem%alloc(X14, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(t_aibj, X14, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X15, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X14, &
         wf%n_v*wf%n_o, &
         zero, &
         X15, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X14)
      call mem%alloc(X16, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(t_aibj, X16, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         rAI, &
         X16, &
         wf%n_v*wf%n_o, &
         X15, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X15)
      call mem%dealloc(X16)
      call mem%alloc(X17, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(L_ovov, X17, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X18, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(t_aibj, X18, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X19, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X17, &
         wf%n_v*wf%n_o, &
         X18, &
         wf%n_v*wf%n_o, &
         zero, &
         X19, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X17)
      call mem%dealloc(X18)
      call mem%alloc(X20, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(t_aibj, X20, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X21, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         rAI, &
         X19, &
         wf%n_v*wf%n_o, &
         X20, &
         wf%n_v*wf%n_o, &
         zero, &
         X21, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X19)
      call mem%dealloc(X20)
      call add_1432_to_1234(rAI, X21, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X21)
      call mem%alloc(X22, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X22, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X23, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(t_aibj, X23, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X24, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v**2, &
         two, &
         X22, &
         wf%n_o**2, &
         X23, &
         wf%n_v**2, &
         zero, &
         X24, &
         wf%n_o**2)
!
      call mem%dealloc(X22)
      call mem%dealloc(X23)
      call mem%alloc(X25, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X25, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X26, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o**2, &
         rAI, &
         X25, &
         wf%n_v**2, &
         X24, &
         wf%n_o**2, &
         zero, &
         X26, &
         wf%n_v**2)
!
      call mem%dealloc(X24)
      call mem%dealloc(X25)
      call add_1324_to_1234(rAI, X26, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X26)
!
   end subroutine mu_4_H_nu_1_ss_doublet_ccsd

