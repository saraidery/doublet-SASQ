   subroutine mu_4_H_nu_1_s_doublet_ccsd(wf, rho_aibj, FAx_v, FxI_o, LAIxx_ov, LAIxx_vo, LAxxx_oov, LAxxx_voo, LAxxx_vvv, L_oooo, L_ovov, L_voov, L_vvoo, LxIxx_ooo, LxIxx_vov, LxxxI_vvo, gAIxx_vo, gAxxI_ov, gAxxx_oov, gAxxx_ovo, gAxxx_voo, gAxxx_vvv, g_oooo, g_ovov, g_voov, g_vvoo, g_vvvv, gxIxx_ooo, gxIxx_vov, gxIxx_vvo, gxxxI_vvo, rAI, rAx_o, r_vo, rxI_v, tAxxx_ovo, t_aibj, txIxx_vvo, txxxI_vov, uAIxx_vo, uAxxx_ovo, u_aibj, uxIxx_vvo, uxxxI_vov)
!!
!! Generated function
!!
      implicit none
!
      class(doublet_ccsd), intent(in) :: wf
!
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(inout) :: rho_aibj
!
      real(dp), intent(in) :: rAI
      real(dp), dimension(wf%n_o), intent(in) :: FxI_o, rAx_o
      real(dp), dimension(wf%n_v), intent(in) :: FAx_v, rxI_v
      real(dp), dimension(wf%n_o,wf%n_v), intent(in) :: LAIxx_ov, gAxxI_ov
      real(dp), dimension(wf%n_v,wf%n_o), intent(in) :: LAIxx_vo, gAIxx_vo, r_vo, uAIxx_vo
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_o), intent(in) :: LxIxx_ooo, gxIxx_ooo
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_v), intent(in) :: LAxxx_oov, gAxxx_oov
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o), intent(in) :: gAxxx_ovo, tAxxx_ovo, uAxxx_ovo
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_o), intent(in) :: LAxxx_voo, gAxxx_voo
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v), intent(in) :: LxIxx_vov, gxIxx_vov, txxxI_vov, uxxxI_vov
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_o), intent(in) :: LxxxI_vvo, gxIxx_vvo, gxxxI_vvo, txIxx_vvo, uxIxx_vvo
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_v), intent(in) :: LAxxx_vvv, gAxxx_vvv
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_o,wf%n_o), intent(in) :: L_oooo, g_oooo
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o,wf%n_v), intent(in) :: L_ovov, g_ovov
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_o,wf%n_v), intent(in) :: L_voov, g_voov
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(in) :: t_aibj, u_aibj
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_o,wf%n_o), intent(in) :: L_vvoo, g_vvoo
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_v,wf%n_v), intent(in) :: g_vvvv
!
      real(dp), dimension(:), allocatable :: X438, X446, X468, X471, X559, X619
      real(dp), dimension(:,:), allocatable :: X7, X9, X10, X12, X29, X30, X33, X34, X39, X40, X47, X48, X70, X71, X72, X73, X75, X76, X83, X84, X92, X98, X148, X151, X158, X161, X169, X172, X190, X193, X202, X205, X219, X222, X234, X235, X239, X240, X244, X245, X248, X249, X250, X251, X252, X253, X254, X255, X257, X258, X259, X263, X264, X265, X271, X272, X273, X276, X277, X278, X279, X280, X291, X294, X316, X320, X324, X329, X361, X364, X395, X396, X398, X399, X401, X402, X405, X406, X436, X439, X443, X447, X469, X472, X498, X500, X503, X520, X523, X564, X569, X573, X622, X627, X630, X634, X639, X645
      real(dp), dimension(:,:,:), allocatable :: X3, X5, X15, X16, X17, X19, X20, X21, X22, X23, X25, X26, X27, X32, X36, X37, X62, X63, X65, X66, X67, X69, X79, X81, X82, X87, X88, X89, X90, X95, X96, X97, X109, X110, X113, X116, X117, X119, X120, X123, X126, X128, X129, X131, X133, X134, X135, X138, X141, X144, X145, X146, X147, X150, X152, X155, X157, X160, X162, X163, X164, X166, X168, X171, X173, X176, X177, X179, X180, X182, X184, X187, X189, X192, X194, X198, X199, X201, X204, X206, X207, X209, X210, X212, X213, X214, X216, X217, X218, X221, X223, X224, X228, X229, X230, X233, X236, X237, X241, X242, X246, X281, X289, X290, X293, X297, X298, X299, X300, X302, X303, X304, X306, X307, X308, X309, X310, X311, X312, X314, X315, X318, X319, X322, X323, X327, X328, X332, X333, X337, X338, X341, X342, X345, X346, X350, X351, X352, X355, X356, X357, X360, X363, X367, X371, X372, X376, X377, X378, X382, X383, X386, X387, X388, X391, X392, X433, X434, X435, X437, X440, X441, X442, X445, X449, X450, X451, X454, X455, X456, X458, X459, X460, X461, X463, X464, X465, X466, X467, X470, X474, X475, X476, X479, X480, X481, X483, X485, X486, X487, X488, X492, X493, X495, X496, X506, X507, X508, X510, X511, X512, X513, X515, X517, X519, X522, X525, X527, X528, X531, X532, X533, X536, X538, X543, X545, X546, X547, X549, X551, X553, X554, X555, X556, X558, X560, X561, X565, X566, X570, X574, X576, X577, X578, X580, X581, X582, X584, X585, X586, X587, X589, X591, X595, X596, X597, X598, X599, X600, X602, X604, X606, X607, X608, X613, X614, X615, X616, X617, X618, X620, X623, X624, X625, X628, X631, X632, X633, X638, X642, X643, X644
      real(dp), dimension(:,:,:,:), allocatable :: X1, X2, X4, X6, X8, X11, X13, X14, X18, X24, X28, X31, X35, X38, X41, X42, X43, X44, X45, X46, X49, X50, X51, X52, X53, X54, X55, X56, X57, X58, X59, X60, X61, X64, X68, X74, X77, X78, X80, X85, X86, X91, X93, X94, X99, X100, X101, X102, X103, X104, X105, X106, X107, X108, X111, X112, X114, X115, X118, X121, X122, X124, X125, X127, X130, X132, X136, X137, X139, X140, X142, X143, X149, X153, X154, X156, X159, X165, X167, X170, X174, X175, X178, X181, X183, X185, X186, X188, X191, X195, X196, X197, X200, X203, X208, X211, X215, X220, X225, X226, X227, X231, X232, X238, X243, X247, X256, X260, X261, X262, X266, X267, X268, X269, X270, X274, X275, X282, X283, X284, X285, X286, X287, X288, X292, X295, X296, X301, X305, X313, X317, X321, X325, X326, X330, X331, X334, X335, X336, X339, X340, X343, X344, X347, X348, X349, X353, X354, X358, X359, X362, X365, X366, X368, X369, X370, X373, X374, X375, X379, X380, X381, X384, X385, X389, X390, X393, X394, X397, X400, X403, X404, X407, X408, X409, X410, X411, X412, X413, X414, X415, X416, X417, X418, X419, X420, X421, X422, X423, X424, X425, X426, X427, X428, X429, X430, X431, X432, X444, X448, X452, X453, X457, X462, X473, X477, X478, X482, X484, X489, X490, X491, X494, X497, X499, X501, X502, X504, X505, X509, X514, X516, X518, X521, X524, X526, X529, X530, X534, X535, X537, X539, X540, X541, X542, X544, X548, X550, X552, X557, X562, X563, X567, X568, X571, X572, X575, X579, X583, X588, X590, X592, X593, X594, X601, X603, X605, X609, X610, X611, X612, X621, X626, X629, X635, X636, X637, X640, X641
!
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         LAIxx_vo, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X1, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         gAIxx_vo, 1, &
         r_vo, 1, &
         X1, &
         wf%n_v*wf%n_o)
!
      call add_1432_to_1234(one, X1, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1)
      call mem%alloc(X2, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         gAxxI_ov, 1, &
         X2, &
         wf%n_v*wf%n_o)
!
      call add_1423_to_1234(one, X2, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2)
      call mem%alloc(X3, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(gAxxx_ovo, X3, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X4, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X3, 1, &
         rxI_v, 1, &
         X4, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X3)
      call add_1243_to_1234(one, X4, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X4)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         -two, &
         rxI_v, 1, &
         gAxxx_ovo, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%alloc(X5, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(gxIxx_vvo, X5, wf%n_v, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X5, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X5)
      call mem%alloc(X6, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         -two, &
         gxIxx_vvo, 1, &
         rAx_o, 1, &
         X6, &
         wf%n_v**2*wf%n_o)
!
      call add_1342_to_1234(one, X6, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X6)
      call mem%alloc(X7, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         wf%fock_ab, &
         wf%n_v, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X7, &
         wf%n_v)
!
      call mem%alloc(X8, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X7, 1, &
         r_vo, 1, &
         X8, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X7)
      call add_1432_to_1234(one, X8, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X8)
      call mem%alloc(X9, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         two, &
         wf%fock_ab, &
         wf%n_v, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X9, &
         wf%n_v)
!
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X9, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X9)
      call mem%alloc(X10, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         wf%fock_ij, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X10, &
         wf%n_o)
!
      call mem%alloc(X11, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X10, 1, &
         X11, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X10)
      call add_1423_to_1234(one, X11, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X11)
      call mem%alloc(X12, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         -two, &
         uAIxx_vo, &
         wf%n_v, &
         wf%fock_ij, &
         wf%n_o, &
         zero, &
         X12, &
         wf%n_v)
!
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X12, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X12)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         two*rAI, &
         wf%fock_ab, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%alloc(X13, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X13, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X14, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         -two*rAI, &
         X13, &
         wf%n_v**2*wf%n_o, &
         wf%fock_ij, &
         wf%n_o, &
         zero, &
         X14, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X13)
      call add_1342_to_1234(rAI, X14, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X14)
      call mem%alloc(X15, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(uxIxx_vvo, X15, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X16, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -one, &
         wf%fock_ab, &
         wf%n_v, &
         X15, &
         wf%n_v*wf%n_o, &
         zero, &
         X16, &
         wf%n_v)
!
      call mem%dealloc(X15)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X16, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X16)
      call mem%alloc(X17, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -one, &
         wf%fock_ab, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X17, &
         wf%n_v)
!
      call mem%alloc(X18, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X17, 1, &
         rAx_o, 1, &
         X18, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X17)
      call add_1342_to_1234(one, X18, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X18)
      call mem%alloc(X19, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X19, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X20, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X19, &
         wf%n_v**2, &
         wf%fock_ij, &
         wf%n_o, &
         zero, &
         X20, &
         wf%n_v**2)
