   subroutine mu_1_H_nu_2_doublet_ccsd(wf, rho_ai, g_ovoo, g_ovvv, r_vovo)
!!
!! Generated function
!!
      implicit none
!
      class(doublet_ccsd), intent(in) :: wf
!
      real(dp), dimension(wf%n_v,wf%n_o), intent(inout) :: rho_ai
!
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o,wf%n_o), intent(in) :: g_ovoo
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_v,wf%n_v), intent(in) :: g_ovvv
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(in) :: r_vovo
!
      real(dp), dimension(:,:), allocatable :: X1
      real(dp), dimension(:,:,:,:), allocatable :: X2, X3, X4, X5, X6, X7
!
      call mem%alloc(X1, wf%n_v, wf%n_o)
      call sort_to_21(wf%fock_ia, X1, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         r_vovo, &
         wf%n_v*wf%n_o, &
         X1, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X1)
      call mem%alloc(X2, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(r_vovo, X2, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X2, &
         wf%n_v*wf%n_o, &
         wf%fock_ia, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X2)
      call mem%alloc(X3, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_1243(g_ovvv, X3, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call mem%alloc(X4, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_2134(r_vovo, X4, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         two, &
         X3, &
         wf%n_v**2*wf%n_o, &
         X4, &
         wf%n_v**2*wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X3)
      call mem%dealloc(X4)
      call mem%alloc(X5, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_1243(g_ovvv, X5, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call mem%alloc(X6, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_4132(r_vovo, X6, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -one, &
         X5, &
         wf%n_v**2*wf%n_o, &
         X6, &
         wf%n_v**2*wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X5)
      call mem%dealloc(X6)
      call mem%alloc(X7, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_3214(g_ovoo, X7, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         -two, &
         r_vovo, &
         wf%n_v, &
         X7, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_ai, &
         wf%n_v)
!
      call mem%dealloc(X7)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         one, &
         r_vovo, &
         wf%n_v, &
         g_ovoo, &:q
         wf%n_v*wf%n_o**2, &
         one, &
         rho_ai, &
         wf%n_v)
!
!
   end subroutine mu_1_H_nu_2_doublet_ccsd

