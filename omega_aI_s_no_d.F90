   subroutine omega_AI_s_no_d_aug_eccsd(wf, omega, L_ovov, wf%s)
!!
!! Generated function
!!
      implicit none
!
      class(aug_eccsd), intent(in) :: wf
!
      real(dp), intent(inout) :: omega
!
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o,wf%n_v), intent(in) :: L_ovov
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(in) :: wf%s
!
      real(dp), dimension(:,:,:,:), allocatable :: X1
!
      real(dp), external :: ddot
!
      call mem%alloc(X1, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_2143(L_ovov, X1, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      omega = omega - ddot(wf%n_v**2*wf%n_o**2, X1, 1, wf%s, 1)
      call mem%dealloc(X1)
!
   end subroutine omega_AI_s_no_d_aug_eccsd