!
      call mem%dealloc(X19)
      call mem%alloc(X21, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X20, X21, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X20)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X21, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X21)
      call mem%alloc(X22, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X22, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X23, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v, &
         -one, &
         wf%fock_ab, &
         wf%n_v, &
         X22, &
         wf%n_o**2, &
         zero, &
         X23, &
         wf%n_v)
!
      call mem%dealloc(X22)
      call mem%alloc(X24, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X23, 1, &
         rxI_v, 1, &
         X24, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X23)
      call add_1423_to_1234(one, X24, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X24)
      call mem%alloc(X25, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         wf%fock_ij, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X25, &
         wf%n_o)
!
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X25, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X25)
      call mem%alloc(X26, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(uAxxx_ovo, X26, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X27, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X26, &
         wf%n_v*wf%n_o, &
         wf%fock_ij, &
         wf%n_o, &
         zero, &
         X27, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X26)
      call mem%alloc(X28, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X27, 1, &
         rxI_v, 1, &
         X28, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X27)
      call add_1423_to_1234(one, X28, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X28)
      call mem%alloc(X29, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         FAx_v, 1, &
         zero, &
         X29, 1)
!
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X29, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X29)
      call mem%alloc(X30, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         FAx_v, 1, &
         zero, &
         X30, 1)
!
      call mem%alloc(X31, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X30, 1, &
         X31, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X30)
      call add_1432_to_1234(one, X31, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X31)
      call mem%alloc(X32, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         -one, &
         u_aibj, &
         wf%n_v, &
         FAx_v, 1, &
         zero, &
         X32, 1)
!
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X32, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X32)
      call mem%alloc(X33, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         uAxxx_ovo, &
         wf%n_o, &
         FxI_o, 1, &
         zero, &
         X33, 1)
!
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X33, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X33)
      call mem%alloc(X34, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         FxI_o, 1, &
         zero, &
         X34, 1)
!
      call mem%alloc(X35, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X34, 1, &
         X35, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X34)
      call add_1432_to_1234(one, X35, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X35)
      call mem%alloc(X36, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v**2*wf%n_o, &
         FxI_o, 1, &
         zero, &
         X36, 1)
!
      call mem%alloc(X37, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_312(X36, X37, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X36)
      call mem%alloc(X38, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X37, 1, &
         rAx_o, 1, &
         X38, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X37)
      call add_1342_to_1234(one, X38, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X38)
      call mem%alloc(X39, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X39, wf%n_v, wf%n_o)
      call mem%alloc(X40, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         L_voov, &
         wf%n_v*wf%n_o, &
         X39, 1, &
         zero, &
         X40, 1)
!
      call mem%dealloc(X39)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X40, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X40)
      call mem%alloc(X41, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         L_voov, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X41, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X42, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1243(X41, X42, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X41)
      call mem%alloc(X43, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X42, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X43, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X42)
      call add_1243_to_1234(one, X43, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X43)
      call mem%alloc(X44, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         L_voov, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X44, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X45, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1243(X44, X45, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X44)
      call mem%alloc(X46, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X45, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X46, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X45)
      call add_1243_to_1234(one, X46, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X46)
      call mem%alloc(X47, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X47, wf%n_v, wf%n_o)
      call mem%alloc(X48, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         L_voov, &
         wf%n_v*wf%n_o, &
         X47, 1, &
         zero, &
         X48, 1)
!
      call mem%dealloc(X47)
      call mem%alloc(X49, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X48, 1, &
         r_vo, 1, &
         X49, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X48)
      call add_1432_to_1234(one, X49, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X49)
      call mem%alloc(X50, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1342(L_vvoo, X50, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X51, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         X50, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X51, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X50)
      call mem%alloc(X52, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X51, X52, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X51)
      call mem%alloc(X53, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X52, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X53, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X52)
      call add_1423_to_1234(one, X53, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X53)
      call mem%alloc(X54, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1342(L_vvoo, X54, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X55, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         X54, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X55, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X54)
      call mem%alloc(X56, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X55, X56, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X55)
      call mem%alloc(X57, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X56, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X57, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X56)
      call add_1423_to_1234(one, X57, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X57)
      call mem%alloc(X58, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1243(L_oooo, X58, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X59, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X58, &
         wf%n_o**3, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X59, &
         wf%n_o**3)
!
      call mem%dealloc(X58)
      call mem%alloc(X60, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(X59, X60, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X59)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X60, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X60)
      call mem%alloc(X61, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(L_voov, X61, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two*rAI, &
         X61, &
         wf%n_v*wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X61)
      call mem%alloc(X62, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X62, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X63, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         L_voov, &
         wf%n_v*wf%n_o, &
         X62, &
         wf%n_v, &
         zero, &
         X63, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X62)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X63, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X63)
      call mem%alloc(X64, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(L_voov, X64, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X65, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         -one, &
         X64, &
         wf%n_v**2*wf%n_o, &
         rAx_o, 1, &
         zero, &
         X65, 1)
!
      call mem%dealloc(X64)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X65, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X65)
      call mem%alloc(X66, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X66, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X67, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         L_voov, &
         wf%n_v*wf%n_o, &
         X66, &
         wf%n_o, &
         zero, &
         X67, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X66)
      call mem%alloc(X68, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X67, 1, &
         rxI_v, 1, &
         X68, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X67)
      call add_1243_to_1234(one, X68, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X68)
      call mem%alloc(X69, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -one, &
         L_voov, &
         wf%n_v*wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X69, 1)
!
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X69, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X69)
      call mem%alloc(X70, wf%n_v, wf%n_o)
      call sort_to_21(LAIxx_ov, X70, wf%n_o, wf%n_v)
      call mem%alloc(X71, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X70, 1, &
         zero, &
         X71, 1)
!
      call mem%dealloc(X70)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X71, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X71)
      call mem%alloc(X72, wf%n_v, wf%n_o)
      call sort_to_21(LAIxx_ov, X72, wf%n_o, wf%n_v)
      call mem%alloc(X73, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X72, 1, &
         zero, &
         X73, 1)
!
      call mem%dealloc(X72)
      call mem%alloc(X74, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X73, 1, &
         X74, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X73)
      call add_1432_to_1234(one, X74, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X74)
      call mem%alloc(X75, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o, &
         -one, &
         LAIxx_ov, &
         wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X75, &
         wf%n_v)
!
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X75, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X75)
      call mem%alloc(X76, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         LAIxx_ov, &
         wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X76, &
         wf%n_o)
!
      call mem%alloc(X77, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X77, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X78, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X77, &
         wf%n_v**2*wf%n_o, &
         X76, &
         wf%n_o, &
         zero, &
         X78, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X76)
      call mem%dealloc(X77)
      call add_1342_to_1234(one, X78, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X78)
      call mem%alloc(X79, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         LAxxx_vvv, &
         wf%n_v**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X79, &
         wf%n_v**2)
!
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X79, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X79)
      call mem%alloc(X80, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -one, &
         LAxxx_voo, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X80, &
         wf%n_o**2)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X80, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X80)
      call mem%alloc(X81, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(LAxxx_oov, X81, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X82, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X81, &
         wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X82, &
         wf%n_o)
!
      call mem%dealloc(X81)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X82, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X82)
      call mem%alloc(X83, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v**2, &
         one, &
         LAxxx_vvv, &
         wf%n_v, &
         rxI_v, 1, &
         zero, &
         X83, 1)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X83, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X83)
      call mem%alloc(X84, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_o**2, &
         -one, &
         LAxxx_voo, &
         wf%n_v, &
         rxI_v, 1, &
         zero, &
         X84, 1)
!
      call mem%alloc(X85, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X85, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X86, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X85, &
         wf%n_v**2*wf%n_o, &
         X84, &
         wf%n_o, &
         zero, &
         X86, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X84)
      call mem%dealloc(X85)
      call add_1342_to_1234(one, X86, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X86)
      call mem%alloc(X87, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_312(LxIxx_ooo, X87, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X88, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X87, &
         wf%n_o**2, &
         zero, &
         X88, &
         wf%n_v)
!
      call mem%dealloc(X87)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X88, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X88)
      call mem%alloc(X89, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(LxIxx_vov, X89, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X90, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X89, &
         wf%n_v, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X90, &
         wf%n_v)
!
      call mem%dealloc(X89)
      call mem%alloc(X91, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X90, 1, &
         rAx_o, 1, &
         X91, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X90)
      call add_1342_to_1234(one, X91, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X91)
      call mem%alloc(X92, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         LxIxx_ooo, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X92, 1)
!
      call mem%alloc(X93, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X93, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X94, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X93, &
         wf%n_v**2*wf%n_o, &
         X92, &
         wf%n_o, &
         zero, &
         X94, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X92)
      call mem%dealloc(X93)
      call add_1342_to_1234(one, X94, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X94)
      call mem%alloc(X95, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(LxxxI_vvo, X95, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X96, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         X95, &
         wf%n_v*wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X96, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X95)
      call mem%alloc(X97, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X96, X97, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X96)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X97, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X97)
      call mem%alloc(X98, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_o, &
         -one, &
         LxxxI_vvo, &
         wf%n_v**2, &
         rAx_o, 1, &
         zero, &
         X98, 1)
!
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X98, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X98)
      call mem%alloc(X99, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**3, &
         wf%n_o, &
         wf%n_v, &
         two, &
         g_vvvv, &
         wf%n_v**3, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X99, &
         wf%n_v**3)
