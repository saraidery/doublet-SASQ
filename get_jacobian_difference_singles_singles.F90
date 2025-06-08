   subroutine get_jacobian_difference_singles_singles_doublet_ccsd(wf, diff_aibj, g_ooov, g_vvov, r_vo)
!!
!! Generated function
!!
      implicit none
!
      class(doublet_ccsd), intent(in) :: wf
!
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(inout) :: diff_aibj
!
      real(dp), dimension(wf%n_v,wf%n_o), intent(in) :: r_vo
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_o,wf%n_v), intent(in) :: g_ooov
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_o,wf%n_v), intent(in) :: g_vvov
!
      real(dp), dimension(:,:), allocatable :: X1, X2, X4, X6
      real(dp), dimension(:,:,:,:), allocatable :: X3, X5
!
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         wf%fock_ai, 1, &
         r_vo, 1, &
         diff_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X1, wf%n_v, wf%n_o)
      call sort_to_21(wf%fock_ia, X1, wf%n_o, wf%n_v)
      call mem%alloc(X2, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         X1, 1, &
         zero, &
         X2, 1)
!
      call mem%dealloc(X1)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2, 1, &
         diff_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2)
      call mem%alloc(X3, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(wf%u_aibj, X3, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X4, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         one, &
         g_vvov, &
         wf%n_v, &
         X3, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X4, &
         wf%n_v)
!
      call mem%dealloc(X3)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X4, 1, &
         r_vo, 1, &
         diff_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X4)
      call mem%alloc(X5, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1432(g_ooov, X5, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X6, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         -one, &
         wf%u_aibj, &
         wf%n_v, &
         X5, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X6, &
         wf%n_v)
!
      call mem%dealloc(X5)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X6, 1, &
         r_vo, 1, &
         diff_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X6)
!
   end subroutine get_jacobian_difference_singles_singles_doublet_ccsd

