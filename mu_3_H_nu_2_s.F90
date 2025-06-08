   subroutine mu_4_H_nu_2_s_doublet_ccsd(wf, rho_aibj, FAx_o, FxI_v, LAIxx_oo, LAIxx_vv, LAxxx_vov, LAxxx_vvo, L_ooov, L_vooo, L_vvov, LxIxx_oov, LxIxx_voo, LxxxI_voo, gAxxx_ooo, gAxxx_ovv, gAxxx_vov, gAxxx_vvo, g_ooov, g_vovv, g_vvov, gxIxx_oov, gxIxx_vvv, rAIxx_vo, rAxxI_ov, rAxxx_ovo, r_vovo, rxIxx_vvo, rxxxI_vov, uAIxx_vo, uAxxx_ovo, u_aibj, uxIxx_vvo, uxxxI_vov)
!!
!! Generated function
!!
      implicit none
!
      class(doublet_ccsd), intent(in) :: wf
!
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(inout) :: rho_aibj
!
      real(dp), dimension(wf%n_o), intent(in) :: FAx_o
      real(dp), dimension(wf%n_v), intent(in) :: FxI_v
      real(dp), dimension(wf%n_o,wf%n_o), intent(in) :: LAIxx_oo
      real(dp), dimension(wf%n_o,wf%n_v), intent(in) :: rAxxI_ov
      real(dp), dimension(wf%n_v,wf%n_o), intent(in) :: rAIxx_vo, uAIxx_vo
      real(dp), dimension(wf%n_v,wf%n_v), intent(in) :: LAIxx_vv
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_o), intent(in) :: gAxxx_ooo
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_v), intent(in) :: LxIxx_oov, gxIxx_oov
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o), intent(in) :: rAxxx_ovo, uAxxx_ovo
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_v), intent(in) :: gAxxx_ovv
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_o), intent(in) :: LxIxx_voo, LxxxI_voo
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v), intent(in) :: LAxxx_vov, gAxxx_vov, rxxxI_vov, uxxxI_vov
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_o), intent(in) :: LAxxx_vvo, gAxxx_vvo, rxIxx_vvo, uxIxx_vvo
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_v), intent(in) :: gxIxx_vvv
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_o,wf%n_v), intent(in) :: L_ooov, g_ooov
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_o,wf%n_o), intent(in) :: L_vooo
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(in) :: r_vovo, u_aibj
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_v), intent(in) :: g_vovv
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_o,wf%n_v), intent(in) :: L_vvov, g_vvov
!
      real(dp), dimension(:), allocatable :: X66, X70, X83, X86, X343, X354, X429, X475, X523, X526, X570, X574
      real(dp), dimension(:,:), allocatable :: X2, X37, X38, X41, X43, X46, X47, X48, X49, X51, X52, X55, X56, X57, X58, X59, X61, X64, X65, X69, X82, X85, X99, X100, X106, X107, X124, X125, X131, X132, X150, X151, X154, X155, X161, X164, X232, X234, X243, X255, X264, X266, X270, X273, X288, X291, X305, X308, X309, X324, X325, X328, X329, X491, X493, X497, X500, X512, X516, X541, X543, X545, X549, X552, X555
      real(dp), dimension(:,:,:), allocatable :: X6, X15, X16, X18, X22, X24, X26, X29, X30, X33, X35, X67, X71, X72, X74, X75, X77, X78, X79, X80, X84, X88, X89, X91, X92, X93, X94, X96, X97, X167, X168, X169, X170, X172, X173, X174, X175, X178, X179, X181, X182, X183, X185, X186, X187, X188, X189, X192, X193, X194, X195, X196, X197, X199, X200, X201, X202, X205, X206, X208, X209, X212, X213, X214, X215, X216, X217, X220, X221, X222, X223, X224, X227, X228, X229, X230, X231, X233, X237, X238, X239, X240, X242, X244, X245, X246, X247, X250, X251, X252, X253, X254, X258, X259, X260, X261, X263, X265, X342, X345, X346, X348, X349, X350, X351, X353, X355, X356, X357, X358, X361, X362, X363, X365, X368, X369, X371, X372, X373, X376, X379, X380, X381, X384, X385, X386, X387, X389, X390, X391, X394, X395, X396, X398, X399, X402, X403, X405, X408, X410, X411, X413, X414, X416, X417, X418, X419, X421, X422, X423, X425, X426, X431, X432, X435, X438, X439, X440, X443, X444, X445, X446, X447, X448, X451, X452, X454, X455, X456, X458, X459, X461, X462, X463, X465, X466, X467, X470, X471, X472, X478, X479, X482, X483, X485, X487, X488, X490, X492, X496, X499, X504, X505, X507, X509, X511, X515, X520, X522, X524, X525, X528, X530, X532, X533, X534, X537, X538, X540, X542, X544, X548, X551, X554, X558, X562, X564, X567, X569, X571, X573, X575, X576, X578, X580, X582
      real(dp), dimension(:,:,:,:), allocatable :: X1, X3, X4, X5, X7, X8, X9, X10, X11, X12, X13, X14, X17, X19, X20, X21, X23, X25, X27, X28, X31, X32, X34, X36, X39, X40, X42, X44, X45, X50, X53, X54, X60, X62, X63, X68, X73, X76, X81, X87, X90, X95, X98, X101, X102, X103, X104, X105, X108, X109, X110, X111, X112, X113, X114, X115, X116, X117, X118, X119, X120, X121, X122, X123, X126, X127, X128, X129, X130, X133, X134, X135, X136, X137, X138, X139, X140, X141, X142, X143, X144, X145, X146, X147, X148, X149, X152, X153, X156, X157, X158, X159, X160, X162, X163, X165, X166, X171, X176, X177, X180, X184, X190, X191, X198, X203, X204, X207, X210, X211, X218, X219, X225, X226, X235, X236, X241, X248, X249, X256, X257, X262, X267, X268, X269, X271, X272, X274, X275, X276, X277, X278, X279, X280, X281, X282, X283, X284, X285, X286, X287, X289, X290, X292, X293, X294, X295, X296, X297, X298, X299, X300, X301, X302, X303, X304, X306, X307, X310, X311, X312, X313, X314, X315, X316, X317, X318, X319, X320, X321, X322, X323, X326, X327, X330, X331, X332, X333, X334, X335, X336, X337, X338, X339, X340, X341, X344, X347, X352, X359, X360, X364, X366, X367, X370, X374, X375, X377, X378, X382, X383, X388, X392, X393, X397, X400, X401, X404, X406, X407, X409, X412, X415, X420, X424, X427, X428, X430, X433, X434, X436, X437, X441, X442, X449, X450, X453, X457, X460, X464, X468, X469, X473, X474, X476, X477, X480, X481, X484, X486, X489, X494, X495, X498, X501, X502, X503, X506, X508, X510, X513, X514, X517, X518, X519, X521, X527, X529, X531, X535, X536, X539, X546, X547, X550, X553, X556, X557, X559, X560, X561, X563, X565, X566, X568, X572, X577, X579, X581, X583, X584, X585
!
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         four, &
         wf%fock_ai, 1, &
         rAIxx_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X1, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         wf%fock_ai, 1, &
         rAIxx_vo, 1, &
         X1, &
         wf%n_v*wf%n_o)
!
      call add_1432_to_1234(one, X1, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1)
      call mem%alloc(X2, wf%n_v, wf%n_o)
      call sort_to_21(rAxxI_ov, X2, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         wf%fock_ai, 1, &
         X2, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2)
      call mem%alloc(X3, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         wf%fock_ai, 1, &
         rAxxI_ov, 1, &
         X3, &
         wf%n_v*wf%n_o)
!
      call add_1423_to_1234(one, X3, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X3)
      call mem%alloc(X4, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         -two, &
         rxIxx_vvo, 1, &
         FAx_o, 1, &
         X4, &
         wf%n_v**2*wf%n_o)
!
      call add_1342_to_1234(one, X4, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X4)
      call mem%alloc(X5, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         rxxxI_vov, 1, &
         FAx_o, 1, &
         X5, &
         wf%n_v**2*wf%n_o)
