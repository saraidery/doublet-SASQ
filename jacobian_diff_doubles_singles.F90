   subroutine jacobian_diff_doubles_singles_doublet_ccsd(wf, rho_2, c_1, u_aibj)
!!
!! Generated function
!!
      implicit none
!
      class(doublet_ccsd), intent(in) :: wf
!
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(inout) :: rho_2
!
      real(dp), dimension(wf%n_v,wf%n_o), intent(in) :: c_1
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(in) :: u_aibj


      real(dp), dimension(:,:,:,:), allocatable :: g_ovoo
      real(dp), dimension(:,:,:,:), allocatable :: g_ovvv
!
      real(dp), dimension(:,:), allocatable :: X2, X3, X4, X5, X9, X13, X15, X18
      real(dp), dimension(:,:,:,:), allocatable :: X1, X6, X7, X8, X10, X11, X12, X14, X16, X17
!
      call mem%alloc(g_ovoo, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(g_ovvv, wf%n_o, wf%n_v, wf%n_v, wf%n_v)

      call wf%eri_t1%get('ovoo', g_ovoo)
      call wf%eri_t1%get('ovvv', g_ovvv)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         four, &
         wf%fock_ai, 1, &
         c_1, 1, &
         rho_2, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X1, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         wf%fock_ai, 1, &
         c_1, 1, &
         X1, &
         wf%n_v*wf%n_o)
!
      call add_1432_to_1234(one, X1, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1)
      call mem%alloc(X2, wf%n_v, wf%n_o)
      call sort_to_21(wf%fock_ia, X2, wf%n_o, wf%n_v)
      call mem%alloc(X3, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         four, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X2, 1, &
         zero, &
         X3, 1)
!
      call mem%dealloc(X2)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         c_1, 1, &
         X3, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X3)
      call mem%alloc(X4, wf%n_v, wf%n_o)
      call sort_to_21(wf%fock_ia, X4, wf%n_o, wf%n_v)
      call mem%alloc(X5, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X4, 1, &
         zero, &
         X5, 1)
!
      call mem%dealloc(X4)
      call mem%alloc(X6, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         c_1, 1, &
         X5, 1, &
         X6, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X5)
      call add_1432_to_1234(one, X6, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X6)
      call mem%alloc(X7, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_1243(g_ovvv, X7, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call mem%alloc(X8, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_2134(u_aibj, X8, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X9, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -two, &
         X7, &
         wf%n_v**2*wf%n_o, &
         X8, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X9, &
         wf%n_v)
!
      call mem%dealloc(X7)
      call mem%dealloc(X8)
      call mem%alloc(X10, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X9, 1, &
         c_1, 1, &
         X10, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X9)
      call add_1432_to_1234(one, X10, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X10)
      call mem%alloc(X11, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_1243(g_ovvv, X11, wf%n_o, wf%n_v, wf%n_v, wf%n_v)
      call mem%alloc(X12, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_2134(u_aibj, X12, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X13, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         four, &
         X11, &
         wf%n_v**2*wf%n_o, &
         X12, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X13, &
         wf%n_v)
!
      call mem%dealloc(X11)
      call mem%dealloc(X12)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X13, 1, &
         c_1, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X13)
      call mem%alloc(X14, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_3214(g_ovoo, X14, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X15, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         two, &
         X14, &
         wf%n_v*wf%n_o**2, &
         u_aibj, &
         wf%n_v, &
         zero, &
         X15, &
         wf%n_o)
!
      call mem%dealloc(X14)
      call mem%alloc(X16, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         c_1, 1, &
         X15, 1, &
         X16, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X15)
      call add_1423_to_1234(one, X16, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X16)
      call mem%alloc(X17, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_3214(g_ovoo, X17, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X18, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         -four, &
         u_aibj, &
         wf%n_v, &
         X17, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X18, &
         wf%n_v)
!
      call mem%dealloc(X17)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X18, 1, &
         c_1, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X18)
      call mem%dealloc(g_ovoo)
      call mem%dealloc(g_ovvv)
!
   end subroutine jacobian_diff_doubles_singles_doublet_ccsd

