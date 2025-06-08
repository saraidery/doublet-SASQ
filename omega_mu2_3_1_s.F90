   subroutine omega_mu2_3_1_s_doublet_ccsd(wf, omega_aibj, LAxxx_vov, LAxxx_vvo, L_vvov, LxIxx_oov, LxxxI_voo, gAIxI_o, gAIxx_oo, gAIxx_vv, gAxxI_oo, gAxxI_vv, gAxxx_ovv, gAxxx_vov, gAxxx_vvo, g_ooov, g_vovv, g_vvov, gxIxI_vo, gxIxx_oov, gxIxx_voo, gxIxx_vvv, gxxxI_voo, tAIxI_v, tAIxx_vo, tAxxI_ov, tAxxx_ovo, t_vovo, txIxI_vv, txIxx_vvo, txxxI_vov, uAIxx_vo, uAxxx_ovo, uxIxx_vvo, uxxxI_vov, xAx_o)
!!
!! Generated function
!!
      implicit none
!
      class(doublet_ccsd), intent(in) :: wf
!
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(inout) :: omega_aibj
!
      real(dp), dimension(wf%n_o), intent(in) :: gAIxI_o, xAx_o
      real(dp), dimension(wf%n_v), intent(in) :: tAIxI_v
      real(dp), dimension(wf%n_o,wf%n_o), intent(in) :: gAIxx_oo, gAxxI_oo
      real(dp), dimension(wf%n_o,wf%n_v), intent(in) :: tAxxI_ov
      real(dp), dimension(wf%n_v,wf%n_o), intent(in) :: gxIxI_vo, tAIxx_vo, uAIxx_vo
      real(dp), dimension(wf%n_v,wf%n_v), intent(in) :: gAIxx_vv, gAxxI_vv, txIxI_vv
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_v), intent(in) :: LxIxx_oov, gxIxx_oov
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o), intent(in) :: tAxxx_ovo, uAxxx_ovo
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_v), intent(in) :: gAxxx_ovv
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_o), intent(in) :: LxxxI_voo, gxIxx_voo, gxxxI_voo
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v), intent(in) :: LAxxx_vov, gAxxx_vov, txxxI_vov, uxxxI_vov
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_o), intent(in) :: LAxxx_vvo, gAxxx_vvo, txIxx_vvo, uxIxx_vvo
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_v), intent(in) :: gxIxx_vvv
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_o,wf%n_v), intent(in) :: g_ooov
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(in) :: t_vovo
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_v), intent(in) :: g_vovv
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_o,wf%n_v), intent(in) :: L_vvov, g_vvov
!
      real(dp), dimension(:), allocatable :: X49, X51, X308, X311, X371, X375, X387, X390, X402, X405
      real(dp), dimension(:,:), allocatable :: X54, X63, X72, X74, X77, X83, X96, X125, X126, X136, X161, X173, X187, X208, X215, X223, X253, X265, X282, X283, X291, X292, X298, X299, X302, X303, X325, X328, X333, X337, X341, X345, X349, X353, X356, X358, X362, X367, X370, X374, X401, X404, X426, X429, X433, X437, X441, X444, X448, X452, X456, X459, X463, X467, X471, X475, X479, X482, X487, X492, X495
      real(dp), dimension(:,:,:), allocatable :: X1, X2, X3, X4, X5, X7, X8, X10, X11, X12, X14, X15, X16, X17, X18, X19, X20, X21, X22, X23, X24, X25, X26, X28, X29, X31, X32, X33, X34, X36, X37, X38, X39, X40, X42, X43, X45, X47, X50, X52, X55, X56, X57, X58, X59, X60, X61, X64, X65, X66, X67, X68, X69, X70, X73, X75, X78, X79, X80, X81, X82, X84, X85, X86, X88, X89, X91, X92, X93, X95, X97, X98, X99, X100, X101, X103, X104, X105, X108, X109, X110, X111, X113, X114, X115, X117, X118, X120, X121, X122, X127, X128, X130, X131, X132, X133, X137, X138, X140, X141, X142, X144, X145, X146, X147, X148, X149, X152, X153, X154, X156, X157, X158, X159, X162, X165, X166, X168, X169, X170, X174, X175, X177, X178, X179, X181, X182, X183, X184, X188, X189, X191, X192, X193, X194, X195, X196, X199, X200, X201, X203, X204, X205, X206, X209, X212, X213, X216, X218, X219, X220, X224, X225, X227, X228, X229, X232, X233, X234, X236, X237, X238, X239, X240, X241, X242, X243, X244, X245, X246, X249, X250, X251, X254, X258, X259, X261, X262, X263, X266, X267, X269, X270, X271, X274, X275, X277, X278, X279, X284, X285, X286, X287, X288, X289, X290, X293, X294, X296, X297, X300, X304, X305, X306, X307, X309, X310, X312, X314, X315, X316, X318, X319, X320, X321, X322, X323, X324, X326, X327, X329, X330, X331, X332, X334, X335, X336, X338, X340, X342, X344, X346, X347, X348, X350, X351, X354, X357, X359, X361, X363, X364, X366, X368, X369, X372, X373, X376, X378, X380, X381, X382, X383, X384, X385, X386, X388, X389, X391, X393, X395, X396, X397, X398, X399, X400, X403, X406, X408, X410, X411, X412, X414, X415, X416, X417, X418, X419, X420, X421, X422, X423, X424, X425, X427, X428, X430, X431, X432, X434, X435, X436, X438, X440, X442, X443, X445, X446, X447, X449, X451, X453, X454, X455, X457, X458, X460, X462, X464, X466, X468, X470, X472, X473, X474, X476, X477, X478, X480, X481, X483, X484, X485, X486, X488, X489, X490, X491, X493, X494, X496
      real(dp), dimension(:,:,:,:), allocatable :: X6, X9, X13, X27, X30, X35, X41, X44, X46, X48, X53, X62, X71, X76, X87, X90, X94, X102, X106, X107, X112, X116, X119, X123, X124, X129, X134, X135, X139, X143, X150, X151, X155, X160, X163, X164, X167, X171, X172, X176, X180, X185, X186, X190, X197, X198, X202, X207, X210, X211, X214, X217, X221, X222, X226, X230, X231, X235, X247, X248, X252, X255, X256, X257, X260, X264, X268, X272, X273, X276, X280, X281, X295, X301, X313, X317, X339, X343, X352, X355, X360, X365, X377, X379, X392, X394, X407, X409, X413, X439, X450, X461, X465, X469
!
      call mem%alloc(X1, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         LAxxx_vvo, &
         wf%n_v, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X1, &
         wf%n_v*wf%n_o)
!
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1)
      call mem%alloc(X2, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         -one, &
         LxxxI_voo, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X2, &
         wf%n_v*wf%n_o)
!
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2)
      call mem%alloc(X3, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         -one, &
         LxxxI_voo, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X3, &
         wf%n_v*wf%n_o)
!
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X3, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X3)
      call mem%alloc(X4, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         g_vovv, &
         wf%n_v**2*wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X4, 1)
!
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X4, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X4)
      call mem%alloc(X5, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -one, &
         g_vovv, &
         wf%n_v**2*wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X5, 1)
!
      call mem%alloc(X6, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X5, 1, &
         xAx_o, 1, &
         X6, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X5)
      call add_1432_to_1234(one, X6, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X6)
      call mem%alloc(X7, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         -two, &
         t_vovo, &
         wf%n_v**2*wf%n_o, &
         gAIxI_o, 1, &
         zero, &
         X7, 1)
!
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X7, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X7)
      call mem%alloc(X8, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         t_vovo, &
         wf%n_v**2*wf%n_o, &
         gAIxI_o, 1, &
         zero, &
         X8, 1)
!
      call mem%alloc(X9, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X8, 1, &
         xAx_o, 1, &
         X9, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X8)
      call add_1432_to_1234(one, X9, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X9)
      call mem%alloc(X10, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(uxIxx_vvo, X10, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X11, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         gAIxx_vv, &
         wf%n_v, &
         X10, &
         wf%n_v*wf%n_o, &
         zero, &
         X11, &
         wf%n_v)
!
      call mem%dealloc(X10)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X11, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X11)
      call mem%alloc(X12, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         gAIxx_vv, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X12, &
         wf%n_v)
