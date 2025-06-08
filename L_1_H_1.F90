   subroutine L_1_H_1_doublet_ccsd(wf, sigma_ai, L_oooo, L_ovov, L_ovvo, g_ovov, l_vo, u_aibj)
!!
!! Generated function
!!
      implicit none
!
      class(doublet_ccsd), intent(in) :: wf
!
      real(dp), dimension(wf%n_v,wf%n_o), intent(inout) :: sigma_ai
!
      real(dp), dimension(wf%n_v,wf%n_o), intent(in) :: l_vo
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_o,wf%n_o), intent(in) :: L_oooo
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o,wf%n_v), intent(in) :: L_ovov, g_ovov
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_v,wf%n_o), intent(in) :: L_ovvo
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(in) :: u_aibj
!
      real(dp) :: X1, X3, X12
      real(dp), dimension(:,:), allocatable :: X2, X4, X5, X6, X8, X10
      real(dp), dimension(:,:,:,:), allocatable :: X7, X9, X11
!
      integer :: i1, i2
!
      real(dp), external :: ddot
!
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         -two, &
         l_vo, &
         wf%n_v, &
         wf%fock_ij, &
         wf%n_o, &
         one, &
         sigma_ai, &
         wf%n_v)
!
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         two, &
         wf%fock_ab, &
         wf%n_v, &
         l_vo, &
         wf%n_v, &
         one, &
         sigma_ai, &
         wf%n_v)
!
      X1 = zero
!
      do i1 = 1, wf%n_o
         X1 = X1 + wf%fock_ij(i1,i1)
      end do
!
      call daxpy(wf%n_v*wf%n_o, four*X1, l_vo, 1, sigma_ai, 1)
      call mem%alloc(X2, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         L_ovvo, &
         wf%n_v*wf%n_o, &
         l_vo, 1, &
         zero, &
         X2, 1)
!
      call add_21_to_12(one, X2, sigma_ai, wf%n_v, wf%n_o)
      call mem%dealloc(X2)
      X3 = zero
!
      do i2 = 1, wf%n_o
         do i1 = 1, wf%n_o
            X3 = X3 + L_oooo(i1,i1,i2,i2)
         end do
      end do
!
      call daxpy(wf%n_v*wf%n_o, -two*X3, l_vo, 1, sigma_ai, 1)
      call mem%alloc(X4, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         l_vo, 1, &
         zero, &
         X4, 1)
!
      call mem%alloc(X5, wf%n_o, wf%n_v)
      call sort_to_21(X4, X5, wf%n_v, wf%n_o)
      call mem%dealloc(X4)
      call mem%alloc(X6, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X5, 1, &
         zero, &
         X6, 1)
!
      call mem%dealloc(X5)
      call add_21_to_12(one, X6, sigma_ai, wf%n_v, wf%n_o)
      call mem%dealloc(X6)
      call mem%alloc(X7, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(u_aibj, X7, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X8, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -two, &
         g_ovov, &
         wf%n_o, &
         X7, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X8, &
         wf%n_o)
!
      call mem%dealloc(X7)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         l_vo, &
         wf%n_v, &
         X8, &
         wf%n_o, &
         one, &
         sigma_ai, &
         wf%n_v)
!
      call mem%dealloc(X8)
      call mem%alloc(X9, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X9, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X10, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         -two, &
         X9, &
         wf%n_v*wf%n_o**2, &
         u_aibj, &
         wf%n_v, &
         zero, &
         X10, &
         wf%n_v)
!
      call mem%dealloc(X9)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X10, &
         wf%n_v, &
         l_vo, &
         wf%n_v, &
         one, &
         sigma_ai, &
         wf%n_v)
!
      call mem%dealloc(X10)
      call mem%alloc(X11, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_2143(g_ovov, X11, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      X12 = two * ddot(wf%n_v**2*wf%n_o**2, X11, 1, u_aibj, 1)
      call mem%dealloc(X11)
      call daxpy(wf%n_v*wf%n_o, X12, l_vo, 1, sigma_ai, 1)
!
   end subroutine L_1_H_1_doublet_ccsd