!
      call add_1432_to_1234(one, X5, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X5)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         -two, &
         FxI_v, 1, &
         rAxxx_ovo, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%alloc(X6, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_321(rAxxx_ovo, X6, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         FxI_v, 1, &
         X6, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X6)
      call mem%alloc(X7, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1243(L_vooo, X7, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X8, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         -two, &
         X7, &
         wf%n_v*wf%n_o**2, &
         rAIxx_vo, &
         wf%n_v, &
         zero, &
         X8, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X7)
      call add_1243_to_1234(one, X8, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X8)
      call mem%alloc(X9, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1243(L_vooo, X9, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X10, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X9, &
         wf%n_v*wf%n_o**2, &
         rAxxI_ov, &
         wf%n_o, &
         zero, &
         X10, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X9)
      call add_1243_to_1234(one, X10, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X10)
      call mem%alloc(X11, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -one, &
         LAIxx_vv, &
         wf%n_v, &
         r_vovo, &
         wf%n_v, &
         zero, &
         X11, &
         wf%n_v)
!
      call add_1432_to_1234(one, X11, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X11)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         two, &
         LAIxx_vv, &
         wf%n_v, &
         r_vovo, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%alloc(X12, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         r_vovo, &
         wf%n_v**2*wf%n_o, &
         LAIxx_oo, &
         wf%n_o, &
         zero, &
         X12, &
         wf%n_v**2*wf%n_o)
!
      call add_1432_to_1234(one, X12, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X12)
      call mem%alloc(X13, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(r_vovo, X13, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X14, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         -two, &
         X13, &
         wf%n_v**2*wf%n_o, &
         LAIxx_oo, &
         wf%n_o, &
         zero, &
         X14, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X13)
      call add_1342_to_1234(one, X14, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X14)
      call mem%alloc(X15, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(rxIxx_vvo, X15, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -one, &
         LAxxx_vvo, &
         wf%n_v, &
         X15, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X15)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         LAxxx_vvo, &
         wf%n_v, &
         rxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X16, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(LxIxx_voo, X16, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X17, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X16, &
         wf%n_v*wf%n_o, &
         rAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X17, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X16)
      call add_1423_to_1234(one, X17, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X17)
      call mem%alloc(X18, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(rAxxx_ovo, X18, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         LxxxI_voo, &
         wf%n_v*wf%n_o, &
         X18, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X18)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         -two, &
         LxxxI_voo, &
         wf%n_v*wf%n_o, &
         rAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X19, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         LxxxI_voo, &
         wf%n_v*wf%n_o, &
         rAxxx_ovo, &
         wf%n_o, &
         zero, &
         X19, &
         wf%n_v*wf%n_o)
!
      call add_1432_to_1234(one, X19, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X19)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         four, &
         g_vovv, &
         wf%n_v**2*wf%n_o, &
         rAIxx_vo, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%alloc(X20, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         g_vovv, &
         wf%n_v**2*wf%n_o, &
         rAIxx_vo, &
         wf%n_v, &
         zero, &
         X20, &
         wf%n_v**2*wf%n_o)
!
      call add_1432_to_1234(one, X20, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X20)
!
      call dgemm('N', 'T', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         g_vovv, &
         wf%n_v**2*wf%n_o, &
         rAxxI_ov, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%alloc(X21, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         g_vovv, &
         wf%n_v**2*wf%n_o, &
         rAxxI_ov, &
         wf%n_o, &
         zero, &
         X21, &
         wf%n_v**2*wf%n_o)
!
      call add_1432_to_1234(one, X21, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X21)
      call mem%alloc(X22, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(rxIxx_vvo, X22, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X23, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         X22, &
         wf%n_v*wf%n_o, &
         gAxxx_ovv, &
         wf%n_v*wf%n_o, &
         zero, &
         X23, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X22)
      call add_1423_to_1234(one, X23, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X23)
      call mem%alloc(X24, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(gAxxx_ooo, X24, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X25, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         two, &
         rxIxx_vvo, &
         wf%n_v**2, &
         X24, &
         wf%n_o**2, &
         zero, &
         X25, &
         wf%n_v**2)
!
      call mem%dealloc(X24)
      call add_1324_to_1234(one, X25, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X25)
      call mem%alloc(X26, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(rxIxx_vvo, X26, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X27, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         gAxxx_vvo, &
         wf%n_v, &
         X26, &
         wf%n_v*wf%n_o, &
         zero, &
         X27, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X26)
      call add_1432_to_1234(one, X27, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X27)
      call mem%alloc(X28, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         rxxxI_vov, &
         wf%n_v*wf%n_o, &
         gAxxx_ovv, &
         wf%n_v*wf%n_o, &
         zero, &
         X28, &
         wf%n_v*wf%n_o)
!
      call add_1423_to_1234(one, X28, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X28)
      call mem%alloc(X29, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(gAxxx_ooo, X29, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X30, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(rxxxI_vov, X30, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X31, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         -one, &
         X30, &
         wf%n_v**2, &
         X29, &
         wf%n_o**2, &
         zero, &
         X31, &
         wf%n_v**2)
!
      call mem%dealloc(X29)
      call mem%dealloc(X30)
      call add_1324_to_1234(one, X31, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X31)
      call mem%alloc(X32, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         gAxxx_vvo, &
         wf%n_v, &
         rxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X32, &
         wf%n_v*wf%n_o)
!
      call add_1432_to_1234(one, X32, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X32)
      call mem%alloc(X33, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(rAxxx_ovo, X33, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X34, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_v, &
         -two, &
         gxIxx_vvv, &
         wf%n_v**2, &
         X33, &
         wf%n_o**2, &
         zero, &
         X34, &
         wf%n_v**2)
!
      call mem%dealloc(X33)
      call add_1324_to_1234(one, X34, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X34)
      call mem%alloc(X35, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(rAxxx_ovo, X35, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X36, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         gxIxx_vvv, &
         wf%n_v**2, &
         X35, &
         wf%n_o**2, &
         zero, &
         X36, &
         wf%n_v**2)
!
      call mem%dealloc(X35)
      call add_1342_to_1234(one, X36, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X36)
      call mem%alloc(X37, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X37, &
         wf%n_o)
!
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         r_vovo, &
         wf%n_v**2*wf%n_o, &
         X37, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X37)
      call mem%alloc(X38, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X38, &
         wf%n_v)
!
      call mem%alloc(X39, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1243(r_vovo, X39, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X40, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X39, &
         wf%n_v*wf%n_o**2, &
         X38, &
         wf%n_v, &
         zero, &
         X40, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X38)
      call mem%dealloc(X39)
      call add_1243_to_1234(one, X40, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X40)
      call mem%alloc(X41, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X41, &
         wf%n_o)
!
      call mem%alloc(X42, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         r_vovo, &
         wf%n_v**2*wf%n_o, &
         X41, &
         wf%n_o, &
         zero, &
         X42, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X41)
      call add_1432_to_1234(one, X42, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X42)
      call mem%alloc(X43, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X43, &
         wf%n_v)
!
      call mem%alloc(X44, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1243(r_vovo, X44, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X45, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X44, &
         wf%n_v*wf%n_o**2, &
         X43, &
         wf%n_v, &
         zero, &
         X45, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X43)
      call mem%dealloc(X44)
      call add_1423_to_1234(one, X45, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X45)
      call mem%alloc(X46, wf%n_v, wf%n_o)
      call sort_to_21(wf%fock_ia, X46, wf%n_o, wf%n_v)
      call mem%alloc(X47, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         four, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X46, 1, &
         zero, &
         X47, 1)
!
      call mem%dealloc(X46)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         rAIxx_vo, 1, &
         X47, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X47)
      call mem%alloc(X48, wf%n_v, wf%n_o)
      call sort_to_21(wf%fock_ia, X48, wf%n_o, wf%n_v)
      call mem%alloc(X49, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X48, 1, &
         zero, &
         X49, 1)
!
      call mem%dealloc(X48)
      call mem%alloc(X50, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         rAIxx_vo, 1, &
         X49, 1, &
         X50, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X49)
      call add_1432_to_1234(one, X50, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X50)
      call mem%alloc(X51, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         rAIxx_vo, &
         wf%n_v, &
         zero, &
         X51, &
         wf%n_v)
!
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X51, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X51)
      call mem%alloc(X52, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         rAIxx_vo, &
         wf%n_v, &
         zero, &
         X52, &
         wf%n_o)
!
      call mem%alloc(X53, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X53, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X54, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X53, &
         wf%n_v**2*wf%n_o, &
         X52, &
         wf%n_o, &
         zero, &
         X54, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X52)
      call mem%dealloc(X53)
      call add_1342_to_1234(one, X54, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X54)
      call mem%alloc(X55, wf%n_v, wf%n_o)
      call sort_to_21(wf%fock_ia, X55, wf%n_o, wf%n_v)
      call mem%alloc(X56, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X55, 1, &
         zero, &
         X56, 1)
!
      call mem%dealloc(X55)
      call mem%alloc(X57, wf%n_v, wf%n_o)
      call sort_to_21(rAxxI_ov, X57, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X57, 1, &
         X56, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X56)
      call mem%dealloc(X57)
      call mem%alloc(X58, wf%n_v, wf%n_o)
      call sort_to_21(wf%fock_ia, X58, wf%n_o, wf%n_v)
      call mem%alloc(X59, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X58, 1, &
         zero, &
         X59, 1)
!
      call mem%dealloc(X58)
      call mem%alloc(X60, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X59, 1, &
         rAxxI_ov, 1, &
         X60, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X59)
      call add_1423_to_1234(one, X60, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X60)
      call mem%alloc(X61, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         rAxxI_ov, &
         wf%n_o, &
         zero, &
         X61, &
         wf%n_o)
!
      call mem%alloc(X62, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X62, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X63, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X62, &
         wf%n_v**2*wf%n_o, &
         X61, &
         wf%n_o, &
         zero, &
         X63, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X61)
      call mem%dealloc(X62)
      call add_1342_to_1234(one, X63, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X63)
      call mem%alloc(X64, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         rAxxI_ov, &
         wf%n_o, &
         zero, &
         X64, &
         wf%n_v)
!
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X64, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X64)
      call mem%alloc(X65, wf%n_v, wf%n_o)
      call sort_to_21(wf%fock_ia, X65, wf%n_o, wf%n_v)
      call mem%alloc(X66, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         uxIxx_vvo, &
         wf%n_v, &
         X65, 1, &
         zero, &
         X66, 1)
!
      call mem%dealloc(X65)
      call mem%alloc(X67, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(rAxxx_ovo, X67, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X68, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X67, 1, &
         X66, 1, &
         X68, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X66)
      call mem%dealloc(X67)
      call add_1243_to_1234(one, X68, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X68)
      call mem%alloc(X69, wf%n_v, wf%n_o)
      call sort_to_21(wf%fock_ia, X69, wf%n_o, wf%n_v)
      call mem%alloc(X70, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         uxIxx_vvo, &
         wf%n_v, &
         X69, 1, &
         zero, &
         X70, 1)
!
      call mem%dealloc(X69)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         X70, 1, &
         rAxxx_ovo, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X70)
      call mem%alloc(X71, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X71, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X72, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         X71, &
         wf%n_v*wf%n_o, &
         zero, &
         X72, &
         wf%n_o)
!
      call mem%dealloc(X71)
      call mem%alloc(X73, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X72, &
         wf%n_o, &
         rAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X73, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X72)
      call add_1423_to_1234(one, X73, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X73)
      call mem%alloc(X74, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(rAxxx_ovo, X74, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X75, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         X74, &
         wf%n_o**2, &
         zero, &
         X75, &
         wf%n_o)
!
      call mem%dealloc(X74)
      call mem%alloc(X76, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         uxIxx_vvo, &
         wf%n_v**2, &
         X75, &
         wf%n_o, &
         zero, &
         X76, &
         wf%n_v**2)
!
      call mem%dealloc(X75)
      call add_1324_to_1234(one, X76, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X76)
      call mem%alloc(X77, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X77, &
         wf%n_o)
!
      call mem%alloc(X78, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(rAxxx_ovo, X78, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X78, &
         wf%n_v*wf%n_o, &
         X77, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X77)
      call mem%dealloc(X78)
      call mem%alloc(X79, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X79, &
         wf%n_o)
!
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         rAxxx_ovo, &
         wf%n_o, &
         X79, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X79)
      call mem%alloc(X80, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X80, &
         wf%n_o)
!
      call mem%alloc(X81, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         rAxxx_ovo, &
         wf%n_o, &
         X80, &
         wf%n_o, &
         zero, &
         X81, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X80)
      call add_1432_to_1234(one, X81, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X81)
      call mem%alloc(X82, wf%n_v, wf%n_o)
      call sort_to_21(wf%fock_ia, X82, wf%n_o, wf%n_v)
      call mem%alloc(X83, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X82, 1, &
         zero, &
         X83, 1)
!
      call mem%dealloc(X82)
      call mem%alloc(X84, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(rxIxx_vvo, X84, wf%n_v, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X84, 1, &
         X83, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X83)
      call mem%dealloc(X84)
      call mem%alloc(X85, wf%n_v, wf%n_o)
      call sort_to_21(wf%fock_ia, X85, wf%n_o, wf%n_v)
      call mem%alloc(X86, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         uAxxx_ovo, &
         wf%n_o, &
         X85, 1, &
         zero, &
         X86, 1)
!
      call mem%dealloc(X85)
      call mem%alloc(X87, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         rxIxx_vvo, 1, &
         X86, 1, &
         X87, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X86)
      call add_1342_to_1234(one, X87, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X87)
      call mem%alloc(X88, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X88, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X89, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         X88, &
         wf%n_o**2, &
         zero, &
         X89, &
         wf%n_o)
!
      call mem%dealloc(X88)
      call mem%alloc(X90, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         rxIxx_vvo, &
         wf%n_v**2, &
         X89, &
         wf%n_o, &
         zero, &
         X90, &
         wf%n_v**2)
!
      call mem%dealloc(X89)
      call add_1324_to_1234(one, X90, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X90)
      call mem%alloc(X91, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(rxIxx_vvo, X91, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X92, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         X91, &
         wf%n_v*wf%n_o, &
         zero, &
         X92, &
         wf%n_o)
!
      call mem%dealloc(X91)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X92, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X92)
      call mem%alloc(X93, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(rxIxx_vvo, X93, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X94, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         X93, &
         wf%n_v*wf%n_o, &
         zero, &
         X94, &
         wf%n_o)
!
      call mem%dealloc(X93)
      call mem%alloc(X95, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X94, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X95, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X94)
      call add_1423_to_1234(one, X95, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X95)
      call mem%alloc(X96, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         rxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X96, &
         wf%n_o)
!
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X96, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X96)
      call mem%alloc(X97, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         wf%fock_ia, &
         wf%n_o, &
         rxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X97, &
         wf%n_o)
!
      call mem%alloc(X98, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X97, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X98, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X97)
      call add_1432_to_1234(one, X98, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X98)
      call mem%alloc(X99, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X99, wf%n_v, wf%n_o)
      call mem%alloc(X100, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -one, &
         L_vvov, &
         wf%n_v**2, &
         X99, 1, &
         zero, &
         X100, 1)
!
      call mem%dealloc(X99)
      call mem%alloc(X101, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X100, &
         wf%n_v, &
         r_vovo, &
         wf%n_v, &
         zero, &
         X101, &
         wf%n_v)
!
      call mem%dealloc(X100)
      call add_1432_to_1234(one, X101, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X101)
      call mem%alloc(X102, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(L_vvov, X102, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X103, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         X102, &
         wf%n_v**2*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X103, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X102)
      call mem%alloc(X104, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(X103, X104, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X103)
      call mem%alloc(X105, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X104, &
         wf%n_v*wf%n_o, &
         r_vovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X105, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X104)
      call add_1432_to_1234(one, X105, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X105)
      call mem%alloc(X106, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X106, wf%n_v, wf%n_o)
      call mem%alloc(X107, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         two, &
         L_vvov, &
         wf%n_v**2, &
         X106, 1, &
         zero, &
         X107, 1)
!
      call mem%dealloc(X106)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X107, &
         wf%n_v, &
         r_vovo, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X107)
      call mem%alloc(X108, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(L_vvov, X108, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X109, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         X108, &
         wf%n_v**2*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X109, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X108)
      call mem%alloc(X110, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(X109, X110, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X109)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X110, &
         wf%n_v*wf%n_o, &
         r_vovo, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X110)
      call mem%alloc(X111, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         L_vvov, &
         wf%n_v**2*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X111, &
         wf%n_v**2*wf%n_o)
!
      call mem%alloc(X112, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1432(X111, X112, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X111)
      call mem%alloc(X113, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(r_vovo, X113, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X114, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X112, &
         wf%n_v*wf%n_o, &
         X113, &
         wf%n_v*wf%n_o, &
         zero, &
         X114, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X112)
      call mem%dealloc(X113)
      call add_1432_to_1234(one, X114, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X114)
      call mem%alloc(X115, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(L_vvov, X115, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X116, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         X115, &
         wf%n_v**2*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X116, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X115)
      call mem%alloc(X117, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(X116, X117, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X116)
      call mem%alloc(X118, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(r_vovo, X118, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X117, &
         wf%n_v*wf%n_o, &
         X118, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X117)
      call mem%dealloc(X118)
      call mem%alloc(X119, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(L_vvov, X119, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X120, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(r_vovo, X120, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X121, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v**2, &
         -one, &
         X119, &
         wf%n_v*wf%n_o, &
         X120, &
         wf%n_v**2, &
         zero, &
         X121, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X119)
      call mem%dealloc(X120)
      call mem%alloc(X122, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X121, X122, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X121)
      call mem%alloc(X123, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X122, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X123, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X122)
      call add_1243_to_1234(one, X123, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X123)
      call mem%alloc(X124, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X124, wf%n_v, wf%n_o)
      call mem%alloc(X125, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         one, &
         L_ooov, &
         wf%n_o**2, &
         X124, 1, &
         zero, &
         X125, 1)
!
      call mem%dealloc(X124)
      call mem%alloc(X126, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         r_vovo, &
         wf%n_v**2*wf%n_o, &
         X125, &
         wf%n_o, &
         zero, &
         X126, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X125)
      call add_1432_to_1234(one, X126, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X126)
      call mem%alloc(X127, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(L_ooov, X127, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X128, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         one, &
         r_vovo, &
         wf%n_v*wf%n_o, &
         X127, &
         wf%n_o**2, &
         zero, &
         X128, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X127)
      call mem%alloc(X129, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1243(X128, X129, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X128)
      call mem%alloc(X130, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X129, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X130, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X129)
      call add_1423_to_1234(one, X130, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X130)
      call mem%alloc(X131, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X131, wf%n_v, wf%n_o)
      call mem%alloc(X132, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -two, &
         L_ooov, &
         wf%n_o**2, &
         X131, 1, &
         zero, &
         X132, 1)
!
      call mem%dealloc(X131)
      call mem%alloc(X133, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(r_vovo, X133, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X134, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X133, &
         wf%n_v**2*wf%n_o, &
         X132, &
         wf%n_o, &
         zero, &
         X134, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X132)
      call mem%dealloc(X133)
      call add_1342_to_1234(one, X134, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X134)
      call mem%alloc(X135, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**3, &
         wf%n_o, &
         wf%n_v, &
         one, &
         L_ooov, &
         wf%n_o**3, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X135, &
         wf%n_o**3)
!
      call mem%alloc(X136, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1324(X135, X136, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X135)
      call mem%alloc(X137, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(r_vovo, X137, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X138, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o**2, &
         one, &
         X137, &
         wf%n_v**2, &
         X136, &
         wf%n_o**2, &
         zero, &
         X138, &
         wf%n_v**2)
!
      call mem%dealloc(X136)
      call mem%dealloc(X137)
      call add_1324_to_1234(one, X138, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X138)
      call mem%alloc(X139, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(L_ooov, X139, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X140, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(r_vovo, X140, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X141, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         one, &
         X140, &
         wf%n_v*wf%n_o, &
         X139, &
         wf%n_v*wf%n_o, &
         zero, &
         X141, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X139)
      call mem%dealloc(X140)
      call mem%alloc(X142, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X141, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X142, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X141)
      call add_1423_to_1234(one, X142, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X142)
      call mem%alloc(X143, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(L_ooov, X143, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X144, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X143, &
         wf%n_o**2, &
         r_vovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X144, &
         wf%n_o**2)
!
      call mem%dealloc(X143)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X144, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X144)
      call mem%alloc(X145, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(r_vovo, X145, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X146, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         L_ooov, &
         wf%n_o**2, &
         X145, &
         wf%n_v*wf%n_o, &
         zero, &
         X146, &
         wf%n_o**2)
!
      call mem%dealloc(X145)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X146, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X146)
      call mem%alloc(X147, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(L_vvov, X147, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X148, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         X147, &
         wf%n_v**2*wf%n_o, &
         rAIxx_vo, &
         wf%n_v, &
         zero, &
         X148, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X147)
      call mem%alloc(X149, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(X148, X149, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X148)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X149, &
         wf%n_v*wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X149)
      call mem%alloc(X150, wf%n_o, wf%n_v)
      call sort_to_21(rAIxx_vo, X150, wf%n_v, wf%n_o)
      call mem%alloc(X151, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         two, &
         L_vvov, &
         wf%n_v**2, &
         X150, 1, &
         zero, &
         X151, 1)
!
      call mem%dealloc(X150)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X151, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X151)
      call mem%alloc(X152, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(L_ooov, X152, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X153, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X152, &
         wf%n_o**2, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X153, &
         wf%n_o**2)
!
      call mem%dealloc(X152)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         rAIxx_vo, &
         wf%n_v, &
         X153, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X153)
      call mem%alloc(X154, wf%n_o, wf%n_v)
      call sort_to_21(rAIxx_vo, X154, wf%n_v, wf%n_o)
      call mem%alloc(X155, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -two, &
         L_ooov, &
         wf%n_o**2, &
         X154, 1, &
         zero, &
         X155, 1)
!
      call mem%dealloc(X154)
      call mem%alloc(X156, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X156, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X157, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X156, &
         wf%n_v**2*wf%n_o, &
         X155, &
         wf%n_o, &
         zero, &
         X157, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X155)
      call mem%dealloc(X156)
      call add_1342_to_1234(one, X157, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X157)
      call mem%alloc(X158, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(L_vvov, X158, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X159, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         X158, &
         wf%n_v**2*wf%n_o, &
         rAxxI_ov, &
         wf%n_o, &
         zero, &
         X159, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X158)
      call mem%alloc(X160, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(X159, X160, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X159)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X160, &
         wf%n_v*wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X160)
      call mem%alloc(X161, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -one, &
         L_vvov, &
         wf%n_v**2, &
         rAxxI_ov, 1, &
         zero, &
         X161, 1)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X161, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X161)
      call mem%alloc(X162, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(L_ooov, X162, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X163, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X162, &
         wf%n_o**2, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X163, &
         wf%n_o**2)
!
      call mem%dealloc(X162)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         rAxxI_ov, &
         wf%n_o, &
         X163, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X163)
      call mem%alloc(X164, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         one, &
         L_ooov, &
         wf%n_o**2, &
         rAxxI_ov, 1, &
         zero, &
         X164, 1)
!
      call mem%alloc(X165, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X165, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X166, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X165, &
         wf%n_v**2*wf%n_o, &
         X164, &
         wf%n_o, &
         zero, &
         X166, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X164)
      call mem%dealloc(X165)
      call add_1342_to_1234(one, X166, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X166)
      call mem%alloc(X167, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X167, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X168, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         L_vvov, &
         wf%n_v**2, &
         X167, &
         wf%n_v, &
         zero, &
         X168, &
         wf%n_v**2)
!
      call mem%dealloc(X167)
      call mem%alloc(X169, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_132(X168, X169, wf%n_v, wf%n_v, wf%n_v)
      call mem%dealloc(X168)
      call mem%alloc(X170, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(rAxxx_ovo, X170, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X171, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X169, &
         wf%n_v**2, &
         X170, &
         wf%n_o**2, &
         zero, &
         X171, &
         wf%n_v**2)
!
      call mem%dealloc(X169)
      call mem%dealloc(X170)
      call add_1342_to_1234(one, X171, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X171)
      call mem%alloc(X172, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(rAxxx_ovo, X172, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X173, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         L_vvov, &
         wf%n_v**2, &
         X172, &
         wf%n_o, &
         zero, &
         X173, &
         wf%n_v**2)
!
      call mem%dealloc(X172)
      call mem%alloc(X174, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X173, X174, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X173)
      call mem%alloc(X175, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X175, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X176, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X174, &
         wf%n_v*wf%n_o, &
         X175, &
         wf%n_v*wf%n_o, &
         zero, &
         X176, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X174)
      call mem%dealloc(X175)
      call add_1432_to_1234(one, X176, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X176)
      call mem%alloc(X177, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(L_ooov, X177, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X178, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X177, &
         wf%n_o**2, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X178, &
         wf%n_o**2)
!
      call mem%dealloc(X177)
      call mem%alloc(X179, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(rAxxx_ovo, X179, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X180, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X179, &
         wf%n_v*wf%n_o, &
         X178, &
         wf%n_o, &
         zero, &
         X180, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X178)
      call mem%dealloc(X179)
      call add_1423_to_1234(one, X180, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X180)
      call mem%alloc(X181, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(rAxxx_ovo, X181, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X182, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         L_vvov, &
         wf%n_v**2, &
         X181, &
         wf%n_o, &
         zero, &
         X182, &
         wf%n_v**2)
!
      call mem%dealloc(X181)
      call mem%alloc(X183, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X182, X183, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X182)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X183, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X183)
      call mem%alloc(X184, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(L_vvov, X184, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X185, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X184, &
         wf%n_v**2, &
         rAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X185, &
         wf%n_v**2)
!
      call mem%dealloc(X184)
      call mem%alloc(X186, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X185, X186, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X185)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X186, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X186)
      call mem%alloc(X187, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(rAxxx_ovo, X187, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X188, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         L_ooov, &
         wf%n_o**2, &
         X187, &
         wf%n_o, &
         zero, &
         X188, &
         wf%n_o**2)
!
      call mem%dealloc(X187)
      call mem%alloc(X189, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X189, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X190, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X189, &
         wf%n_v**2, &
         X188, &
         wf%n_o, &
         zero, &
         X190, &
         wf%n_v**2)
!
      call mem%dealloc(X188)
      call mem%dealloc(X189)
      call add_1324_to_1234(one, X190, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X190)
      call mem%alloc(X191, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1324(L_ooov, X191, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X192, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(rAxxx_ovo, X192, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X193, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         one, &
         X192, &
         wf%n_o**2, &
         X191, &
         wf%n_o**2, &
         zero, &
         X193, &
         wf%n_v)
!
      call mem%dealloc(X191)
      call mem%dealloc(X192)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X193, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X193)
      call mem%alloc(X194, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X194, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X195, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         L_vvov, &
         wf%n_v**2, &
         X194, &
         wf%n_o, &
         zero, &
         X195, &
         wf%n_v**2)
!
      call mem%dealloc(X194)
      call mem%alloc(X196, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X195, X196, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X195)
      call mem%alloc(X197, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(rxIxx_vvo, X197, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X198, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X196, &
         wf%n_v*wf%n_o, &
         X197, &
         wf%n_v*wf%n_o, &
         zero, &
         X198, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X196)
      call mem%dealloc(X197)
      call add_1432_to_1234(one, X198, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X198)
      call mem%alloc(X199, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(rxIxx_vvo, X199, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X200, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         L_vvov, &
         wf%n_v**2, &
         X199, &
         wf%n_v, &
         zero, &
         X200, &
         wf%n_v**2)
!
      call mem%dealloc(X199)
      call mem%alloc(X201, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_132(X200, X201, wf%n_v, wf%n_v, wf%n_v)
      call mem%dealloc(X200)
      call mem%alloc(X202, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X202, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X203, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X201, &
         wf%n_v**2, &
         X202, &
         wf%n_o**2, &
         zero, &
         X203, &
         wf%n_v**2)
!
      call mem%dealloc(X201)
      call mem%dealloc(X202)
      call add_1342_to_1234(one, X203, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X203)
      call mem%alloc(X204, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(L_ooov, X204, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X205, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         one, &
         rxIxx_vvo, &
         wf%n_v, &
         X204, &
         wf%n_o**2, &
         zero, &
         X205, &
         wf%n_v)
!
      call mem%dealloc(X204)
      call mem%alloc(X206, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X205, X206, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X205)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X206, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X206)
      call mem%alloc(X207, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(L_ooov, X207, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X208, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X207, &
         wf%n_o**2, &
         rxIxx_vvo, &
         wf%n_v, &
         zero, &
         X208, &
         wf%n_o**2)
!
      call mem%dealloc(X207)
      call mem%alloc(X209, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(uAxxx_ovo, X209, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X210, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X209, &
         wf%n_v*wf%n_o, &
         X208, &
         wf%n_o, &
         zero, &
         X210, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X208)
      call mem%dealloc(X209)
      call add_1423_to_1234(one, X210, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X210)
      call mem%alloc(X211, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(L_vvov, X211, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X212, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(rxxxI_vov, X212, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X213, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         -one, &
         X211, &
         wf%n_v*wf%n_o, &
         X212, &
         wf%n_v**2, &
         zero, &
         X213, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X211)
      call mem%dealloc(X212)
      call mem%alloc(X214, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X213, X214, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X213)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X214, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X214)
      call mem%alloc(X215, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X215, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X216, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         L_ooov, &
         wf%n_o**2, &
         X215, &
         wf%n_o, &
         zero, &
         X216, &
         wf%n_o**2)
!
      call mem%dealloc(X215)
      call mem%alloc(X217, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(rxxxI_vov, X217, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X218, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X217, &
         wf%n_v**2, &
         X216, &
         wf%n_o, &
         zero, &
         X218, &
         wf%n_v**2)
!
      call mem%dealloc(X216)
      call mem%dealloc(X217)
      call add_1324_to_1234(one, X218, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X218)
      call mem%alloc(X219, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(L_ooov, X219, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X220, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         one, &
         rxxxI_vov, &
         wf%n_v, &
         X219, &
         wf%n_v*wf%n_o, &
         zero, &
         X220, &
         wf%n_v)
!
      call mem%dealloc(X219)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X220, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X220)
      call mem%alloc(X221, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(LAxxx_vov, X221, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X222, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X221, &
         wf%n_v, &
         r_vovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X222, &
         wf%n_v)
!
      call mem%dealloc(X221)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X222, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X222)
      call mem%alloc(X223, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(LAxxx_vov, X223, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X224, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X223, &
         wf%n_v, &
         r_vovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X224, &
         wf%n_v)
!
      call mem%dealloc(X223)
      call mem%alloc(X225, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X224, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X225, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X224)
      call add_1432_to_1234(one, X225, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X225)
      call mem%alloc(X226, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(r_vovo, X226, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X227, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         LAxxx_vov, &
         wf%n_v, &
         X226, &
         wf%n_v*wf%n_o, &
         zero, &
         X227, &
         wf%n_v)
!
      call mem%dealloc(X226)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X227, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X227)
      call mem%alloc(X228, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(LAxxx_vov, X228, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X229, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X228, &
         wf%n_v, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X229, &
         wf%n_v)
!
      call mem%dealloc(X228)
      call mem%alloc(X230, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(rxIxx_vvo, X230, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X230, &
         wf%n_v*wf%n_o, &
         X229, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X229)
      call mem%dealloc(X230)
      call mem%alloc(X231, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(LAxxx_vov, X231, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X232, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         X231, &
         wf%n_v, &
         rxIxx_vvo, &
         wf%n_v, &
         zero, &
         X232, &
         wf%n_v)
!
      call mem%dealloc(X231)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X232, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X232)
      call mem%alloc(X233, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(LAxxx_vov, X233, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X234, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         -one, &
         X233, &
         wf%n_v**2, &
         rxIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X234, &
         wf%n_o)
!
      call mem%dealloc(X233)
      call mem%alloc(X235, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X235, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X236, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X235, &
         wf%n_v**2*wf%n_o, &
         X234, &
         wf%n_o, &
         zero, &
         X236, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X234)
      call mem%dealloc(X235)
      call add_1342_to_1234(one, X236, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X236)
      call mem%alloc(X237, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(LAxxx_vov, X237, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X238, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X237, &
         wf%n_v, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X238, &
         wf%n_v)
!
      call mem%dealloc(X237)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         rxxxI_vov, &
         wf%n_v*wf%n_o, &
         X238, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X238)
      call mem%alloc(X239, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(LAxxx_vov, X239, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X240, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X239, &
         wf%n_v, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X240, &
         wf%n_v)
!
      call mem%dealloc(X239)
      call mem%alloc(X241, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         rxxxI_vov, &
         wf%n_v*wf%n_o, &
         X240, &
         wf%n_v, &
         zero, &
         X241, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X240)
      call add_1432_to_1234(one, X241, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X241)
      call mem%alloc(X242, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(rxxxI_vov, X242, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X243, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         LAxxx_vov, &
         wf%n_v*wf%n_o, &
         X242, &
         wf%n_v, &
         zero, &
         X243, &
         wf%n_v)
!
      call mem%dealloc(X242)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X243, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X243)
      call mem%alloc(X244, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(LxIxx_oov, X244, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X245, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X244, &
         wf%n_o, &
         r_vovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X245, &
         wf%n_o)
!
      call mem%dealloc(X244)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X245, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X245)
      call mem%alloc(X246, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(LxIxx_oov, X246, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X247, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X246, &
         wf%n_o, &
         r_vovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X247, &
         wf%n_o)
!
      call mem%dealloc(X246)
      call mem%alloc(X248, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X247, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X248, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X247)
      call add_1432_to_1234(one, X248, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X248)
      call mem%alloc(X249, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(r_vovo, X249, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X250, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         LxIxx_oov, &
         wf%n_o, &
         X249, &
         wf%n_v*wf%n_o, &
         zero, &
         X250, &
         wf%n_o)
!
      call mem%dealloc(X249)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X250, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X250)
      call mem%alloc(X251, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(LxIxx_oov, X251, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X252, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X251, &
         wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X252, &
         wf%n_o)
!
      call mem%dealloc(X251)
      call mem%alloc(X253, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(rAxxx_ovo, X253, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X253, &
         wf%n_v*wf%n_o, &
         X252, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X252)
      call mem%dealloc(X253)
      call mem%alloc(X254, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(LxIxx_oov, X254, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X255, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X254, &
         wf%n_o, &
         rAxxx_ovo, &
         wf%n_o, &
         zero, &
         X255, &
         wf%n_o)
!
      call mem%dealloc(X254)
      call mem%alloc(X256, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X256, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X257, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X256, &
         wf%n_v**2*wf%n_o, &
         X255, &
         wf%n_o, &
         zero, &
         X257, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X255)
      call mem%dealloc(X256)
      call add_1342_to_1234(one, X257, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X257)
      call mem%alloc(X258, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(LxIxx_oov, X258, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X259, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X258, &
         wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X259, &
         wf%n_o)
!
      call mem%dealloc(X258)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         rAxxx_ovo, &
         wf%n_o, &
         X259, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X259)
      call mem%alloc(X260, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(LxIxx_oov, X260, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X261, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X260, &
         wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X261, &
         wf%n_o)
!
      call mem%dealloc(X260)
      call mem%alloc(X262, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         rAxxx_ovo, &
         wf%n_o, &
         X261, &
         wf%n_o, &
         zero, &
         X262, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X261)
      call add_1432_to_1234(one, X262, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X262)
      call mem%alloc(X263, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(rAxxx_ovo, X263, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X264, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         LxIxx_oov, &
         wf%n_o**2, &
         X263, &
         wf%n_o**2, &
         zero, &
         X264, &
         wf%n_v)
!
      call mem%dealloc(X263)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X264, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X264)
      call mem%alloc(X265, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(LxIxx_oov, X265, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X266, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X265, &
         wf%n_v*wf%n_o, &
         rAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X266, &
         wf%n_o)
!
      call mem%dealloc(X265)
      call mem%alloc(X267, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X267, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X268, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X267, &
         wf%n_v**2*wf%n_o, &
         X266, &
         wf%n_o, &
         zero, &
         X268, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X266)
      call mem%dealloc(X267)
      call add_1342_to_1234(one, X268, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X268)
      call mem%alloc(X269, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(u_aibj, X269, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X270, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -two, &
         g_vvov, &
         wf%n_v, &
         X269, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X270, &
         wf%n_v)
!
      call mem%dealloc(X269)
      call mem%alloc(X271, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X270, 1, &
         rAIxx_vo, 1, &
         X271, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X270)
      call add_1432_to_1234(one, X271, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X271)
      call mem%alloc(X272, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(u_aibj, X272, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X273, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         four, &
         g_vvov, &
         wf%n_v, &
         X272, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X273, &
         wf%n_v)
!
      call mem%dealloc(X272)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X273, 1, &
         rAIxx_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X273)
      call mem%alloc(X274, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X274, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X275, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X275, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X276, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v**2, &
         -two, &
         X274, &
         wf%n_v*wf%n_o, &
         X275, &
         wf%n_v**2, &
         zero, &
         X276, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X274)
      call mem%dealloc(X275)
      call mem%alloc(X277, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X276, X277, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X276)
      call mem%alloc(X278, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X277, &
         wf%n_v*wf%n_o**2, &
         rAIxx_vo, &
         wf%n_v, &
         zero, &
         X278, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X277)
      call add_1243_to_1234(one, X278, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X278)
      call mem%alloc(X279, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_vvov, X279, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X280, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         X279, &
         wf%n_v**2*wf%n_o, &
         rAIxx_vo, &
         wf%n_v, &
         zero, &
         X280, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X279)
      call mem%alloc(X281, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(X280, X281, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X280)
      call mem%alloc(X282, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X281, &
         wf%n_v*wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X282, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X281)
      call add_1432_to_1234(one, X282, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X282)
      call mem%alloc(X283, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         rAIxx_vo, &
         wf%n_v, &
         zero, &
         X283, &
         wf%n_v**2*wf%n_o)
!
      call mem%alloc(X284, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1432(X283, X284, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X283)
      call mem%alloc(X285, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(u_aibj, X285, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X286, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X284, &
         wf%n_v*wf%n_o, &
         X285, &
         wf%n_v*wf%n_o, &
         zero, &
         X286, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X284)
      call mem%dealloc(X285)
      call add_1432_to_1234(one, X286, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X286)
      call mem%alloc(X287, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1432(g_ooov, X287, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X288, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         two, &
         X287, &
         wf%n_v*wf%n_o**2, &
         u_aibj, &
         wf%n_v, &
         zero, &
         X288, &
         wf%n_o)
!
      call mem%dealloc(X287)
      call mem%alloc(X289, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         rAIxx_vo, 1, &
         X288, 1, &
         X289, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X288)
      call add_1423_to_1234(one, X289, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X289)
      call mem%alloc(X290, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1432(g_ooov, X290, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X291, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         -four, &
         u_aibj, &
         wf%n_v, &
         X290, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X291, &
         wf%n_v)
!
      call mem%dealloc(X290)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X291, 1, &
         rAIxx_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X291)
      call mem%alloc(X292, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X292, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X293, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         two, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X292, &
         wf%n_o**2, &
         zero, &
         X293, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X292)
      call mem%alloc(X294, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1243(X293, X294, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X293)
      call mem%alloc(X295, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X294, &
         wf%n_v*wf%n_o**2, &
         rAIxx_vo, &
         wf%n_v, &
         zero, &
         X295, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X294)
      call add_1423_to_1234(one, X295, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X295)
      call mem%alloc(X296, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X296, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X297, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(u_aibj, X297, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X298, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         two, &
         X297, &
         wf%n_v*wf%n_o, &
         X296, &
         wf%n_v*wf%n_o, &
         zero, &
         X298, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X296)
      call mem%dealloc(X297)
      call mem%alloc(X299, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X298, &
         wf%n_v*wf%n_o**2, &
         rAIxx_vo, &
         wf%n_v, &
         zero, &
         X299, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X298)
      call add_1423_to_1234(one, X299, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X299)
      call mem%alloc(X300, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**3, &
         wf%n_o, &
         wf%n_v, &
         two, &
         g_ooov, &
         wf%n_o**3, &
         rAIxx_vo, &
         wf%n_v, &
         zero, &
         X300, &
         wf%n_o**3)
!
      call mem%alloc(X301, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1324(X300, X301, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X300)
      call mem%alloc(X302, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X302, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X303, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o**2, &
         one, &
         X302, &
         wf%n_v**2, &
         X301, &
         wf%n_o**2, &
         zero, &
         X303, &
         wf%n_v**2)
!
      call mem%dealloc(X301)
      call mem%dealloc(X302)
      call add_1324_to_1234(one, X303, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X303)
      call mem%alloc(X304, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(u_aibj, X304, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X305, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         one, &
         g_vvov, &
         wf%n_v, &
         X304, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X305, &
         wf%n_v)
!
      call mem%dealloc(X304)
      call mem%alloc(X306, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X305, 1, &
         rAxxI_ov, 1, &
         X306, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X305)
      call add_1423_to_1234(one, X306, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X306)
      call mem%alloc(X307, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(u_aibj, X307, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X308, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -two, &
         g_vvov, &
         wf%n_v, &
         X307, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X308, &
         wf%n_v)
!
      call mem%dealloc(X307)
      call mem%alloc(X309, wf%n_v, wf%n_o)
      call sort_to_21(rAxxI_ov, X309, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X308, 1, &
         X309, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X308)
      call mem%dealloc(X309)
      call mem%alloc(X310, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_vvov, X310, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X311, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X310, &
         wf%n_v**2*wf%n_o, &
         rAxxI_ov, &
         wf%n_o, &
         zero, &
         X311, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X310)
      call mem%alloc(X312, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(X311, X312, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X311)
      call mem%alloc(X313, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X312, &
         wf%n_v*wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X313, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X312)
      call add_1432_to_1234(one, X313, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X313)
      call mem%alloc(X314, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         rAxxI_ov, &
         wf%n_o, &
         zero, &
         X314, &
         wf%n_v**2*wf%n_o)
!
      call mem%alloc(X315, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1432(X314, X315, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X314)
      call mem%alloc(X316, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(u_aibj, X316, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X317, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X315, &
         wf%n_v*wf%n_o, &
         X316, &
         wf%n_v*wf%n_o, &
         zero, &
         X317, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X315)
      call mem%dealloc(X316)
      call add_1432_to_1234(one, X317, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X317)
      call mem%alloc(X318, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X318, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X319, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X319, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X320, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v**2, &
         one, &
         X318, &
         wf%n_v*wf%n_o, &
         X319, &
         wf%n_v**2, &
         zero, &
         X320, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X318)
      call mem%dealloc(X319)
      call mem%alloc(X321, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X320, X321, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X320)
      call mem%alloc(X322, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X321, &
         wf%n_v*wf%n_o**2, &
         rAxxI_ov, &
         wf%n_o, &
         zero, &
         X322, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X321)
      call add_1243_to_1234(one, X322, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X322)
      call mem%alloc(X323, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1432(g_ooov, X323, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X324, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         -one, &
         X323, &
         wf%n_v*wf%n_o**2, &
         u_aibj, &
         wf%n_v, &
         zero, &
         X324, &
         wf%n_o)
!
      call mem%dealloc(X323)
      call mem%alloc(X325, wf%n_v, wf%n_o)
      call sort_to_21(rAxxI_ov, X325, wf%n_o, wf%n_v)
      call mem%alloc(X326, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X325, 1, &
         X324, 1, &
         X326, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X324)
      call mem%dealloc(X325)
      call add_1423_to_1234(one, X326, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X326)
      call mem%alloc(X327, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1432(g_ooov, X327, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X328, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         two, &
         u_aibj, &
         wf%n_v, &
         X327, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X328, &
         wf%n_v)
!
      call mem%dealloc(X327)
      call mem%alloc(X329, wf%n_v, wf%n_o)
      call sort_to_21(rAxxI_ov, X329, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X328, 1, &
         X329, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X328)
      call mem%dealloc(X329)
      call mem%alloc(X330, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**3, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         g_ooov, &
         wf%n_o**3, &
         rAxxI_ov, &
         wf%n_o, &
         zero, &
         X330, &
         wf%n_o**3)
!
      call mem%alloc(X331, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1324(X330, X331, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X330)
      call mem%alloc(X332, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X332, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X333, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o**2, &
         one, &
         X332, &
         wf%n_v**2, &
         X331, &
         wf%n_o**2, &
         zero, &
         X333, &
         wf%n_v**2)
!
      call mem%dealloc(X331)
      call mem%dealloc(X332)
      call add_1324_to_1234(one, X333, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X333)
      call mem%alloc(X334, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X334, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X335, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -one, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X334, &
         wf%n_o**2, &
         zero, &
         X335, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X334)
      call mem%alloc(X336, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1243(X335, X336, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X335)
      call mem%alloc(X337, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X336, &
         wf%n_v*wf%n_o**2, &
         rAxxI_ov, &
         wf%n_o, &
         zero, &
         X337, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X336)
      call add_1423_to_1234(one, X337, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X337)
      call mem%alloc(X338, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X338, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X339, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(u_aibj, X339, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X340, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -one, &
         X339, &
         wf%n_v*wf%n_o, &
         X338, &
         wf%n_v*wf%n_o, &
         zero, &
         X340, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X338)
      call mem%dealloc(X339)
      call mem%alloc(X341, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X340, &
         wf%n_v*wf%n_o**2, &
         rAxxI_ov, &
         wf%n_o, &
         zero, &
         X341, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X340)
      call add_1423_to_1234(one, X341, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X341)
      call mem%alloc(X342, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X342, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X343, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v**2*wf%n_o, &
         -two, &
         g_vvov, &
         wf%n_v, &
         X342, 1, &
         zero, &
         X343, 1)
!
      call mem%dealloc(X342)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         X343, 1, &
         rAxxx_ovo, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X343)
      call mem%alloc(X344, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X344, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X345, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X344, &
         wf%n_v*wf%n_o, &
         uxIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X345, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X344)
      call mem%alloc(X346, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X345, X346, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X345)
      call mem%alloc(X347, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X346, &
         wf%n_v*wf%n_o, &
         rAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X347, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X346)
      call add_1423_to_1234(one, X347, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X347)
      call mem%alloc(X348, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X348, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X349, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         g_vvov, &
         wf%n_v**2, &
         X348, &
         wf%n_v, &
         zero, &
         X349, &
         wf%n_v**2)
!
      call mem%dealloc(X348)
      call mem%alloc(X350, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_132(X349, X350, wf%n_v, wf%n_v, wf%n_v)
      call mem%dealloc(X349)
      call mem%alloc(X351, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(rAxxx_ovo, X351, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X352, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X350, &
         wf%n_v**2, &
         X351, &
         wf%n_o**2, &
         zero, &
         X352, &
         wf%n_v**2)
!
      call mem%dealloc(X350)
      call mem%dealloc(X351)
      call add_1324_to_1234(one, X352, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X352)
      call mem%alloc(X353, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X353, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X354, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v**2*wf%n_o, &
         one, &
         g_vvov, &
         wf%n_v, &
         X353, 1, &
         zero, &
         X354, 1)
!
      call mem%dealloc(X353)
      call mem%alloc(X355, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_321(rAxxx_ovo, X355, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         X354, 1, &
         X355, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X354)
      call mem%dealloc(X355)
      call mem%alloc(X356, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         g_vvov, &
         wf%n_v**2, &
         rAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X356, &
         wf%n_v**2)
!
      call mem%alloc(X357, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X356, X357, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X356)
      call mem%alloc(X358, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X358, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X359, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X357, &
         wf%n_v*wf%n_o, &
         X358, &
         wf%n_v*wf%n_o, &
         zero, &
         X359, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X357)
      call mem%dealloc(X358)
      call add_1432_to_1234(one, X359, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X359)
      call mem%alloc(X360, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X360, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X361, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -one, &
         uxIxx_vvo, &
         wf%n_v, &
         X360, &
         wf%n_o**2, &
         zero, &
         X361, &
         wf%n_v)
!
      call mem%dealloc(X360)
      call mem%alloc(X362, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X361, X362, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X361)
      call mem%alloc(X363, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(rAxxx_ovo, X363, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X362, &
         wf%n_v*wf%n_o, &
         X363, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X362)
      call mem%dealloc(X363)
      call mem%alloc(X364, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X364, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X365, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         X364, &
         wf%n_o**2, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X365, &
         wf%n_o**2)
!
      call mem%dealloc(X364)
      call mem%alloc(X366, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         rAxxx_ovo, &
         wf%n_o, &
         X365, &
         wf%n_o, &
         zero, &
         X366, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X365)
      call add_1423_to_1234(one, X366, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X366)
      call mem%alloc(X367, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X367, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X368, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         two, &
         uxIxx_vvo, &
         wf%n_v, &
         X367, &
         wf%n_o**2, &
         zero, &
         X368, &
         wf%n_v)
!
      call mem%dealloc(X367)
      call mem%alloc(X369, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X368, X369, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X368)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X369, &
         wf%n_v*wf%n_o, &
         rAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X369)
      call mem%alloc(X370, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1324(g_ooov, X370, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X371, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(rAxxx_ovo, X371, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X372, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -one, &
         X371, &
         wf%n_o**2, &
         X370, &
         wf%n_o**2, &
         zero, &
         X372, &
         wf%n_v)
!
      call mem%dealloc(X370)
      call mem%dealloc(X371)
      call mem%alloc(X373, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X373, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X374, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X373, &
         wf%n_v*wf%n_o, &
         X372, &
         wf%n_v*wf%n_o, &
         zero, &
         X374, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X372)
      call mem%dealloc(X373)
      call add_1432_to_1234(one, X374, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X374)
      call mem%alloc(X375, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X375, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X376, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -one, &
         rAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X375, &
         wf%n_v*wf%n_o, &
         zero, &
         X376, &
         wf%n_o)
!
      call mem%dealloc(X375)
      call mem%alloc(X377, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         uxIxx_vvo, &
         wf%n_v**2, &
         X376, &
         wf%n_o**2, &
         zero, &
         X377, &
         wf%n_v**2)
!
      call mem%dealloc(X376)
      call add_1342_to_1234(one, X377, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X377)
      call mem%alloc(X378, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X378, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X379, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X378, &
         wf%n_v**2, &
         uxxxI_vov, &
         wf%n_v, &
         zero, &
         X379, &
         wf%n_v**2)
!
      call mem%dealloc(X378)
      call mem%alloc(X380, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_132(X379, X380, wf%n_v, wf%n_v, wf%n_v)
      call mem%dealloc(X379)
      call mem%alloc(X381, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(rAxxx_ovo, X381, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X382, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X380, &
         wf%n_v**2, &
         X381, &
         wf%n_o**2, &
         zero, &
         X382, &
         wf%n_v**2)
!
      call mem%dealloc(X380)
      call mem%dealloc(X381)
      call add_1324_to_1234(one, X382, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X382)
      call mem%alloc(X383, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X383, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X384, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X384, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X385, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X383, &
         wf%n_v*wf%n_o, &
         X384, &
         wf%n_v**2, &
         zero, &
         X385, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X383)
      call mem%dealloc(X384)
      call mem%alloc(X386, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X385, X386, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X385)
      call mem%alloc(X387, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(rAxxx_ovo, X387, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X386, &
         wf%n_v*wf%n_o, &
         X387, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X386)
      call mem%dealloc(X387)
      call mem%alloc(X388, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X388, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X389, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X389, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X390, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X388, &
         wf%n_v*wf%n_o, &
         X389, &
         wf%n_v**2, &
         zero, &
         X390, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X388)
      call mem%dealloc(X389)
      call mem%alloc(X391, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X390, X391, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X390)
      call mem%alloc(X392, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X391, &
         wf%n_v*wf%n_o, &
         rAxxx_ovo, &
         wf%n_o, &
         zero, &
         X392, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X391)
      call add_1432_to_1234(one, X392, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X392)
      call mem%alloc(X393, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X393, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X394, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X394, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X395, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         -two, &
         X393, &
         wf%n_v*wf%n_o, &
         X394, &
         wf%n_v**2, &
         zero, &
         X395, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X393)
      call mem%dealloc(X394)
      call mem%alloc(X396, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X395, X396, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X395)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X396, &
         wf%n_v*wf%n_o, &
         rAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X396)
      call mem%alloc(X397, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X397, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X398, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X397, &
         wf%n_v**2, &
         rAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X398, &
         wf%n_v**2)
!
      call mem%dealloc(X397)
      call mem%alloc(X399, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X398, X399, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X398)
      call mem%alloc(X400, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X399, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X400, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X399)
      call add_1432_to_1234(one, X400, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X400)
      call mem%alloc(X401, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X401, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X402, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -one, &
         uxxxI_vov, &
         wf%n_v, &
         X401, &
         wf%n_v*wf%n_o, &
         zero, &
         X402, &
         wf%n_v)
!
      call mem%dealloc(X401)
      call mem%alloc(X403, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(rAxxx_ovo, X403, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X402, &
         wf%n_v*wf%n_o, &
         X403, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X402)
      call mem%dealloc(X403)
      call mem%alloc(X404, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X404, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X405, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -one, &
         uxxxI_vov, &
         wf%n_v, &
         X404, &
         wf%n_v*wf%n_o, &
         zero, &
         X405, &
         wf%n_v)
!
      call mem%dealloc(X404)
      call mem%alloc(X406, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         rAxxx_ovo, &
         wf%n_o, &
         X405, &
         wf%n_v*wf%n_o, &
         zero, &
         X406, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X405)
      call add_1432_to_1234(one, X406, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X406)
      call mem%alloc(X407, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X407, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X408, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         two, &
         uxxxI_vov, &
         wf%n_v, &
         X407, &
         wf%n_v*wf%n_o, &
         zero, &
         X408, &
         wf%n_v)
!
      call mem%dealloc(X407)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X408, &
         wf%n_v*wf%n_o, &
         rAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X408)
      call mem%alloc(X409, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1324(g_ooov, X409, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X410, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(rAxxx_ovo, X410, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X411, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -one, &
         X410, &
         wf%n_o**2, &
         X409, &
         wf%n_o**2, &
         zero, &
         X411, &
         wf%n_v)
!
      call mem%dealloc(X409)
      call mem%dealloc(X410)
      call mem%alloc(X412, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X411, &
         wf%n_v*wf%n_o, &
         zero, &
         X412, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X411)
      call add_1432_to_1234(one, X412, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X412)
      call mem%alloc(X413, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         g_ooov, &
         wf%n_o**2, &
         rAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X413, &
         wf%n_o**2)
!
      call mem%alloc(X414, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X414, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X415, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X414, &
         wf%n_v**2, &
         X413, &
         wf%n_o, &
         zero, &
         X415, &
         wf%n_v**2)
!
      call mem%dealloc(X413)
      call mem%dealloc(X414)
      call add_1324_to_1234(one, X415, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X415)
      call mem%alloc(X416, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X416, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X417, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         g_vvov, &
         wf%n_v**2, &
         X416, &
         wf%n_o, &
         zero, &
         X417, &
         wf%n_v**2)
!
      call mem%dealloc(X416)
      call mem%alloc(X418, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X417, X418, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X417)
      call mem%alloc(X419, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(rxIxx_vvo, X419, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X418, &
         wf%n_v*wf%n_o, &
         X419, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X418)
      call mem%dealloc(X419)
      call mem%alloc(X420, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X420, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X421, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X420, &
         wf%n_v**2, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X421, &
         wf%n_v**2)
!
      call mem%dealloc(X420)
      call mem%alloc(X422, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X421, X422, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X421)
      call mem%alloc(X423, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(rxIxx_vvo, X423, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X422, &
         wf%n_v*wf%n_o, &
         X423, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X422)
      call mem%dealloc(X423)
      call mem%alloc(X424, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X424, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X425, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X424, &
         wf%n_v*wf%n_o, &
         rxIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X425, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X424)
      call mem%alloc(X426, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X425, X426, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X425)
      call mem%alloc(X427, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X426, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X427, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X426)
      call add_1423_to_1234(one, X427, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X427)
      call mem%alloc(X428, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1432(g_ooov, X428, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X429, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         two, &
         X428, &
         wf%n_v*wf%n_o**2, &
         uAxxx_ovo, 1, &
         zero, &
         X429, 1)
!
      call mem%dealloc(X428)
      call mem%alloc(X430, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         rxIxx_vvo, 1, &
         X429, 1, &
         X430, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X429)
      call add_1342_to_1234(one, X430, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X430)
      call mem%alloc(X431, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X431, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X432, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         g_ooov, &
         wf%n_o**2, &
         X431, &
         wf%n_o, &
         zero, &
         X432, &
         wf%n_o**2)
!
      call mem%dealloc(X431)
      call mem%alloc(X433, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         rxIxx_vvo, &
         wf%n_v**2, &
         X432, &
         wf%n_o, &
         zero, &
         X433, &
         wf%n_v**2)
!
      call mem%dealloc(X432)
      call add_1324_to_1234(one, X433, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X433)
      call mem%alloc(X434, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X434, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X435, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -one, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X434, &
         wf%n_v*wf%n_o, &
         zero, &
         X435, &
         wf%n_o)
!
      call mem%dealloc(X434)
      call mem%alloc(X436, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         rxIxx_vvo, &
         wf%n_v**2, &
         X435, &
         wf%n_o**2, &
         zero, &
         X436, &
         wf%n_v**2)
!
      call mem%dealloc(X435)
      call add_1342_to_1234(one, X436, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X436)
      call mem%alloc(X437, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1324(g_ooov, X437, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X438, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X438, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X439, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -one, &
         X438, &
         wf%n_o**2, &
         X437, &
         wf%n_o**2, &
         zero, &
         X439, &
         wf%n_v)
!
      call mem%dealloc(X437)
      call mem%dealloc(X438)
      call mem%alloc(X440, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(rxIxx_vvo, X440, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X441, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X440, &
         wf%n_v*wf%n_o, &
         X439, &
         wf%n_v*wf%n_o, &
         zero, &
         X441, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X439)
      call mem%dealloc(X440)
      call add_1432_to_1234(one, X441, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X441)
      call mem%alloc(X442, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1324(g_ooov, X442, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X443, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(uAxxx_ovo, X443, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X444, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -one, &
         X443, &
         wf%n_o**2, &
         X442, &
         wf%n_o**2, &
         zero, &
         X444, &
         wf%n_v)
!
      call mem%dealloc(X442)
      call mem%dealloc(X443)
      call mem%alloc(X445, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(rxIxx_vvo, X445, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X444, &
         wf%n_v*wf%n_o, &
         X445, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X444)
      call mem%dealloc(X445)
      call mem%alloc(X446, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X446, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X447, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         g_vvov, &
         wf%n_v**2, &
         X446, &
         wf%n_o, &
         zero, &
         X447, &
         wf%n_v**2)
!
      call mem%dealloc(X446)
      call mem%alloc(X448, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X447, X448, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X447)
      call mem%alloc(X449, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X448, &
         wf%n_v*wf%n_o, &
         rxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X449, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X448)
      call add_1432_to_1234(one, X449, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X449)
      call mem%alloc(X450, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X450, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X451, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X450, &
         wf%n_v**2, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X451, &
         wf%n_v**2)
!
      call mem%dealloc(X450)
      call mem%alloc(X452, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X451, X452, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X451)
      call mem%alloc(X453, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X452, &
         wf%n_v*wf%n_o, &
         rxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X453, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X452)
      call add_1432_to_1234(one, X453, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X453)
      call mem%alloc(X454, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X454, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X455, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         g_vvov, &
         wf%n_v**2, &
         X454, &
         wf%n_o, &
         zero, &
         X455, &
         wf%n_v**2)
!
      call mem%dealloc(X454)
      call mem%alloc(X456, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X455, X456, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X455)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X456, &
         wf%n_v*wf%n_o, &
         rxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X456)
      call mem%alloc(X457, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X457, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X458, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X457, &
         wf%n_v**2, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X458, &
         wf%n_v**2)
!
      call mem%dealloc(X457)
      call mem%alloc(X459, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X458, X459, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X458)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X459, &
         wf%n_v*wf%n_o, &
         rxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X459)
      call mem%alloc(X460, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X460, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X461, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X460, &
         wf%n_v**2, &
         rxxxI_vov, &
         wf%n_v, &
         zero, &
         X461, &
         wf%n_v**2)
!
      call mem%dealloc(X460)
      call mem%alloc(X462, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_132(X461, X462, wf%n_v, wf%n_v, wf%n_v)
      call mem%dealloc(X461)
      call mem%alloc(X463, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X463, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X464, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X462, &
         wf%n_v**2, &
         X463, &
         wf%n_o**2, &
         zero, &
         X464, &
         wf%n_v**2)
!
      call mem%dealloc(X462)
      call mem%dealloc(X463)
      call add_1324_to_1234(one, X464, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X464)
      call mem%alloc(X465, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         g_vvov, &
         wf%n_v**2, &
         rxxxI_vov, &
         wf%n_v, &
         zero, &
         X465, &
         wf%n_v**2)
!
      call mem%alloc(X466, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_132(X465, X466, wf%n_v, wf%n_v, wf%n_v)
      call mem%dealloc(X465)
      call mem%alloc(X467, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X467, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X468, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X466, &
         wf%n_v**2, &
         X467, &
         wf%n_o**2, &
         zero, &
         X468, &
         wf%n_v**2)
!
      call mem%dealloc(X466)
      call mem%dealloc(X467)
      call add_1342_to_1234(one, X468, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X468)
      call mem%alloc(X469, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X469, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X470, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(rxxxI_vov, X470, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X471, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X469, &
         wf%n_v*wf%n_o, &
         X470, &
         wf%n_v**2, &
         zero, &
         X471, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X469)
      call mem%dealloc(X470)
      call mem%alloc(X472, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X471, X472, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X471)
      call mem%alloc(X473, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X472, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X473, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X472)
      call add_1432_to_1234(one, X473, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X473)
      call mem%alloc(X474, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1432(g_ooov, X474, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X475, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         -one, &
         X474, &
         wf%n_v*wf%n_o**2, &
         uAxxx_ovo, 1, &
         zero, &
         X475, 1)
!
      call mem%dealloc(X474)
      call mem%alloc(X476, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         rxxxI_vov, 1, &
         X475, 1, &
         X476, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X475)
      call add_1432_to_1234(one, X476, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X476)
      call mem%alloc(X477, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1324(g_ooov, X477, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X478, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(uAxxx_ovo, X478, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X479, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -one, &
         X478, &
         wf%n_o**2, &
         X477, &
         wf%n_o**2, &
         zero, &
         X479, &
         wf%n_v)
!
      call mem%dealloc(X477)
      call mem%dealloc(X478)
      call mem%alloc(X480, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         rxxxI_vov, &
         wf%n_v*wf%n_o, &
         X479, &
         wf%n_v*wf%n_o, &
         zero, &
         X480, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X479)
      call add_1432_to_1234(one, X480, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X480)
      call mem%alloc(X481, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1324(g_ooov, X481, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X482, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(uAxxx_ovo, X482, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X483, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         two, &
         X482, &
         wf%n_o**2, &
         X481, &
         wf%n_o**2, &
         zero, &
         X483, &
         wf%n_v)
!
      call mem%dealloc(X481)
      call mem%dealloc(X482)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X483, &
         wf%n_v*wf%n_o, &
         rxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X483)
      call mem%alloc(X484, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X484, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X485, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -one, &
         rxxxI_vov, &
         wf%n_v, &
         X484, &
         wf%n_v*wf%n_o, &
         zero, &
         X485, &
         wf%n_v)
!
      call mem%dealloc(X484)
      call mem%alloc(X486, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X485, &
         wf%n_v*wf%n_o, &
         zero, &
         X486, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X485)
      call add_1432_to_1234(one, X486, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X486)
      call mem%alloc(X487, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         g_ooov, &
         wf%n_o**2, &
         rxxxI_vov, &
         wf%n_v, &
         zero, &
         X487, &
         wf%n_o**2)
!
      call mem%alloc(X488, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(uAxxx_ovo, X488, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X489, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X488, &
         wf%n_v*wf%n_o, &
         X487, &
         wf%n_o, &
         zero, &
         X489, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X487)
      call mem%dealloc(X488)
      call add_1423_to_1234(one, X489, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X489)
      call mem%alloc(X490, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X490, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X491, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         -two, &
         X490, &
         wf%n_v**2, &
         uxIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X491, &
         wf%n_o)
!
      call mem%dealloc(X490)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         r_vovo, &
         wf%n_v**2*wf%n_o, &
         X491, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X491)
      call mem%alloc(X492, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X492, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X493, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         X492, &
         wf%n_v, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X493, &
         wf%n_v)
!
      call mem%dealloc(X492)
      call mem%alloc(X494, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1243(r_vovo, X494, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X495, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X494, &
         wf%n_v*wf%n_o**2, &
         X493, &
         wf%n_v, &
         zero, &
         X495, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X493)
      call mem%dealloc(X494)
      call add_1243_to_1234(one, X495, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X495)
      call mem%alloc(X496, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X496, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X497, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X496, &
         wf%n_v**2, &
         uxIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X497, &
         wf%n_o)
!
      call mem%dealloc(X496)
      call mem%alloc(X498, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         r_vovo, &
         wf%n_v**2*wf%n_o, &
         X497, &
         wf%n_o, &
         zero, &
         X498, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X497)
      call add_1432_to_1234(one, X498, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X498)
      call mem%alloc(X499, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X499, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X500, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X499, &
         wf%n_v, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X500, &
         wf%n_v)
!
      call mem%dealloc(X499)
      call mem%alloc(X501, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1243(r_vovo, X501, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X502, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X501, &
         wf%n_v*wf%n_o**2, &
         X500, &
         wf%n_v, &
         zero, &
         X502, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X500)
      call mem%dealloc(X501)
      call add_1423_to_1234(one, X502, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X502)
      call mem%alloc(X503, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(r_vovo, X503, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X504, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X503, &
         wf%n_v*wf%n_o, &
         zero, &
         X504, &
         wf%n_v)
!
      call mem%dealloc(X503)
      call mem%alloc(X505, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X505, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X506, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X504, &
         wf%n_v, &
         X505, &
         wf%n_v*wf%n_o, &
         zero, &
         X506, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X504)
      call mem%dealloc(X505)
      call add_1432_to_1234(one, X506, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X506)
      call mem%alloc(X507, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X507, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X508, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(r_vovo, X508, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X509, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v**2, &
         one, &
         X507, &
         wf%n_v**2, &
         X508, &
         wf%n_v**2, &
         zero, &
         X509, &
         wf%n_o)
!
      call mem%dealloc(X507)
      call mem%dealloc(X508)
      call mem%alloc(X510, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         uxIxx_vvo, &
         wf%n_v**2, &
         X509, &
         wf%n_o, &
         zero, &
         X510, &
         wf%n_v**2)
!
      call mem%dealloc(X509)
      call add_1324_to_1234(one, X510, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X510)
      call mem%alloc(X511, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X511, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X512, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X511, &
         wf%n_v, &
         zero, &
         X512, &
         wf%n_v)
!
      call mem%dealloc(X511)
      call mem%alloc(X513, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1243(r_vovo, X513, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X514, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X513, &
         wf%n_v*wf%n_o**2, &
         X512, &
         wf%n_v, &
         zero, &
         X514, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X512)
      call mem%dealloc(X513)
      call add_1243_to_1234(one, X514, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X514)
      call mem%alloc(X515, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X515, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X516, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X515, &
         wf%n_v, &
         zero, &
         X516, &
         wf%n_v)
!
      call mem%dealloc(X515)
      call mem%alloc(X517, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1243(r_vovo, X517, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X518, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X517, &
         wf%n_v*wf%n_o**2, &
         X516, &
         wf%n_v, &
         zero, &
         X518, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X516)
      call mem%dealloc(X517)
      call add_1423_to_1234(one, X518, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X518)
      call mem%alloc(X519, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(r_vovo, X519, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X520, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         gAxxx_vov, &
         wf%n_v, &
         X519, &
         wf%n_v*wf%n_o, &
         zero, &
         X520, &
         wf%n_v)
!
      call mem%dealloc(X519)
      call mem%alloc(X521, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X520, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X521, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X520)
      call add_1432_to_1234(one, X521, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X521)
      call mem%alloc(X522, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_321(gAxxx_vov, X522, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X523, wf%n_o)
!
      call dgemv('T', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v**2*wf%n_o, &
         X522, 1, &
         zero, &
         X523, 1)
!
      call mem%dealloc(X522)
      call mem%alloc(X524, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(rxIxx_vvo, X524, wf%n_v, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X524, 1, &
         X523, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X523)
      call mem%dealloc(X524)
      call mem%alloc(X525, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_321(gAxxx_vov, X525, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X526, wf%n_o)
!
      call dgemv('T', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         -two, &
         u_aibj, &
         wf%n_v**2*wf%n_o, &
         X525, 1, &
         zero, &
         X526, 1)
!
      call mem%dealloc(X525)
      call mem%alloc(X527, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         rxIxx_vvo, 1, &
         X526, 1, &
         X527, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X526)
      call add_1342_to_1234(one, X527, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X527)
      call mem%alloc(X528, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X528, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X529, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X529, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X530, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v**2, &
         one, &
         X528, &
         wf%n_v**2, &
         X529, &
         wf%n_v**2, &
         zero, &
         X530, &
         wf%n_o)
!
      call mem%dealloc(X528)
      call mem%dealloc(X529)
      call mem%alloc(X531, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         rxIxx_vvo, &
         wf%n_v**2, &
         X530, &
         wf%n_o, &
         zero, &
         X531, &
         wf%n_v**2)
!
      call mem%dealloc(X530)
      call add_1324_to_1234(one, X531, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X531)
      call mem%alloc(X532, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X532, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X533, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X532, &
         wf%n_v, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X533, &
         wf%n_v)
!
      call mem%dealloc(X532)
      call mem%alloc(X534, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(rxIxx_vvo, X534, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X535, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X534, &
         wf%n_v*wf%n_o, &
         X533, &
         wf%n_v, &
         zero, &
         X535, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X533)
      call mem%dealloc(X534)
      call add_1432_to_1234(one, X535, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X535)
      call mem%alloc(X536, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(u_aibj, X536, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X537, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X536, &
         wf%n_v*wf%n_o, &
         zero, &
         X537, &
         wf%n_v)
!
      call mem%dealloc(X536)
      call mem%alloc(X538, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(rxIxx_vvo, X538, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X539, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X538, &
         wf%n_v*wf%n_o, &
         X537, &
         wf%n_v, &
         zero, &
         X539, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X537)
      call mem%dealloc(X538)
      call add_1432_to_1234(one, X539, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X539)
      call mem%alloc(X540, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X540, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X541, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X540, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X541, &
         wf%n_o)
!
      call mem%dealloc(X540)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         r_vovo, &
         wf%n_v**2*wf%n_o, &
         X541, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X541)
      call mem%alloc(X542, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X542, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X543, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X542, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X543, &
         wf%n_o)
!
      call mem%dealloc(X542)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         r_vovo, &
         wf%n_v**2*wf%n_o, &
         X543, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X543)
      call mem%alloc(X544, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X544, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X545, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o**2, &
         two, &
         gxIxx_oov, &
         wf%n_o**2, &
         X544, &
         wf%n_o**2, &
         zero, &
         X545, &
         wf%n_v)
!
      call mem%dealloc(X544)
      call mem%alloc(X546, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1243(r_vovo, X546, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X547, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X546, &
         wf%n_v*wf%n_o**2, &
         X545, &
         wf%n_v, &
         zero, &
         X547, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X545)
      call mem%dealloc(X546)
      call add_1243_to_1234(one, X547, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X547)
      call mem%alloc(X548, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X548, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X549, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X548, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X549, &
         wf%n_o)
!
      call mem%dealloc(X548)
      call mem%alloc(X550, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         r_vovo, &
         wf%n_v**2*wf%n_o, &
         X549, &
         wf%n_o, &
         zero, &
         X550, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X549)
      call add_1432_to_1234(one, X550, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X550)
      call mem%alloc(X551, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X551, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X552, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X551, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X552, &
         wf%n_o)
!
      call mem%dealloc(X551)
      call mem%alloc(X553, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         r_vovo, &
         wf%n_v**2*wf%n_o, &
         X552, &
         wf%n_o, &
         zero, &
         X553, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X552)
      call add_1432_to_1234(one, X553, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X553)
      call mem%alloc(X554, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X554, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X555, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o**2, &
         -one, &
         gxIxx_oov, &
         wf%n_o**2, &
         X554, &
         wf%n_o**2, &
         zero, &
         X555, &
         wf%n_v)
!
      call mem%dealloc(X554)
      call mem%alloc(X556, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1243(r_vovo, X556, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X557, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X556, &
         wf%n_v*wf%n_o**2, &
         X555, &
         wf%n_v, &
         zero, &
         X557, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X555)
      call mem%dealloc(X556)
      call add_1423_to_1234(one, X557, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X557)
      call mem%alloc(X558, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X558, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X559, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v, &
         -one, &
         gxIxx_oov, &
         wf%n_o**2, &
         X558, &
         wf%n_o**2, &
         zero, &
         X559, &
         wf%n_o**2)
!
      call mem%dealloc(X558)
      call mem%alloc(X560, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(r_vovo, X560, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X561, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o**2, &
         one, &
         X560, &
         wf%n_v**2, &
         X559, &
         wf%n_o**2, &
         zero, &
         X561, &
         wf%n_v**2)
!
      call mem%dealloc(X559)
      call mem%dealloc(X560)
      call add_1324_to_1234(one, X561, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X561)
      call mem%alloc(X562, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X562, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X563, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(r_vovo, X563, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X564, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X562, &
         wf%n_v*wf%n_o, &
         X563, &
         wf%n_v*wf%n_o, &
         zero, &
         X564, &
         wf%n_o)
!
      call mem%dealloc(X562)
      call mem%dealloc(X563)
      call mem%alloc(X565, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X564, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X565, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X564)
      call add_1423_to_1234(one, X565, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X565)
      call mem%alloc(X566, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(r_vovo, X566, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X567, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         gxIxx_oov, &
         wf%n_o, &
         X566, &
         wf%n_v*wf%n_o, &
         zero, &
         X567, &
         wf%n_o)
!
      call mem%dealloc(X566)
      call mem%alloc(X568, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X567, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X568, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X567)
      call add_1432_to_1234(one, X568, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X568)
      call mem%alloc(X569, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X569, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X570, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         -one, &
         u_aibj, &
         wf%n_v, &
         X569, 1, &
         zero, &
         X570, 1)
!
      call mem%dealloc(X569)
      call mem%alloc(X571, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(rAxxx_ovo, X571, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X572, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X571, 1, &
         X570, 1, &
         X572, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X570)
      call mem%dealloc(X571)
      call add_1243_to_1234(one, X572, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X572)
      call mem%alloc(X573, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X573, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X574, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         two, &
         u_aibj, &
         wf%n_v, &
         X573, 1, &
         zero, &
         X574, 1)
!
      call mem%dealloc(X573)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         X574, 1, &
         rAxxx_ovo, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X574)
      call mem%alloc(X575, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X575, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X576, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X575, &
         wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X576, &
         wf%n_o)
!
      call mem%dealloc(X575)
      call mem%alloc(X577, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X576, &
         wf%n_o, &
         rAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X577, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X576)
      call add_1423_to_1234(one, X577, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X577)
      call mem%alloc(X578, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X578, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X579, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(u_aibj, X579, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X580, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X578, &
         wf%n_v*wf%n_o, &
         X579, &
         wf%n_v*wf%n_o, &
         zero, &
         X580, &
         wf%n_o)
!
      call mem%dealloc(X578)
      call mem%dealloc(X579)
      call mem%alloc(X581, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X580, &
         wf%n_o, &
         rAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X581, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X580)
      call add_1423_to_1234(one, X581, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X581)
      call mem%alloc(X582, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(rAxxx_ovo, X582, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X583, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v, &
         -one, &
         gxIxx_oov, &
         wf%n_o**2, &
         X582, &
         wf%n_o**2, &
         zero, &
         X583, &
         wf%n_o**2)
!
      call mem%dealloc(X582)
      call mem%alloc(X584, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X584, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X585, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o**2, &
         one, &
         X584, &
         wf%n_v**2, &
         X583, &
         wf%n_o**2, &
         zero, &
         X585, &
         wf%n_v**2)
!
      call mem%dealloc(X583)
      call mem%dealloc(X584)
      call add_1324_to_1234(one, X585, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X585)
!
   end subroutine mu_4_H_nu_2_s_doublet_ccsd