!
      call mem%alloc(X13, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X12, 1, &
         xAx_o, 1, &
         X13, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X12)
      call add_1342_to_1234(one, X13, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X13)
      call mem%alloc(X14, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X14, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X15, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         -one, &
         X14, &
         wf%n_v**2, &
         gAIxx_oo, &
         wf%n_o, &
         zero, &
         X15, &
         wf%n_v**2)
!
      call mem%dealloc(X14)
      call mem%alloc(X16, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X15, X16, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X15)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X16, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X16)
      call mem%alloc(X17, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         gAxxI_oo, &
         wf%n_o, &
         zero, &
         X17, &
         wf%n_v**2)
!
      call mem%alloc(X18, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X17, X18, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X17)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X18, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X18)
      call mem%alloc(X19, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(txIxx_vvo, X19, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X20, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -one, &
         gAxxI_vv, &
         wf%n_v, &
         X19, &
         wf%n_v*wf%n_o, &
         zero, &
         X20, &
         wf%n_v)
!
      call mem%dealloc(X19)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X20, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X20)
      call mem%alloc(X21, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X21, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X22, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X21, &
         wf%n_v**2, &
         gAxxI_oo, &
         wf%n_o, &
         zero, &
         X22, &
         wf%n_v**2)
!
      call mem%dealloc(X21)
      call mem%alloc(X23, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X22, X23, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X22)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X23, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X23)
      call mem%alloc(X24, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -one, &
         gAxxI_vv, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X24, &
         wf%n_v)
!
      call mem%alloc(X25, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X24, X25, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X24)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X25, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X25)
      call mem%alloc(X26, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         gAxxI_vv, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X26, &
         wf%n_v)
!
      call mem%alloc(X27, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X26, 1, &
         xAx_o, 1, &
         X27, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X26)
      call add_1342_to_1234(one, X27, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X27)
      call mem%alloc(X28, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -one, &
         txIxI_vv, &
         wf%n_v, &
         gAxxx_ovv, &
         wf%n_v*wf%n_o, &
         zero, &
         X28, &
         wf%n_v)
!
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X28, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X28)
      call mem%alloc(X29, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         -one, &
         gAxxx_vvo, &
         wf%n_v, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X29, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X30, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X29, 1, &
         xAx_o, 1, &
         X30, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X29)
      call add_1432_to_1234(one, X30, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X30)
      call mem%alloc(X31, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         gxIxI_vo, &
         wf%n_v, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X31, &
         wf%n_v)
!
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X31, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X31)
      call mem%alloc(X32, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X32, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X33, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         gxIxI_vo, &
         wf%n_v, &
         X32, &
         wf%n_o, &
         zero, &
         X33, &
         wf%n_v)
!
      call mem%dealloc(X32)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X33, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X33)
      call mem%alloc(X34, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         -one, &
         gxIxI_vo, &
         wf%n_v, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X34, &
         wf%n_v)
!
      call mem%alloc(X35, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X34, 1, &
         xAx_o, 1, &
         X35, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X34)
      call add_1342_to_1234(one, X35, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X35)
      call mem%alloc(X36, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         gxIxx_vvv, &
         wf%n_v**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X36, &
         wf%n_v**2)
!
      call mem%alloc(X37, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X36, X37, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X36)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X37, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X37)
      call mem%alloc(X38, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         gxIxx_vvv, &
         wf%n_v**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X38, &
         wf%n_v**2)
!
      call mem%alloc(X39, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X38, X39, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X38)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X39, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X39)
      call mem%alloc(X40, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         gxIxx_vvv, &
         wf%n_v**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X40, &
         wf%n_v**2)
!
      call mem%alloc(X41, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X40, 1, &
         xAx_o, 1, &
         X41, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X40)
      call add_1342_to_1234(one, X41, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X41)
      call mem%alloc(X42, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(gxIxx_voo, X42, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X43, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         -one, &
         X42, &
         wf%n_v*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X43, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X42)
      call mem%alloc(X44, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X43, 1, &
         xAx_o, 1, &
         X44, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X43)
      call add_1432_to_1234(one, X44, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X44)
      call mem%alloc(X45, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         gxxxI_voo, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X45, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X46, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X45, 1, &
         xAx_o, 1, &
         X46, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X45)
      call add_1432_to_1234(one, X46, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X46)
      call mem%alloc(X47, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         gxxxI_voo, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X47, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X48, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X47, 1, &
         xAx_o, 1, &
         X48, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X47)
      call add_1432_to_1234(one, X48, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X48)
      call mem%alloc(X49, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X49, 1)
!
      call mem%alloc(X50, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         t_vovo, &
         wf%n_v**2*wf%n_o, &
         X49, 1, &
         zero, &
         X50, 1)
!
      call mem%dealloc(X49)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X50, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X50)
      call mem%alloc(X51, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X51, 1)
!
      call mem%alloc(X52, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         t_vovo, &
         wf%n_v**2*wf%n_o, &
         X51, 1, &
         zero, &
         X52, 1)
!
      call mem%dealloc(X51)
      call mem%alloc(X53, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X52, 1, &
         xAx_o, 1, &
         X53, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X52)
      call add_1432_to_1234(one, X53, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X53)
      call mem%alloc(X54, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X54, &
         wf%n_o)
!
      call mem%alloc(X55, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X54, &
         wf%n_o, &
         zero, &
         X55, &
         wf%n_v**2)
!
      call mem%dealloc(X54)
      call mem%alloc(X56, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X55, X56, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X55)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X56, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X56)
      call mem%alloc(X57, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X57, &
         wf%n_o)
!
      call mem%alloc(X58, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X57, X58, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X57)
      call mem%alloc(X59, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X58, &
         wf%n_o, &
         zero, &
         X59, &
         wf%n_v)
!
      call mem%dealloc(X58)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X59, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X59)
      call mem%alloc(X60, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -one, &
         wf%fock_ia, &
         wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X60, &
         wf%n_o)
!
      call mem%alloc(X61, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X60, &
         wf%n_o, &
         zero, &
         X61, &
         wf%n_v)
!
      call mem%dealloc(X60)
      call mem%alloc(X62, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X61, 1, &
         xAx_o, 1, &
         X62, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X61)
      call add_1342_to_1234(one, X62, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X62)
      call mem%alloc(X63, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X63, &
         wf%n_o)
!
      call mem%alloc(X64, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X63, &
         wf%n_o, &
         zero, &
         X64, &
         wf%n_v**2)
!
      call mem%dealloc(X63)
      call mem%alloc(X65, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X64, X65, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X64)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X65, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X65)
      call mem%alloc(X66, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X66, &
         wf%n_o)
!
      call mem%alloc(X67, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X66, X67, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X66)
      call mem%alloc(X68, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X67, &
         wf%n_o, &
         zero, &
         X68, &
         wf%n_v)
!
      call mem%dealloc(X67)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X68, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X68)
      call mem%alloc(X69, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -one, &
         wf%fock_ia, &
         wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X69, &
         wf%n_o)
!
      call mem%alloc(X70, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X69, &
         wf%n_o, &
         zero, &
         X70, &
         wf%n_v)
!
      call mem%dealloc(X69)
      call mem%alloc(X71, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X70, 1, &
         xAx_o, 1, &
         X71, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X70)
      call add_1342_to_1234(one, X71, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X71)
      call mem%alloc(X72, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X72, &
         wf%n_o)
!
      call mem%alloc(X73, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X72, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X73, &
         wf%n_v)
!
      call mem%dealloc(X72)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X73, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X73)
      call mem%alloc(X74, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X74, &
         wf%n_o)
!
      call mem%alloc(X75, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X74, &
         wf%n_o, &
         zero, &
         X75, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X74)
      call mem%alloc(X76, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X75, 1, &
         xAx_o, 1, &
         X76, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X75)
      call add_1432_to_1234(one, X76, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X76)
      call mem%alloc(X77, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         -one, &
         wf%fock_ia, &
         wf%n_o, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X77, &
         wf%n_o)
