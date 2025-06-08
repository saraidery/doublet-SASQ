   subroutine mu_1_H_nu_1_doublet_ccsd(wf, rho_ai, g_oooo, g_oovv, g_ovvo, r_vo)
!!
!! Generated function
!!
      implicit none
!
      class(doublet_ccsd), intent(in) :: wf
!
      real(dp), dimension(wf%n_v,wf%n_o), intent(inout) :: rho_ai
!
      real(dp), dimension(wf%n_v,wf%n_o), intent(in) :: r_vo
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_o,wf%n_o), intent(in) :: g_oooo
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_v,wf%n_v), intent(in) :: g_oovv
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_v,wf%n_o), intent(in) :: g_ovvo
!
      real(dp) :: X1, X2, X3
      real(dp), dimension(:,:), allocatable :: X4, X6
      real(dp), dimension(:,:,:,:), allocatable :: X5
!
      integer :: i1, i2
!
      X1 = zero
!
      do i1 = 1, wf%n_o
         X1 = X1 + wf%fock_ij(i1,i1)
      end do
!
      call daxpy(wf%n_v*wf%n_o, two*X1, r_vo, 1, rho_ai, 1)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         -one, &
         r_vo, &
         wf%n_v, &
         wf%fock_ij, &
         wf%n_o, &
         one, &
         rho_ai, &
         wf%n_v)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         wf%fock_ab, &
         wf%n_v, &
         r_vo, &
         wf%n_v, &
         one, &
         rho_ai, &
         wf%n_v)
!
      X2 = zero
!
      do i2 = 1, wf%n_o
         do i1 = 1, wf%n_o
            X2 = X2 + g_oooo(i1,i1,i2,i2)
         end do
      end do
!
      call daxpy(wf%n_v*wf%n_o, -two*X2, r_vo, 1, rho_ai, 1)
      X3 = zero
!
      do i2 = 1, wf%n_o
         do i1 = 1, wf%n_o
            X3 = X3 + g_oooo(i1,i2,i2,i1)
         end do
      end do
!
      call daxpy(wf%n_v*wf%n_o, X3, r_vo, 1, rho_ai, 1)
      call mem%alloc(X4, wf%n_o, wf%n_v)
      call sort_to_21(r_vo, X4, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         g_ovvo, &
         wf%n_v*wf%n_o, &
         X4, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X4)
      call mem%alloc(X5, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1432(g_oovv, X5, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call mem%alloc(X6, wf%n_o, wf%n_v)
      call sort_to_21(r_vo, X6, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X5, &
         wf%n_v*wf%n_o, &
         X6, 1, &
         one, &
         rho_ai, 1)
!
      call mem%dealloc(X5)
      call mem%dealloc(X6)
!
   end subroutine mu_1_H_nu_1_doublet_ccsd

