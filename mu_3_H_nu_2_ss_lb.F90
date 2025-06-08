   subroutine mu_4_H_nu_2_ss_doublet_ccsd(wf, rho_aibj, FAI, gAxxx_vov, gxIxx_oov, r_vovo, uAIxx_vo, &
uAxxx_ovo, uxIxx_vvo)
!!
!! Generated function
!!
      implicit none
!
      class(doublet_ccsd), intent(in) :: wf
!
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(inout) :: rho_aibj
!
      real(dp), intent(in) :: FAI
      real(dp), dimension(wf%n_v,wf%n_o), intent(in) :: uAIxx_vo
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_v), intent(in) :: gxIxx_oov
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o), intent(in) :: uAxxx_ovo
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v), intent(in) :: gAxxx_vov
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_o), intent(in) :: uxIxx_vvo
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(in) :: r_vovo
!
      real(dp) :: X2, X4, X6, X8, X10, X12
      real(dp), dimension(:,:), allocatable :: X1, X3
      real(dp), dimension(:,:,:), allocatable :: X5, X7, X9, X11
!
      real(dp), external :: ddot
!
      call daxpy(wf%n_v**2*wf%n_o**2, four*FAI, r_vovo, 1, rho_aibj, 1)
      call add_1432_to_1234(-two*FAI, r_vovo, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1, wf%n_v, wf%n_o)
      call sort_to_21(wf%fock_ia, X1, wf%n_o, wf%n_v)
      X2 = four * ddot(wf%n_v*wf%n_o, X1, 1, uAIxx_vo, 1)
      call mem%dealloc(X1)
      call daxpy(wf%n_v**2*wf%n_o**2, X2, r_vovo, 1, rho_aibj, 1)
      call mem%alloc(X3, wf%n_v, wf%n_o)
      call sort_to_21(wf%fock_ia, X3, wf%n_o, wf%n_v)
      X4 = -two * ddot(wf%n_v*wf%n_o, X3, 1, uAIxx_vo, 1)
      call mem%dealloc(X3)
      call add_1432_to_1234(X4, r_vovo, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X5, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X5, wf%n_v, wf%n_o, wf%n_v)
      X6 = four * ddot(wf%n_v**2*wf%n_o, X5, 1, uxIxx_vvo, 1)
      call mem%dealloc(X5)
      call daxpy(wf%n_v**2*wf%n_o**2, X6, r_vovo, 1, rho_aibj, 1)
      call mem%alloc(X7, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X7, wf%n_v, wf%n_o, wf%n_v)
      X8 = -two * ddot(wf%n_v**2*wf%n_o, X7, 1, uxIxx_vvo, 1)
      call mem%dealloc(X7)
      call add_1432_to_1234(X8, r_vovo, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X9, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X9, wf%n_o, wf%n_o, wf%n_v)
      X10 = -four * ddot(wf%n_v*wf%n_o**2, X9, 1, uAxxx_ovo, 1)
      call mem%dealloc(X9)
      call daxpy(wf%n_v**2*wf%n_o**2, X10, r_vovo, 1, rho_aibj, 1)
      call mem%alloc(X11, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X11, wf%n_o, wf%n_o, wf%n_v)
      X12 = two * ddot(wf%n_v*wf%n_o**2, X11, 1, uAxxx_ovo, 1)
      call mem%dealloc(X11)
      call add_1432_to_1234(X12, r_vovo, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
   end subroutine mu_4_H_nu_2_ss_doublet_ccsd