!
      call mem%alloc(X78, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X77, &
         wf%n_o, &
         zero, &
         X78, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X77)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X78, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X78)
      call mem%alloc(X79, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X79, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X80, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -one, &
         wf%fock_ia, &
         wf%n_o, &
         X79, &
         wf%n_v*wf%n_o, &
         zero, &
         X80, &
         wf%n_o)
!
      call mem%dealloc(X79)
      call mem%alloc(X81, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X80, X81, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X80)
      call mem%alloc(X82, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X81, &
         wf%n_o, &
         zero, &
         X82, &
         wf%n_v)
!
      call mem%dealloc(X81)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X82, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X82)
      call mem%alloc(X83, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         wf%fock_ia, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X83, &
         wf%n_o)
!
      call mem%alloc(X84, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X84, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X85, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X84, &
         wf%n_v**2, &
         X83, &
         wf%n_o, &
         zero, &
         X85, &
         wf%n_v**2)
!
      call mem%dealloc(X83)
      call mem%dealloc(X84)
      call mem%alloc(X86, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X85, X86, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X85)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X86, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X86)
      call mem%alloc(X87, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(L_vvov, X87, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X88, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         one, &
         X87, &
         wf%n_v**2*wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X88, 1)
!
      call mem%dealloc(X87)
      call mem%alloc(X89, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X88, &
         wf%n_v, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X89, &
         wf%n_v)
!
      call mem%dealloc(X88)
      call mem%alloc(X90, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X89, 1, &
         xAx_o, 1, &
         X90, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X89)
      call add_1342_to_1234(one, X90, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X90)
      call mem%alloc(X91, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(LAxxx_vov, X91, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X92, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X91, &
         wf%n_v, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X92, &
         wf%n_v)
!
      call mem%dealloc(X91)
      call mem%alloc(X93, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X92, &
         wf%n_v, &
         zero, &
         X93, &
         wf%n_v)
!
      call mem%dealloc(X92)
      call mem%alloc(X94, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X93, 1, &
         xAx_o, 1, &
         X94, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X93)
      call add_1342_to_1234(one, X94, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X94)
      call mem%alloc(X95, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(LAxxx_vov, X95, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X96, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         X95, &
         wf%n_v, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X96, &
         wf%n_v)
!
      call mem%dealloc(X95)
      call mem%alloc(X97, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X96, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X97, &
         wf%n_v)
!
      call mem%dealloc(X96)
      call mem%alloc(X98, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X97, X98, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X97)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X98, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X98)
      call mem%alloc(X99, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(LxIxx_oov, X99, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X100, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X99, &
         wf%n_o, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X100, &
         wf%n_o)
!
      call mem%dealloc(X99)
      call mem%alloc(X101, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X100, &
         wf%n_o, &
         zero, &
         X101, &
         wf%n_v)
!
      call mem%dealloc(X100)
      call mem%alloc(X102, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X101, 1, &
         xAx_o, 1, &
         X102, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X101)
      call add_1342_to_1234(one, X102, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X102)
      call mem%alloc(X103, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(LxIxx_oov, X103, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X104, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X103, &
         wf%n_o, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X104, &
         wf%n_o)
!
      call mem%dealloc(X103)
      call mem%alloc(X105, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X104, &
         wf%n_o, &
         zero, &
         X105, &
         wf%n_v)
!
      call mem%dealloc(X104)
      call mem%alloc(X106, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X105, 1, &
         xAx_o, 1, &
         X106, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X105)
      call add_1342_to_1234(one, X106, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X106)
      call mem%alloc(X107, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X107, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X108, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -one, &
         X107, &
         wf%n_v**2*wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X108, 1)
!
      call mem%dealloc(X107)
      call mem%alloc(X109, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X108, &
         wf%n_v, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X109, &
         wf%n_v)
!
      call mem%dealloc(X108)
      call mem%alloc(X110, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X109, X110, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X109)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X110, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X110)
      call mem%alloc(X111, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -one, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X111, 1)
!
      call mem%alloc(X112, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(wf%u_aibj, X112, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X113, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X111, &
         wf%n_v, &
         X112, &
         wf%n_v*wf%n_o, &
         zero, &
         X113, &
         wf%n_v)
!
      call mem%dealloc(X111)
      call mem%dealloc(X112)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X113, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X113)
      call mem%alloc(X114, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**3, &
         wf%n_v, &
         one, &
         g_ooov, &
         wf%n_o**3, &
         tAIxI_v, 1, &
         zero, &
         X114, 1)
!
      call mem%alloc(X115, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X114, X115, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X114)
      call mem%alloc(X116, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(wf%u_aibj, X116, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X117, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X116, &
         wf%n_v**2, &
         X115, &
         wf%n_o**2, &
         zero, &
         X117, &
         wf%n_v**2)
!
      call mem%dealloc(X115)
      call mem%dealloc(X116)
      call mem%alloc(X118, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X117, X118, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X117)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X118, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X118)
      call mem%alloc(X119, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X119, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X120, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v, &
         X119, &
         wf%n_v**2, &
         zero, &
         X120, &
         wf%n_v)
!
      call mem%dealloc(X119)
      call mem%alloc(X121, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X120, &
         wf%n_v**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X121, &
         wf%n_v**2)
!
      call mem%dealloc(X120)
      call mem%alloc(X122, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_213(X121, X122, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X121)
      call mem%alloc(X123, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X122, 1, &
         xAx_o, 1, &
         X123, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X122)
      call add_1342_to_1234(one, X123, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X123)
      call mem%alloc(X124, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X124, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X125, wf%n_o, wf%n_v)
      call sort_to_21(tAIxx_vo, X125, wf%n_v, wf%n_o)
      call mem%alloc(X126, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -one, &
         X124, &
         wf%n_v*wf%n_o, &
         X125, 1, &
         zero, &
         X126, 1)
!
      call mem%dealloc(X124)
      call mem%dealloc(X125)
      call mem%alloc(X127, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X126, &
         wf%n_o, &
         zero, &
         X127, &
         wf%n_v**2)
!
      call mem%dealloc(X126)
      call mem%alloc(X128, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X127, X128, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X127)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X128, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X128)
      call mem%alloc(X129, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X129, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X130, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X130, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X131, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X129, &
         wf%n_v*wf%n_o, &
         X130, &
         wf%n_v**2, &
         zero, &
         X131, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X129)
      call mem%dealloc(X130)
      call mem%alloc(X132, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X131, X132, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X131)
      call mem%alloc(X133, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X132, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X133, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X132)
      call mem%alloc(X134, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X133, 1, &
         xAx_o, 1, &
         X134, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X133)
      call add_1432_to_1234(one, X134, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X134)
      call mem%alloc(X135, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X135, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X136, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         one, &
         X135, &
         wf%n_v**2, &
         tAIxx_vo, 1, &
         zero, &
         X136, 1)
!
      call mem%dealloc(X135)
      call mem%alloc(X137, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X136, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X137, &
         wf%n_v)
!
      call mem%dealloc(X136)
      call mem%alloc(X138, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X137, X138, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X137)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X138, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X138)
      call mem%alloc(X139, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X139, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X140, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         one, &
         txxxI_vov, &
         wf%n_v, &
         X139, &
         wf%n_v**2, &
         zero, &
         X140, &
         wf%n_v)
!
      call mem%dealloc(X139)
      call mem%alloc(X141, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X140, &
         wf%n_v**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X141, &
         wf%n_v**2)
!
      call mem%dealloc(X140)
      call mem%alloc(X142, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_231(X141, X142, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X141)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X142, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X142)
      call mem%alloc(X143, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1432(g_ooov, X143, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X144, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         X143, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X144, &
         wf%n_o**2)
!
      call mem%dealloc(X143)
      call mem%alloc(X145, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X144, &
         wf%n_o, &
         zero, &
         X145, &
         wf%n_v)
!
      call mem%dealloc(X144)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X145, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X145)
      call mem%alloc(X146, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X146, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X147, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -one, &
         X146, &
         wf%n_v, &
         g_vvov, &
         wf%n_v**2, &
         zero, &
         X147, &
         wf%n_v)
!
      call mem%dealloc(X146)
      call mem%alloc(X148, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X147, &
         wf%n_v**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X148, &
         wf%n_v**2)
!
      call mem%dealloc(X147)
      call mem%alloc(X149, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_213(X148, X149, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X148)
      call mem%alloc(X150, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X149, 1, &
         xAx_o, 1, &
         X150, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X149)
      call add_1342_to_1234(one, X150, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X150)
      call mem%alloc(X151, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X151, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X152, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         one, &
         uxIxx_vvo, &
         wf%n_v, &
         X151, &
         wf%n_o**2, &
         zero, &
         X152, &
         wf%n_v)
!
      call mem%dealloc(X151)
      call mem%alloc(X153, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X152, X153, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X152)
      call mem%alloc(X154, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X153, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X154, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X153)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X154, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X154)
      call mem%alloc(X155, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X155, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X156, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X156, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X157, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         -one, &
         X155, &
         wf%n_v*wf%n_o, &
         X156, &
         wf%n_v**2, &
         zero, &
         X157, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X155)
      call mem%dealloc(X156)
      call mem%alloc(X158, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X157, X158, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X157)
      call mem%alloc(X159, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X158, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X159, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X158)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X159, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X159)
      call mem%alloc(X160, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X160, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X161, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -one, &
         X160, &
         wf%n_v**2, &
         tAIxx_vo, 1, &
         zero, &
         X161, 1)
!
      call mem%dealloc(X160)
      call mem%alloc(X162, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X161, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X162, &
         wf%n_v)
!
      call mem%dealloc(X161)
      call mem%alloc(X163, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X162, 1, &
         xAx_o, 1, &
         X163, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X162)
      call add_1342_to_1234(one, X163, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X163)
      call mem%alloc(X164, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X164, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X165, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         one, &
         uxxxI_vov, &
         wf%n_v, &
         X164, &
         wf%n_v*wf%n_o, &
         zero, &
         X165, &
         wf%n_v)
!
      call mem%dealloc(X164)
      call mem%alloc(X166, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X165, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X166, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X165)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X166, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X166)
      call mem%alloc(X167, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X167, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X168, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v, &
         X167, &
         wf%n_v**2, &
         zero, &
         X168, &
         wf%n_v)