!
      call mem%alloc(X100, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1342(X99, X100, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X99)
      call mem%alloc(X101, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X100, &
         wf%n_v**2*wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X101, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X100)
      call add_1342_to_1234(one, X101, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X101)
      call mem%alloc(X102, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**3, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         g_vvvv, &
         wf%n_v**3, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X102, &
         wf%n_v**3)
!
      call mem%alloc(X103, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1432(X102, X103, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X102)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X103, &
         wf%n_v**2*wf%n_o, &
         r_vo, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X103)
      call mem%alloc(X104, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_voov, X104, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X105, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two*rAI, &
         X104, &
         wf%n_v*wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X105, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X104)
      call add_1432_to_1234(rAI, X105, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X105)
      call mem%alloc(X106, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvoo, X106, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X107, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(u_aibj, X107, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X108, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two*rAI, &
         X106, &
         wf%n_v*wf%n_o, &
         X107, &
         wf%n_v*wf%n_o, &
         zero, &
         X108, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X106)
      call mem%dealloc(X107)
      call add_1432_to_1234(rAI, X108, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X108)
      call mem%alloc(X109, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X109, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X110, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         g_voov, &
         wf%n_v*wf%n_o, &
         X109, &
         wf%n_v, &
         zero, &
         X110, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X109)
      call mem%alloc(X111, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X110, 1, &
         rAx_o, 1, &
         X111, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X110)
      call add_1432_to_1234(one, X111, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X111)
      call mem%alloc(X112, wf%n_v, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvvv, X112, wf%n_v, wf%n_v, wf%n_v, wf%n_v)
      call mem%alloc(X113, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v**2, &
         -one, &
         X112, &
         wf%n_v**2, &
         uxIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X113, &
         wf%n_v**2)
!
      call mem%dealloc(X112)
      call mem%alloc(X114, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X113, 1, &
         rAx_o, 1, &
         X114, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X113)
      call add_1342_to_1234(one, X114, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X114)
      call mem%alloc(X115, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvoo, X115, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X116, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X115, &
         wf%n_v**2*wf%n_o, &
         rAx_o, 1, &
         zero, &
         X116, 1)
!
      call mem%dealloc(X115)
      call mem%alloc(X117, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X117, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X118, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X116, &
         wf%n_v*wf%n_o, &
         X117, &
         wf%n_v*wf%n_o, &
         zero, &
         X118, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X116)
      call mem%dealloc(X117)
      call add_1432_to_1234(one, X118, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X118)
      call mem%alloc(X119, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_o**3, &
         -one, &
         g_oooo, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X119, 1)
!
      call mem%alloc(X120, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X119, X120, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X119)
      call mem%alloc(X121, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         uxIxx_vvo, &
         wf%n_v**2, &
         X120, &
         wf%n_o**2, &
         zero, &
         X121, &
         wf%n_v**2)
!
      call mem%dealloc(X120)
      call add_1324_to_1234(one, X121, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X121)
      call mem%alloc(X122, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_voov, X122, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X123, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X122, &
         wf%n_v**2*wf%n_o, &
         rAx_o, 1, &
         zero, &
         X123, 1)
!
      call mem%dealloc(X122)
      call mem%alloc(X124, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X123, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X124, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X123)
      call add_1432_to_1234(one, X124, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X124)
      call mem%alloc(X125, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvoo, X125, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X126, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X125, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v, &
         zero, &
         X126, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X125)
      call mem%alloc(X127, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X126, 1, &
         rAx_o, 1, &
         X127, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X126)
      call add_1432_to_1234(one, X127, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X127)
      call mem%alloc(X128, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X128, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X129, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         g_voov, &
         wf%n_v*wf%n_o, &
         X128, &
         wf%n_o, &
         zero, &
         X129, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X128)
      call mem%alloc(X130, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X129, 1, &
         rxI_v, 1, &
         X130, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X129)
      call add_1423_to_1234(one, X130, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X130)
      call mem%alloc(X131, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         g_voov, &
         wf%n_v*wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X131, 1)
!
      call mem%alloc(X132, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X131, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X132, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X131)
      call add_1432_to_1234(one, X132, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X132)
      call mem%alloc(X133, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**3, &
         wf%n_v, &
         -one, &
         g_vvvv, &
         wf%n_v**3, &
         rxI_v, 1, &
         zero, &
         X133, 1)
!
      call mem%alloc(X134, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_132(X133, X134, wf%n_v, wf%n_v, wf%n_v)
      call mem%dealloc(X133)
      call mem%alloc(X135, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X135, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X136, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X134, &
         wf%n_v**2, &
         X135, &
         wf%n_o**2, &
         zero, &
         X136, &
         wf%n_v**2)
!
      call mem%dealloc(X134)
      call mem%dealloc(X135)
      call add_3124_to_1234(one, X136, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X136)
      call mem%alloc(X137, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvoo, X137, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X138, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X137, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X138, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X137)
      call mem%alloc(X139, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X138, 1, &
         rxI_v, 1, &
         X139, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X138)
      call add_1423_to_1234(one, X139, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X139)
      call mem%alloc(X140, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvoo, X140, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X141, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X140, &
         wf%n_v*wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X141, 1)
!
      call mem%dealloc(X140)
      call mem%alloc(X142, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X141, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X142, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X141)
      call add_1423_to_1234(one, X142, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X142)
      call mem%alloc(X143, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1324(g_oooo, X143, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X144, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X144, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X145, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o**2, &
         -one, &
         X143, &
         wf%n_o**2, &
         X144, &
         wf%n_o**2, &
         zero, &
         X145, &
         wf%n_o**2)
!
      call mem%dealloc(X143)
      call mem%dealloc(X144)
      call mem%alloc(X146, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X145, X146, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X145)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X146, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X146)
      call mem%alloc(X147, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_oov, X147, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X148, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X147, &
         wf%n_o, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X148, &
         wf%n_o)
!
      call mem%dealloc(X147)
      call mem%alloc(X149, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X148, 1, &
         X149, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X148)
      call add_1423_to_1234(one, X149, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X149)
      call mem%alloc(X150, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_oov, X150, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X151, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         uxIxx_vvo, &
         wf%n_v, &
         X150, &
         wf%n_o, &
         zero, &
         X151, &
         wf%n_v)
!
      call mem%dealloc(X150)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X151, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X151)
      call mem%alloc(X152, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X152, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X153, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X152, &
         wf%n_v*wf%n_o, &
         gAxxx_oov, &
         wf%n_o**2, &
         zero, &
         X153, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X152)
      call mem%alloc(X154, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X153, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X154, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X153)
      call add_1423_to_1234(one, X154, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X154)
      call mem%alloc(X155, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         r_vo, &
         wf%n_v, &
         gAxxx_oov, &
         wf%n_o**2, &
         zero, &
         X155, &
         wf%n_o)
!
      call mem%alloc(X156, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         uxIxx_vvo, &
         wf%n_v**2, &
         X155, &
         wf%n_o**2, &
         zero, &
         X156, &
         wf%n_v**2)
!
      call mem%dealloc(X155)
      call add_1342_to_1234(one, X156, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X156)
      call mem%alloc(X157, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_132(gAxxx_vvv, X157, wf%n_v, wf%n_v, wf%n_v)
      call mem%alloc(X158, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v**2, &
         -one, &
         X157, &
         wf%n_v**2, &
         uxIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X158, &
         wf%n_v)
!
      call mem%dealloc(X157)
      call mem%alloc(X159, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X158, 1, &
         r_vo, 1, &
         X159, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X158)
      call add_1432_to_1234(one, X159, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X159)
      call mem%alloc(X160, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_132(gAxxx_vvv, X160, wf%n_v, wf%n_v, wf%n_v)
      call mem%alloc(X161, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v**2, &
         two, &
         X160, &
         wf%n_v**2, &
         uxIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X161, &
         wf%n_v)
!
      call mem%dealloc(X160)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X161, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X161)
      call mem%alloc(X162, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         gAxxx_vvv, &
         wf%n_v, &
         r_vo, &
         wf%n_v, &
         zero, &
         X162, &
         wf%n_v**2)
!
      call mem%alloc(X163, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X162, X163, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X162)
      call mem%alloc(X164, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X164, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X165, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X163, &
         wf%n_v*wf%n_o, &
         X164, &
         wf%n_v*wf%n_o, &
         zero, &
         X165, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X163)
      call mem%dealloc(X164)
      call add_1432_to_1234(one, X165, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X165)
      call mem%alloc(X166, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         gAxxx_vvv, &
         wf%n_v**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X166, &
         wf%n_v**2)
!
      call mem%alloc(X167, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X166, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X167, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X166)
      call add_1432_to_1234(one, X167, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X167)
      call mem%alloc(X168, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_213(gAxxx_voo, X168, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X169, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X168, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v, &
         zero, &
         X169, &
         wf%n_o)
!
      call mem%dealloc(X168)
      call mem%alloc(X170, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X169, 1, &
         X170, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X169)
      call add_1423_to_1234(one, X170, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X170)
      call mem%alloc(X171, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_213(gAxxx_voo, X171, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X172, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         uxxxI_vov, &
         wf%n_v, &
         X171, &
         wf%n_v*wf%n_o, &
         zero, &
         X172, &
         wf%n_v)
!
      call mem%dealloc(X171)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X172, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X172)
      call mem%alloc(X173, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(gAxxx_voo, X173, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X174, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X173, &
         wf%n_v, &
         zero, &
         X174, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X173)
      call mem%alloc(X175, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X174, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X175, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X174)
      call add_1423_to_1234(one, X175, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X175)
      call mem%alloc(X176, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         gAxxx_voo, &
         wf%n_v, &
         r_vo, &
         wf%n_v, &
         zero, &
         X176, &
         wf%n_o**2)
!
      call mem%alloc(X177, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X177, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X178, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X177, &
         wf%n_v**2, &
         X176, &
         wf%n_o, &
         zero, &
         X178, &
         wf%n_v**2)
!
      call mem%dealloc(X176)
      call mem%dealloc(X177)
      call add_1324_to_1234(one, X178, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X178)
      call mem%alloc(X179, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_oov, X179, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X180, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X179, &
         wf%n_o, &
         zero, &
         X180, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X179)
      call mem%alloc(X181, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X180, 1, &
         rxI_v, 1, &
         X181, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X180)
      call add_1423_to_1234(one, X181, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X181)
      call mem%alloc(X182, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_132(gAxxx_vvv, X182, wf%n_v, wf%n_v, wf%n_v)
      call mem%alloc(X183, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X183, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X184, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v**2, &
         -one, &
         X182, &
         wf%n_v**2, &
         X183, &
         wf%n_v**2, &
         zero, &
         X184, &
         wf%n_v)
!
      call mem%dealloc(X182)
      call mem%dealloc(X183)
      call mem%alloc(X185, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X184, 1, &
         rxI_v, 1, &
         X185, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X184)
      call add_1423_to_1234(one, X185, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X185)
      call mem%alloc(X186, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(u_aibj, X186, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X187, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X186, &
         wf%n_v*wf%n_o, &
         gAxxx_voo, &
         wf%n_v*wf%n_o, &
         zero, &
         X187, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X186)
      call mem%alloc(X188, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X187, 1, &
         rxI_v, 1, &
         X188, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X187)
      call add_1423_to_1234(one, X188, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X188)
      call mem%alloc(X189, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X189, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X190, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         gxIxx_vov, &
         wf%n_v, &
         X189, &
         wf%n_o, &
         zero, &
         X190, &
         wf%n_v)
!
      call mem%dealloc(X189)
      call mem%alloc(X191, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X190, 1, &
         r_vo, 1, &
         X191, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X190)
      call add_1432_to_1234(one, X191, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X191)
      call mem%alloc(X192, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X192, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X193, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         gxIxx_vov, &
         wf%n_v, &
         X192, &
         wf%n_o, &
         zero, &
         X193, &
         wf%n_v)
!
      call mem%dealloc(X192)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X193, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X193)
      call mem%alloc(X194, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X194, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X195, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         gxIxx_vov, &
         wf%n_v*wf%n_o, &
         X194, &
         wf%n_o**2, &
         zero, &
         X195, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X194)
      call mem%alloc(X196, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X195, X196, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X195)
      call mem%alloc(X197, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X196, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X197, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X196)
      call add_1243_to_1234(one, X197, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X197)
      call mem%alloc(X198, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         gxIxx_vov, &
         wf%n_v*wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X198, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X199, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X198, X199, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X198)
      call mem%alloc(X200, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X199, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X200, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X199)
      call add_1423_to_1234(one, X200, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X200)
      call mem%alloc(X201, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X201, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X202, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o**2, &
         -one, &
         gxIxx_ooo, &
         wf%n_o**2, &
         X201, &
         wf%n_o**2, &
         zero, &
         X202, &
         wf%n_o)
!
      call mem%dealloc(X201)
      call mem%alloc(X203, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X202, 1, &
         X203, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X202)
      call add_1423_to_1234(one, X203, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X203)
      call mem%alloc(X204, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X204, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X205, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o**2, &
         two, &
         X204, &
         wf%n_o**2, &
         gxIxx_ooo, &
         wf%n_o**2, &
         zero, &
         X205, &
         wf%n_v)
!
      call mem%dealloc(X204)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X205, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X205)
      call mem%alloc(X206, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         -one, &
         gxIxx_ooo, &
         wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X206, &
         wf%n_o**2)
!
      call mem%alloc(X207, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(uAxxx_ovo, X207, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X208, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X207, &
         wf%n_v*wf%n_o, &
         X206, &
         wf%n_o, &
         zero, &
         X208, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X206)
      call mem%dealloc(X207)
      call add_1423_to_1234(one, X208, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X208)
      call mem%alloc(X209, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(gxIxx_ooo, X209, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X210, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         -one, &
         X209, &
         wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X210, &
         wf%n_o**2)
!
      call mem%dealloc(X209)
      call mem%alloc(X211, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X210, &
         wf%n_o, &
         zero, &
         X211, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X210)
      call add_1423_to_1234(one, X211, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X211)
      call mem%alloc(X212, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_vov, X212, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X213, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X212, &
         wf%n_v, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X213, &
         wf%n_v)
!
      call mem%dealloc(X212)
      call mem%alloc(X214, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X213, X214, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X213)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X214, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X214)
      call mem%alloc(X215, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X215, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X216, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o**2, &
         -one, &
         X215, &
         wf%n_v**2, &
         gxIxx_ooo, &
         wf%n_o**2, &
         zero, &
         X216, &
         wf%n_v**2)
!
      call mem%dealloc(X215)
      call mem%alloc(X217, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X216, X217, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X216)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X217, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X217)
      call mem%alloc(X218, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(uAxxx_ovo, X218, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X219, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         gxxxI_vvo, &
         wf%n_v, &
         X218, &
         wf%n_v*wf%n_o, &
         zero, &
         X219, &
         wf%n_v)
!
      call mem%dealloc(X218)
      call mem%alloc(X220, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X219, 1, &
         r_vo, 1, &
         X220, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X219)
      call add_1432_to_1234(one, X220, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X220)
      call mem%alloc(X221, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(uAxxx_ovo, X221, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X222, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         gxxxI_vvo, &
         wf%n_v, &
         X221, &
         wf%n_v*wf%n_o, &
         zero, &
         X222, &
         wf%n_v)
!
      call mem%dealloc(X221)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X222, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X222)
      call mem%alloc(X223, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(gxxxI_vvo, X223, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X224, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X224, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X225, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X223, &
         wf%n_v*wf%n_o, &
         X224, &
         wf%n_o**2, &
         zero, &
         X225, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X223)
      call mem%dealloc(X224)
      call mem%alloc(X226, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X225, X226, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X225)
      call mem%alloc(X227, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X226, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X227, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X226)
      call add_1423_to_1234(one, X227, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X227)
      call mem%alloc(X228, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(gxxxI_vvo, X228, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X229, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X228, &
         wf%n_v*wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X229, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X228)
      call mem%alloc(X230, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X229, X230, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X229)
      call mem%alloc(X231, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X230, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X231, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X230)
      call add_1432_to_1234(one, X231, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X231)
      call mem%alloc(X232, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(u_aibj, X232, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X233, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         gxxxI_vvo, &
         wf%n_v, &
         X232, &
         wf%n_v*wf%n_o, &
         zero, &
         X233, &
         wf%n_v)
!
      call mem%dealloc(X232)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X233, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X233)
      call mem%alloc(X234, wf%n_o, wf%n_v)
      call sort_to_21(r_vo, X234, wf%n_v, wf%n_o)
      call mem%alloc(X235, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X234, 1, &
         zero, &
         X235, 1)
!
      call mem%dealloc(X234)
      call mem%alloc(X236, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X236, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X237, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X235, &
         wf%n_o, &
         X236, &
         wf%n_v*wf%n_o, &
         zero, &
         X237, &
         wf%n_o)
!
      call mem%dealloc(X235)
      call mem%dealloc(X236)
      call mem%alloc(X238, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X237, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X238, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X237)
      call add_1423_to_1234(one, X238, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X238)
      call mem%alloc(X239, wf%n_o, wf%n_v)
      call sort_to_21(r_vo, X239, wf%n_v, wf%n_o)
      call mem%alloc(X240, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X239, 1, &
         zero, &
         X240, 1)
!
      call mem%dealloc(X239)
      call mem%alloc(X241, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X241, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X242, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X240, &
         wf%n_o, &
         X241, &
         wf%n_o**2, &
         zero, &
         X242, &
         wf%n_o)
!
      call mem%dealloc(X240)
      call mem%dealloc(X241)
      call mem%alloc(X243, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         uxIxx_vvo, &
         wf%n_v**2, &
         X242, &
         wf%n_o, &
         zero, &
         X243, &
         wf%n_v**2)
!
      call mem%dealloc(X242)
      call add_1324_to_1234(one, X243, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X243)
      call mem%alloc(X244, wf%n_o, wf%n_v)
      call sort_to_21(r_vo, X244, wf%n_v, wf%n_o)
      call mem%alloc(X245, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X244, 1, &
         zero, &
         X245, 1)
!
      call mem%dealloc(X244)
      call mem%alloc(X246, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X245, &
         wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X246, &
         wf%n_o)
!
      call mem%dealloc(X245)
      call mem%alloc(X247, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X246, &
         wf%n_o, &
         zero, &
         X247, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X246)
      call add_1432_to_1234(one, X247, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X247)
      call mem%alloc(X248, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X248, wf%n_v, wf%n_o)
      call mem%alloc(X249, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X248, 1, &
         zero, &
         X249, 1)
!
      call mem%dealloc(X248)
      call mem%alloc(X250, wf%n_v, wf%n_o)
      call sort_to_21(X249, X250, wf%n_o, wf%n_v)
      call mem%dealloc(X249)
      call mem%alloc(X251, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X250, 1, &
         zero, &
         X251, 1)
!
      call mem%dealloc(X250)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X251, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X251)
      call mem%alloc(X252, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X252, wf%n_v, wf%n_o)
      call mem%alloc(X253, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X252, 1, &
         zero, &
         X253, 1)
!
      call mem%dealloc(X252)
      call mem%alloc(X254, wf%n_v, wf%n_o)
      call sort_to_21(X253, X254, wf%n_o, wf%n_v)
      call mem%dealloc(X253)
      call mem%alloc(X255, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X254, 1, &
         zero, &
         X255, 1)
!
      call mem%dealloc(X254)
      call mem%alloc(X256, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X255, 1, &
         X256, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X255)
      call add_1432_to_1234(one, X256, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X256)
      call mem%alloc(X257, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X257, wf%n_v, wf%n_o)
      call mem%alloc(X258, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X257, 1, &
         zero, &
         X258, 1)
!
      call mem%dealloc(X257)
      call mem%alloc(X259, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X258, &
         wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X259, &
         wf%n_v)
!
      call mem%dealloc(X258)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X259, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X259)
      call mem%alloc(X260, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         L_ovov, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X260, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X261, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_2134(X260, X261, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X260)
      call mem%alloc(X262, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X261, &
         wf%n_v*wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X262, &
         wf%n_o**2)
!
      call mem%dealloc(X261)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X262, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X262)
      call mem%alloc(X263, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X263, wf%n_v, wf%n_o)
      call mem%alloc(X264, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X263, 1, &
         zero, &
         X264, 1)
!
      call mem%dealloc(X263)
      call mem%alloc(X265, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X264, &
         wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X265, &
         wf%n_o)
!
      call mem%dealloc(X264)
      call mem%alloc(X266, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X266, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X267, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X266, &
         wf%n_v**2*wf%n_o, &
         X265, &
         wf%n_o, &
         zero, &
         X267, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X265)
      call mem%dealloc(X266)
      call add_1342_to_1234(one, X267, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X267)
      call mem%alloc(X268, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         L_ovov, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X268, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X269, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_2134(X268, X269, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X268)
      call mem%alloc(X270, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X269, &
         wf%n_v*wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X270, &
         wf%n_o**2)
!
      call mem%dealloc(X269)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X270, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X270)
      call mem%alloc(X271, wf%n_o, wf%n_v)
      call sort_to_21(r_vo, X271, wf%n_v, wf%n_o)
      call mem%alloc(X272, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X271, 1, &
         zero, &
         X272, 1)
!
      call mem%dealloc(X271)
      call mem%alloc(X273, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X272, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X273, &
         wf%n_o)
!
      call mem%dealloc(X272)
      call mem%alloc(X274, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X274, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X275, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X274, &
         wf%n_v**2*wf%n_o, &
         X273, &
         wf%n_o, &
         zero, &
         X275, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X273)
      call mem%dealloc(X274)
      call add_1342_to_1234(one, X275, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X275)
      call mem%alloc(X276, wf%n_o, wf%n_v)
      call sort_to_21(r_vo, X276, wf%n_v, wf%n_o)
      call mem%alloc(X277, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X276, 1, &
         zero, &
         X277, 1)
!
      call mem%dealloc(X276)
      call mem%alloc(X278, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X277, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X278, &
         wf%n_v)
!
      call mem%dealloc(X277)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X278, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X278)
      call mem%alloc(X279, wf%n_o, wf%n_v)
      call sort_to_21(r_vo, X279, wf%n_v, wf%n_o)
      call mem%alloc(X280, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X279, 1, &
         zero, &
         X280, 1)
!
      call mem%dealloc(X279)
      call mem%alloc(X281, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X280, &
         wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X281, &
         wf%n_o)
!
      call mem%dealloc(X280)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X281, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X281)
      call mem%alloc(X282, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(t_aibj, X282, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X283, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -four, &
         X282, &
         wf%n_v*wf%n_o, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X283, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X282)
      call mem%alloc(X284, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(X283, X284, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X283)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         rAI, &
         t_aibj, &
         wf%n_v*wf%n_o, &
         X284, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X284)
      call mem%alloc(X285, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1243(t_aibj, X285, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X286, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X285, &
         wf%n_v*wf%n_o, &
         zero, &
         X286, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X285)
      call mem%alloc(X287, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(t_aibj, X287, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X288, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         rAI, &
         X286, &
         wf%n_v*wf%n_o, &
         X287, &
         wf%n_v*wf%n_o, &
         zero, &
         X288, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X286)
      call mem%dealloc(X287)
      call add_1432_to_1234(rAI, X288, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X288)
      call mem%alloc(X289, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X289, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X290, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         X289, &
         wf%n_v, &
         zero, &
         X290, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X289)
      call mem%alloc(X291, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X290, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X291, 1)
!
      call mem%dealloc(X290)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X291, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X291)
      call mem%alloc(X292, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(L_ovov, X292, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X293, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X292, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X293, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X292)
      call mem%alloc(X294, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X293, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X294, 1)
!
      call mem%dealloc(X293)
      call mem%alloc(X295, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1243(u_aibj, X295, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X296, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X295, &
         wf%n_v*wf%n_o**2, &
         X294, &
         wf%n_v, &
         zero, &
         X296, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X294)
      call mem%dealloc(X295)
      call add_1243_to_1234(one, X296, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X296)
      call mem%alloc(X297, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X297, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X298, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X297, &
         wf%n_v, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X298, &
         wf%n_v)
!
      call mem%dealloc(X297)
      call mem%alloc(X299, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(X298, X299, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X298)
      call mem%alloc(X300, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X299, &
         wf%n_v, &
         u_aibj, &
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
         rAx_o, 1, &
         X301, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X300)
      call add_1342_to_1234(one, X301, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X301)
      call mem%alloc(X302, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         L_ovov, &
         wf%n_v*wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X302, 1)
!
      call mem%alloc(X303, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(X302, X303, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X302)
      call mem%alloc(X304, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X303, &
         wf%n_v*wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X304, &
         wf%n_o)
!
      call mem%dealloc(X303)
      call mem%alloc(X305, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X304, &
         wf%n_o, &
         zero, &
         X305, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X304)
      call add_1432_to_1234(one, X305, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X305)
      call mem%alloc(X306, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X306, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X307, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X306, &
         wf%n_o, &
         L_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X307, &
         wf%n_o)
!
      call mem%dealloc(X306)
      call mem%alloc(X308, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X307, X308, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X307)
      call mem%alloc(X309, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X308, &
         wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X309, &
         wf%n_o)
!
      call mem%dealloc(X308)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X309, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X309)
      call mem%alloc(X310, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -one, &
         L_ovov, &
         wf%n_v*wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X310, 1)
!
      call mem%alloc(X311, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(X310, X311, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X310)
      call mem%alloc(X312, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X311, &
         wf%n_v*wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X312, &
         wf%n_o)
!
      call mem%dealloc(X311)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X312, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X312)
      call mem%alloc(X313, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X313, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X314, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X314, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X315, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X313, &
         wf%n_v*wf%n_o, &
         X314, &
         wf%n_o, &
         zero, &
         X315, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X313)
      call mem%dealloc(X314)
      call mem%alloc(X316, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v, &
         X315, &
         wf%n_v*wf%n_o, &
         zero, &
         X316, &
         wf%n_v)
!
      call mem%dealloc(X315)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X316, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X316)
      call mem%alloc(X317, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X317, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X318, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v**2, &
         two, &
         X317, &
         wf%n_o**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X318, &
         wf%n_o**2)
!
      call mem%dealloc(X317)
      call mem%alloc(X319, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X319, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X320, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X319, &
         wf%n_o**2, &
         X318, &
         wf%n_o**2, &
         zero, &
         X320, &
         wf%n_v)
!
      call mem%dealloc(X318)
      call mem%dealloc(X319)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X320, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X320)
      call mem%alloc(X321, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X321, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X322, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X322, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X323, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X321, &
         wf%n_v*wf%n_o, &
         X322, &
         wf%n_o, &
         zero, &
         X323, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X321)
      call mem%dealloc(X322)
      call mem%alloc(X324, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X323, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X324, &
         wf%n_o)
!
      call mem%dealloc(X323)
      call mem%alloc(X325, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X324, 1, &
         X325, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X324)
      call add_1423_to_1234(one, X325, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X325)
      call mem%alloc(X326, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X326, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X327, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v**2, &
         -one, &
         X326, &
         wf%n_o**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X327, &
         wf%n_o**2)
!
      call mem%dealloc(X326)
      call mem%alloc(X328, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X328, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X329, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X327, &
         wf%n_o**2, &
         X328, &
         wf%n_o**2, &
         zero, &
         X329, &
         wf%n_o)
!
      call mem%dealloc(X327)
      call mem%dealloc(X328)
      call mem%alloc(X330, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X329, 1, &
         X330, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X329)
      call add_1423_to_1234(one, X330, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X330)
      call mem%alloc(X331, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X331, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X332, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         txIxx_vvo, &
         wf%n_v, &
         X331, &
         wf%n_v*wf%n_o, &
         zero, &
         X332, &
         wf%n_v)
!
      call mem%dealloc(X331)
      call mem%alloc(X333, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(uAxxx_ovo, X333, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X334, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X333, &
         wf%n_o**2, &
         X332, &
         wf%n_v*wf%n_o, &
         zero, &
         X334, &
         wf%n_o**2)
!
      call mem%dealloc(X332)
      call mem%dealloc(X333)
      call mem%alloc(X335, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(X334, X335, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X334)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X335, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X335)
      call mem%alloc(X336, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X336, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X337, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         uAxxx_ovo, &
         wf%n_o, &
         X336, &
         wf%n_v*wf%n_o, &
         zero, &
         X337, &
         wf%n_o)
!
      call mem%dealloc(X336)
      call mem%alloc(X338, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(txIxx_vvo, X338, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X339, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X338, &
         wf%n_v*wf%n_o, &
         X337, &
         wf%n_o**2, &
         zero, &
         X339, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X337)
      call mem%dealloc(X338)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X339, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X339)
      call mem%alloc(X340, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_ovov, X340, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X341, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v**2, &
         -one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X340, &
         wf%n_o**2, &
         zero, &
         X341, &
         wf%n_o)
!
      call mem%dealloc(X340)
      call mem%alloc(X342, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X341, &
         wf%n_o**2, &
         zero, &
         X342, &
         wf%n_v)
!
      call mem%dealloc(X341)
      call mem%alloc(X343, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X342, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X343, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X342)
      call add_1423_to_1234(one, X343, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X343)
      call mem%alloc(X344, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X344, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X345, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X344, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X345, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X344)
      call mem%alloc(X346, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X345, &
         wf%n_v, &
         r_vo, &
         wf%n_v, &
         zero, &
         X346, &
         wf%n_o**2)
!
      call mem%dealloc(X345)
      call mem%alloc(X347, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X346, &
         wf%n_o, &
         zero, &
         X347, &
         wf%n_v**2)
!
      call mem%dealloc(X346)
      call add_1342_to_1234(one, X347, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X347)
      call mem%alloc(X348, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -one, &
         r_vo, &
         wf%n_v, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X348, &
         wf%n_o)
!
      call mem%alloc(X349, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(X348, X349, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X348)
      call mem%alloc(X350, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X350, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X351, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         one, &
         X350, &
         wf%n_o**2, &
         X349, &
         wf%n_v*wf%n_o, &
         zero, &
         X351, &
         wf%n_v)
!
      call mem%dealloc(X349)
      call mem%dealloc(X350)
      call mem%alloc(X352, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X352, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X353, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X352, &
         wf%n_v*wf%n_o, &
         X351, &
         wf%n_v*wf%n_o, &
         zero, &
         X353, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X351)
      call mem%dealloc(X352)
      call add_1432_to_1234(one, X353, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X353)
      call mem%alloc(X354, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X354, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X355, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         txIxx_vvo, &
         wf%n_v, &
         X354, &
         wf%n_v*wf%n_o, &
         zero, &
         X355, &
         wf%n_v)
!
      call mem%dealloc(X354)
      call mem%alloc(X356, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         r_vo, &
         wf%n_v, &
         X355, &
         wf%n_v*wf%n_o, &
         zero, &
         X356, &
         wf%n_o)
!
      call mem%dealloc(X355)
      call mem%alloc(X357, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(uAxxx_ovo, X357, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X358, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X357, &
         wf%n_v*wf%n_o, &
         X356, &
         wf%n_v*wf%n_o, &
         zero, &
         X358, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X356)
      call mem%dealloc(X357)
      call add_1423_to_1234(one, X358, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X358)
      call mem%alloc(X359, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X359, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X360, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X359, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X360, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X359)
      call mem%alloc(X361, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         txxxI_vov, &
         wf%n_v, &
         X360, &
         wf%n_v*wf%n_o, &
         zero, &
         X361, &
         wf%n_v)
!
      call mem%dealloc(X360)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X361, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X361)
      call mem%alloc(X362, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X362, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X363, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X362, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X363, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X362)
      call mem%alloc(X364, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X363, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X364, &
         wf%n_o)
!
      call mem%dealloc(X363)
      call mem%alloc(X365, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X364, 1, &
         X365, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X364)
      call add_1423_to_1234(one, X365, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X365)
      call mem%alloc(X366, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X366, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X367, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X366, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X367, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X366)
      call mem%alloc(X368, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X367, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X368, &
         wf%n_o**2)
!
      call mem%dealloc(X367)
      call mem%alloc(X369, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(X368, X369, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X368)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X369, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X369)
      call mem%alloc(X370, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X370, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X371, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         txxxI_vov, &
         wf%n_v, &
         X370, &
         wf%n_v*wf%n_o, &
         zero, &
         X371, &
         wf%n_v)
!
      call mem%dealloc(X370)
      call mem%alloc(X372, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X372, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X373, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X372, &
         wf%n_o**2, &
         X371, &
         wf%n_v*wf%n_o, &
         zero, &
         X373, &
         wf%n_o**2)
!
      call mem%dealloc(X371)
      call mem%dealloc(X372)
      call mem%alloc(X374, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(X373, X374, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X373)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X374, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X374)
      call mem%alloc(X375, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_ovov, X375, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X376, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X376, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X377, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v**2, &
         -one, &
         X376, &
         wf%n_v**2, &
         X375, &
         wf%n_o**2, &
         zero, &
         X377, &
         wf%n_o)
!
      call mem%dealloc(X375)
      call mem%dealloc(X376)
      call mem%alloc(X378, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X377, &
         wf%n_o**2, &
         zero, &
         X378, &
         wf%n_v)
!
      call mem%dealloc(X377)
      call mem%alloc(X379, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X378, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X379, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X378)
      call add_1432_to_1234(one, X379, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X379)
      call mem%alloc(X380, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -one, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X380, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X381, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1324(X380, X381, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X380)
      call mem%alloc(X382, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X382, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X383, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X381, &
         wf%n_o**2, &
         X382, &
         wf%n_o**2, &
         zero, &
         X383, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X381)
      call mem%dealloc(X382)
      call mem%alloc(X384, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         X383, &
         wf%n_v, &
         zero, &
         X384, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X383)
      call add_1423_to_1234(one, X384, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X384)
      call mem%alloc(X385, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X385, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X386, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         uAxxx_ovo, &
         wf%n_o, &
         X385, &
         wf%n_v*wf%n_o, &
         zero, &
         X386, &
         wf%n_o)
!
      call mem%dealloc(X385)
      call mem%alloc(X387, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         r_vo, &
         wf%n_v, &
         X386, &
         wf%n_o**2, &
         zero, &
         X387, &
         wf%n_o)
!
      call mem%dealloc(X386)
      call mem%alloc(X388, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X388, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X389, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X388, &
         wf%n_v**2, &
         X387, &
         wf%n_o**2, &
         zero, &
         X389, &
         wf%n_v**2)
!
      call mem%dealloc(X387)
      call mem%dealloc(X388)
      call add_1324_to_1234(one, X389, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X389)
      call mem%alloc(X390, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X390, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X391, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         X390, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X391, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X390)
      call mem%alloc(X392, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X391, &
         wf%n_v, &
         r_vo, &
         wf%n_v, &
         zero, &
         X392, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X391)
      call mem%alloc(X393, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X392, &
         wf%n_o, &
         zero, &
         X393, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X392)
      call add_1432_to_1234(one, X393, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X393)
      call mem%alloc(X394, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X394, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X395, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         -two, &
         X394, &
         wf%n_v*wf%n_o**2, &
         u_aibj, &
         wf%n_v, &
         zero, &
         X395, &
         wf%n_v)
!
      call mem%dealloc(X394)
      call mem%alloc(X396, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X395, &
         wf%n_v, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X396, &
         wf%n_v)
!
      call mem%dealloc(X395)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X396, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X396)
      call mem%alloc(X397, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(u_aibj, X397, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X398, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -two, &
         g_ovov, &
         wf%n_o, &
         X397, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X398, &
         wf%n_o)
!
      call mem%dealloc(X397)
      call mem%alloc(X399, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X398, &
         wf%n_o, &
         zero, &
         X399, &
         wf%n_v)
!
      call mem%dealloc(X398)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X399, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X399)
      call mem%alloc(X400, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X400, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X401, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         X400, &
         wf%n_v*wf%n_o**2, &
         u_aibj, &
         wf%n_v, &
         zero, &
         X401, &
         wf%n_v)
!
      call mem%dealloc(X400)
      call mem%alloc(X402, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X401, &
         wf%n_v, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X402, &
         wf%n_v)
!
      call mem%dealloc(X401)
      call mem%alloc(X403, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X402, 1, &
         X403, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X402)
      call add_1432_to_1234(one, X403, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X403)
      call mem%alloc(X404, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(u_aibj, X404, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X405, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         one, &
         g_ovov, &
         wf%n_o, &
         X404, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X405, &
         wf%n_o)
!
      call mem%dealloc(X404)
      call mem%alloc(X406, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X405, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X406, &
         wf%n_o)
!
      call mem%dealloc(X405)
      call mem%alloc(X407, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X406, 1, &
         X407, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X406)
      call add_1423_to_1234(one, X407, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X407)
      call mem%alloc(X408, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X408, &
         wf%n_o)
!
      call mem%alloc(X409, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(X408, X409, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X408)
      call mem%alloc(X410, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X409, &
         wf%n_o**2, &
         zero, &
         X410, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X409)
      call mem%alloc(X411, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_2134(X410, X411, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X410)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X411, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X411)
      call mem%alloc(X412, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X412, &
         wf%n_o)
!
      call mem%alloc(X413, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(u_aibj, X413, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X414, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         one, &
         X413, &
         wf%n_v*wf%n_o, &
         X412, &
         wf%n_o**2, &
         zero, &
         X414, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X412)
      call mem%dealloc(X413)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X414, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X414)
      call mem%alloc(X415, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X415, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X416, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X416, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X417, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v**2, &
         one, &
         X416, &
         wf%n_v**2, &
         X415, &
         wf%n_o**2, &
         zero, &
         X417, &
         wf%n_o**2)
!
      call mem%dealloc(X415)
      call mem%dealloc(X416)
      call mem%alloc(X418, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X417, &
         wf%n_o**3, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X418, &
         wf%n_o**3)
!
      call mem%dealloc(X417)
      call mem%alloc(X419, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(X418, X419, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X418)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X419, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X419)
      call mem%alloc(X420, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         r_vo, &
         wf%n_v, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X420, &
         wf%n_o)
!
      call mem%alloc(X421, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(X420, X421, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X420)
      call mem%alloc(X422, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X421, &
         wf%n_o**2, &
         zero, &
         X422, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X421)
      call mem%alloc(X423, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X422, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X423, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X422)
      call add_1423_to_1234(one, X423, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X423)
      call mem%alloc(X424, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X424, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X425, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1342(X424, X425, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X424)
      call mem%alloc(X426, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**3, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X425, &
         wf%n_o**3, &
         r_vo, &
         wf%n_v, &
         zero, &
         X426, &
         wf%n_o**3)
!
      call mem%dealloc(X425)
      call mem%alloc(X427, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X427, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X428, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o**2, &
         one, &
         X427, &
         wf%n_v**2, &
         X426, &
         wf%n_o**2, &
         zero, &
         X428, &
         wf%n_v**2)
!
      call mem%dealloc(X426)
      call mem%dealloc(X427)
      call add_1342_to_1234(one, X428, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X428)
      call mem%alloc(X429, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         r_vo, &
         wf%n_v, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X429, &
         wf%n_o)
!
      call mem%alloc(X430, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(u_aibj, X430, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X431, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         one, &
         X430, &
         wf%n_v*wf%n_o, &
         X429, &
         wf%n_o**2, &
         zero, &
         X431, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X429)
      call mem%dealloc(X430)
      call mem%alloc(X432, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X431, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X432, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X431)
      call add_1423_to_1234(one, X432, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X432)
      call mem%alloc(X433, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X433, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X434, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X433, &
         wf%n_o, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X434, &
         wf%n_o)
!
      call mem%dealloc(X433)
      call mem%alloc(X435, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X434, X435, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X434)
      call mem%alloc(X436, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uxIxx_vvo, &
         wf%n_v, &
         X435, &
         wf%n_o, &
         zero, &
         X436, &
         wf%n_v)
!
      call mem%dealloc(X435)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X436, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X436)
      call mem%alloc(X437, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X437, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X438, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -two, &
         g_ovov, &
         wf%n_o, &
         X437, 1, &
         zero, &
         X438, 1)
!
      call mem%dealloc(X437)
      call mem%alloc(X439, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X438, 1, &
         zero, &
         X439, 1)
!
      call mem%dealloc(X438)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X439, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X439)
      call mem%alloc(X440, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X440, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X441, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X440, &
         wf%n_o, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X441, &
         wf%n_o)
!
      call mem%dealloc(X440)
      call mem%alloc(X442, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X441, X442, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X441)
      call mem%alloc(X443, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X442, &
         wf%n_o, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X443, &
         wf%n_o)
!
      call mem%dealloc(X442)
      call mem%alloc(X444, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X443, 1, &
         X444, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X443)
      call add_1423_to_1234(one, X444, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X444)
      call mem%alloc(X445, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X445, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X446, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         one, &
         g_ovov, &
         wf%n_o, &
         X445, 1, &
         zero, &
         X446, 1)
!
      call mem%dealloc(X445)
      call mem%alloc(X447, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X446, 1, &
         zero, &
         X447, 1)
!
      call mem%dealloc(X446)
      call mem%alloc(X448, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X447, 1, &
         X448, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X447)
      call add_1432_to_1234(one, X448, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X448)
      call mem%alloc(X449, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X449, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X450, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X449, &
         wf%n_v, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X450, &
         wf%n_v)
!
      call mem%dealloc(X449)
      call mem%alloc(X451, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(uAxxx_ovo, X451, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X452, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X451, &
         wf%n_o**2, &
         X450, &
         wf%n_v*wf%n_o, &
         zero, &
         X452, &
         wf%n_o**2)
!
      call mem%dealloc(X450)
      call mem%dealloc(X451)
      call mem%alloc(X453, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(X452, X453, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X452)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X453, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X453)
      call mem%alloc(X454, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X454, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X455, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X454, &
         wf%n_o, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X455, &
         wf%n_o)
!
      call mem%dealloc(X454)
      call mem%alloc(X456, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(uxIxx_vvo, X456, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X457, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X456, &
         wf%n_v*wf%n_o, &
         X455, &
         wf%n_o**2, &
         zero, &
         X457, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X455)
      call mem%dealloc(X456)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X457, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X457)
      call mem%alloc(X458, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X458, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X459, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X458, &
         wf%n_v, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X459, &
         wf%n_v)
!
      call mem%dealloc(X458)
      call mem%alloc(X460, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         r_vo, &
         wf%n_v, &
         X459, &
         wf%n_v*wf%n_o, &
         zero, &
         X460, &
         wf%n_o)
!
      call mem%dealloc(X459)
      call mem%alloc(X461, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(uAxxx_ovo, X461, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X462, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X461, &
         wf%n_v*wf%n_o, &
         X460, &
         wf%n_v*wf%n_o, &
         zero, &
         X462, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X460)
      call mem%dealloc(X461)
      call add_1423_to_1234(one, X462, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X462)
      call mem%alloc(X463, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X463, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X464, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X463, &
         wf%n_v, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X464, &
         wf%n_v)
!
      call mem%dealloc(X463)
      call mem%alloc(X465, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X464, &
         wf%n_v*wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X465, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X464)
      call mem%alloc(X466, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X465, X466, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X465)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X466, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X466)
      call mem%alloc(X467, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_321(uAxxx_ovo, X467, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X468, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -two, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         X467, 1, &
         zero, &
         X468, 1)
!
      call mem%dealloc(X467)
      call mem%alloc(X469, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X468, 1, &
         zero, &
         X469, 1)
!
      call mem%dealloc(X468)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X469, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X469)
      call mem%alloc(X470, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_321(uAxxx_ovo, X470, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X471, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         X470, 1, &
         zero, &
         X471, 1)
!
      call mem%dealloc(X470)
      call mem%alloc(X472, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X471, 1, &
         zero, &
         X472, 1)
!
      call mem%dealloc(X471)
      call mem%alloc(X473, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X472, 1, &
         X473, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X472)
      call add_1432_to_1234(one, X473, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X473)
      call mem%alloc(X474, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X474, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X475, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X474, &
         wf%n_o, &
         zero, &
         X475, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X474)
      call mem%alloc(X476, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X475, X476, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X475)
      call mem%alloc(X477, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X476, &
         wf%n_o**2, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X477, &
         wf%n_o**2)
!
      call mem%dealloc(X476)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X477, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X477)
      call mem%alloc(X478, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_ovov, X478, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X479, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X479, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X480, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v**2, &
         one, &
         X479, &
         wf%n_v**2, &
         X478, &
         wf%n_o**2, &
         zero, &
         X480, &
         wf%n_o)
!
      call mem%dealloc(X478)
      call mem%dealloc(X479)
      call mem%alloc(X481, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X480, &
         wf%n_o**2, &
         zero, &
         X481, &
         wf%n_v)
!
      call mem%dealloc(X480)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X481, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X481)
      call mem%alloc(X482, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X482, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X483, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X482, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X483, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X482)
      call mem%alloc(X484, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X483, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X484, &
         wf%n_o**2)
!
      call mem%dealloc(X483)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X484, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X484)
      call mem%alloc(X485, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X485, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X486, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X485, &
         wf%n_o, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X486, &
         wf%n_o)
!
      call mem%dealloc(X485)
      call mem%alloc(X487, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         r_vo, &
         wf%n_v, &
         X486, &
         wf%n_o**2, &
         zero, &
         X487, &
         wf%n_o)
!
      call mem%dealloc(X486)
      call mem%alloc(X488, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X488, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X489, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X488, &
         wf%n_v**2, &
         X487, &
         wf%n_o**2, &
         zero, &
         X489, &
         wf%n_v**2)
!
      call mem%dealloc(X487)
      call mem%dealloc(X488)
      call add_1324_to_1234(one, X489, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X489)
      call mem%alloc(X490, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         r_vo, &
         wf%n_v, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X490, &
         wf%n_o)
!
      call mem%alloc(X491, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(X490, X491, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X490)
      call mem%alloc(X492, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X492, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X493, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         one, &
         X492, &
         wf%n_o**2, &
         X491, &
         wf%n_v*wf%n_o, &
         zero, &
         X493, &
         wf%n_v)
!
      call mem%dealloc(X491)
      call mem%dealloc(X492)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X493, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X493)
      call mem%alloc(X494, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X494, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X495, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X494, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v, &
         zero, &
         X495, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X494)
      call mem%alloc(X496, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X495, &
         wf%n_v, &
         r_vo, &
         wf%n_v, &
         zero, &
         X496, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X495)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X496, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X496)
      call mem%alloc(X497, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(u_aibj, X497, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X498, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -four, &
         g_ovov, &
         wf%n_o, &
         X497, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X498, &
         wf%n_o)
!
      call mem%dealloc(X497)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         rAI, &
         t_aibj, &
         wf%n_v**2*wf%n_o, &
         X498, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X498)
      call mem%alloc(X499, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(u_aibj, X499, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X500, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         two, &
         g_ovov, &
         wf%n_o, &
         X499, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X500, &
         wf%n_o)
!
      call mem%dealloc(X499)
      call mem%alloc(X501, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         rAI, &
         t_aibj, &
         wf%n_v**2*wf%n_o, &
         X500, &
         wf%n_o, &
         zero, &
         X501, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X500)
      call add_1432_to_1234(rAI, X501, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X501)
      call mem%alloc(X502, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X502, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X503, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         -two, &
         X502, &
         wf%n_v*wf%n_o**2, &
         u_aibj, &
         wf%n_v, &
         zero, &
         X503, &
         wf%n_v)
!
      call mem%dealloc(X502)
      call mem%alloc(X504, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1243(u_aibj, X504, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X505, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         rAI, &
         X504, &
         wf%n_v*wf%n_o**2, &
         X503, &
         wf%n_v, &
         zero, &
         X505, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X503)
      call mem%dealloc(X504)
      call add_1243_to_1234(rAI, X505, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X505)
      call mem%alloc(X506, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         one, &
         g_ovov, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X506, 1)
!
      call mem%alloc(X507, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X506, &
         wf%n_v*wf%n_o, &
         t_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X507, &
         wf%n_v)
!
      call mem%dealloc(X506)
      call mem%alloc(X508, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X508, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X509, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X508, &
         wf%n_v*wf%n_o, &
         X507, &
         wf%n_v, &
         zero, &
         X509, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X507)
      call mem%dealloc(X508)
      call add_1432_to_1234(one, X509, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X509)
      call mem%alloc(X510, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         four, &
         g_ovov, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X510, 1)
!
      call mem%alloc(X511, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X510, &
         wf%n_v*wf%n_o, &
         t_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X511, &
         wf%n_v)
!
      call mem%dealloc(X510)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X511, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X511)
      call mem%alloc(X512, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -two, &
         g_ovov, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X512, 1)
!
      call mem%alloc(X513, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X512, &
         wf%n_v*wf%n_o, &
         t_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X513, &
         wf%n_v)
!
      call mem%dealloc(X512)
      call mem%alloc(X514, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X513, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X514, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X513)
      call add_1432_to_1234(one, X514, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X514)
      call mem%alloc(X515, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -two, &
         g_ovov, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X515, 1)
!
      call mem%alloc(X516, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(t_aibj, X516, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X517, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X515, &
         wf%n_v*wf%n_o, &
         X516, &
         wf%n_v*wf%n_o, &
         zero, &
         X517, &
         wf%n_v)
!
      call mem%dealloc(X515)
      call mem%dealloc(X516)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         X517, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X517)
      call mem%alloc(X518, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X518, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X519, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v**2, &
         two, &
         X518, &
         wf%n_o**2, &
         uxIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X519, &
         wf%n_o**2)
!
      call mem%dealloc(X518)
      call mem%alloc(X520, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X519, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X520, 1)
!
      call mem%dealloc(X519)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         t_aibj, &
         wf%n_v**2*wf%n_o, &
         X520, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X520)
      call mem%alloc(X521, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X521, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X522, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v**2, &
         -one, &
         X521, &
         wf%n_o**2, &
         uxIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X522, &
         wf%n_o**2)
!
      call mem%dealloc(X521)
      call mem%alloc(X523, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X522, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X523, 1)
!
      call mem%dealloc(X522)
      call mem%alloc(X524, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         t_aibj, &
         wf%n_v**2*wf%n_o, &
         X523, &
         wf%n_o, &
         zero, &
         X524, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X523)
      call add_1432_to_1234(one, X524, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X524)
      call mem%alloc(X525, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -one, &
         g_ovov, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X525, 1)
!
      call mem%alloc(X526, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(t_aibj, X526, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X527, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X525, &
         wf%n_v*wf%n_o, &
         X526, &
         wf%n_v*wf%n_o, &
         zero, &
         X527, &
         wf%n_v)
!
      call mem%dealloc(X525)
      call mem%dealloc(X526)
      call mem%alloc(X528, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X528, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X529, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X528, &
         wf%n_v*wf%n_o, &
         X527, &
         wf%n_v, &
         zero, &
         X529, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X527)
      call mem%dealloc(X528)
      call add_1432_to_1234(one, X529, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X529)
      call mem%alloc(X530, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X530, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X531, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         txIxx_vvo, &
         wf%n_v, &
         X530, &
         wf%n_v*wf%n_o, &
         zero, &
         X531, &
         wf%n_v)
!
      call mem%dealloc(X530)
      call mem%alloc(X532, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(X531, X532, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X531)
      call mem%alloc(X533, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X532, &
         wf%n_v, &
         zero, &
         X533, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X532)
      call mem%alloc(X534, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X533, 1, &
         rAx_o, 1, &
         X534, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X533)
      call add_1432_to_1234(one, X534, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X534)
      call mem%alloc(X535, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X535, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X536, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v**2, &
         -one, &
         X535, &
         wf%n_o**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X536, &
         wf%n_o**2)
!
      call mem%dealloc(X535)
      call mem%alloc(X537, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X537, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X538, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X537, &
         wf%n_v**2, &
         X536, &
         wf%n_o**2, &
         zero, &
         X538, &
         wf%n_v**2)
!
      call mem%dealloc(X536)
      call mem%dealloc(X537)
      call mem%alloc(X539, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X538, 1, &
         rAx_o, 1, &
         X539, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X538)
      call add_1342_to_1234(one, X539, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X539)
      call mem%alloc(X540, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X540, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X541, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X541, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X542, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v**2, &
         -one, &
         X540, &
         wf%n_o**2, &
         X541, &
         wf%n_v**2, &
         zero, &
         X542, &
         wf%n_o**2)
!
      call mem%dealloc(X540)
      call mem%dealloc(X541)
      call mem%alloc(X543, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_o**3, &
         one, &
         X542, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X543, 1)
!
      call mem%dealloc(X542)
      call mem%alloc(X544, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X543, &
         wf%n_o, &
         zero, &
         X544, &
         wf%n_v**2)
!
      call mem%dealloc(X543)
      call add_1324_to_1234(one, X544, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X544)
      call mem%alloc(X545, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -one, &
         g_ovov, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X545, 1)
!
      call mem%alloc(X546, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X545, &
         wf%n_v*wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X546, &
         wf%n_v)
!
      call mem%dealloc(X545)
      call mem%alloc(X547, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X547, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X547, &
         wf%n_v*wf%n_o, &
         X546, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X546)
      call mem%dealloc(X547)
      call mem%alloc(X548, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X548, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X549, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -one, &
         X548, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X549, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X548)
      call mem%alloc(X550, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(u_aibj, X550, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X551, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         X550, &
         wf%n_v*wf%n_o, &
         X549, &
         wf%n_v*wf%n_o, &
         zero, &
         X551, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X549)
      call mem%dealloc(X550)
      call mem%alloc(X552, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X551, 1, &
         rAx_o, 1, &
         X552, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X551)
      call add_1432_to_1234(one, X552, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X552)
      call mem%alloc(X553, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X553, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X554, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X553, &
         wf%n_v, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X554, &
         wf%n_v)
!
      call mem%dealloc(X553)
      call mem%alloc(X555, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(X554, X555, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X554)
      call mem%alloc(X556, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X555, &
         wf%n_v, &
         zero, &
         X556, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X555)
      call mem%alloc(X557, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X556, 1, &
         rAx_o, 1, &
         X557, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X556)
      call add_1432_to_1234(one, X557, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X557)
      call mem%alloc(X558, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X558, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X559, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         one, &
         g_ovov, &
         wf%n_o, &
         X558, 1, &
         zero, &
         X559, 1)
!
      call mem%dealloc(X558)
      call mem%alloc(X560, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v**2*wf%n_o, &
         X559, 1, &
         zero, &
         X560, 1)
!
      call mem%dealloc(X559)
      call mem%alloc(X561, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_312(X560, X561, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X560)
      call mem%alloc(X562, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X561, 1, &
         rAx_o, 1, &
         X562, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X561)
      call add_1342_to_1234(one, X562, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X562)
      call mem%alloc(X563, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X563, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X564, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         X563, &
         wf%n_v*wf%n_o**2, &
         u_aibj, &
         wf%n_v, &
         zero, &
         X564, &
         wf%n_v)
!
      call mem%dealloc(X563)
      call mem%alloc(X565, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X565, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X566, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X565, &
         wf%n_v*wf%n_o, &
         X564, &
         wf%n_v, &
         zero, &
         X566, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X564)
      call mem%dealloc(X565)
      call mem%alloc(X567, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X566, 1, &
         rAx_o, 1, &
         X567, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X566)
      call add_1432_to_1234(one, X567, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X567)
      call mem%alloc(X568, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(u_aibj, X568, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X569, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         one, &
         g_ovov, &
         wf%n_o, &
         X568, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X569, &
         wf%n_o)
!
      call mem%dealloc(X568)
      call mem%alloc(X570, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         uxIxx_vvo, &
         wf%n_v**2, &
         X569, &
         wf%n_o, &
         zero, &
         X570, &
         wf%n_v**2)
!
      call mem%dealloc(X569)
      call mem%alloc(X571, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X570, 1, &
         rAx_o, 1, &
         X571, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X570)
      call add_1342_to_1234(one, X571, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X571)
      call mem%alloc(X572, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X572, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X573, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         X572, &
         wf%n_v*wf%n_o**2, &
         u_aibj, &
         wf%n_v, &
         zero, &
         X573, &
         wf%n_v)
!
      call mem%dealloc(X572)
      call mem%alloc(X574, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X573, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X574, &
         wf%n_v)
!
      call mem%dealloc(X573)
      call mem%alloc(X575, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X574, 1, &
         rAx_o, 1, &
         X575, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X574)
      call add_1342_to_1234(one, X575, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X575)
      call mem%alloc(X576, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         one, &
         g_ovov, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X576, 1)
!
      call mem%alloc(X577, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(X576, X577, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X576)
      call mem%alloc(X578, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X577, &
         wf%n_v, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X578, &
         wf%n_v)
!
      call mem%dealloc(X577)
      call mem%alloc(X579, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X578, &
         wf%n_v, &
         zero, &
         X579, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X578)
      call add_1432_to_1234(one, X579, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X579)
      call mem%alloc(X580, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -two, &
         g_ovov, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X580, 1)
!
      call mem%alloc(X581, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(X580, X581, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X580)
      call mem%alloc(X582, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X581, &
         wf%n_v, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X582, &
         wf%n_v)
!
      call mem%dealloc(X581)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X582, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X582)
      call mem%alloc(X583, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X583, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X584, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X584, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X585, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X583, &
         wf%n_v*wf%n_o, &
         X584, &
         wf%n_o, &
         zero, &
         X585, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X583)
      call mem%dealloc(X584)
      call mem%alloc(X586, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         t_aibj, &
         wf%n_v*wf%n_o, &
         X585, &
         wf%n_v*wf%n_o, &
         zero, &
         X586, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X585)
      call mem%alloc(X587, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_213(X586, X587, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X586)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X587, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X587)
      call mem%alloc(X588, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X588, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X589, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -one, &
         X588, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X589, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X588)
      call mem%alloc(X590, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(t_aibj, X590, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X591, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X590, &
         wf%n_v*wf%n_o, &
         X589, &
         wf%n_v*wf%n_o, &
         zero, &
         X591, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X589)
      call mem%dealloc(X590)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X591, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X591)
      call mem%alloc(X592, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X592, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X593, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(t_aibj, X593, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X594, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v**2, &
         -one, &
         X592, &
         wf%n_o**2, &
         X593, &
         wf%n_v**2, &
         zero, &
         X594, &
         wf%n_o**2)
!
      call mem%dealloc(X592)
      call mem%dealloc(X593)
      call mem%alloc(X595, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X595, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X596, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X594, &
         wf%n_o**2, &
         X595, &
         wf%n_o**2, &
         zero, &
         X596, &
         wf%n_o**2)
!
      call mem%dealloc(X594)
      call mem%dealloc(X595)
      call mem%alloc(X597, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X596, X597, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X596)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X597, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X597)
      call mem%alloc(X598, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -one, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X598, 1)
!
      call mem%alloc(X599, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(X598, X599, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X598)
      call mem%alloc(X600, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X599, &
         wf%n_v*wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X600, &
         wf%n_o)
!
      call mem%dealloc(X599)
      call mem%alloc(X601, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X600, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X601, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X600)
      call add_1423_to_1234(one, X601, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X601)
      call mem%alloc(X602, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -one, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X602, 1)
!
      call mem%alloc(X603, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(u_aibj, X603, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X604, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X602, &
         wf%n_o, &
         X603, &
         wf%n_v*wf%n_o, &
         zero, &
         X604, &
         wf%n_o)
!
      call mem%dealloc(X602)
      call mem%dealloc(X603)
      call mem%alloc(X605, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X604, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X605, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X604)
      call add_1423_to_1234(one, X605, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X605)
      call mem%alloc(X606, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -one, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X606, 1)
!
      call mem%alloc(X607, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X606, X607, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X606)
      call mem%alloc(X608, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X608, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X609, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X608, &
         wf%n_o**2, &
         X607, &
         wf%n_o**2, &
         zero, &
         X609, &
         wf%n_o**2)
!
      call mem%dealloc(X607)
      call mem%dealloc(X608)
      call mem%alloc(X610, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1243(X609, X610, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X609)
      call mem%alloc(X611, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X611, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X612, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o**2, &
         one, &
         X611, &
         wf%n_v**2, &
         X610, &
         wf%n_o**2, &
         zero, &
         X612, &
         wf%n_v**2)
!
      call mem%dealloc(X610)
      call mem%dealloc(X611)
      call add_1324_to_1234(one, X612, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X612)
      call mem%alloc(X613, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X613, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X614, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X613, &
         wf%n_o, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X614, &
         wf%n_o)
!
      call mem%dealloc(X613)
      call mem%alloc(X615, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X614, X615, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X614)
      call mem%alloc(X616, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X615, &
         wf%n_o, &
         zero, &
         X616, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X615)
      call mem%alloc(X617, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_213(X616, X617, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X616)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X617, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X617)
      call mem%alloc(X618, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_321(uAxxx_ovo, X618, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X619, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         X618, 1, &
         zero, &
         X619, 1)
!
      call mem%dealloc(X618)
      call mem%alloc(X620, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         u_aibj, &
         wf%n_v, &
         X619, 1, &
         zero, &
         X620, 1)
!
      call mem%dealloc(X619)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X620, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X620)
      call mem%alloc(X621, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X621, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X622, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         X621, &
         wf%n_v*wf%n_o**2, &
         u_aibj, &
         wf%n_v, &
         zero, &
         X622, &
         wf%n_v)
!
      call mem%dealloc(X621)
      call mem%alloc(X623, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X623, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X624, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X623, &
         wf%n_o**2, &
         X622, &
         wf%n_v, &
         zero, &
         X624, &
         wf%n_o**2)
!
      call mem%dealloc(X622)
      call mem%dealloc(X623)
      call mem%alloc(X625, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X624, X625, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X624)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X625, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X625)
      call mem%alloc(X626, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(u_aibj, X626, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X627, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         one, &
         g_ovov, &
         wf%n_o, &
         X626, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X627, &
         wf%n_o)
!
      call mem%dealloc(X626)
      call mem%alloc(X628, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X627, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X628, &
         wf%n_o)
!
      call mem%dealloc(X627)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X628, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X628)
      call mem%alloc(X629, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(u_aibj, X629, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X630, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         one, &
         g_ovov, &
         wf%n_o, &
         X629, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X630, &
         wf%n_o)
!
      call mem%dealloc(X629)
      call mem%alloc(X631, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X630, &
         wf%n_o, &
         zero, &
         X631, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X630)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X631, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X631)
      call mem%alloc(X632, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X632, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X633, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X632, &
         wf%n_o, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X633, &
         wf%n_o)
!
      call mem%dealloc(X632)
      call mem%alloc(X634, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X633, &
         wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X634, 1)
!
      call mem%dealloc(X633)
      call mem%alloc(X635, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X635, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X636, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X635, &
         wf%n_v**2*wf%n_o, &
         X634, &
         wf%n_o, &
         zero, &
         X636, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X634)
      call mem%dealloc(X635)
      call add_1342_to_1234(one, X636, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X636)
      call mem%alloc(X637, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X637, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X638, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X637, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X638, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X637)
      call mem%alloc(X639, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X638, &
         wf%n_v, &
         rxI_v, 1, &
         zero, &
         X639, 1)
!
      call mem%dealloc(X638)
      call mem%alloc(X640, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X640, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X641, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X640, &
         wf%n_v**2*wf%n_o, &
         X639, &
         wf%n_o, &
         zero, &
         X641, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X639)
      call mem%dealloc(X640)
      call add_1342_to_1234(one, X641, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X641)
      call mem%alloc(X642, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X642, 1)
!
      call mem%alloc(X643, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(X642, X643, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X642)
      call mem%alloc(X644, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X644, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X645, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X643, &
         wf%n_o**2, &
         X644, &
         wf%n_o**2, &
         zero, &
         X645, &
         wf%n_v)
!
      call mem%dealloc(X643)
      call mem%dealloc(X644)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X645, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X645)
!
   end subroutine mu_4_H_nu_1_s_doublet_ccsd

