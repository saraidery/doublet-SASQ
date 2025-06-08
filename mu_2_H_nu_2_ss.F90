   subroutine mu_2_H_nu_2_ss_doublet_ccsd(wf, rho_aibj, L_oooo, L_vvvv, g_ovov, r_vovo, u_aibj)
!!
!! Generated function
!!
      implicit none
!
      class(doublet_ccsd), intent(in) :: wf
!
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(inout) :: rho_aibj
!
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_o,wf%n_o), intent(in) :: L_oooo
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o,wf%n_v), intent(in) :: g_ovov
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(in) :: r_vovo, u_aibj
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_v,wf%n_v), intent(in) :: L_vvvv
!
      real(dp) :: X1, X2, X3, X4, X22, X24
      real(dp), dimension(:,:,:,:), allocatable :: X5, X6, X7, X8, X9, X10, X11, X12, X13, X14, X15, X16, X17, X18, X19, X20, X21, X23
!
      integer :: i1, i2
!
      real(dp), external :: ddot
!
      X1 = zero
!
      do i1 = 1, wf%n_o
         X1 = X1 + wf%fock_ij(i1,i1)
      end do
!
      call daxpy(wf%n_v**2*wf%n_o**2, eight*X1, r_vovo, 1, rho_aibj, 1)
      X2 = zero
!
      do i1 = 1, wf%n_o
         X2 = X2 + wf%fock_ij(i1,i1)
      end do
!
      call add_1432_to_1234(-four*X2, r_vovo, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      X3 = zero
!
      do i2 = 1, wf%n_o
         do i1 = 1, wf%n_o
            X3 = X3 + L_oooo(i1,i1,i2,i2)
         end do
      end do
!
      call daxpy(wf%n_v**2*wf%n_o**2, -four*X3, r_vovo, 1, rho_aibj, 1)
      X4 = zero
!
      do i2 = 1, wf%n_o
         do i1 = 1, wf%n_o
            X4 = X4 + L_oooo(i1,i1,i2,i2)
         end do
      end do
!
      call add_1432_to_1234(two*X4, r_vovo, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X5, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1324(L_oooo, X5, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X6, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(r_vovo, X6, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X7, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o**2, &
         two, &
         X6, &
         wf%n_v**2, &
         X5, &
         wf%n_o**2, &
         zero, &
         X7, &
         wf%n_v**2)
!
      call mem%dealloc(X5)
      call mem%dealloc(X6)
      call add_1324_to_1234(one, X7, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X7)
      call mem%alloc(X8, wf%n_v, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_1324(L_vvvv, X8, wf%n_v, wf%n_v, wf%n_v, wf%n_v)
      call mem%alloc(X9, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(r_vovo, X9, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X10, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_v**2, &
         two, &
         X8, &
         wf%n_v**2, &
         X9, &
         wf%n_v**2, &
         zero, &
         X10, &
         wf%n_v**2)
!
      call mem%dealloc(X8)
      call mem%dealloc(X9)
      call add_1324_to_1234(one, X10, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X10)
      call mem%alloc(X11, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X11, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X12, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(r_vovo, X12, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X13, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v**2, &
         two, &
         X11, &
         wf%n_o**2, &
         X12, &
         wf%n_v**2, &
         zero, &
         X13, &
         wf%n_o**2)
!
      call mem%dealloc(X11)
      call mem%dealloc(X12)
      call mem%alloc(X14, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X14, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X15, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o**2, &
         one, &
         X14, &
         wf%n_v**2, &
         X13, &
         wf%n_o**2, &
         zero, &
         X15, &
         wf%n_v**2)
!
      call mem%dealloc(X13)
      call mem%dealloc(X14)
      call add_1324_to_1234(one, X15, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X15)
      call mem%alloc(X16, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X16, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X17, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X17, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X18, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v**2, &
         two, &
         X16, &
         wf%n_o**2, &
         X17, &
         wf%n_v**2, &
         zero, &
         X18, &
         wf%n_o**2)
!
      call mem%dealloc(X16)
      call mem%dealloc(X17)
      call mem%alloc(X19, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(r_vovo, X19, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X20, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o**2, &
         one, &
         X19, &
         wf%n_v**2, &
         X18, &
         wf%n_o**2, &
         zero, &
         X20, &
         wf%n_v**2)
!
      call mem%dealloc(X18)
      call mem%dealloc(X19)
      call add_1324_to_1234(one, X20, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X20)
      call mem%alloc(X21, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_2143(g_ovov, X21, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      X22 = four * ddot(wf%n_v**2*wf%n_o**2, X21, 1, u_aibj, 1)
      call mem%dealloc(X21)
      call daxpy(wf%n_v**2*wf%n_o**2, X22, r_vovo, 1, rho_aibj, 1)
      call mem%alloc(X23, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_2143(g_ovov, X23, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      X24 = -two * ddot(wf%n_v**2*wf%n_o**2, X23, 1, u_aibj, 1)
      call mem%dealloc(X23)
      call add_1432_to_1234(X24, r_vovo, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
   end subroutine mu_2_H_nu_2_ss_doublet_ccsd