!
      call mem%dealloc(X167)
      call mem%alloc(X169, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X168, &
         wf%n_v**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X169, &
         wf%n_v**2)
!
      call mem%dealloc(X168)
      call mem%alloc(X170, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_213(X169, X170, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X169)
      call mem%alloc(X171, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X170, 1, &
         xAx_o, 1, &
         X171, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X170)
      call add_1342_to_1234(one, X171, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X171)
      call mem%alloc(X172, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X172, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X173, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -one, &
         X172, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X173, 1)
!
      call mem%dealloc(X172)
      call mem%alloc(X174, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X173, &
         wf%n_o, &
         zero, &
         X174, &
         wf%n_v**2)
!
      call mem%dealloc(X173)
      call mem%alloc(X175, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X174, X175, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X174)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X175, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X175)
      call mem%alloc(X176, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X176, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X177, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         one, &
         txxxI_vov, &
         wf%n_v, &
         X176, &
         wf%n_v**2, &
         zero, &
         X177, &
         wf%n_v)
!
      call mem%dealloc(X176)
      call mem%alloc(X178, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X177, &
         wf%n_v**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X178, &
         wf%n_v**2)
!
      call mem%dealloc(X177)
      call mem%alloc(X179, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_231(X178, X179, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X178)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X179, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X179)
      call mem%alloc(X180, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X180, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X181, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X181, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X182, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X180, &
         wf%n_v*wf%n_o, &
         X181, &
         wf%n_v**2, &
         zero, &
         X182, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X180)
      call mem%dealloc(X181)
      call mem%alloc(X183, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X182, X183, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X182)
      call mem%alloc(X184, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X183, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X184, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X183)
      call mem%alloc(X185, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X184, 1, &
         xAx_o, 1, &
         X185, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X184)
      call add_1432_to_1234(one, X185, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X185)
      call mem%alloc(X186, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X186, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X187, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         one, &
         X186, &
         wf%n_v**2, &
         tAxxI_ov, 1, &
         zero, &
         X187, 1)
!
      call mem%dealloc(X186)
      call mem%alloc(X188, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X187, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X188, &
         wf%n_v)
!
      call mem%dealloc(X187)
      call mem%alloc(X189, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X188, X189, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X188)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X189, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X189)
      call mem%alloc(X190, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1432(g_ooov, X190, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X191, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         X190, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X191, &
         wf%n_o**2)
!
      call mem%dealloc(X190)
      call mem%alloc(X192, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X191, &
         wf%n_o, &
         zero, &
         X192, &
         wf%n_v)
!
      call mem%dealloc(X191)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X192, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X192)
      call mem%alloc(X193, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X193, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X194, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -one, &
         X193, &
         wf%n_v, &
         g_vvov, &
         wf%n_v**2, &
         zero, &
         X194, &
         wf%n_v)
!
      call mem%dealloc(X193)
      call mem%alloc(X195, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X194, &
         wf%n_v**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X195, &
         wf%n_v**2)
!
      call mem%dealloc(X194)
      call mem%alloc(X196, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_213(X195, X196, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X195)
      call mem%alloc(X197, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X196, 1, &
         xAx_o, 1, &
         X197, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X196)
      call add_1342_to_1234(one, X197, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X197)
      call mem%alloc(X198, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X198, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X199, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         one, &
         uxIxx_vvo, &
         wf%n_v, &
         X198, &
         wf%n_o**2, &
         zero, &
         X199, &
         wf%n_v)
!
      call mem%dealloc(X198)
      call mem%alloc(X200, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X199, X200, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X199)
      call mem%alloc(X201, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X200, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X201, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X200)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X201, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X201)
      call mem%alloc(X202, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X202, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X203, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X203, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X204, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         -one, &
         X202, &
         wf%n_v*wf%n_o, &
         X203, &
         wf%n_v**2, &
         zero, &
         X204, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X202)
      call mem%dealloc(X203)
      call mem%alloc(X205, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X204, X205, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X204)
      call mem%alloc(X206, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X205, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X206, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X205)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X206, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X206)
      call mem%alloc(X207, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X207, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X208, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -one, &
         X207, &
         wf%n_v**2, &
         tAxxI_ov, 1, &
         zero, &
         X208, 1)
!
      call mem%dealloc(X207)
      call mem%alloc(X209, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X208, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X209, &
         wf%n_v)
!
      call mem%dealloc(X208)
      call mem%alloc(X210, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X209, 1, &
         xAx_o, 1, &
         X210, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X209)
      call add_1342_to_1234(one, X210, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X210)
      call mem%alloc(X211, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X211, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X212, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         one, &
         uxxxI_vov, &
         wf%n_v, &
         X211, &
         wf%n_v*wf%n_o, &
         zero, &
         X212, &
         wf%n_v)
!
      call mem%dealloc(X211)
      call mem%alloc(X213, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X212, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X213, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X212)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X213, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X213)
      call mem%alloc(X214, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X214, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X215, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v**2, &
         one, &
         X214, &
         wf%n_v*wf%n_o, &
         txIxI_vv, 1, &
         zero, &
         X215, 1)
!
      call mem%dealloc(X214)
      call mem%alloc(X216, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X215, &
         wf%n_v, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X216, &
         wf%n_v)
!
      call mem%dealloc(X215)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X216, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X216)
      call mem%alloc(X217, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X217, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X218, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X217, &
         wf%n_v**2, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X218, &
         wf%n_v**2)
!
      call mem%dealloc(X217)
      call mem%alloc(X219, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X218, X219, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X218)
      call mem%alloc(X220, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X219, &
         wf%n_v*wf%n_o, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X220, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X219)
      call mem%alloc(X221, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X220, 1, &
         xAx_o, 1, &
         X221, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X220)
      call add_1432_to_1234(one, X221, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X221)
      call mem%alloc(X222, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X222, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X223, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v**2, &
         one, &
         X222, &
         wf%n_v*wf%n_o, &
         txIxI_vv, 1, &
         zero, &
         X223, 1)
!
      call mem%dealloc(X222)
      call mem%alloc(X224, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X224, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X225, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X223, &
         wf%n_v, &
         X224, &
         wf%n_o, &
         zero, &
         X225, &
         wf%n_v)
!
      call mem%dealloc(X223)
      call mem%dealloc(X224)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X225, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X225)
      call mem%alloc(X226, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X226, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X227, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X226, &
         wf%n_v**2, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X227, &
         wf%n_v**2)
!
      call mem%dealloc(X226)
      call mem%alloc(X228, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X227, X228, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X227)
      call mem%alloc(X229, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X228, &
         wf%n_v*wf%n_o, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X229, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X228)
      call mem%alloc(X230, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X229, 1, &
         xAx_o, 1, &
         X230, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X229)
      call add_1432_to_1234(one, X230, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X230)
      call mem%alloc(X231, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1342(g_ooov, X231, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X232, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X232, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X233, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o**2, &
         -one, &
         X231, &
         wf%n_o**2, &
         X232, &
         wf%n_o**2, &
         zero, &
         X233, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X231)
      call mem%dealloc(X232)
      call mem%alloc(X234, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X233, &
         wf%n_v, &
         zero, &
         X234, &
         wf%n_v)
!
      call mem%dealloc(X233)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X234, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X234)
      call mem%alloc(X235, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1342(g_ooov, X235, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X236, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(tAxxx_ovo, X236, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X237, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o**2, &
         -one, &
         X235, &
         wf%n_o**2, &
         X236, &
         wf%n_o**2, &
         zero, &
         X237, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X235)
      call mem%dealloc(X236)
      call mem%alloc(X238, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X237, &
         wf%n_v, &
         zero, &
         X238, &
         wf%n_v)
!
      call mem%dealloc(X237)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X238, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X238)
      call mem%alloc(X239, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X239, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X240, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         g_vvov, &
         wf%n_v**2, &
         X239, &
         wf%n_o, &
         zero, &
         X240, &
         wf%n_v**2)
!
      call mem%dealloc(X239)
      call mem%alloc(X241, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X240, X241, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X240)
      call mem%alloc(X242, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X241, &
         wf%n_v*wf%n_o, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X242, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X241)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X242, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X242)
      call mem%alloc(X243, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X243, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X244, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         g_vvov, &
         wf%n_v**2, &
         X243, &
         wf%n_o, &
         zero, &
         X244, &
         wf%n_v**2)
!
      call mem%dealloc(X243)
      call mem%alloc(X245, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X244, X245, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X244)
      call mem%alloc(X246, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X245, &
         wf%n_v*wf%n_o, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X246, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X245)
      call mem%alloc(X247, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X246, 1, &
         xAx_o, 1, &
         X247, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X246)
      call add_1432_to_1234(one, X247, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X247)
      call mem%alloc(X248, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X248, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X249, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X248, &
         wf%n_v**2, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X249, &
         wf%n_v**2)
!
      call mem%dealloc(X248)
      call mem%alloc(X250, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X249, X250, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X249)
      call mem%alloc(X251, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X250, &
         wf%n_v*wf%n_o, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X251, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X250)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X251, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X251)
      call mem%alloc(X252, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X252, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X253, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v**2, &
         -one, &
         X252, &
         wf%n_v*wf%n_o, &
         txIxI_vv, 1, &
         zero, &
         X253, 1)
!
      call mem%dealloc(X252)
      call mem%alloc(X254, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X253, &
         wf%n_v, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X254, &
         wf%n_v)
!
      call mem%dealloc(X253)
      call mem%alloc(X255, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X254, 1, &
         xAx_o, 1, &
         X255, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X254)
      call add_1342_to_1234(one, X255, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X255)
      call mem%alloc(X256, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_v, &
         one, &
         g_ooov, &
         wf%n_o**3, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X256, &
         wf%n_o**3)
!
      call mem%alloc(X257, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1324(X256, X257, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X256)
      call mem%alloc(X258, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(uAxxx_ovo, X258, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X259, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         one, &
         X258, &
         wf%n_o**2, &
         X257, &
         wf%n_o**2, &
         zero, &
         X259, &
         wf%n_v)
!
      call mem%dealloc(X257)
      call mem%dealloc(X258)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X259, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X259)
      call mem%alloc(X260, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X260, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X261, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -one, &
         txIxx_vvo, &
         wf%n_v, &
         X260, &
         wf%n_v**2, &
         zero, &
         X261, &
         wf%n_v)
!
      call mem%dealloc(X260)
      call mem%alloc(X262, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X261, &
         wf%n_v**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X262, &
         wf%n_v**2)
!
      call mem%dealloc(X261)
      call mem%alloc(X263, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_231(X262, X263, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X262)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X263, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X263)
      call mem%alloc(X264, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X264, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X265, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -one, &
         X264, &
         wf%n_v**2, &
         uAIxx_vo, 1, &
         zero, &
         X265, 1)
!
      call mem%dealloc(X264)
      call mem%alloc(X266, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(txIxx_vvo, X266, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X267, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X265, &
         wf%n_v, &
         X266, &
         wf%n_v*wf%n_o, &
         zero, &
         X267, &
         wf%n_v)
!
      call mem%dealloc(X265)
      call mem%dealloc(X266)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X267, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X267)
      call mem%alloc(X268, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X268, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X269, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         -one, &
         X268, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X269, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X268)
      call mem%alloc(X270, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X269, X270, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X269)
      call mem%alloc(X271, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X270, &
         wf%n_v*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X271, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X270)
      call mem%alloc(X272, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X271, 1, &
         xAx_o, 1, &
         X272, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X271)
      call add_1432_to_1234(one, X272, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X272)
      call mem%alloc(X273, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_4132(g_ooov, X273, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X274, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X273, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X274, &
         wf%n_o**2)
!
      call mem%dealloc(X273)
      call mem%alloc(X275, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X274, &
         wf%n_o, &
         zero, &
         X275, &
         wf%n_v)
!
      call mem%dealloc(X274)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X275, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X275)
      call mem%alloc(X276, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X276, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X277, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -one, &
         txxxI_vov, &
         wf%n_v, &
         X276, &
         wf%n_v**2, &
         zero, &
         X277, &
         wf%n_v)
!
      call mem%dealloc(X276)
      call mem%alloc(X278, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X277, &
         wf%n_v**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X278, &
         wf%n_v**2)
!
      call mem%dealloc(X277)
      call mem%alloc(X279, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_213(X278, X279, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X278)
      call mem%alloc(X280, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X279, 1, &
         xAx_o, 1, &
         X280, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X279)
      call add_1342_to_1234(one, X280, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X280)
      call mem%alloc(X281, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X281, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X282, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X282, wf%n_v, wf%n_o)
      call mem%alloc(X283, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         one, &
         X281, &
         wf%n_v*wf%n_o, &
         X282, 1, &
         zero, &
         X283, 1)
!
      call mem%dealloc(X281)
      call mem%dealloc(X282)
      call mem%alloc(X284, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X284, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X285, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X284, &
         wf%n_v**2, &
         X283, &
         wf%n_o, &
         zero, &
         X285, &
         wf%n_v**2)
!
      call mem%dealloc(X283)
      call mem%dealloc(X284)
      call mem%alloc(X286, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X285, X286, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X285)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X286, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X286)
      call mem%alloc(X287, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X287, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X288, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         one, &
         X287, &
         wf%n_v, &
         g_vvov, &
         wf%n_v**2, &
         zero, &
         X288, &
         wf%n_v)
!
      call mem%dealloc(X287)
      call mem%alloc(X289, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X288, &
         wf%n_v**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X289, &
         wf%n_v**2)
!
      call mem%dealloc(X288)
      call mem%alloc(X290, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_231(X289, X290, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X289)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X290, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X290)
      call mem%alloc(X291, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X291, wf%n_v, wf%n_o)
      call mem%alloc(X292, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         one, &
         g_vvov, &
         wf%n_v**2, &
         X291, 1, &
         zero, &
         X292, 1)
!
      call mem%dealloc(X291)
      call mem%alloc(X293, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(uxIxx_vvo, X293, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X294, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X292, &
         wf%n_v, &
         X293, &
         wf%n_v*wf%n_o, &
         zero, &
         X294, &
         wf%n_v)
!
      call mem%dealloc(X292)
      call mem%dealloc(X293)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X294, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X294)
      call mem%alloc(X295, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X295, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X296, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         X295, &
         wf%n_o**2, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X296, &
         wf%n_o**2)
!
      call mem%dealloc(X295)
      call mem%alloc(X297, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X296, &
         wf%n_o, &
         zero, &
         X297, &
         wf%n_v)
!
      call mem%dealloc(X296)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X297, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X297)
      call mem%alloc(X298, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X298, wf%n_v, wf%n_o)
      call mem%alloc(X299, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         one, &
         g_vvov, &
         wf%n_v**2, &
         X298, 1, &
         zero, &
         X299, 1)
!
      call mem%dealloc(X298)
      call mem%alloc(X300, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X299, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X300, &
         wf%n_v)
!
      call mem%dealloc(X299)
      call mem%alloc(X301, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X300, 1, &
         xAx_o, 1, &
         X301, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X300)
      call add_1342_to_1234(one, X301, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X301)
      call mem%alloc(X302, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X302, wf%n_v, wf%n_o)
      call mem%alloc(X303, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -one, &
         g_ooov, &
         wf%n_o**2, &
         X302, 1, &
         zero, &
         X303, 1)
!
      call mem%dealloc(X302)
      call mem%alloc(X304, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X304, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X305, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X304, &
         wf%n_v**2, &
         X303, &
         wf%n_o, &
         zero, &
         X305, &
         wf%n_v**2)
!
      call mem%dealloc(X303)
      call mem%dealloc(X304)
      call mem%alloc(X306, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X305, X306, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X305)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X306, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X306)
      call mem%alloc(X307, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X307, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X308, wf%n_o)
!
      call dgemv('T', &
         wf%n_v**2, &
         wf%n_o, &
         -two, &
         X307, &
         wf%n_v**2, &
         txIxI_vv, 1, &
         zero, &
         X308, 1)
!
      call mem%dealloc(X307)
      call mem%alloc(X309, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         t_vovo, &
         wf%n_v**2*wf%n_o, &
         X308, 1, &
         zero, &
         X309, 1)
!
      call mem%dealloc(X308)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X309, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X309)
      call mem%alloc(X310, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X310, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X311, wf%n_o)
!
      call dgemv('T', &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X310, &
         wf%n_v**2, &
         txIxI_vv, 1, &
         zero, &
         X311, 1)
!
      call mem%dealloc(X310)
      call mem%alloc(X312, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         t_vovo, &
         wf%n_v**2*wf%n_o, &
         X311, 1, &
         zero, &
         X312, 1)
!
      call mem%dealloc(X311)
      call mem%alloc(X313, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X312, 1, &
         xAx_o, 1, &
         X313, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X312)
      call add_1432_to_1234(one, X313, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X313)
      call mem%alloc(X314, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         t_vovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X314, &
         wf%n_v)
!
      call mem%alloc(X315, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X314, X315, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X314)
      call mem%alloc(X316, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X315, &
         wf%n_v, &
         zero, &
         X316, &
         wf%n_v)
!
      call mem%dealloc(X315)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X316, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X316)
      call mem%alloc(X317, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(t_vovo, X317, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X318, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X317, &
         wf%n_v*wf%n_o, &
         zero, &
         X318, &
         wf%n_v)
!
      call mem%dealloc(X317)
      call mem%alloc(X319, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X318, &
         wf%n_v, &
         zero, &
         X319, &
         wf%n_v)
!
      call mem%dealloc(X318)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X319, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X319)
      call mem%alloc(X320, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X320, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X321, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X320, &
         wf%n_v, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X321, &
         wf%n_v)
!
      call mem%dealloc(X320)
      call mem%alloc(X322, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X321, X322, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X321)
      call mem%alloc(X323, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X322, &
         wf%n_v, &
         zero, &
         X323, &
         wf%n_v)
!
      call mem%dealloc(X322)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X323, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X323)
      call mem%alloc(X324, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X324, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X325, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X324, &
         wf%n_v**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X325, &
         wf%n_o)
!
      call mem%dealloc(X324)
      call mem%alloc(X326, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X325, &
         wf%n_o, &
         zero, &
         X326, &
         wf%n_v**2)
!
      call mem%dealloc(X325)
      call mem%alloc(X327, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X326, X327, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X326)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X327, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X327)
      call mem%alloc(X328, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X328, &
         wf%n_v)
!
      call mem%alloc(X329, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(txIxx_vvo, X329, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X330, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X328, &
         wf%n_v, &
         X329, &
         wf%n_v*wf%n_o, &
         zero, &
         X330, &
         wf%n_v)
!
      call mem%dealloc(X328)
      call mem%dealloc(X329)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X330, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X330)
      call mem%alloc(X331, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X331, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X332, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X332, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X333, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X331, &
         wf%n_v**2, &
         X332, &
         wf%n_v**2, &
         zero, &
         X333, &
         wf%n_o)
!
      call mem%dealloc(X331)
      call mem%dealloc(X332)
      call mem%alloc(X334, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X333, &
         wf%n_o, &
         zero, &
         X334, &
         wf%n_v**2)
!
      call mem%dealloc(X333)
      call mem%alloc(X335, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X334, X335, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X334)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X335, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X335)
      call mem%alloc(X336, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X336, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X337, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         four, &
         X336, &
         wf%n_v, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X337, &
         wf%n_v)
!
      call mem%dealloc(X336)
      call mem%alloc(X338, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X337, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X338, &
         wf%n_v)
!
      call mem%dealloc(X337)
      call mem%alloc(X339, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X338, 1, &
         xAx_o, 1, &
         X339, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X338)
      call add_1342_to_1234(one, X339, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X339)
      call mem%alloc(X340, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X340, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X341, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         -one, &
         X340, &
         wf%n_v**2, &
         uxIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X341, &
         wf%n_o)
!
      call mem%dealloc(X340)
      call mem%alloc(X342, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X341, &
         wf%n_o, &
         zero, &
         X342, &
         wf%n_v**2)
!
      call mem%dealloc(X341)
      call mem%alloc(X343, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X342, 1, &
         xAx_o, 1, &
         X343, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X342)
      call add_1342_to_1234(one, X343, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X343)
      call mem%alloc(X344, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X344, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X345, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         X344, &
         wf%n_v, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X345, &
         wf%n_v)
!
      call mem%dealloc(X344)
      call mem%alloc(X346, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X346, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X347, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X346, &
         wf%n_v*wf%n_o, &
         X345, &
         wf%n_v, &
         zero, &
         X347, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X345)
      call mem%dealloc(X346)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X347, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X347)
      call mem%alloc(X348, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X348, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X349, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         X348, &
         wf%n_v, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X349, &
         wf%n_v)
!
      call mem%dealloc(X348)
      call mem%alloc(X350, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X350, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X351, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X350, &
         wf%n_v*wf%n_o, &
         X349, &
         wf%n_v, &
         zero, &
         X351, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X349)
      call mem%dealloc(X350)
      call mem%alloc(X352, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X351, 1, &
         xAx_o, 1, &
         X352, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X351)
      call add_1432_to_1234(one, X352, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X352)
      call mem%alloc(X353, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X353, &
         wf%n_v)
!
      call mem%alloc(X354, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X353, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X354, &
         wf%n_v)
!
      call mem%dealloc(X353)
      call mem%alloc(X355, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X354, 1, &
         xAx_o, 1, &
         X355, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X354)
      call add_1342_to_1234(one, X355, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X355)
      call mem%alloc(X356, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         gAxxx_vov, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X356, &
         wf%n_v)
!
      call mem%alloc(X357, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         X356, &
         wf%n_v, &
         zero, &
         X357, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X356)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X357, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X357)
      call mem%alloc(X358, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         gAxxx_vov, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X358, &
         wf%n_v)
!
      call mem%alloc(X359, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         X358, &
         wf%n_v, &
         zero, &
         X359, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X358)
      call mem%alloc(X360, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X359, 1, &
         xAx_o, 1, &
         X360, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X359)
      call add_1432_to_1234(one, X360, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X360)
      call mem%alloc(X361, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X361, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X362, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X361, &
         wf%n_v, &
         zero, &
         X362, &
         wf%n_v)
!
      call mem%dealloc(X361)
      call mem%alloc(X363, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X363, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X364, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X363, &
         wf%n_v*wf%n_o, &
         X362, &
         wf%n_v, &
         zero, &
         X364, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X362)
      call mem%dealloc(X363)
      call mem%alloc(X365, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X364, 1, &
         xAx_o, 1, &
         X365, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X364)
      call add_1432_to_1234(one, X365, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X365)
      call mem%alloc(X366, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X366, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X367, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X366, &
         wf%n_v, &
         zero, &
         X367, &
         wf%n_v)
!
      call mem%dealloc(X366)
      call mem%alloc(X368, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X367, &
         wf%n_v, &
         zero, &
         X368, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X367)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X368, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X368)
      call mem%alloc(X369, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X369, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X370, wf%n_o, wf%n_v)
      call sort_to_21(tAIxx_vo, X370, wf%n_v, wf%n_o)
      call mem%alloc(X371, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         two, &
         X369, &
         wf%n_v*wf%n_o, &
         X370, 1, &
         zero, &
         X371, 1)
!
      call mem%dealloc(X369)
      call mem%dealloc(X370)
      call mem%alloc(X372, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         t_vovo, &
         wf%n_v**2*wf%n_o, &
         X371, 1, &
         zero, &
         X372, 1)
!
      call mem%dealloc(X371)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X372, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X372)
      call mem%alloc(X373, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X373, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X374, wf%n_o, wf%n_v)
      call sort_to_21(tAIxx_vo, X374, wf%n_v, wf%n_o)
      call mem%alloc(X375, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         -one, &
         X373, &
         wf%n_v*wf%n_o, &
         X374, 1, &
         zero, &
         X375, 1)
!
      call mem%dealloc(X373)
      call mem%dealloc(X374)
      call mem%alloc(X376, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         t_vovo, &
         wf%n_v**2*wf%n_o, &
         X375, 1, &
         zero, &
         X376, 1)
!
      call mem%dealloc(X375)
      call mem%alloc(X377, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X376, 1, &
         xAx_o, 1, &
         X377, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X376)
      call add_1432_to_1234(one, X377, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X377)
      call mem%alloc(X378, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         gxIxx_oov, &
         wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X378, &
         wf%n_o**2)
!
      call mem%alloc(X379, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(t_vovo, X379, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X380, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X379, &
         wf%n_v**2, &
         X378, &
         wf%n_o**2, &
         zero, &
         X380, &
         wf%n_v**2)
!
      call mem%dealloc(X378)
      call mem%dealloc(X379)
      call mem%alloc(X381, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X380, X381, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X380)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X381, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X381)
      call mem%alloc(X382, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_312(gxIxx_oov, X382, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X383, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X382, &
         wf%n_v*wf%n_o, &
         t_vovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X383, &
         wf%n_o)
!
      call mem%dealloc(X382)
      call mem%alloc(X384, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X383, X384, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X383)
      call mem%alloc(X385, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X384, &
         wf%n_o, &
         zero, &
         X385, &
         wf%n_v)
!
      call mem%dealloc(X384)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X385, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X385)
      call mem%alloc(X386, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X386, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X387, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         two, &
         X386, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X387, 1)
!
      call mem%dealloc(X386)
      call mem%alloc(X388, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         t_vovo, &
         wf%n_v**2*wf%n_o, &
         X387, 1, &
         zero, &
         X388, 1)
!
      call mem%dealloc(X387)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X388, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X388)
      call mem%alloc(X389, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X389, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X390, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         -one, &
         X389, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X390, 1)
!
      call mem%dealloc(X389)
      call mem%alloc(X391, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         t_vovo, &
         wf%n_v**2*wf%n_o, &
         X390, 1, &
         zero, &
         X391, 1)
!
      call mem%dealloc(X390)
      call mem%alloc(X392, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X391, 1, &
         xAx_o, 1, &
         X392, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X391)
      call add_1432_to_1234(one, X392, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X392)
      call mem%alloc(X393, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         gxIxx_oov, &
         wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X393, &
         wf%n_o**2)
!
      call mem%alloc(X394, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(t_vovo, X394, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X395, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X394, &
         wf%n_v**2, &
         X393, &
         wf%n_o**2, &
         zero, &
         X395, &
         wf%n_v**2)
!
      call mem%dealloc(X393)
      call mem%dealloc(X394)
      call mem%alloc(X396, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X395, X396, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X395)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X396, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X396)
      call mem%alloc(X397, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_312(gxIxx_oov, X397, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X398, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X397, &
         wf%n_v*wf%n_o, &
         t_vovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X398, &
         wf%n_o)
!
      call mem%dealloc(X397)
      call mem%alloc(X399, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X398, X399, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X398)
      call mem%alloc(X400, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X399, &
         wf%n_o, &
         zero, &
         X400, &
         wf%n_v)
!
      call mem%dealloc(X399)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X400, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X400)
      call mem%alloc(X401, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X401, wf%n_v, wf%n_o)
      call mem%alloc(X402, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         gxIxx_oov, &
         wf%n_o, &
         X401, 1, &
         zero, &
         X402, 1)
!
      call mem%dealloc(X401)
      call mem%alloc(X403, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         t_vovo, &
         wf%n_v**2*wf%n_o, &
         X402, 1, &
         zero, &
         X403, 1)
!
      call mem%dealloc(X402)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X403, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X403)
      call mem%alloc(X404, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X404, wf%n_v, wf%n_o)
      call mem%alloc(X405, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         gxIxx_oov, &
         wf%n_o, &
         X404, 1, &
         zero, &
         X405, 1)
!
      call mem%dealloc(X404)
      call mem%alloc(X406, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         t_vovo, &
         wf%n_v**2*wf%n_o, &
         X405, 1, &
         zero, &
         X406, 1)
!
      call mem%dealloc(X405)
      call mem%alloc(X407, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X406, 1, &
         xAx_o, 1, &
         X407, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X406)
      call add_1432_to_1234(one, X407, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X407)
      call mem%alloc(X408, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         gxIxx_oov, &
         wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X408, &
         wf%n_o**2)
!
      call mem%alloc(X409, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(t_vovo, X409, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X410, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X409, &
         wf%n_v**2, &
         X408, &
         wf%n_o**2, &
         zero, &
         X410, &
         wf%n_v**2)
!
      call mem%dealloc(X408)
      call mem%dealloc(X409)
      call mem%alloc(X411, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X410, X411, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X410)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X411, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X411)
      call mem%alloc(X412, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X412, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X413, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(t_vovo, X413, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X414, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X412, &
         wf%n_v*wf%n_o, &
         X413, &
         wf%n_v*wf%n_o, &
         zero, &
         X414, &
         wf%n_o)
!
      call mem%dealloc(X412)
      call mem%dealloc(X413)
      call mem%alloc(X415, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X414, X415, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X414)
      call mem%alloc(X416, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X415, &
         wf%n_o, &
         zero, &
         X416, &
         wf%n_v)
!
      call mem%dealloc(X415)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X416, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X416)
      call mem%alloc(X417, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X417, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X418, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X417, &
         wf%n_o, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X418, &
         wf%n_o)
!
      call mem%dealloc(X417)
      call mem%alloc(X419, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X418, X419, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X418)
      call mem%alloc(X420, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X419, &
         wf%n_o, &
         zero, &
         X420, &
         wf%n_v)
!
      call mem%dealloc(X419)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X420, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X420)
      call mem%alloc(X421, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X421, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X422, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X421, &
         wf%n_o, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X422, &
         wf%n_o)
!
      call mem%dealloc(X421)
      call mem%alloc(X423, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X422, X423, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X422)
      call mem%alloc(X424, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X423, &
         wf%n_o, &
         zero, &
         X424, &
         wf%n_v)
!
      call mem%dealloc(X423)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X424, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X424)
      call mem%alloc(X425, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_312(gxIxx_oov, X425, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X426, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         X425, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X426, &
         wf%n_o)
!
      call mem%dealloc(X425)
      call mem%alloc(X427, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X426, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X427, &
         wf%n_v)
!
      call mem%dealloc(X426)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X427, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X427)
      call mem%alloc(X428, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_312(gxIxx_oov, X428, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X429, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X428, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X429, &
         wf%n_o)
!
      call mem%dealloc(X428)
      call mem%alloc(X430, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X429, &
         wf%n_o, &
         zero, &
         X430, &
         wf%n_v**2)
!
      call mem%dealloc(X429)
      call mem%alloc(X431, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X430, X431, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X430)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X431, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X431)
      call mem%alloc(X432, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X432, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X433, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X432, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X433, &
         wf%n_o)
!
      call mem%dealloc(X432)
      call mem%alloc(X434, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X433, &
         wf%n_o, &
         zero, &
         X434, &
         wf%n_v**2)
!
      call mem%dealloc(X433)
      call mem%alloc(X435, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X434, X435, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X434)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X435, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X435)
      call mem%alloc(X436, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_312(gxIxx_oov, X436, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X437, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         X436, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X437, &
         wf%n_o)
!
      call mem%dealloc(X436)
      call mem%alloc(X438, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X437, &
         wf%n_o, &
         zero, &
         X438, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X437)
      call mem%alloc(X439, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X438, 1, &
         xAx_o, 1, &
         X439, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X438)
      call add_1432_to_1234(one, X439, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X439)
      call mem%alloc(X440, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X440, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X441, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         X440, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X441, &
         wf%n_o)
!
      call mem%dealloc(X440)
      call mem%alloc(X442, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X441, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X442, &
         wf%n_v)
!
      call mem%dealloc(X441)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X442, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X442)
      call mem%alloc(X443, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X443, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X444, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o**2, &
         -one, &
         gxIxx_oov, &
         wf%n_o**2, &
         X443, &
         wf%n_o**2, &
         zero, &
         X444, &
         wf%n_v)
!
      call mem%dealloc(X443)
      call mem%alloc(X445, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X444, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X445, &
         wf%n_v)
!
      call mem%dealloc(X444)
      call mem%alloc(X446, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X445, X446, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X445)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X446, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X446)
      call mem%alloc(X447, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X447, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X448, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         X447, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X448, &
         wf%n_o)
!
      call mem%dealloc(X447)
      call mem%alloc(X449, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X448, &
         wf%n_o, &
         zero, &
         X449, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X448)
      call mem%alloc(X450, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X449, 1, &
         xAx_o, 1, &
         X450, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X449)
      call add_1432_to_1234(one, X450, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X450)
      call mem%alloc(X451, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(tAxxx_ovo, X451, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X452, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o**2, &
         -one, &
         gxIxx_oov, &
         wf%n_o**2, &
         X451, &
         wf%n_o**2, &
         zero, &
         X452, &
         wf%n_v)
!
      call mem%dealloc(X451)
      call mem%alloc(X453, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X452, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X453, &
         wf%n_v)
!
      call mem%dealloc(X452)
      call mem%alloc(X454, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X453, X454, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X453)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X454, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X454)
      call mem%alloc(X455, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X455, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X456, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X455, &
         wf%n_o, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X456, &
         wf%n_o)
!
      call mem%dealloc(X455)
      call mem%alloc(X457, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X456, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X457, &
         wf%n_v)
!
      call mem%dealloc(X456)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X457, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X457)
      call mem%alloc(X458, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X458, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X459, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X458, &
         wf%n_o, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X459, &
         wf%n_o)
!
      call mem%dealloc(X458)
      call mem%alloc(X460, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X459, &
         wf%n_o, &
         zero, &
         X460, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X459)
      call mem%alloc(X461, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X460, 1, &
         xAx_o, 1, &
         X461, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X460)
      call add_1432_to_1234(one, X461, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X461)
      call mem%alloc(X462, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X462, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X463, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         gxIxx_oov, &
         wf%n_o**2, &
         X462, &
         wf%n_o**2, &
         zero, &
         X463, &
         wf%n_v)
!
      call mem%dealloc(X462)
      call mem%alloc(X464, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X463, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X464, &
         wf%n_v)
!
      call mem%dealloc(X463)
      call mem%alloc(X465, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X464, 1, &
         xAx_o, 1, &
         X465, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X464)
      call add_1342_to_1234(one, X465, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X465)
      call mem%alloc(X466, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(tAxxx_ovo, X466, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X467, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         gxIxx_oov, &
         wf%n_o**2, &
         X466, &
         wf%n_o**2, &
         zero, &
         X467, &
         wf%n_v)
!
      call mem%dealloc(X466)
      call mem%alloc(X468, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X467, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X468, &
         wf%n_v)
!
      call mem%dealloc(X467)
      call mem%alloc(X469, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X468, 1, &
         xAx_o, 1, &
         X469, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X468)
      call add_1342_to_1234(one, X469, omega_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X469)
      call mem%alloc(X470, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X470, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X471, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X470, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X471, &
         wf%n_o)
!
      call mem%dealloc(X470)
      call mem%alloc(X472, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X471, &
         wf%n_o, &
         zero, &
         X472, &
         wf%n_v**2)
!
      call mem%dealloc(X471)
      call mem%alloc(X473, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X472, X473, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X472)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X473, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X473)
      call mem%alloc(X474, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X474, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X475, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         gxIxx_oov, &
         wf%n_o**2, &
         X474, &
         wf%n_o**2, &
         zero, &
         X475, &
         wf%n_v)
!
      call mem%dealloc(X474)
      call mem%alloc(X476, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(txIxx_vvo, X476, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X477, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X475, &
         wf%n_v, &
         X476, &
         wf%n_v*wf%n_o, &
         zero, &
         X477, &
         wf%n_v)
!
      call mem%dealloc(X475)
      call mem%dealloc(X476)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X477, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X477)
      call mem%alloc(X478, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_312(gxIxx_oov, X478, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X479, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X478, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X479, &
         wf%n_o)
!
      call mem%dealloc(X478)
      call mem%alloc(X480, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X479, &
         wf%n_o, &
         zero, &
         X480, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X479)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X480, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X480)
      call mem%alloc(X481, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X481, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X482, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X481, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X482, &
         wf%n_o)
!
      call mem%dealloc(X481)
      call mem%alloc(X483, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X483, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X484, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X483, &
         wf%n_v**2, &
         X482, &
         wf%n_o, &
         zero, &
         X484, &
         wf%n_v**2)
!
      call mem%dealloc(X482)
      call mem%dealloc(X483)
      call mem%alloc(X485, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X484, X485, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X484)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X485, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X485)
      call mem%alloc(X486, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X486, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X487, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X486, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X487, &
         wf%n_o)
!
      call mem%dealloc(X486)
      call mem%alloc(X488, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X488, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X489, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X488, &
         wf%n_v**2, &
         X487, &
         wf%n_o, &
         zero, &
         X489, &
         wf%n_v**2)
!
      call mem%dealloc(X487)
      call mem%dealloc(X488)
      call mem%alloc(X490, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X489, X490, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X489)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X490, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X490)
      call mem%alloc(X491, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X491, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X492, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X491, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X492, &
         wf%n_o)
!
      call mem%dealloc(X491)
      call mem%alloc(X493, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X492, &
         wf%n_o, &
         zero, &
         X493, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X492)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X493, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X493)
      call mem%alloc(X494, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X494, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X495, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         X494, &
         wf%n_o, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X495, &
         wf%n_o)
!
      call mem%dealloc(X494)
      call mem%alloc(X496, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X495, &
         wf%n_o, &
         zero, &
         X496, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X495)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X496, 1, &
         xAx_o, 1, &
         omega_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X496)
!
   end subroutine omega_mu2_3_1_s_doublet_ccsd

