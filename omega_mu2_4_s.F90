   subroutine omega_μ2_4_s_doublet_ccsd(wf, omega_bjck, LAxxx_voo, LAxxx_vvv, L_ovov, L_voov, LxIxx_ooo, LxxxI_vvo, gAIxx_ov, gAxAx_vv, gAxxI_vo, gAxxx_oov, gAxxx_voo, gAxxx_vvv, g_oooo, g_ovov, g_voov, g_vvoo, g_vvvv, gxIxI_oo, gxIxx_ooo, gxIxx_vov, gxxxI_vvo, tAIAx_o, tAIxI_v, tAIxx_vo, tAxAx_oo, tAxxI_ov, tAxxx_ovo, t_vovo, txIxI_vv, txIxx_vvo, txxxI_vov, uAIxx_vo, uAxxx_ovo, uxIxx_vvo, uxxxI_vov)
!!
!! Generated function
!!
      implicit none
!
      class(doublet_ccsd), intent(in) :: wf
!
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o,wf%n_v), intent(inout) :: omega_bjck
!
      real(dp), dimension(wf%n_o), intent(in) :: tAIAx_o
      real(dp), dimension(wf%n_v), intent(in) :: tAIxI_v
      real(dp), dimension(wf%n_o,wf%n_o), intent(in) :: gxIxI_oo, tAxAx_oo
      real(dp), dimension(wf%n_o,wf%n_v), intent(in) :: gAIxx_ov, tAxxI_ov
      real(dp), dimension(wf%n_v,wf%n_o), intent(in) :: gAxxI_vo, tAIxx_vo, uAIxx_vo
      real(dp), dimension(wf%n_v,wf%n_v), intent(in) :: gAxAx_vv, txIxI_vv
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_o), intent(in) :: LxIxx_ooo, gxIxx_ooo
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_v), intent(in) :: gAxxx_oov
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o), intent(in) :: tAxxx_ovo, uAxxx_ovo
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_o), intent(in) :: LAxxx_voo, gAxxx_voo
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v), intent(in) :: gxIxx_vov, txxxI_vov, uxxxI_vov
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_o), intent(in) :: LxxxI_vvo, gxxxI_vvo, txIxx_vvo, uxIxx_vvo
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_v), intent(in) :: LAxxx_vvv, gAxxx_vvv
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_o,wf%n_o), intent(in) :: g_oooo
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o,wf%n_v), intent(in) :: L_ovov, g_ovov
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_o,wf%n_v), intent(in) :: L_voov, g_voov
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(in) :: t_vovo
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_o,wf%n_o), intent(in) :: g_vvoo
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_v,wf%n_v), intent(in) :: g_vvvv
!
      real(dp), dimension(:,:), allocatable :: X16, X18, X20, X22, X64, X66, X71, X73, X75, X77, X79, X182, X341, X345, X349, X358, X362, X372, X380, X381, X384, X385, X402, X433, X495, X503, X504, X507, X508, X520, X529, X530, X533, X534, X585, X586, X589, X590, X611, X635, X697, X711, X769, X774, X838, X839, X848, X849, X857, X858, X866, X867, X868, X870, X871, X872, X874, X875
      real(dp), dimension(:,:,:), allocatable :: X2, X3, X4, X5, X6, X7, X25, X26, X28, X29, X32, X33, X35, X36, X38, X39, X40, X43, X55, X56, X58, X59, X61, X62, X68, X69, X70, X81, X82, X84, X85, X87, X88, X89, X91, X92, X93, X95, X96, X98, X99, X100, X101, X102, X104, X106, X108, X109, X110, X112, X113, X115, X118, X119, X120, X121, X123, X124, X126, X128, X129, X130, X132, X134, X135, X137, X140, X141, X142, X143, X145, X146, X148, X149, X151, X152, X154, X155, X157, X158, X159, X160, X163, X164, X165, X167, X168, X170, X171, X173, X174, X177, X178, X179, X184, X187, X188, X190, X191, X193, X194, X195, X196, X197, X199, X200, X201, X203, X204, X206, X207, X208, X210, X211, X212, X214, X215, X216, X217, X218, X220, X221, X223, X226, X227, X229, X230, X231, X232, X233, X235, X237, X240, X241, X243, X244, X245, X246, X247, X249, X250, X253, X254, X256, X257, X258, X259, X261, X262, X265, X266, X267, X269, X270, X271, X272, X273, X274, X275, X276, X277, X278, X279, X280, X281, X301, X303, X304, X305, X307, X308, X309, X313, X315, X340, X343, X344, X348, X351, X352, X353, X354, X356, X357, X361, X364, X365, X366, X367, X369, X370, X371, X388, X389, X393, X394, X398, X399, X403, X404, X405, X408, X409, X410, X413, X414, X419, X420, X424, X425, X428, X429, X430, X434, X435, X436, X438, X439, X440, X443, X444, X445, X448, X449, X454, X455, X456, X458, X459, X460, X462, X463, X465, X466, X467, X470, X471, X475, X476, X477, X480, X481, X482, X483, X484, X485, X490, X491, X496, X497, X510, X511, X512, X513, X514, X515, X516, X521, X522, X523, X537, X538, X539, X542, X543, X544, X546, X547, X548, X549, X550, X553, X554, X557, X558, X559, X560, X562, X563, X564, X565, X567, X568, X569, X570, X573, X574, X575, X576, X577, X578, X579, X580, X593, X594, X597, X598, X602, X603, X606, X607, X612, X613, X614, X618, X619, X622, X623, X624, X627, X628, X631, X632, X636, X637, X638, X640, X641, X642, X644, X645, X646, X651, X652, X653, X655, X656, X659, X660, X661, X664, X665, X669, X670, X671, X674, X675, X676, X678, X679, X680, X682, X683, X685, X686, X687, X692, X693, X698, X699, X701, X702, X703, X704, X705, X706, X707, X712, X713, X714, X716, X717, X721, X722, X723, X726, X728, X732, X733, X734, X736, X737, X738, X741, X742, X743, X744, X745, X746, X747, X748, X752, X754, X757, X758, X759, X761, X762, X765, X766, X770, X771, X775, X776, X779, X780, X784, X785, X786, X789, X790, X791, X794, X795, X798, X799, X803, X804, X805, X808, X810, X811, X812, X814, X815, X816, X821, X822, X823, X825, X828, X829, X830, X831, X832, X833, X834, X835, X836, X840, X841, X843, X844, X845, X846, X850, X851, X854, X855, X856, X859, X860, X863, X864, X865, X876, X877, X878
      real(dp), dimension(:,:,:,:), allocatable :: X1, X8, X9, X10, X11, X12, X13, X14, X15, X17, X19, X21, X23, X24, X27, X30, X31, X34, X37, X41, X42, X44, X45, X46, X47, X48, X49, X50, X51, X52, X53, X54, X57, X60, X63, X65, X67, X72, X74, X76, X78, X80, X83, X86, X90, X94, X97, X103, X105, X107, X111, X114, X116, X117, X122, X125, X127, X131, X133, X136, X138, X139, X144, X147, X150, X153, X156, X161, X162, X166, X169, X172, X175, X176, X180, X181, X183, X185, X186, X189, X192, X198, X202, X205, X209, X213, X219, X222, X224, X225, X228, X234, X236, X238, X239, X242, X248, X251, X252, X255, X260, X263, X264, X268, X282, X283, X284, X285, X286, X287, X288, X289, X290, X291, X292, X293, X294, X295, X296, X297, X298, X299, X300, X302, X306, X310, X311, X312, X314, X316, X317, X318, X319, X320, X321, X322, X323, X324, X325, X326, X327, X328, X329, X330, X331, X332, X333, X334, X335, X336, X337, X338, X339, X342, X346, X347, X350, X355, X359, X360, X363, X368, X373, X374, X375, X376, X377, X378, X379, X382, X383, X386, X387, X390, X391, X392, X395, X396, X397, X400, X401, X406, X407, X411, X412, X415, X416, X417, X418, X421, X422, X423, X426, X427, X431, X432, X437, X441, X442, X446, X447, X450, X451, X452, X453, X457, X461, X464, X468, X469, X472, X473, X474, X478, X479, X486, X487, X488, X489, X492, X493, X494, X498, X499, X500, X501, X502, X505, X506, X509, X517, X518, X519, X524, X525, X526, X527, X528, X531, X532, X535, X536, X540, X541, X545, X551, X552, X555, X556, X561, X566, X571, X572, X581, X582, X583, X584, X587, X588, X591, X592, X595, X596, X599, X600, X601, X604, X605, X608, X609, X610, X615, X616, X617, X620, X621, X625, X626, X629, X630, X633, X634, X639, X643, X647, X648, X649, X650, X654, X657, X658, X662, X663, X666, X667, X668, X672, X673, X677, X681, X684, X688, X689, X690, X691, X694, X695, X696, X700, X708, X709, X710, X715, X718, X719, X720, X724, X725, X729, X730, X731, X735, X739, X740, X749, X750, X751, X755, X756, X760, X763, X764, X767, X768, X772, X773, X777, X778, X781, X782, X783, X787, X788, X792, X793, X796, X797, X800, X801, X802, X806, X807, X809, X813, X817, X818, X819, X820, X824, X826, X827, X837, X842, X847, X852, X853, X861, X862, X869, X873
      real(dp), dimension(:,:,:,:,:), allocatable :: X727, X753
!
      call mem%alloc(X1, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(L_voov, X1, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         2.00000000000000, &
         X1, &
         wf%n_v**2*wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X2, 1)
!
      call mem%dealloc(X1)
      call mem%alloc(X3, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_213(X2, X3, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X2)
      call mem%alloc(X4, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_213(uxxxI_vov, X4, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X3, &
         wf%n_v*wf%n_o, &
         X4, &
         wf%n_v*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X3)
      call mem%dealloc(X4)
      call mem%alloc(X5, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         2.00000000000000, &
         L_voov, &
         wf%n_v*wf%n_o**2, &
         tAIxI_v, 1, &
         zero, &
         X5, 1)
!
      call mem%alloc(X6, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_213(X5, X6, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X5)
      call mem%alloc(X7, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X7, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X6, &
         wf%n_v*wf%n_o, &
         X7, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X6)
      call mem%dealloc(X7)
      call mem%alloc(X8, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         L_voov, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X8, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X9, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_2143(X8, X9, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X8)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X9, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X9)
      call mem%alloc(X10, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         L_voov, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X10, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X11, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_2143(X10, X11, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X10)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X11, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X11)
      call mem%alloc(X12, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -2.00000000000000, &
         txIxI_vv, &
         wf%n_v, &
         L_voov, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X12, &
         wf%n_v)
!
      call mem%alloc(X13, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X12, &
         wf%n_v**2*wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X13, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X12)
      call add_4213_to_1234(one, X13, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X13)
      call mem%alloc(X14, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         L_voov, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X14, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X15, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_2143(X14, X15, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X14)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X15, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X15)
      call mem%alloc(X16, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v**2, &
         -2.00000000000000, &
         LAxxx_vvv, &
         wf%n_v, &
         tAIxI_v, 1, &
         zero, &
         X16, 1)
!
      call mem%alloc(X17, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         wf%u_aibj, &
         wf%n_v, &
         X16, &
         wf%n_v, &
         zero, &
         X17, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X16)
      call add_1432_to_1234(one, X17, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X17)
      call mem%alloc(X18, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_o**2, &
         2.00000000000000, &
         LAxxx_voo, &
         wf%n_v, &
         tAIxI_v, 1, &
         zero, &
         X18, 1)
!
      call mem%alloc(X19, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(wf%u_aibj, X19, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X18, &
         wf%n_o, &
         X19, &
         wf%n_v**2*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_o)
!
      call mem%dealloc(X18)
      call mem%dealloc(X19)
      call mem%alloc(X20, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_o**2, &
         -2.00000000000000, &
         LxIxx_ooo, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X20, 1)
!
      call mem%alloc(X21, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(wf%u_aibj, X21, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X20, &
         wf%n_o, &
         X21, &
         wf%n_v**2*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_o)
!
      call mem%dealloc(X20)
      call mem%dealloc(X21)
      call mem%alloc(X22, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_o, &
         2.00000000000000, &
         LxxxI_vvo, &
         wf%n_v**2, &
         tAIAx_o, 1, &
         zero, &
         X22, 1)
!
      call mem%alloc(X23, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         wf%u_aibj, &
         wf%n_v, &
         X22, &
         wf%n_v, &
         zero, &
         X23, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X22)
      call add_1432_to_1234(one, X23, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X23)
      call mem%alloc(X24, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvoo, X24, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X25, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         -2.00000000000000, &
         X24, &
         wf%n_v**2*wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X25, 1)
!
      call mem%dealloc(X24)
      call mem%alloc(X26, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(uxIxx_vvo, X26, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X27, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X26, &
         wf%n_v*wf%n_o, &
         X25, &
         wf%n_v*wf%n_o, &
         zero, &
         X27, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X25)
      call mem%dealloc(X26)
      call add_1423_to_1234(one, X27, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X27)
      call mem%alloc(X28, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_o**3, &
         2.00000000000000, &
         g_oooo, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X28, 1)
!
      call mem%alloc(X29, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X28, X29, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X28)
      call mem%alloc(X30, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X29, &
         wf%n_o**2, &
         uxIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X30, &
         wf%n_o**2)
!
      call mem%dealloc(X29)
      call add_1324_to_1234(one, X30, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X30)
      call mem%alloc(X31, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_voov, X31, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X32, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         -2.00000000000000, &
         X31, &
         wf%n_v**2*wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X32, 1)
!
      call mem%dealloc(X31)
      call mem%alloc(X33, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_213(uxxxI_vov, X33, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X34, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X33, &
         wf%n_v*wf%n_o, &
         X32, &
         wf%n_v*wf%n_o, &
         zero, &
         X34, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X32)
      call mem%dealloc(X33)
      call add_1423_to_1234(one, X34, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X34)
      call mem%alloc(X35, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -2.00000000000000, &
         g_voov, &
         wf%n_v*wf%n_o**2, &
         tAIxI_v, 1, &
         zero, &
         X35, 1)
!
      call mem%alloc(X36, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X36, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X37, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X36, &
         wf%n_o, &
         X35, &
         wf%n_v*wf%n_o, &
         zero, &
         X37, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X35)
      call mem%dealloc(X36)
      call add_1423_to_1234(one, X37, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X37)
      call mem%alloc(X38, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**3, &
         wf%n_v, &
         2.00000000000000, &
         g_vvvv, &
         wf%n_v**3, &
         tAIxI_v, 1, &
         zero, &
         X38, 1)
!
      call mem%alloc(X39, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_132(X38, X39, wf%n_v, wf%n_v, wf%n_v)
      call mem%dealloc(X38)
      call mem%alloc(X40, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X40, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X41, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_v, &
         one, &
         X40, &
         wf%n_o**2, &
         X39, &
         wf%n_v**2, &
         zero, &
         X41, &
         wf%n_o**2)
!
      call mem%dealloc(X39)
      call mem%dealloc(X40)
      call add_1342_to_1234(one, X41, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X41)
      call mem%alloc(X42, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvoo, X42, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X43, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -2.00000000000000, &
         X42, &
         wf%n_v*wf%n_o**2, &
         tAIxI_v, 1, &
         zero, &
         X43, 1)
!
      call mem%dealloc(X42)
      call mem%alloc(X44, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X43, &
         wf%n_v*wf%n_o, &
         zero, &
         X44, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X43)
      call add_1423_to_1234(one, X44, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X44)
      call mem%alloc(X45, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         2.00000000000000, &
         tAxxI_ov, &
         wf%n_o, &
         g_voov, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X45, &
         wf%n_o)
!
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X45, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X45)
      call mem%alloc(X46, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -2.00000000000000, &
         tAIxx_vo, &
         wf%n_v, &
         g_voov, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X46, &
         wf%n_o)
!
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X46, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X46)
      call mem%alloc(X47, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         2.00000000000000, &
         g_voov, &
         wf%n_v*wf%n_o**2, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X47, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X48, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(X47, X48, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X47)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         tAxAx_oo, &
         wf%n_o, &
         X48, &
         wf%n_v**2*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_o)
!
      call mem%dealloc(X48)
      call mem%alloc(X49, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1342(g_vvoo, X49, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X50, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         2.00000000000000, &
         X49, &
         wf%n_v*wf%n_o**2, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X50, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X49)
      call mem%alloc(X51, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1342(X50, X51, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X50)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         tAxAx_oo, &
         wf%n_o, &
         X51, &
         wf%n_v**2*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_o)
!
      call mem%dealloc(X51)
      call mem%alloc(X52, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         2.00000000000000, &
         tAxxI_ov, &
         wf%n_o, &
         g_voov, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X52, &
         wf%n_o)
!
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X52, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X52)
      call mem%alloc(X53, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvoo, X53, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X54, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         2.00000000000000, &
         uAIxx_vo, &
         wf%n_v, &
         X53, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X54, &
         wf%n_o)
!
      call mem%dealloc(X53)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X54, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X54)
      call mem%alloc(X55, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X55, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X56, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         -2.00000000000000, &
         gAIxx_ov, &
         wf%n_o, &
         X55, &
         wf%n_o**2, &
         zero, &
         X56, &
         wf%n_o)
!
      call mem%dealloc(X55)
      call mem%alloc(X57, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X56, &
         wf%n_o, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X57, &
         wf%n_o**2)
!
      call mem%dealloc(X56)
      call add_1324_to_1234(one, X57, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X57)
      call mem%alloc(X58, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X58, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X59, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         gAIxx_ov, &
         wf%n_o, &
         X58, &
         wf%n_v*wf%n_o, &
         zero, &
         X59, &
         wf%n_o)
!
      call mem%dealloc(X58)
      call mem%alloc(X60, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X59, &
         wf%n_o, &
         zero, &
         X60, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X59)
      call add_1423_to_1234(one, X60, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X60)
      call mem%alloc(X61, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         gAIxx_ov, &
         wf%n_o, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X61, &
         wf%n_o)
!
      call mem%alloc(X62, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X62, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X63, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X62, &
         wf%n_o, &
         X61, &
         wf%n_o, &
         zero, &
         X63, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X61)
      call mem%dealloc(X62)
      call add_1423_to_1234(one, X63, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X63)
      call mem%alloc(X64, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         gAIxx_ov, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X64, &
         wf%n_o)
!
      call mem%alloc(X65, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(wf%u_aibj, X65, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X64, &
         wf%n_o, &
         X65, &
         wf%n_v**2*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_o)
!
      call mem%dealloc(X64)
      call mem%dealloc(X65)
      call mem%alloc(X66, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o, &
         2.00000000000000, &
         gAIxx_ov, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X66, &
         wf%n_v)
!
      call mem%alloc(X67, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         wf%u_aibj, &
         wf%n_v, &
         X66, &
         wf%n_v, &
         zero, &
         X67, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X66)
      call add_1432_to_1234(one, X67, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X67)
      call mem%alloc(X68, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         gAIxx_ov, &
         wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X68, &
         wf%n_o)
!
      call mem%alloc(X69, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X68, X69, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X68)
      call mem%alloc(X70, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X70, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X70, &
         wf%n_o, &
         X69, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X69)
      call mem%dealloc(X70)
      call mem%alloc(X71, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v, &
         2.00000000000000, &
         gAxAx_vv, &
         wf%n_v, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X71, &
         wf%n_v)
!
      call mem%alloc(X72, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         wf%u_aibj, &
         wf%n_v, &
         X71, &
         wf%n_v, &
         zero, &
         X72, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X71)
      call add_1432_to_1234(one, X72, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X72)
      call mem%alloc(X73, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o, &
         -2.00000000000000, &
         gAxxI_vo, &
         wf%n_v, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X73, &
         wf%n_v)
!
      call mem%alloc(X74, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         wf%u_aibj, &
         wf%n_v, &
         X73, &
         wf%n_v, &
         zero, &
         X74, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X73)
      call add_1432_to_1234(one, X74, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X74)
      call mem%alloc(X75, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         gAxxI_vo, &
         wf%n_v, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X75, &
         wf%n_o)
!
      call mem%alloc(X76, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(wf%u_aibj, X76, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X75, &
         wf%n_o, &
         X76, &
         wf%n_v**2*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_o)
!
      call mem%dealloc(X75)
      call mem%dealloc(X76)
      call mem%alloc(X77, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         gAxxI_vo, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X77, &
         wf%n_o)
!
      call mem%alloc(X78, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(wf%u_aibj, X78, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X77, &
         wf%n_o, &
         X78, &
         wf%n_v**2*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_o)
!
      call mem%dealloc(X77)
      call mem%dealloc(X78)
      call mem%alloc(X79, wf%n_v, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o, &
         -2.00000000000000, &
         gAxxI_vo, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X79, &
         wf%n_v)
!
      call mem%alloc(X80, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         wf%u_aibj, &
         wf%n_v, &
         X79, &
         wf%n_v, &
         zero, &
         X80, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X79)
      call add_1432_to_1234(one, X80, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X80)
      call mem%alloc(X81, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X81, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X82, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         gAxxI_vo, &
         wf%n_v, &
         X81, &
         wf%n_v*wf%n_o, &
         zero, &
         X82, &
         wf%n_o)
!
      call mem%dealloc(X81)
      call mem%alloc(X83, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X82, &
         wf%n_o, &
         zero, &
         X83, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X82)
      call add_1423_to_1234(one, X83, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X83)
      call mem%alloc(X84, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X84, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X85, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         2.00000000000000, &
         gAxxI_vo, &
         wf%n_v, &
         X84, &
         wf%n_o**2, &
         zero, &
         X85, &
         wf%n_o)
!
      call mem%dealloc(X84)
      call mem%alloc(X86, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X85, &
         wf%n_o, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X86, &
         wf%n_o**2)
!
      call mem%dealloc(X85)
      call add_1324_to_1234(one, X86, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X86)
      call mem%alloc(X87, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X87, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X88, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         gAxxI_vo, &
         wf%n_v, &
         X87, &
         wf%n_v*wf%n_o, &
         zero, &
         X88, &
         wf%n_o)
!
      call mem%dealloc(X87)
      call mem%alloc(X89, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X88, X89, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X88)
      call mem%alloc(X90, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X89, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X90, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X89)
      call add_1423_to_1234(one, X90, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X90)
      call mem%alloc(X91, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X91, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X92, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         2.00000000000000, &
         gAxxI_vo, &
         wf%n_v, &
         X91, &
         wf%n_o**2, &
         zero, &
         X92, &
         wf%n_o)
!
      call mem%dealloc(X91)
      call mem%alloc(X93, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X93, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X94, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X92, &
         wf%n_o, &
         X93, &
         wf%n_v**2, &
         zero, &
         X94, &
         wf%n_o**2)
!
      call mem%dealloc(X92)
      call mem%dealloc(X93)
      call add_1324_to_1234(one, X94, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X94)
      call mem%alloc(X95, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         gAxxI_vo, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X95, &
         wf%n_o)
!
      call mem%alloc(X96, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X96, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X97, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X96, &
         wf%n_o, &
         X95, &
         wf%n_o, &
         zero, &
         X97, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X95)
      call mem%dealloc(X96)
      call add_1423_to_1234(one, X97, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X97)
      call mem%alloc(X98, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         gAxxI_vo, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X98, &
         wf%n_o)
!
      call mem%alloc(X99, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X98, X99, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X98)
      call mem%alloc(X100, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X100, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X100, &
         wf%n_o, &
         X99, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X99)
      call mem%dealloc(X100)
      call mem%alloc(X101, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         gAxxx_vvv, &
         wf%n_v**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X101, &
         wf%n_v**2)
!
      call mem%alloc(X102, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(txIxx_vvo, X102, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X103, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X102, &
         wf%n_v*wf%n_o, &
         X101, &
         wf%n_v, &
         zero, &
         X103, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X101)
      call mem%dealloc(X102)
      call add_1423_to_1234(one, X103, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X103)
      call mem%alloc(X104, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X104, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X105, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         gAxxx_voo, &
         wf%n_v, &
         X104, &
         wf%n_v*wf%n_o, &
         zero, &
         X105, &
         wf%n_o**2)
!
      call mem%dealloc(X104)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X105, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X105)
      call mem%alloc(X106, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_213(gAxxx_oov, X106, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X107, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         X106, &
         wf%n_o**2, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X107, &
         wf%n_o**2)
!
      call mem%dealloc(X106)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X107, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X107)
      call mem%alloc(X108, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         gAxxx_oov, &
         wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X108, &
         wf%n_o**2)
!
      call mem%alloc(X109, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X108, X109, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X108)
      call mem%alloc(X110, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X110, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X111, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X109, &
         wf%n_o**2, &
         X110, &
         wf%n_v**2, &
         zero, &
         X111, &
         wf%n_o**2)
!
      call mem%dealloc(X109)
      call mem%dealloc(X110)
      call add_1324_to_1234(one, X111, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X111)
      call mem%alloc(X112, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_v, &
         2.00000000000000, &
         tAIxx_vo, &
         wf%n_v, &
         gAxxx_vvv, &
         wf%n_v, &
         zero, &
         X112, &
         wf%n_o)
!
      call mem%alloc(X113, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(uxIxx_vvo, X113, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X114, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X113, &
         wf%n_v*wf%n_o, &
         X112, &
         wf%n_v*wf%n_o, &
         zero, &
         X114, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X112)
      call mem%dealloc(X113)
      call add_1432_to_1234(one, X114, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X114)
      call mem%alloc(X115, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_213(gAxxx_oov, X115, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X116, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         X115, &
         wf%n_o**2, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X116, &
         wf%n_o**2)
!
      call mem%dealloc(X115)
      call mem%alloc(X117, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X116, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X117, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X116)
      call add_1432_to_1234(one, X117, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X117)
      call mem%alloc(X118, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_v, &
         2.00000000000000, &
         tAIxx_vo, &
         wf%n_v, &
         gAxxx_vvv, &
         wf%n_v, &
         zero, &
         X118, &
         wf%n_o)
!
      call mem%alloc(X119, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_213(uxxxI_vov, X119, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X118, &
         wf%n_v*wf%n_o, &
         X119, &
         wf%n_v*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X118)
      call mem%dealloc(X119)
      call mem%alloc(X120, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         gAxxx_voo, &
         wf%n_v, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X120, &
         wf%n_o**2)
!
      call mem%alloc(X121, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X121, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X122, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X120, &
         wf%n_o, &
         X121, &
         wf%n_v**2, &
         zero, &
         X122, &
         wf%n_o**2)
!
      call mem%dealloc(X120)
      call mem%dealloc(X121)
      call add_1324_to_1234(one, X122, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X122)
      call mem%alloc(X123, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         gAxxx_vvv, &
         wf%n_v**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X123, &
         wf%n_v**2)
!
      call mem%alloc(X124, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(txIxx_vvo, X124, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X125, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X124, &
         wf%n_v*wf%n_o, &
         X123, &
         wf%n_v, &
         zero, &
         X125, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X123)
      call mem%dealloc(X124)
      call add_1423_to_1234(one, X125, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X125)
      call mem%alloc(X126, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X126, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X127, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         gAxxx_voo, &
         wf%n_v, &
         X126, &
         wf%n_v*wf%n_o, &
         zero, &
         X127, &
         wf%n_o**2)
!
      call mem%dealloc(X126)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X127, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X127)
      call mem%alloc(X128, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         gAxxx_oov, &
         wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X128, &
         wf%n_o**2)
!
      call mem%alloc(X129, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X128, X129, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X128)
      call mem%alloc(X130, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X130, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X131, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X129, &
         wf%n_o**2, &
         X130, &
         wf%n_v**2, &
         zero, &
         X131, &
         wf%n_o**2)
!
      call mem%dealloc(X129)
      call mem%dealloc(X130)
      call add_1324_to_1234(one, X131, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X131)
      call mem%alloc(X132, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_213(gAxxx_oov, X132, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X133, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         X132, &
         wf%n_o**2, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X133, &
         wf%n_o**2)
!
      call mem%dealloc(X132)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X133, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X133)
      call mem%alloc(X134, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_v, &
         2.00000000000000, &
         tAxxI_ov, &
         wf%n_o, &
         gAxxx_vvv, &
         wf%n_v, &
         zero, &
         X134, &
         wf%n_o)
!
      call mem%alloc(X135, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(uxIxx_vvo, X135, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X136, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X135, &
         wf%n_v*wf%n_o, &
         X134, &
         wf%n_v*wf%n_o, &
         zero, &
         X136, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X134)
      call mem%dealloc(X135)
      call add_1432_to_1234(one, X136, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X136)
      call mem%alloc(X137, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_213(gAxxx_oov, X137, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X138, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         X137, &
         wf%n_o**2, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X138, &
         wf%n_o**2)
!
      call mem%dealloc(X137)
      call mem%alloc(X139, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X138, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X139, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X138)
      call add_1432_to_1234(one, X139, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X139)
      call mem%alloc(X140, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_v, &
         2.00000000000000, &
         tAxxI_ov, &
         wf%n_o, &
         gAxxx_vvv, &
         wf%n_v, &
         zero, &
         X140, &
         wf%n_o)
!
      call mem%alloc(X141, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_213(uxxxI_vov, X141, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X140, &
         wf%n_v*wf%n_o, &
         X141, &
         wf%n_v*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X140)
      call mem%dealloc(X141)
      call mem%alloc(X142, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         gAxxx_voo, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X142, &
         wf%n_o**2)
!
      call mem%alloc(X143, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X143, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X144, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X142, &
         wf%n_o, &
         X143, &
         wf%n_v**2, &
         zero, &
         X144, &
         wf%n_o**2)
!
      call mem%dealloc(X142)
      call mem%dealloc(X143)
      call add_1324_to_1234(one, X144, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X144)
      call mem%alloc(X145, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         2.00000000000000, &
         gAxxx_oov, &
         wf%n_o**2, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X145, &
         wf%n_o**2)
!
      call mem%alloc(X146, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X145, X146, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X145)
      call mem%alloc(X147, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X146, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X147, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X146)
      call add_1432_to_1234(one, X147, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X147)
      call mem%alloc(X148, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         2.00000000000000, &
         gAxxx_oov, &
         wf%n_o**2, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X148, &
         wf%n_o**2)
!
      call mem%alloc(X149, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X148, X149, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X148)
      call mem%alloc(X150, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X149, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X150, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X149)
      call add_1423_to_1234(one, X150, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X150)
      call mem%alloc(X151, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_v, &
         wf%n_v, &
         -2.00000000000000, &
         gAxxx_vvv, &
         wf%n_v**2, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X151, &
         wf%n_v**2)
!
      call mem%alloc(X152, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X152, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X153, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_v, &
         one, &
         X152, &
         wf%n_o**2, &
         X151, &
         wf%n_v, &
         zero, &
         X153, &
         wf%n_o**2)
!
      call mem%dealloc(X151)
      call mem%dealloc(X152)
      call add_1324_to_1234(one, X153, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X153)
      call mem%alloc(X154, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_v, &
         wf%n_v, &
         -2.00000000000000, &
         gAxxx_vvv, &
         wf%n_v**2, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X154, &
         wf%n_v**2)
!
      call mem%alloc(X155, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(tAxxx_ovo, X155, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X156, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_v, &
         one, &
         X155, &
         wf%n_o**2, &
         X154, &
         wf%n_v, &
         zero, &
         X156, &
         wf%n_o**2)
!
      call mem%dealloc(X154)
      call mem%dealloc(X155)
      call add_1324_to_1234(one, X156, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X156)
      call mem%alloc(X157, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         -2.00000000000000, &
         gAxxx_oov, &
         wf%n_o**2, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X157, &
         wf%n_o**2)
!
      call mem%alloc(X158, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X157, X158, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X157)
      call mem%alloc(X159, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X159, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X158, &
         wf%n_v*wf%n_o, &
         X159, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X158)
      call mem%dealloc(X159)
      call mem%alloc(X160, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X160, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X161, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_v, &
         2.00000000000000, &
         gAxxx_vvv, &
         wf%n_v**2, &
         X160, &
         wf%n_o**2, &
         zero, &
         X161, &
         wf%n_v**2)
!
      call mem%dealloc(X160)
      call mem%alloc(X162, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1423(X161, X162, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X161)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X162, &
         wf%n_v, &
         txIxI_vv, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X162)
      call mem%alloc(X163, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         -2.00000000000000, &
         gAxxx_voo, &
         wf%n_v, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X163, &
         wf%n_o**2)
!
      call mem%alloc(X164, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X164, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X163, &
         wf%n_o, &
         X164, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X163)
      call mem%dealloc(X164)
      call mem%alloc(X165, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         -2.00000000000000, &
         gAxxx_voo, &
         wf%n_v, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X165, &
         wf%n_o**2)
!
      call mem%alloc(X166, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X165, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X166, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X165)
      call add_1432_to_1234(one, X166, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X166)
      call mem%alloc(X167, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         gAxxx_oov, &
         wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X167, &
         wf%n_o**2)
!
      call mem%alloc(X168, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X167, X168, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X167)
      call mem%alloc(X169, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X168, &
         wf%n_o**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X169, &
         wf%n_o**2)
!
      call mem%dealloc(X168)
      call add_1324_to_1234(one, X169, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X169)
      call mem%alloc(X170, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_213(gAxxx_oov, X170, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X171, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X171, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X172, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         X170, &
         wf%n_o**2, &
         X171, &
         wf%n_v*wf%n_o, &
         zero, &
         X172, &
         wf%n_o**2)
!
      call mem%dealloc(X170)
      call mem%dealloc(X171)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X172, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X172)
      call mem%alloc(X173, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         gAxxx_vvv, &
         wf%n_v**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X173, &
         wf%n_v**2)
!
      call mem%alloc(X174, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_213(txxxI_vov, X174, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X175, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X174, &
         wf%n_v*wf%n_o, &
         X173, &
         wf%n_v, &
         zero, &
         X175, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X173)
      call mem%dealloc(X174)
      call add_1423_to_1234(one, X175, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X175)
      call mem%alloc(X176, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         gAxxx_voo, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X176, &
         wf%n_o**2)
!
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X176, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X176)
      call mem%alloc(X177, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_v, &
         -2.00000000000000, &
         uAIxx_vo, &
         wf%n_v, &
         gAxxx_vvv, &
         wf%n_v**2, &
         zero, &
         X177, &
         wf%n_o)
!
      call mem%alloc(X178, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_132(X177, X178, wf%n_o, wf%n_v, wf%n_v)
      call mem%dealloc(X177)
      call mem%alloc(X179, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_213(uxxxI_vov, X179, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X178, &
         wf%n_v*wf%n_o, &
         X179, &
         wf%n_v*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X178)
      call mem%dealloc(X179)
      call mem%alloc(X180, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         gAxxx_voo, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X180, &
         wf%n_o**2)
!
      call mem%alloc(X181, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X180, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X181, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X180)
      call add_1432_to_1234(one, X181, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X181)
      call mem%alloc(X182, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         2.00000000000000, &
         gxIxI_oo, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X182, &
         wf%n_o)
!
      call mem%alloc(X183, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(wf%u_aibj, X183, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X182, &
         wf%n_o, &
         X183, &
         wf%n_v**2*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_o)
!
      call mem%dealloc(X182)
      call mem%dealloc(X183)
      call mem%alloc(X184, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(tAxxx_ovo, X184, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X185, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         X184, &
         wf%n_o**2, &
         gxIxx_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X185, &
         wf%n_o**2)
!
      call mem%dealloc(X184)
      call mem%alloc(X186, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(X185, X186, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X185)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X186, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X186)
      call mem%alloc(X187, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         tAIxx_vo, &
         wf%n_v, &
         gxIxx_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X187, &
         wf%n_o)
!
      call mem%alloc(X188, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X188, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X189, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X188, &
         wf%n_o, &
         X187, &
         wf%n_v*wf%n_o, &
         zero, &
         X189, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X187)
      call mem%dealloc(X188)
      call add_1432_to_1234(one, X189, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X189)
      call mem%alloc(X190, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(gxIxx_ooo, X190, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X191, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         -2.00000000000000, &
         X190, &
         wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X191, &
         wf%n_o**2)
!
      call mem%dealloc(X190)
      call mem%alloc(X192, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X191, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X192, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X191)
      call add_1432_to_1234(one, X192, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X192)
      call mem%alloc(X193, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         tAIxx_vo, &
         wf%n_v, &
         gxIxx_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X193, &
         wf%n_o)
!
      call mem%alloc(X194, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X194, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X193, &
         wf%n_v*wf%n_o, &
         X194, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X193)
      call mem%dealloc(X194)
      call mem%alloc(X195, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         2.00000000000000, &
         gxIxx_ooo, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X195, &
         wf%n_o**2)
!
      call mem%alloc(X196, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X196, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X195, &
         wf%n_o, &
         X196, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X195)
      call mem%dealloc(X196)
      call mem%alloc(X197, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         2.00000000000000, &
         gxIxx_ooo, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X197, &
         wf%n_o**2)
!
      call mem%alloc(X198, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X197, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X198, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X197)
      call add_1432_to_1234(one, X198, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X198)
      call mem%alloc(X199, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_vov, X199, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X200, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_o, &
         2.00000000000000, &
         tAxAx_oo, &
         wf%n_o, &
         X199, &
         wf%n_v**2, &
         zero, &
         X200, &
         wf%n_o)
!
      call mem%dealloc(X199)
      call mem%alloc(X201, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(txIxx_vvo, X201, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X202, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X201, &
         wf%n_v*wf%n_o, &
         X200, &
         wf%n_v*wf%n_o, &
         zero, &
         X202, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X200)
      call mem%dealloc(X201)
      call add_1432_to_1234(one, X202, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X202)
      call mem%alloc(X203, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(gxIxx_ooo, X203, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X204, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_o, &
         -2.00000000000000, &
         X203, &
         wf%n_o**2, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X204, &
         wf%n_o**2)
!
      call mem%dealloc(X203)
      call mem%alloc(X205, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X204, &
         wf%n_o, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X205, &
         wf%n_o**2)
!
      call mem%dealloc(X204)
      call add_1324_to_1234(one, X205, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X205)
      call mem%alloc(X206, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_vov, X206, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X207, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_o, &
         2.00000000000000, &
         tAxAx_oo, &
         wf%n_o, &
         X206, &
         wf%n_v**2, &
         zero, &
         X207, &
         wf%n_o)
!
      call mem%dealloc(X206)
      call mem%alloc(X208, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_213(txxxI_vov, X208, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X209, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X208, &
         wf%n_v*wf%n_o, &
         X207, &
         wf%n_v*wf%n_o, &
         zero, &
         X209, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X207)
      call mem%dealloc(X208)
      call add_1432_to_1234(one, X209, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X209)
      call mem%alloc(X210, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(gxIxx_ooo, X210, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X211, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_o, &
         -2.00000000000000, &
         X210, &
         wf%n_o**2, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X211, &
         wf%n_o**2)
!
      call mem%dealloc(X210)
      call mem%alloc(X212, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X212, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X213, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X211, &
         wf%n_o, &
         X212, &
         wf%n_v**2, &
         zero, &
         X213, &
         wf%n_o**2)
!
      call mem%dealloc(X211)
      call mem%dealloc(X212)
      call add_1324_to_1234(one, X213, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X213)
      call mem%alloc(X214, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_vov, X214, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X215, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_o, &
         -2.00000000000000, &
         tAxAx_oo, &
         wf%n_o, &
         X214, &
         wf%n_v**2, &
         zero, &
         X215, &
         wf%n_o)
!
      call mem%dealloc(X214)
      call mem%alloc(X216, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_213(uxxxI_vov, X216, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X215, &
         wf%n_v*wf%n_o, &
         X216, &
         wf%n_v*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X215)
      call mem%dealloc(X216)
      call mem%alloc(X217, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_o, &
         2.00000000000000, &
         gxIxx_ooo, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X217, &
         wf%n_o**2)
!
      call mem%alloc(X218, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X218, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X219, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X217, &
         wf%n_o, &
         X218, &
         wf%n_v**2, &
         zero, &
         X219, &
         wf%n_o**2)
!
      call mem%dealloc(X217)
      call mem%dealloc(X218)
      call add_1324_to_1234(one, X219, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X219)
      call mem%alloc(X220, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         tAxxI_ov, &
         wf%n_o, &
         gxIxx_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X220, &
         wf%n_o)
!
      call mem%alloc(X221, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X221, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X222, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X221, &
         wf%n_o, &
         X220, &
         wf%n_v*wf%n_o, &
         zero, &
         X222, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X220)
      call mem%dealloc(X221)
      call add_1432_to_1234(one, X222, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X222)
      call mem%alloc(X223, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(tAxxx_ovo, X223, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X224, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         X223, &
         wf%n_o**2, &
         gxIxx_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X224, &
         wf%n_o**2)
!
      call mem%dealloc(X223)
      call mem%alloc(X225, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(X224, X225, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X224)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X225, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X225)
      call mem%alloc(X226, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(gxIxx_ooo, X226, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X227, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         -2.00000000000000, &
         X226, &
         wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X227, &
         wf%n_o**2)
!
      call mem%dealloc(X226)
      call mem%alloc(X228, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X227, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X228, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X227)
      call add_1432_to_1234(one, X228, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X228)
      call mem%alloc(X229, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         tAxxI_ov, &
         wf%n_o, &
         gxIxx_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X229, &
         wf%n_o)
!
      call mem%alloc(X230, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X230, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X229, &
         wf%n_v*wf%n_o, &
         X230, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X229)
      call mem%dealloc(X230)
      call mem%alloc(X231, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         2.00000000000000, &
         gxIxx_ooo, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X231, &
         wf%n_o**2)
!
      call mem%alloc(X232, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X232, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X231, &
         wf%n_o, &
         X232, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X231)
      call mem%dealloc(X232)
      call mem%alloc(X233, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         2.00000000000000, &
         gxIxx_ooo, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X233, &
         wf%n_o**2)
!
      call mem%alloc(X234, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X233, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X234, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X233)
      call add_1432_to_1234(one, X234, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X234)
      call mem%alloc(X235, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         uAIxx_vo, &
         wf%n_v, &
         gxIxx_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X235, &
         wf%n_o)
!
      call mem%alloc(X236, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X235, &
         wf%n_v*wf%n_o, &
         zero, &
         X236, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X235)
      call add_1432_to_1234(one, X236, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X236)
      call mem%alloc(X237, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X237, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X238, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         X237, &
         wf%n_o**2, &
         gxIxx_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X238, &
         wf%n_o**2)
!
      call mem%dealloc(X237)
      call mem%alloc(X239, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(X238, X239, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X238)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X239, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X239)
      call mem%alloc(X240, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(gxIxx_ooo, X240, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X241, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         2.00000000000000, &
         X240, &
         wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X241, &
         wf%n_o**2)
!
      call mem%dealloc(X240)
      call mem%alloc(X242, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X241, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X242, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X241)
      call add_1423_to_1234(one, X242, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X242)
      call mem%alloc(X243, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(gxIxx_ooo, X243, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X244, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         -2.00000000000000, &
         X243, &
         wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X244, &
         wf%n_o**2)
!
      call mem%dealloc(X243)
      call mem%alloc(X245, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X245, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X244, &
         wf%n_o, &
         X245, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X244)
      call mem%dealloc(X245)
      call mem%alloc(X246, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(gxxxI_vvo, X246, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X247, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         tAIxx_vo, &
         wf%n_v, &
         X246, &
         wf%n_v*wf%n_o, &
         zero, &
         X247, &
         wf%n_o)
!
      call mem%dealloc(X246)
      call mem%alloc(X248, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X247, &
         wf%n_v*wf%n_o, &
         zero, &
         X248, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X247)
      call add_1432_to_1234(one, X248, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X248)
      call mem%alloc(X249, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(gxxxI_vvo, X249, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X250, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(uAxxx_ovo, X250, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X251, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         X250, &
         wf%n_o**2, &
         X249, &
         wf%n_v*wf%n_o, &
         zero, &
         X251, &
         wf%n_o**2)
!
      call mem%dealloc(X249)
      call mem%dealloc(X250)
      call mem%alloc(X252, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(X251, X252, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X251)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X252, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X252)
      call mem%alloc(X253, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_o, &
         -2.00000000000000, &
         tAxAx_oo, &
         wf%n_o, &
         gxxxI_vvo, &
         wf%n_v**2, &
         zero, &
         X253, &
         wf%n_o)
!
      call mem%alloc(X254, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(uxIxx_vvo, X254, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X255, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X254, &
         wf%n_v*wf%n_o, &
         X253, &
         wf%n_v*wf%n_o, &
         zero, &
         X255, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X253)
      call mem%dealloc(X254)
      call add_1432_to_1234(one, X255, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X255)
      call mem%alloc(X256, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_o, &
         -2.00000000000000, &
         tAxAx_oo, &
         wf%n_o, &
         gxxxI_vvo, &
         wf%n_v**2, &
         zero, &
         X256, &
         wf%n_o)
!
      call mem%alloc(X257, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_213(uxxxI_vov, X257, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X256, &
         wf%n_v*wf%n_o, &
         X257, &
         wf%n_v*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X256)
      call mem%dealloc(X257)
      call mem%alloc(X258, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(gxxxI_vvo, X258, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X259, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         tAxxI_ov, &
         wf%n_o, &
         X258, &
         wf%n_v*wf%n_o, &
         zero, &
         X259, &
         wf%n_o)
!
      call mem%dealloc(X258)
      call mem%alloc(X260, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X259, &
         wf%n_v*wf%n_o, &
         zero, &
         X260, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X259)
      call add_1432_to_1234(one, X260, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X260)
      call mem%alloc(X261, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(gxxxI_vvo, X261, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X262, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(uAxxx_ovo, X262, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X263, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         X262, &
         wf%n_o**2, &
         X261, &
         wf%n_v*wf%n_o, &
         zero, &
         X263, &
         wf%n_o**2)
!
      call mem%dealloc(X261)
      call mem%dealloc(X262)
      call mem%alloc(X264, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(X263, X264, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X263)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X264, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X264)
      call mem%alloc(X265, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(gxxxI_vvo, X265, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X266, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         uAIxx_vo, &
         wf%n_v, &
         X265, &
         wf%n_v*wf%n_o, &
         zero, &
         X266, &
         wf%n_o)
!
      call mem%dealloc(X265)
      call mem%alloc(X267, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X267, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X268, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X267, &
         wf%n_o, &
         X266, &
         wf%n_v*wf%n_o, &
         zero, &
         X268, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X266)
      call mem%dealloc(X267)
      call add_1432_to_1234(one, X268, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X268)
      call mem%alloc(X269, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(gxxxI_vvo, X269, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X270, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         uAIxx_vo, &
         wf%n_v, &
         X269, &
         wf%n_v*wf%n_o, &
         zero, &
         X270, &
         wf%n_o)
!
      call mem%dealloc(X269)
      call mem%alloc(X271, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X271, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X270, &
         wf%n_v*wf%n_o, &
         X271, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X270)
      call mem%dealloc(X271)
      call mem%alloc(X272, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         2.00000000000000, &
         L_ovov, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X272, 1)
!
      call mem%alloc(X273, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(X272, X273, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X272)
      call mem%alloc(X274, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X273, &
         wf%n_v, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X274, &
         wf%n_v)
!
      call mem%dealloc(X273)
      call mem%alloc(X275, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X274, X275, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X274)
      call mem%alloc(X276, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_213(uxxxI_vov, X276, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X276, &
         wf%n_v*wf%n_o, &
         X275, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X275)
      call mem%dealloc(X276)
      call mem%alloc(X277, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         2.00000000000000, &
         L_ovov, &
         wf%n_v*wf%n_o**2, &
         tAIxI_v, 1, &
         zero, &
         X277, 1)
!
      call mem%alloc(X278, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(X277, X278, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X277)
      call mem%alloc(X279, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X278, &
         wf%n_v*wf%n_o, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X279, &
         wf%n_o)
!
      call mem%dealloc(X278)
      call mem%alloc(X280, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X279, X280, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X279)
      call mem%alloc(X281, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X281, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X281, &
         wf%n_o, &
         X280, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X280)
      call mem%dealloc(X281)
      call mem%alloc(X282, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         L_ovov, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X282, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X283, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_2134(X282, X283, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X282)
      call mem%alloc(X284, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X283, &
         wf%n_v*wf%n_o, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X284, &
         wf%n_o**2)
!
      call mem%dealloc(X283)
      call mem%alloc(X285, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X284, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X285, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X284)
      call add_1432_to_1234(one, X285, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X285)
      call mem%alloc(X286, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         L_ovov, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X286, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X287, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_2134(X286, X287, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X286)
      call mem%alloc(X288, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X287, &
         wf%n_v*wf%n_o, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X288, &
         wf%n_o**2)
!
      call mem%dealloc(X287)
      call mem%alloc(X289, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X288, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X289, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X288)
      call add_1432_to_1234(one, X289, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X289)
      call mem%alloc(X290, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1243(L_ovov, X290, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X291, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         X290, &
         wf%n_v*wf%n_o, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X291, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X290)
      call mem%alloc(X292, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X291, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X292, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X291)
      call mem%alloc(X293, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X292, &
         wf%n_v, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X293, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X292)
      call add_4312_to_1234(one, X293, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X293)
      call mem%alloc(X294, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         L_ovov, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X294, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X295, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_2134(X294, X295, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X294)
      call mem%alloc(X296, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X295, &
         wf%n_v*wf%n_o, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X296, &
         wf%n_o**2)
!
      call mem%dealloc(X295)
      call mem%alloc(X297, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X296, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X297, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X296)
      call add_1432_to_1234(one, X297, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X297)
      call mem%alloc(X298, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X298, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X299, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(t_vovo, X299, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X300, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v**2, &
         2.00000000000000, &
         X298, &
         wf%n_o**2, &
         X299, &
         wf%n_v**2, &
         zero, &
         X300, &
         wf%n_o**2)
!
      call mem%dealloc(X298)
      call mem%dealloc(X299)
      call mem%alloc(X301, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_o**3, &
         one, &
         X300, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X301, 1)
!
      call mem%dealloc(X300)
      call mem%alloc(X302, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X301, &
         wf%n_o, &
         uxIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X302, &
         wf%n_o**2)
!
      call mem%dealloc(X301)
      call add_1324_to_1234(one, X302, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X302)
      call mem%alloc(X303, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         tAIxI_v, 1, &
         zero, &
         X303, 1)
!
      call mem%alloc(X304, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X303, &
         wf%n_o, &
         t_vovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X304, &
         wf%n_o)
!
      call mem%dealloc(X303)
      call mem%alloc(X305, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X305, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X306, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X305, &
         wf%n_o, &
         X304, &
         wf%n_o, &
         zero, &
         X306, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X304)
      call mem%dealloc(X305)
      call add_1423_to_1234(one, X306, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X306)
      call mem%alloc(X307, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         tAIxI_v, 1, &
         zero, &
         X307, 1)
!
      call mem%alloc(X308, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X307, X308, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X307)
      call mem%alloc(X309, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X309, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X310, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X308, &
         wf%n_o**2, &
         X309, &
         wf%n_o**2, &
         zero, &
         X310, &
         wf%n_o**2)
!
      call mem%dealloc(X308)
      call mem%dealloc(X309)
      call mem%alloc(X311, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(t_vovo, X311, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X312, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o**2, &
         one, &
         X310, &
         wf%n_o**2, &
         X311, &
         wf%n_v**2, &
         zero, &
         X312, &
         wf%n_o**2)
!
      call mem%dealloc(X310)
      call mem%dealloc(X311)
      call add_1342_to_1234(one, X312, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X312)
      call mem%alloc(X313, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         tAIxI_v, 1, &
         zero, &
         X313, 1)
!
      call mem%alloc(X314, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(t_vovo, X314, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X315, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X313, &
         wf%n_o, &
         X314, &
         wf%n_v*wf%n_o, &
         zero, &
         X315, &
         wf%n_o)
!
      call mem%dealloc(X313)
      call mem%dealloc(X314)
      call mem%alloc(X316, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X315, &
         wf%n_o, &
         zero, &
         X316, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X315)
      call add_1432_to_1234(one, X316, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X316)
      call mem%alloc(X317, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -2.00000000000000, &
         tAxxI_ov, &
         wf%n_o, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X317, &
         wf%n_o)
!
      call mem%alloc(X318, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         one, &
         t_vovo, &
         wf%n_v*wf%n_o, &
         X317, &
         wf%n_o**2, &
         zero, &
         X318, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X317)
      call mem%alloc(X319, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_2134(X318, X319, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X318)
      call mem%alloc(X320, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X319, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X320, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X319)
      call add_1432_to_1234(one, X320, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X320)
      call mem%alloc(X321, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X321, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X322, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1423(X321, X322, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X321)
      call mem%alloc(X323, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X322, &
         wf%n_o**2, &
         t_vovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X323, &
         wf%n_o**2)
!
      call mem%dealloc(X322)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X323, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X323)
      call mem%alloc(X324, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X324, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X325, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         X324, &
         wf%n_v*wf%n_o, &
         t_vovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X325, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X324)
      call mem%alloc(X326, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         tAxAx_oo, &
         wf%n_o, &
         X325, &
         wf%n_o, &
         zero, &
         X326, &
         wf%n_o)
!
      call mem%dealloc(X325)
      call mem%alloc(X327, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1342(X326, X327, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X326)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X327, &
         wf%n_v*wf%n_o**2, &
         txIxI_vv, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X327)
      call mem%alloc(X328, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X328, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X329, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(t_vovo, X329, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X330, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         X329, &
         wf%n_v*wf%n_o, &
         X328, &
         wf%n_v*wf%n_o, &
         zero, &
         X330, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X328)
      call mem%dealloc(X329)
      call mem%alloc(X331, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         tAxAx_oo, &
         wf%n_o, &
         X330, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X331, &
         wf%n_o)
!
      call mem%dealloc(X330)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X331, &
         wf%n_v*wf%n_o**2, &
         txIxI_vv, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X331)
      call mem%alloc(X332, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X332, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X333, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1423(X332, X333, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X332)
      call mem%alloc(X334, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X333, &
         wf%n_o**2, &
         t_vovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X334, &
         wf%n_o**2)
!
      call mem%dealloc(X333)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X334, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X334)
      call mem%alloc(X335, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X335, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X336, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1432(X335, X336, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X335)
      call mem%alloc(X337, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(t_vovo, X337, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X338, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X336, &
         wf%n_o**2, &
         X337, &
         wf%n_v*wf%n_o, &
         zero, &
         X338, &
         wf%n_o**2)
!
      call mem%dealloc(X336)
      call mem%dealloc(X337)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X338, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X338)
      call mem%alloc(X339, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X339, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X340, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v**2, &
         -2.00000000000000, &
         X339, &
         wf%n_o**2, &
         uxIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X340, &
         wf%n_o**2)
!
      call mem%dealloc(X339)
      call mem%alloc(X341, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X340, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X341, 1)
!
      call mem%dealloc(X340)
      call mem%alloc(X342, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X341, &
         wf%n_o, &
         wf%u_aibj, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X342, &
         wf%n_o)
!
      call mem%dealloc(X341)
      call add_3214_to_1234(one, X342, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X342)
      call mem%alloc(X343, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X343, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X344, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X343, &
         wf%n_v, &
         zero, &
         X344, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X343)
      call mem%alloc(X345, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X344, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X345, 1)
!
      call mem%dealloc(X344)
      call mem%alloc(X346, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         wf%u_aibj, &
         wf%n_v, &
         X345, &
         wf%n_v, &
         zero, &
         X346, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X345)
      call add_1432_to_1234(one, X346, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X346)
      call mem%alloc(X347, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X347, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X348, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         X347, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v, &
         zero, &
         X348, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X347)
      call mem%alloc(X349, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v**2, &
         one, &
         X348, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X349, 1)
!
      call mem%dealloc(X348)
      call mem%alloc(X350, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(wf%u_aibj, X350, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X350, &
         wf%n_v, &
         X349, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X349)
      call mem%dealloc(X350)
      call mem%alloc(X351, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         -2.00000000000000, &
         g_ovov, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X351, 1)
!
      call mem%alloc(X352, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(X351, X352, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X351)
      call mem%alloc(X353, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X352, &
         wf%n_v, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X353, &
         wf%n_v)
!
      call mem%dealloc(X352)
      call mem%alloc(X354, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X353, X354, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X353)
      call mem%alloc(X355, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X354, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X355, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X354)
      call add_1423_to_1234(one, X355, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X355)
      call mem%alloc(X356, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X356, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X357, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         X356, &
         wf%n_o, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X357, &
         wf%n_o)
!
      call mem%dealloc(X356)
      call mem%alloc(X358, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X357, &
         wf%n_o**2, &
         tAIxI_v, 1, &
         zero, &
         X358, 1)
!
      call mem%dealloc(X357)
      call mem%alloc(X359, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(wf%u_aibj, X359, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X358, &
         wf%n_o, &
         X359, &
         wf%n_v**2*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_o)
!
      call mem%dealloc(X358)
      call mem%dealloc(X359)
      call mem%alloc(X360, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X360, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X361, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         X360, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X361, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X360)
      call mem%alloc(X362, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X361, &
         wf%n_v, &
         tAIxI_v, 1, &
         zero, &
         X362, 1)
!
      call mem%dealloc(X361)
      call mem%alloc(X363, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(wf%u_aibj, X363, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X362, &
         wf%n_o, &
         X363, &
         wf%n_v**2*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_o)
!
      call mem%dealloc(X362)
      call mem%dealloc(X363)
      call mem%alloc(X364, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         tAIxI_v, 1, &
         zero, &
         X364, 1)
!
      call mem%alloc(X365, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(X364, X365, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X364)
      call mem%alloc(X366, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X365, &
         wf%n_v*wf%n_o, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X366, &
         wf%n_o)
!
      call mem%dealloc(X365)
      call mem%alloc(X367, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X366, X367, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X366)
      call mem%alloc(X368, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X367, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X368, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X367)
      call add_1423_to_1234(one, X368, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X368)
      call mem%alloc(X369, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         -2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         tAIxI_v, 1, &
         zero, &
         X369, 1)
!
      call mem%alloc(X370, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(X369, X370, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X369)
      call mem%alloc(X371, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X371, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X372, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X370, &
         wf%n_o**2, &
         X371, &
         wf%n_o**2, &
         zero, &
         X372, &
         wf%n_v)
!
      call mem%dealloc(X370)
      call mem%dealloc(X371)
      call mem%alloc(X373, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         wf%u_aibj, &
         wf%n_v, &
         X372, &
         wf%n_v, &
         zero, &
         X373, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X372)
      call add_1432_to_1234(one, X373, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X373)
      call mem%alloc(X374, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         2.00000000000000, &
         tAxxI_ov, &
         wf%n_o, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X374, &
         wf%n_o)
!
      call mem%alloc(X375, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(X374, X375, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X374)
      call mem%alloc(X376, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         one, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         X375, &
         wf%n_o**2, &
         zero, &
         X376, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X375)
      call mem%alloc(X377, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_2134(X376, X377, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X376)
      call mem%alloc(X378, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X377, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X378, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X377)
      call add_1432_to_1234(one, X378, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X378)
      call mem%alloc(X379, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X379, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X380, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         X379, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X380, 1)
!
      call mem%dealloc(X379)
      call mem%alloc(X381, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X380, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X381, &
         wf%n_v)
!
      call mem%dealloc(X380)
      call mem%alloc(X382, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         wf%u_aibj, &
         wf%n_v, &
         X381, &
         wf%n_v, &
         zero, &
         X382, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X381)
      call add_1432_to_1234(one, X382, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X382)
      call mem%alloc(X383, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X383, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X384, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         X383, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X384, 1)
!
      call mem%dealloc(X383)
      call mem%alloc(X385, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X384, &
         wf%n_v, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X385, &
         wf%n_o)
!
      call mem%dealloc(X384)
      call mem%alloc(X386, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(wf%u_aibj, X386, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X385, &
         wf%n_o, &
         X386, &
         wf%n_v**2*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_o)
!
      call mem%dealloc(X385)
      call mem%dealloc(X386)
      call mem%alloc(X387, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X387, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X388, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         txIxx_vvo, &
         wf%n_v, &
         X387, &
         wf%n_v*wf%n_o, &
         zero, &
         X388, &
         wf%n_v)
!
      call mem%dealloc(X387)
      call mem%alloc(X389, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X389, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X390, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X389, &
         wf%n_o**2, &
         X388, &
         wf%n_v*wf%n_o, &
         zero, &
         X390, &
         wf%n_o**2)
!
      call mem%dealloc(X388)
      call mem%dealloc(X389)
      call mem%alloc(X391, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X390, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X391, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X390)
      call add_1342_to_1234(one, X391, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X391)
      call mem%alloc(X392, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X392, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X393, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X392, &
         wf%n_v*wf%n_o, &
         zero, &
         X393, &
         wf%n_o)
!
      call mem%dealloc(X392)
      call mem%alloc(X394, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(txIxx_vvo, X394, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X395, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X394, &
         wf%n_v*wf%n_o, &
         X393, &
         wf%n_o**2, &
         zero, &
         X395, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X393)
      call mem%dealloc(X394)
      call mem%alloc(X396, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X395, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X396, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X395)
      call add_1432_to_1234(one, X396, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X396)
      call mem%alloc(X397, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X397, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X398, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         txIxx_vvo, &
         wf%n_v, &
         X397, &
         wf%n_v*wf%n_o, &
         zero, &
         X398, &
         wf%n_v)
!
      call mem%dealloc(X397)
      call mem%alloc(X399, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X398, &
         wf%n_v*wf%n_o, &
         zero, &
         X399, &
         wf%n_o)
!
      call mem%dealloc(X398)
      call mem%alloc(X400, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X399, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X400, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X399)
      call add_1423_to_1234(one, X400, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X400)
      call mem%alloc(X401, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X401, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X402, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         X401, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, 1, &
         zero, &
         X402, 1)
!
      call mem%dealloc(X401)
      call mem%alloc(X403, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X403, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X404, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X402, &
         wf%n_o, &
         X403, &
         wf%n_v*wf%n_o, &
         zero, &
         X404, &
         wf%n_o)
!
      call mem%dealloc(X402)
      call mem%dealloc(X403)
      call mem%alloc(X405, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X404, X405, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X404)
      call mem%alloc(X406, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X405, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X406, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X405)
      call add_1423_to_1234(one, X406, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X406)
      call mem%alloc(X407, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X407, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X408, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X408, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X409, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v**2, &
         -2.00000000000000, &
         X407, &
         wf%n_o**2, &
         X408, &
         wf%n_v**2, &
         zero, &
         X409, &
         wf%n_o**2)
!
      call mem%dealloc(X407)
      call mem%dealloc(X408)
      call mem%alloc(X410, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X409, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X410, &
         wf%n_o**2)
!
      call mem%dealloc(X409)
      call mem%alloc(X411, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X410, &
         wf%n_o, &
         zero, &
         X411, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X410)
      call add_1432_to_1234(one, X411, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X411)
      call mem%alloc(X412, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X412, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X413, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         X412, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X413, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X412)
      call mem%alloc(X414, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X413, X414, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X413)
      call mem%alloc(X415, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X414, &
         wf%n_o**2, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X415, &
         wf%n_o**2)
!
      call mem%dealloc(X414)
      call mem%alloc(X416, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(X415, X416, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X415)
      call mem%alloc(X417, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X416, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X417, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X416)
      call add_1342_to_1234(one, X417, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X417)
      call mem%alloc(X418, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X418, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X419, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         txxxI_vov, &
         wf%n_v, &
         X418, &
         wf%n_v*wf%n_o, &
         zero, &
         X419, &
         wf%n_v)
!
      call mem%dealloc(X418)
      call mem%alloc(X420, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X419, &
         wf%n_v*wf%n_o, &
         zero, &
         X420, &
         wf%n_o)
!
      call mem%dealloc(X419)
      call mem%alloc(X421, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X420, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X421, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X420)
      call add_1432_to_1234(one, X421, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X421)
      call mem%alloc(X422, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X422, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X423, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_3124(X422, X423, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X422)
      call mem%alloc(X424, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X424, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X425, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X423, &
         wf%n_o**2, &
         X424, &
         wf%n_o**2, &
         zero, &
         X425, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X423)
      call mem%dealloc(X424)
      call mem%alloc(X426, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X425, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X426, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X425)
      call add_1423_to_1234(one, X426, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X426)
      call mem%alloc(X427, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X427, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X428, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X427, &
         wf%n_v*wf%n_o, &
         zero, &
         X428, &
         wf%n_o)
!
      call mem%dealloc(X427)
      call mem%alloc(X429, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X428, &
         wf%n_o**2, &
         zero, &
         X429, &
         wf%n_o)
!
      call mem%dealloc(X428)
      call mem%alloc(X430, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X430, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X431, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X429, &
         wf%n_o**2, &
         X430, &
         wf%n_v**2, &
         zero, &
         X431, &
         wf%n_o**2)
!
      call mem%dealloc(X429)
      call mem%dealloc(X430)
      call add_1324_to_1234(one, X431, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X431)
      call mem%alloc(X432, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X432, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X433, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         X432, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, 1, &
         zero, &
         X433, 1)
!
      call mem%dealloc(X432)
      call mem%alloc(X434, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X434, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X435, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X433, &
         wf%n_o, &
         X434, &
         wf%n_o**2, &
         zero, &
         X435, &
         wf%n_o)
!
      call mem%dealloc(X433)
      call mem%dealloc(X434)
      call mem%alloc(X436, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X436, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X437, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X435, &
         wf%n_o, &
         X436, &
         wf%n_v**2, &
         zero, &
         X437, &
         wf%n_o**2)
!
      call mem%dealloc(X435)
      call mem%dealloc(X436)
      call add_1324_to_1234(one, X437, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X437)
      call mem%alloc(X438, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X438, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X439, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         X438, &
         wf%n_v, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X439, &
         wf%n_v)
!
      call mem%dealloc(X438)
      call mem%alloc(X440, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X440, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X441, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X440, &
         wf%n_o**2, &
         X439, &
         wf%n_v*wf%n_o, &
         zero, &
         X441, &
         wf%n_o**2)
!
      call mem%dealloc(X439)
      call mem%dealloc(X440)
      call mem%alloc(X442, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X441, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X442, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X441)
      call add_1342_to_1234(one, X442, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X442)
      call mem%alloc(X443, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X443, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X444, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         X443, &
         wf%n_v, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X444, &
         wf%n_v)
!
      call mem%dealloc(X443)
      call mem%alloc(X445, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X444, &
         wf%n_v*wf%n_o, &
         zero, &
         X445, &
         wf%n_o)
!
      call mem%dealloc(X444)
      call mem%alloc(X446, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X445, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X446, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X445)
      call add_1423_to_1234(one, X446, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X446)
      call mem%alloc(X447, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X447, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X448, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         X447, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X448, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X447)
      call mem%alloc(X449, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X448, X449, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X448)
      call mem%alloc(X450, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X449, &
         wf%n_o**2, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X450, &
         wf%n_o**2)
!
      call mem%dealloc(X449)
      call mem%alloc(X451, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X450, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X451, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X450)
      call add_1432_to_1234(one, X451, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X451)
      call mem%alloc(X452, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X452, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X453, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_3124(X452, X453, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X452)
      call mem%alloc(X454, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X454, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X455, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X453, &
         wf%n_o**2, &
         X454, &
         wf%n_o**2, &
         zero, &
         X455, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X453)
      call mem%dealloc(X454)
      call mem%alloc(X456, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_213(uxxxI_vov, X456, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X455, &
         wf%n_v, &
         X456, &
         wf%n_v*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X455)
      call mem%dealloc(X456)
      call mem%alloc(X457, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X457, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X458, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v**2, &
         2.00000000000000, &
         X457, &
         wf%n_o**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X458, &
         wf%n_o**2)
!
      call mem%dealloc(X457)
      call mem%alloc(X459, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X458, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X459, &
         wf%n_o**2)
!
      call mem%dealloc(X458)
      call mem%alloc(X460, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X460, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X459, &
         wf%n_o, &
         X460, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X459)
      call mem%dealloc(X460)
      call mem%alloc(X461, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X461, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X462, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v**2, &
         2.00000000000000, &
         X461, &
         wf%n_o**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X462, &
         wf%n_o**2)
!
      call mem%dealloc(X461)
      call mem%alloc(X463, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X462, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X463, &
         wf%n_o**2)
!
      call mem%dealloc(X462)
      call mem%alloc(X464, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X463, &
         wf%n_o, &
         zero, &
         X464, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X463)
      call add_1432_to_1234(one, X464, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X464)
      call mem%alloc(X465, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X465, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X466, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         X465, &
         wf%n_o, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X466, &
         wf%n_o)
!
      call mem%dealloc(X465)
      call mem%alloc(X467, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X466, &
         wf%n_o**2, &
         zero, &
         X467, &
         wf%n_o)
!
      call mem%dealloc(X466)
      call mem%alloc(X468, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X467, &
         wf%n_o**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X468, &
         wf%n_o**2)
!
      call mem%dealloc(X467)
      call add_1324_to_1234(one, X468, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X468)
      call mem%alloc(X469, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X469, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X470, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X469, &
         wf%n_v*wf%n_o, &
         zero, &
         X470, &
         wf%n_o)
!
      call mem%dealloc(X469)
      call mem%alloc(X471, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X470, &
         wf%n_o**2, &
         zero, &
         X471, &
         wf%n_o)
!
      call mem%dealloc(X470)
      call mem%alloc(X472, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X471, &
         wf%n_o**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X472, &
         wf%n_o**2)
!
      call mem%dealloc(X471)
      call add_1324_to_1234(one, X472, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X472)
      call mem%alloc(X473, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X473, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X474, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_3124(X473, X474, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X473)
      call mem%alloc(X475, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X475, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X476, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X474, &
         wf%n_o**2, &
         X475, &
         wf%n_o**2, &
         zero, &
         X476, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X474)
      call mem%dealloc(X475)
      call mem%alloc(X477, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X477, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X478, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X476, &
         wf%n_v, &
         X477, &
         wf%n_v*wf%n_o, &
         zero, &
         X478, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X476)
      call mem%dealloc(X477)
      call add_1423_to_1234(one, X478, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X478)
      call mem%alloc(X479, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X479, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X480, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         txIxx_vvo, &
         wf%n_v, &
         X479, &
         wf%n_v*wf%n_o, &
         zero, &
         X480, &
         wf%n_v)
!
      call mem%dealloc(X479)
      call mem%alloc(X481, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X480, &
         wf%n_v*wf%n_o, &
         zero, &
         X481, &
         wf%n_o)
!
      call mem%dealloc(X480)
      call mem%alloc(X482, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X482, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X481, &
         wf%n_v*wf%n_o, &
         X482, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X481)
      call mem%dealloc(X482)
      call mem%alloc(X483, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X483, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X484, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X483, &
         wf%n_o, &
         zero, &
         X484, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X483)
      call mem%alloc(X485, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X484, X485, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X484)
      call mem%alloc(X486, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X485, &
         wf%n_o**2, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X486, &
         wf%n_o**2)
!
      call mem%dealloc(X485)
      call mem%alloc(X487, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(X486, X487, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X486)
      call mem%alloc(X488, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X487, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X488, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X487)
      call add_1342_to_1234(one, X488, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X488)
      call mem%alloc(X489, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X489, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X490, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         txxxI_vov, &
         wf%n_v, &
         X489, &
         wf%n_v*wf%n_o, &
         zero, &
         X490, &
         wf%n_v)
!
      call mem%dealloc(X489)
      call mem%alloc(X491, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X491, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X492, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X491, &
         wf%n_o**2, &
         X490, &
         wf%n_v*wf%n_o, &
         zero, &
         X492, &
         wf%n_o**2)
!
      call mem%dealloc(X490)
      call mem%dealloc(X491)
      call mem%alloc(X493, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X492, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X493, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X492)
      call add_1342_to_1234(one, X493, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X493)
      call mem%alloc(X494, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X494, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X495, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         X494, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, 1, &
         zero, &
         X495, 1)
!
      call mem%dealloc(X494)
      call mem%alloc(X496, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X495, &
         wf%n_o, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X496, &
         wf%n_o)
!
      call mem%dealloc(X495)
      call mem%alloc(X497, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X497, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X498, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X497, &
         wf%n_o, &
         X496, &
         wf%n_o, &
         zero, &
         X498, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X496)
      call mem%dealloc(X497)
      call add_1423_to_1234(one, X498, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X498)
      call mem%alloc(X499, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X499, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X500, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_2134(X499, X500, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X499)
      call mem%alloc(X501, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X500, &
         wf%n_v*wf%n_o, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X501, &
         wf%n_o**2)
!
      call mem%dealloc(X500)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X501, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X501)
      call mem%alloc(X502, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X502, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X503, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         X502, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, 1, &
         zero, &
         X503, 1)
!
      call mem%dealloc(X502)
      call mem%alloc(X504, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X503, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X504, &
         wf%n_o)
!
      call mem%dealloc(X503)
      call mem%alloc(X505, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(wf%u_aibj, X505, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X504, &
         wf%n_o, &
         X505, &
         wf%n_v**2*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_o)
!
      call mem%dealloc(X504)
      call mem%dealloc(X505)
      call mem%alloc(X506, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X506, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X507, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         X506, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, 1, &
         zero, &
         X507, 1)
!
      call mem%dealloc(X506)
      call mem%alloc(X508, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X507, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X508, &
         wf%n_v)
!
      call mem%dealloc(X507)
      call mem%alloc(X509, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         wf%u_aibj, &
         wf%n_v, &
         X508, &
         wf%n_v, &
         zero, &
         X509, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X508)
      call add_1432_to_1234(one, X509, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X509)
      call mem%alloc(X510, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X510, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X511, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         X510, &
         wf%n_v, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X511, &
         wf%n_v)
!
      call mem%dealloc(X510)
      call mem%alloc(X512, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X511, &
         wf%n_v*wf%n_o, &
         zero, &
         X512, &
         wf%n_o)
!
      call mem%dealloc(X511)
      call mem%alloc(X513, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X513, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X512, &
         wf%n_v*wf%n_o, &
         X513, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X512)
      call mem%dealloc(X513)
      call mem%alloc(X514, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X514, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X515, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X514, &
         wf%n_o, &
         zero, &
         X515, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X514)
      call mem%alloc(X516, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X515, X516, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X515)
      call mem%alloc(X517, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X516, &
         wf%n_o**2, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X517, &
         wf%n_o**2)
!
      call mem%dealloc(X516)
      call mem%alloc(X518, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X517, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X518, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X517)
      call add_1432_to_1234(one, X518, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X518)
      call mem%alloc(X519, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X519, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X520, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         X519, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, 1, &
         zero, &
         X520, 1)
!
      call mem%dealloc(X519)
      call mem%alloc(X521, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X520, &
         wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X521, &
         wf%n_o)
!
      call mem%dealloc(X520)
      call mem%alloc(X522, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X521, X522, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X521)
      call mem%alloc(X523, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X523, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X523, &
         wf%n_o, &
         X522, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X522)
      call mem%dealloc(X523)
      call mem%alloc(X524, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1243(g_ovov, X524, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X525, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         X524, &
         wf%n_v*wf%n_o, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X525, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X524)
      call mem%alloc(X526, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         tAxAx_oo, &
         wf%n_o, &
         X525, &
         wf%n_o, &
         zero, &
         X526, &
         wf%n_o)
!
      call mem%dealloc(X525)
      call mem%alloc(X527, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1342(X526, X527, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X526)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X527, &
         wf%n_v*wf%n_o**2, &
         txIxI_vv, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X527)
      call mem%alloc(X528, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X528, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X529, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v**2, &
         2.00000000000000, &
         X528, &
         wf%n_o**2, &
         txIxI_vv, 1, &
         zero, &
         X529, 1)
!
      call mem%dealloc(X528)
      call mem%alloc(X530, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X529, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X530, &
         wf%n_o)
!
      call mem%dealloc(X529)
      call mem%alloc(X531, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(wf%u_aibj, X531, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X530, &
         wf%n_o, &
         X531, &
         wf%n_v**2*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_o)
!
      call mem%dealloc(X530)
      call mem%dealloc(X531)
      call mem%alloc(X532, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X532, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X533, wf%n_v, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v**2, &
         2.00000000000000, &
         X532, &
         wf%n_o**2, &
         tAxAx_oo, 1, &
         zero, &
         X533, 1)
!
      call mem%dealloc(X532)
      call mem%alloc(X534, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X533, &
         wf%n_v, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X534, &
         wf%n_v)
!
      call mem%dealloc(X533)
      call mem%alloc(X535, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         wf%u_aibj, &
         wf%n_v, &
         X534, &
         wf%n_v, &
         zero, &
         X535, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X534)
      call add_1432_to_1234(one, X535, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X535)
      call mem%alloc(X536, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_ovov, X536, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X537, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X537, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X538, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v**2, &
         -2.00000000000000, &
         X537, &
         wf%n_v**2, &
         X536, &
         wf%n_o**2, &
         zero, &
         X538, &
         wf%n_o)
!
      call mem%dealloc(X536)
      call mem%dealloc(X537)
      call mem%alloc(X539, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         tAxAx_oo, &
         wf%n_o, &
         X538, &
         wf%n_o**2, &
         zero, &
         X539, &
         wf%n_o)
!
      call mem%dealloc(X538)
      call mem%alloc(X540, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X539, &
         wf%n_o**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X540, &
         wf%n_o**2)
!
      call mem%dealloc(X539)
      call add_1324_to_1234(one, X540, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X540)
      call mem%alloc(X541, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X541, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X542, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         X541, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X542, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X541)
      call mem%alloc(X543, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         tAxAx_oo, &
         wf%n_o, &
         X542, &
         wf%n_o, &
         zero, &
         X543, &
         wf%n_o)
!
      call mem%dealloc(X542)
      call mem%alloc(X544, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_132(X543, X544, wf%n_o, wf%n_v, wf%n_v)
      call mem%dealloc(X543)
      call mem%alloc(X545, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X544, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X545, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X544)
      call add_1423_to_1234(one, X545, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X545)
      call mem%alloc(X546, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X546, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X547, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X546, &
         wf%n_v, &
         zero, &
         X547, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X546)
      call mem%alloc(X548, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         tAxAx_oo, &
         wf%n_o, &
         X547, &
         wf%n_o, &
         zero, &
         X548, &
         wf%n_o)
!
      call mem%dealloc(X547)
      call mem%alloc(X549, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_132(X548, X549, wf%n_o, wf%n_v, wf%n_v)
      call mem%dealloc(X548)
      call mem%alloc(X550, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X550, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X551, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X549, &
         wf%n_v*wf%n_o, &
         X550, &
         wf%n_v*wf%n_o, &
         zero, &
         X551, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X549)
      call mem%dealloc(X550)
      call add_1423_to_1234(one, X551, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X551)
      call mem%alloc(X552, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_ovov, X552, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X553, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v**2, &
         2.00000000000000, &
         txIxx_vvo, &
         wf%n_v**2, &
         X552, &
         wf%n_o**2, &
         zero, &
         X553, &
         wf%n_o)
!
      call mem%dealloc(X552)
      call mem%alloc(X554, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         tAxAx_oo, &
         wf%n_o, &
         X553, &
         wf%n_o**2, &
         zero, &
         X554, &
         wf%n_o)
!
      call mem%dealloc(X553)
      call mem%alloc(X555, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X554, &
         wf%n_o**2, &
         uxIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X555, &
         wf%n_o**2)
!
      call mem%dealloc(X554)
      call add_1324_to_1234(one, X555, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X555)
      call mem%alloc(X556, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X556, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X557, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         X556, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X557, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X556)
      call mem%alloc(X558, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         tAxAx_oo, &
         wf%n_o, &
         X557, &
         wf%n_o, &
         zero, &
         X558, &
         wf%n_o)
!
      call mem%dealloc(X557)
      call mem%alloc(X559, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_132(X558, X559, wf%n_o, wf%n_v, wf%n_v)
      call mem%dealloc(X558)
      call mem%alloc(X560, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_213(uxxxI_vov, X560, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X559, &
         wf%n_v*wf%n_o, &
         X560, &
         wf%n_v*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X559)
      call mem%dealloc(X560)
      call mem%alloc(X561, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_ovov, X561, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X562, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X562, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X563, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v**2, &
         -2.00000000000000, &
         X562, &
         wf%n_v**2, &
         X561, &
         wf%n_o**2, &
         zero, &
         X563, &
         wf%n_o)
!
      call mem%dealloc(X561)
      call mem%dealloc(X562)
      call mem%alloc(X564, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         tAxAx_oo, &
         wf%n_o, &
         X563, &
         wf%n_o**2, &
         zero, &
         X564, &
         wf%n_o)
!
      call mem%dealloc(X563)
      call mem%alloc(X565, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X565, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X566, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X564, &
         wf%n_o**2, &
         X565, &
         wf%n_v**2, &
         zero, &
         X566, &
         wf%n_o**2)
!
      call mem%dealloc(X564)
      call mem%dealloc(X565)
      call add_1324_to_1234(one, X566, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X566)
      call mem%alloc(X567, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X567, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X568, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X567, &
         wf%n_v, &
         zero, &
         X568, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X567)
      call mem%alloc(X569, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         tAxAx_oo, &
         wf%n_o, &
         X568, &
         wf%n_o, &
         zero, &
         X569, &
         wf%n_o)
!
      call mem%dealloc(X568)
      call mem%alloc(X570, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_132(X569, X570, wf%n_o, wf%n_v, wf%n_v)
      call mem%dealloc(X569)
      call mem%alloc(X571, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X570, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X571, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X570)
      call add_1423_to_1234(one, X571, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X571)
      call mem%alloc(X572, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X572, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X573, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         txxxI_vov, &
         wf%n_v, &
         X572, &
         wf%n_v*wf%n_o, &
         zero, &
         X573, &
         wf%n_v)
!
      call mem%dealloc(X572)
      call mem%alloc(X574, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         tAxAx_oo, &
         wf%n_o, &
         X573, &
         wf%n_v**2, &
         zero, &
         X574, &
         wf%n_o)
!
      call mem%dealloc(X573)
      call mem%alloc(X575, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_213(uxxxI_vov, X575, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X574, &
         wf%n_v*wf%n_o, &
         X575, &
         wf%n_v*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X574)
      call mem%dealloc(X575)
      call mem%alloc(X576, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X576, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X577, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X576, &
         wf%n_v, &
         zero, &
         X577, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X576)
      call mem%alloc(X578, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         tAxAx_oo, &
         wf%n_o, &
         X577, &
         wf%n_o, &
         zero, &
         X578, &
         wf%n_o)
!
      call mem%dealloc(X577)
      call mem%alloc(X579, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_132(X578, X579, wf%n_o, wf%n_v, wf%n_v)
      call mem%dealloc(X578)
      call mem%alloc(X580, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_213(uxxxI_vov, X580, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X579, &
         wf%n_v*wf%n_o, &
         X580, &
         wf%n_v*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X579)
      call mem%dealloc(X580)
      call mem%alloc(X581, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X581, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X582, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_2134(X581, X582, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X581)
      call mem%alloc(X583, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X582, &
         wf%n_v*wf%n_o, &
         wf%u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X583, &
         wf%n_o**2)
!
      call mem%dealloc(X582)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X583, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X583)
      call mem%alloc(X584, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X584, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X585, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         X584, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X585, 1)
!
      call mem%dealloc(X584)
      call mem%alloc(X586, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X585, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X586, &
         wf%n_o)
!
      call mem%dealloc(X585)
      call mem%alloc(X587, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(wf%u_aibj, X587, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X586, &
         wf%n_o, &
         X587, &
         wf%n_v**2*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_o)
!
      call mem%dealloc(X586)
      call mem%dealloc(X587)
      call mem%alloc(X588, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X588, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X589, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         X588, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X589, 1)
!
      call mem%dealloc(X588)
      call mem%alloc(X590, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X589, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X590, &
         wf%n_v)
!
      call mem%dealloc(X589)
      call mem%alloc(X591, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         wf%u_aibj, &
         wf%n_v, &
         X590, &
         wf%n_v, &
         zero, &
         X591, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X590)
      call add_1432_to_1234(one, X591, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X591)
      call mem%alloc(X592, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X592, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X593, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         txIxx_vvo, &
         wf%n_v, &
         X592, &
         wf%n_v*wf%n_o, &
         zero, &
         X593, &
         wf%n_v)
!
      call mem%dealloc(X592)
      call mem%alloc(X594, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X593, &
         wf%n_v*wf%n_o, &
         zero, &
         X594, &
         wf%n_o)
!
      call mem%dealloc(X593)
      call mem%alloc(X595, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X594, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X595, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X594)
      call add_1423_to_1234(one, X595, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X595)
      call mem%alloc(X596, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X596, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X597, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X596, &
         wf%n_v*wf%n_o, &
         zero, &
         X597, &
         wf%n_o)
!
      call mem%dealloc(X596)
      call mem%alloc(X598, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(txIxx_vvo, X598, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X599, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X598, &
         wf%n_v*wf%n_o, &
         X597, &
         wf%n_o**2, &
         zero, &
         X599, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X597)
      call mem%dealloc(X598)
      call mem%alloc(X600, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X599, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X600, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X599)
      call add_1432_to_1234(one, X600, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X600)
      call mem%alloc(X601, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X601, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X602, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v**2, &
         -2.00000000000000, &
         txIxx_vvo, &
         wf%n_v**2, &
         X601, &
         wf%n_o**2, &
         zero, &
         X602, &
         wf%n_o)
!
      call mem%dealloc(X601)
      call mem%alloc(X603, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X602, &
         wf%n_o**2, &
         zero, &
         X603, &
         wf%n_v)
!
      call mem%dealloc(X602)
      call mem%alloc(X604, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X603, &
         wf%n_v*wf%n_o, &
         zero, &
         X604, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X603)
      call add_1423_to_1234(one, X604, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X604)
      call mem%alloc(X605, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X605, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X606, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         txIxx_vvo, &
         wf%n_v, &
         X605, &
         wf%n_v*wf%n_o, &
         zero, &
         X606, &
         wf%n_v)
!
      call mem%dealloc(X605)
      call mem%alloc(X607, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X607, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X608, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X607, &
         wf%n_o**2, &
         X606, &
         wf%n_v*wf%n_o, &
         zero, &
         X608, &
         wf%n_o**2)
!
      call mem%dealloc(X606)
      call mem%dealloc(X607)
      call mem%alloc(X609, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X608, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X609, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X608)
      call add_1342_to_1234(one, X609, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X609)
      call mem%alloc(X610, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X610, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X611, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         X610, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X611, 1)
!
      call mem%dealloc(X610)
      call mem%alloc(X612, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X612, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X613, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X611, &
         wf%n_o, &
         X612, &
         wf%n_v*wf%n_o, &
         zero, &
         X613, &
         wf%n_o)
!
      call mem%dealloc(X611)
      call mem%dealloc(X612)
      call mem%alloc(X614, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X613, X614, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X613)
      call mem%alloc(X615, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X614, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X615, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X614)
      call add_1423_to_1234(one, X615, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X615)
      call mem%alloc(X616, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X616, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X617, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_3124(X616, X617, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X616)
      call mem%alloc(X618, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X618, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X619, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X617, &
         wf%n_o**2, &
         X618, &
         wf%n_o**2, &
         zero, &
         X619, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X617)
      call mem%dealloc(X618)
      call mem%alloc(X620, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X619, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X620, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X619)
      call add_1423_to_1234(one, X620, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X620)
      call mem%alloc(X621, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X621, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X622, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X621, &
         wf%n_v*wf%n_o, &
         zero, &
         X622, &
         wf%n_o)
!
      call mem%dealloc(X621)
      call mem%alloc(X623, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X622, &
         wf%n_o**2, &
         zero, &
         X623, &
         wf%n_o)
!
      call mem%dealloc(X622)
      call mem%alloc(X624, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X624, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X625, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X623, &
         wf%n_o**2, &
         X624, &
         wf%n_v**2, &
         zero, &
         X625, &
         wf%n_o**2)
!
      call mem%dealloc(X623)
      call mem%dealloc(X624)
      call add_1324_to_1234(one, X625, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X625)
      call mem%alloc(X626, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X626, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X627, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         txxxI_vov, &
         wf%n_v, &
         X626, &
         wf%n_v*wf%n_o, &
         zero, &
         X627, &
         wf%n_v)
!
      call mem%dealloc(X626)
      call mem%alloc(X628, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X627, &
         wf%n_v*wf%n_o, &
         zero, &
         X628, &
         wf%n_o)
!
      call mem%dealloc(X627)
      call mem%alloc(X629, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X628, &
         wf%n_v*wf%n_o, &
         zero, &
         X629, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X628)
      call add_1432_to_1234(one, X629, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X629)
      call mem%alloc(X630, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X630, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X631, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         X630, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X631, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X630)
      call mem%alloc(X632, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X631, X632, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X631)
      call mem%alloc(X633, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X632, &
         wf%n_o**2, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X633, &
         wf%n_o**2)
!
      call mem%dealloc(X632)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X633, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X633)
      call mem%alloc(X634, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X634, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X635, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         X634, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X635, 1)
!
      call mem%dealloc(X634)
      call mem%alloc(X636, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X636, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X637, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X635, &
         wf%n_v, &
         X636, &
         wf%n_o**2, &
         zero, &
         X637, &
         wf%n_o)
!
      call mem%dealloc(X635)
      call mem%dealloc(X636)
      call mem%alloc(X638, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X638, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X639, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X637, &
         wf%n_o, &
         X638, &
         wf%n_v**2, &
         zero, &
         X639, &
         wf%n_o**2)
!
      call mem%dealloc(X637)
      call mem%dealloc(X638)
      call add_1324_to_1234(one, X639, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X639)
      call mem%alloc(X640, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X640, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X641, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         X640, &
         wf%n_v, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X641, &
         wf%n_v)
!
      call mem%dealloc(X640)
      call mem%alloc(X642, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X641, &
         wf%n_v*wf%n_o, &
         zero, &
         X642, &
         wf%n_o)
!
      call mem%dealloc(X641)
      call mem%alloc(X643, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X642, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X643, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X642)
      call add_1423_to_1234(one, X643, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X643)
      call mem%alloc(X644, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X644, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X645, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         X644, &
         wf%n_v, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X645, &
         wf%n_v)
!
      call mem%dealloc(X644)
      call mem%alloc(X646, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X646, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X647, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X646, &
         wf%n_o**2, &
         X645, &
         wf%n_v*wf%n_o, &
         zero, &
         X647, &
         wf%n_o**2)
!
      call mem%dealloc(X645)
      call mem%dealloc(X646)
      call mem%alloc(X648, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X647, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X648, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X647)
      call add_1342_to_1234(one, X648, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X648)
      call mem%alloc(X649, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X649, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X650, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_3124(X649, X650, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X649)
      call mem%alloc(X651, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X651, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X652, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X650, &
         wf%n_o**2, &
         X651, &
         wf%n_o**2, &
         zero, &
         X652, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X650)
      call mem%dealloc(X651)
      call mem%alloc(X653, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_213(uxxxI_vov, X653, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X652, &
         wf%n_v, &
         X653, &
         wf%n_v*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X652)
      call mem%dealloc(X653)
      call mem%alloc(X654, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X654, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X655, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         X654, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X655, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X654)
      call mem%alloc(X656, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X655, X656, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X655)
      call mem%alloc(X657, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X656, &
         wf%n_o**2, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X657, &
         wf%n_o**2)
!
      call mem%dealloc(X656)
      call mem%alloc(X658, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X657, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X658, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X657)
      call add_1432_to_1234(one, X658, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X658)
      call mem%alloc(X659, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X659, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X660, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         X659, &
         wf%n_o, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X660, &
         wf%n_o)
!
      call mem%dealloc(X659)
      call mem%alloc(X661, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X660, &
         wf%n_o**2, &
         zero, &
         X661, &
         wf%n_o)
!
      call mem%dealloc(X660)
      call mem%alloc(X662, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X661, &
         wf%n_o**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X662, &
         wf%n_o**2)
!
      call mem%dealloc(X661)
      call add_1324_to_1234(one, X662, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X662)
      call mem%alloc(X663, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X663, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X664, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X663, &
         wf%n_v*wf%n_o, &
         zero, &
         X664, &
         wf%n_o)
!
      call mem%dealloc(X663)
      call mem%alloc(X665, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X664, &
         wf%n_o**2, &
         zero, &
         X665, &
         wf%n_o)
!
      call mem%dealloc(X664)
      call mem%alloc(X666, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X665, &
         wf%n_o**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X666, &
         wf%n_o**2)
!
      call mem%dealloc(X665)
      call add_1324_to_1234(one, X666, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X666)
      call mem%alloc(X667, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X667, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X668, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_3124(X667, X668, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X667)
      call mem%alloc(X669, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X669, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X670, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X668, &
         wf%n_o**2, &
         X669, &
         wf%n_o**2, &
         zero, &
         X670, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X668)
      call mem%dealloc(X669)
      call mem%alloc(X671, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X671, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X672, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X670, &
         wf%n_v, &
         X671, &
         wf%n_v*wf%n_o, &
         zero, &
         X672, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X670)
      call mem%dealloc(X671)
      call add_1423_to_1234(one, X672, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X672)
      call mem%alloc(X673, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X673, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X674, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         txIxx_vvo, &
         wf%n_v, &
         X673, &
         wf%n_v*wf%n_o, &
         zero, &
         X674, &
         wf%n_v)
!
      call mem%dealloc(X673)
      call mem%alloc(X675, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X674, &
         wf%n_v*wf%n_o, &
         zero, &
         X675, &
         wf%n_o)
!
      call mem%dealloc(X674)
      call mem%alloc(X676, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X676, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X675, &
         wf%n_v*wf%n_o, &
         X676, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X675)
      call mem%dealloc(X676)
      call mem%alloc(X677, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X677, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X678, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v**2, &
         2.00000000000000, &
         X677, &
         wf%n_o**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X678, &
         wf%n_o**2)
!
      call mem%dealloc(X677)
      call mem%alloc(X679, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X678, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X679, &
         wf%n_o**2)
!
      call mem%dealloc(X678)
      call mem%alloc(X680, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X680, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X679, &
         wf%n_o, &
         X680, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X679)
      call mem%dealloc(X680)
      call mem%alloc(X681, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_ovov, X681, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X682, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v**2, &
         2.00000000000000, &
         X681, &
         wf%n_o**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X682, &
         wf%n_o**2)
!
      call mem%dealloc(X681)
      call mem%alloc(X683, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X682, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X683, &
         wf%n_o**2)
!
      call mem%dealloc(X682)
      call mem%alloc(X684, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X683, &
         wf%n_o, &
         zero, &
         X684, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X683)
      call add_1432_to_1234(one, X684, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X684)
      call mem%alloc(X685, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X685, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X686, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X685, &
         wf%n_o, &
         zero, &
         X686, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X685)
      call mem%alloc(X687, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X686, X687, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X686)
      call mem%alloc(X688, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X687, &
         wf%n_o**2, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X688, &
         wf%n_o**2)
!
      call mem%dealloc(X687)
      call mem%alloc(X689, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(X688, X689, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X688)
      call mem%alloc(X690, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X689, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X690, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X689)
      call add_1342_to_1234(one, X690, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X690)
      call mem%alloc(X691, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X691, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X692, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         txxxI_vov, &
         wf%n_v, &
         X691, &
         wf%n_v*wf%n_o, &
         zero, &
         X692, &
         wf%n_v)
!
      call mem%dealloc(X691)
      call mem%alloc(X693, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X693, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X694, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X693, &
         wf%n_o**2, &
         X692, &
         wf%n_v*wf%n_o, &
         zero, &
         X694, &
         wf%n_o**2)
!
      call mem%dealloc(X692)
      call mem%dealloc(X693)
      call mem%alloc(X695, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X694, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X695, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X694)
      call add_1342_to_1234(one, X695, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X695)
      call mem%alloc(X696, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X696, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X697, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         X696, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X697, 1)
!
      call mem%dealloc(X696)
      call mem%alloc(X698, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X697, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X698, &
         wf%n_o)
!
      call mem%dealloc(X697)
      call mem%alloc(X699, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X699, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X700, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X699, &
         wf%n_o, &
         X698, &
         wf%n_o, &
         zero, &
         X700, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X698)
      call mem%dealloc(X699)
      call add_1423_to_1234(one, X700, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X700)
      call mem%alloc(X701, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X701, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X702, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         X701, &
         wf%n_v, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X702, &
         wf%n_v)
!
      call mem%dealloc(X701)
      call mem%alloc(X703, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X702, &
         wf%n_v*wf%n_o, &
         zero, &
         X703, &
         wf%n_o)
!
      call mem%dealloc(X702)
      call mem%alloc(X704, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X704, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X703, &
         wf%n_v*wf%n_o, &
         X704, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X703)
      call mem%dealloc(X704)
      call mem%alloc(X705, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X705, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X706, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X705, &
         wf%n_o, &
         zero, &
         X706, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X705)
      call mem%alloc(X707, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X706, X707, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X706)
      call mem%alloc(X708, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X707, &
         wf%n_o**2, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X708, &
         wf%n_o**2)
!
      call mem%dealloc(X707)
      call mem%alloc(X709, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X708, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X709, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X708)
      call add_1432_to_1234(one, X709, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X709)
      call mem%alloc(X710, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X710, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X711, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         X710, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X711, 1)
!
      call mem%dealloc(X710)
      call mem%alloc(X712, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X711, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X712, &
         wf%n_o)
!
      call mem%dealloc(X711)
      call mem%alloc(X713, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X712, X713, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X712)
      call mem%alloc(X714, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X714, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X714, &
         wf%n_o, &
         X713, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X713)
      call mem%dealloc(X714)
      call mem%alloc(X715, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X715, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X716, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         tAxxx_ovo, &
         wf%n_o, &
         X715, &
         wf%n_v*wf%n_o, &
         zero, &
         X716, &
         wf%n_o)
!
      call mem%dealloc(X715)
      call mem%alloc(X717, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X716, &
         wf%n_o**2, &
         zero, &
         X717, &
         wf%n_v)
!
      call mem%dealloc(X716)
      call mem%alloc(X718, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X717, &
         wf%n_v*wf%n_o, &
         zero, &
         X718, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X717)
      call add_1423_to_1234(one, X718, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X718)
      call mem%alloc(X719, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         -2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X719, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X720, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(X719, X720, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X719)
      call mem%alloc(X721, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X721, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X722, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v**2, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X720, &
         wf%n_o**2, &
         X721, &
         wf%n_o**2, &
         zero, &
         X722, &
         wf%n_v**2)
!
      call mem%dealloc(X720)
      call mem%dealloc(X721)
      call mem%alloc(X723, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X723, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X724, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_v, &
         one, &
         X723, &
         wf%n_o**2, &
         X722, &
         wf%n_v, &
         zero, &
         X724, &
         wf%n_o**2)
!
      call mem%dealloc(X722)
      call mem%dealloc(X723)
      call add_1342_to_1234(one, X724, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X724)
      call mem%alloc(X725, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_ovov, X725, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X726, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X726, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X727, wf%n_o, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v, &
         -2.00000000000000, &
         X725, &
         wf%n_v*wf%n_o**2, &
         X726, &
         wf%n_o**2, &
         zero, &
         X727, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X725)
      call mem%dealloc(X726)
      call mem%alloc(X728, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X728, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X729, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X727, &
         wf%n_o**2, &
         X728, &
         wf%n_o**2, &
         zero, &
         X729, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X727)
      call mem%dealloc(X728)
      call mem%alloc(X730, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X729, &
         wf%n_v, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X730, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X729)
      call add_1342_to_1234(one, X730, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X730)
      call mem%alloc(X731, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X731, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X732, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         X731, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X732, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X731)
      call mem%alloc(X733, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X732, X733, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X732)
      call mem%alloc(X734, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X733, &
         wf%n_o**2, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X734, &
         wf%n_o**2)
!
      call mem%dealloc(X733)
      call mem%alloc(X735, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X734, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X735, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X734)
      call add_1423_to_1234(one, X735, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X735)
      call mem%alloc(X736, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X736, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X737, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         X736, &
         wf%n_o, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X737, &
         wf%n_o)
!
      call mem%dealloc(X736)
      call mem%alloc(X738, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X737, &
         wf%n_o**2, &
         zero, &
         X738, &
         wf%n_v)
!
      call mem%dealloc(X737)
      call mem%alloc(X739, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X738, &
         wf%n_v*wf%n_o, &
         zero, &
         X739, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X738)
      call add_1423_to_1234(one, X739, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X739)
      call mem%alloc(X740, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X740, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X741, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         X740, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X741, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X740)
      call mem%alloc(X742, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X741, X742, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X741)
      call mem%alloc(X743, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X742, &
         wf%n_o**2, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X743, &
         wf%n_o**2)
!
      call mem%dealloc(X742)
      call mem%alloc(X744, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X744, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X743, &
         wf%n_o, &
         X744, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X743)
      call mem%dealloc(X744)
      call mem%alloc(X745, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X745, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X746, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X745, &
         wf%n_o, &
         zero, &
         X746, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X745)
      call mem%alloc(X747, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X746, X747, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X746)
      call mem%alloc(X748, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X747, &
         wf%n_o**2, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X748, &
         wf%n_o**2)
!
      call mem%dealloc(X747)
      call mem%alloc(X749, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X748, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X749, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X748)
      call add_1423_to_1234(one, X749, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X749)
      call mem%alloc(X750, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_ovov, X750, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X751, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         2.00000000000000, &
         txIxI_vv, &
         wf%n_v, &
         X750, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X751, &
         wf%n_v)
!
      call mem%dealloc(X750)
      call mem%alloc(X752, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(uAxxx_ovo, X752, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X753, wf%n_o, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X752, &
         wf%n_o**2, &
         X751, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X753, &
         wf%n_o**2)
!
      call mem%dealloc(X751)
      call mem%dealloc(X752)
      call mem%alloc(X754, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X754, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X755, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X753, &
         wf%n_v*wf%n_o**2, &
         X754, &
         wf%n_o**2, &
         zero, &
         X755, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X753)
      call mem%dealloc(X754)
      call add_1342_to_1234(one, X755, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X755)
      call mem%alloc(X756, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X756, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X757, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         X756, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X757, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X756)
      call mem%alloc(X758, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X757, &
         wf%n_v, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X758, &
         wf%n_o**2)
!
      call mem%dealloc(X757)
      call mem%alloc(X759, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X759, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X758, &
         wf%n_o, &
         X759, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X758)
      call mem%dealloc(X759)
      call mem%alloc(X760, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X760, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X761, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         X760, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X761, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X760)
      call mem%alloc(X762, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X761, &
         wf%n_v, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X762, &
         wf%n_o**2)
!
      call mem%dealloc(X761)
      call mem%alloc(X763, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X762, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X763, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X762)
      call add_1432_to_1234(one, X763, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X763)
      call mem%alloc(X764, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X764, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X765, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         txIxx_vvo, &
         wf%n_v, &
         X764, &
         wf%n_v*wf%n_o, &
         zero, &
         X765, &
         wf%n_v)
!
      call mem%dealloc(X764)
      call mem%alloc(X766, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X765, &
         wf%n_v*wf%n_o, &
         zero, &
         X766, &
         wf%n_o)
!
      call mem%dealloc(X765)
      call mem%alloc(X767, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X766, &
         wf%n_v*wf%n_o, &
         zero, &
         X767, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X766)
      call add_1432_to_1234(one, X767, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X767)
      call mem%alloc(X768, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X768, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X769, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         X768, &
         wf%n_v*wf%n_o, &
         uAIxx_vo, 1, &
         zero, &
         X769, 1)
!
      call mem%dealloc(X768)
      call mem%alloc(X770, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X770, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X771, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X769, &
         wf%n_o, &
         X770, &
         wf%n_v*wf%n_o, &
         zero, &
         X771, &
         wf%n_o)
!
      call mem%dealloc(X769)
      call mem%dealloc(X770)
      call mem%alloc(X772, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X771, &
         wf%n_o, &
         zero, &
         X772, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X771)
      call add_1423_to_1234(one, X772, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X772)
      call mem%alloc(X773, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X773, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X774, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         X773, &
         wf%n_v*wf%n_o, &
         uAIxx_vo, 1, &
         zero, &
         X774, 1)
!
      call mem%dealloc(X773)
      call mem%alloc(X775, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X775, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X776, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X774, &
         wf%n_o, &
         X775, &
         wf%n_o**2, &
         zero, &
         X776, &
         wf%n_o)
!
      call mem%dealloc(X774)
      call mem%dealloc(X775)
      call mem%alloc(X777, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X776, &
         wf%n_o, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X777, &
         wf%n_o**2)
!
      call mem%dealloc(X776)
      call add_1324_to_1234(one, X777, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X777)
      call mem%alloc(X778, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X778, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X779, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         txIxx_vvo, &
         wf%n_v, &
         X778, &
         wf%n_v*wf%n_o, &
         zero, &
         X779, &
         wf%n_v)
!
      call mem%dealloc(X778)
      call mem%alloc(X780, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X780, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X781, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X780, &
         wf%n_o**2, &
         X779, &
         wf%n_v*wf%n_o, &
         zero, &
         X781, &
         wf%n_o**2)
!
      call mem%dealloc(X779)
      call mem%dealloc(X780)
      call mem%alloc(X782, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(X781, X782, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X781)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X782, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X782)
      call mem%alloc(X783, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X783, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X784, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         tAxxx_ovo, &
         wf%n_o, &
         X783, &
         wf%n_v*wf%n_o, &
         zero, &
         X784, &
         wf%n_o)
!
      call mem%dealloc(X783)
      call mem%alloc(X785, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X784, &
         wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X785, &
         wf%n_o**2)
!
      call mem%dealloc(X784)
      call mem%alloc(X786, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X785, X786, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X785)
      call mem%alloc(X787, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X786, &
         wf%n_o**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X787, &
         wf%n_o**2)
!
      call mem%dealloc(X786)
      call add_1324_to_1234(one, X787, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X787)
      call mem%alloc(X788, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X788, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X789, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         X788, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X789, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X788)
      call mem%alloc(X790, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X789, X790, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X789)
      call mem%alloc(X791, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X791, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X792, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X790, &
         wf%n_o**2, &
         X791, &
         wf%n_v*wf%n_o, &
         zero, &
         X792, &
         wf%n_o**2)
!
      call mem%dealloc(X790)
      call mem%dealloc(X791)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X792, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X792)
      call mem%alloc(X793, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_ovov, X793, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X794, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v**2, &
         2.00000000000000, &
         X793, &
         wf%n_o**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X794, &
         wf%n_o**2)
!
      call mem%dealloc(X793)
      call mem%alloc(X795, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X794, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X795, &
         wf%n_o**2)
!
      call mem%dealloc(X794)
      call mem%alloc(X796, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X795, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X796, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X795)
      call add_1423_to_1234(one, X796, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X796)
      call mem%alloc(X797, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X797, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X798, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         txxxI_vov, &
         wf%n_v, &
         X797, &
         wf%n_v*wf%n_o, &
         zero, &
         X798, &
         wf%n_v)
!
      call mem%dealloc(X797)
      call mem%alloc(X799, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X798, &
         wf%n_v*wf%n_o, &
         zero, &
         X799, &
         wf%n_o)
!
      call mem%dealloc(X798)
      call mem%alloc(X800, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X799, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X800, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X799)
      call add_1423_to_1234(one, X800, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X800)
      call mem%alloc(X801, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X801, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X802, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1324(X801, X802, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X801)
      call mem%alloc(X803, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X803, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X804, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X802, &
         wf%n_o**2, &
         X803, &
         wf%n_o**2, &
         zero, &
         X804, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X802)
      call mem%dealloc(X803)
      call mem%alloc(X805, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_213(txxxI_vov, X805, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X806, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X805, &
         wf%n_v*wf%n_o, &
         X804, &
         wf%n_v, &
         zero, &
         X806, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X804)
      call mem%dealloc(X805)
      call add_1432_to_1234(one, X806, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X806)
      call mem%alloc(X807, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X807, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X808, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         X807, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X808, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X807)
      call mem%alloc(X809, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X808, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X809, &
         wf%n_o**2)
!
      call mem%dealloc(X808)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X809, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X809)
      call mem%alloc(X810, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X810, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X811, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         X810, &
         wf%n_v, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X811, &
         wf%n_v)
!
      call mem%dealloc(X810)
      call mem%alloc(X812, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X811, &
         wf%n_v*wf%n_o, &
         zero, &
         X812, &
         wf%n_o)
!
      call mem%dealloc(X811)
      call mem%alloc(X813, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X812, &
         wf%n_v*wf%n_o, &
         zero, &
         X813, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X812)
      call add_1432_to_1234(one, X813, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X813)
      call mem%alloc(X814, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X814, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X815, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         X814, &
         wf%n_v, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X815, &
         wf%n_v)
!
      call mem%dealloc(X814)
      call mem%alloc(X816, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X816, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X817, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X816, &
         wf%n_o**2, &
         X815, &
         wf%n_v*wf%n_o, &
         zero, &
         X817, &
         wf%n_o**2)
!
      call mem%dealloc(X815)
      call mem%dealloc(X816)
      call mem%alloc(X818, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(X817, X818, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X817)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X818, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X818)
      call mem%alloc(X819, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X819, &
         wf%n_v*wf%n_o**2)
!
      call mem%alloc(X820, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1324(X819, X820, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X819)
      call mem%alloc(X821, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X821, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X822, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X820, &
         wf%n_o**2, &
         X821, &
         wf%n_o**2, &
         zero, &
         X822, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X820)
      call mem%dealloc(X821)
      call mem%alloc(X823, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_213(uxxxI_vov, X823, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X822, &
         wf%n_v, &
         X823, &
         wf%n_v*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X822)
      call mem%dealloc(X823)
      call mem%alloc(X824, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_ovov, X824, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X825, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         X824, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X825, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X824)
      call mem%alloc(X826, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X825, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X826, &
         wf%n_o**2)
!
      call mem%dealloc(X825)
      call mem%alloc(X827, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X826, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X827, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X826)
      call add_1432_to_1234(one, X827, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X827)
      call mem%alloc(X828, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X828, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X829, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X828, &
         wf%n_o, &
         zero, &
         X829, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X828)
      call mem%alloc(X830, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X829, X830, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X829)
      call mem%alloc(X831, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X830, &
         wf%n_o**2, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X831, &
         wf%n_o**2)
!
      call mem%dealloc(X830)
      call mem%alloc(X832, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X832, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X831, &
         wf%n_o, &
         X832, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X831)
      call mem%dealloc(X832)
      call mem%alloc(X833, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X833, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X834, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         X833, &
         wf%n_o, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         zero, &
         X834, &
         wf%n_o)
!
      call mem%dealloc(X833)
      call mem%alloc(X835, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X834, &
         wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X835, &
         wf%n_o**2)
!
      call mem%dealloc(X834)
      call mem%alloc(X836, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X835, X836, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X835)
      call mem%alloc(X837, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X836, &
         wf%n_o**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X837, &
         wf%n_o**2)
!
      call mem%dealloc(X836)
      call add_1324_to_1234(one, X837, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X837)
      call mem%alloc(X838, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X838, wf%n_v, wf%n_o)
      call mem%alloc(X839, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X838, 1, &
         zero, &
         X839, 1)
!
      call mem%dealloc(X838)
      call mem%alloc(X840, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X840, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X841, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X839, &
         wf%n_o, &
         X840, &
         wf%n_o**2, &
         zero, &
         X841, &
         wf%n_o)
!
      call mem%dealloc(X839)
      call mem%dealloc(X840)
      call mem%alloc(X842, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X841, &
         wf%n_o, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X842, &
         wf%n_o**2)
!
      call mem%dealloc(X841)
      call add_1324_to_1234(one, X842, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X842)
      call mem%alloc(X843, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X843, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X844, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X843, &
         wf%n_o, &
         zero, &
         X844, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X843)
      call mem%alloc(X845, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X844, X845, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X844)
      call mem%alloc(X846, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X846, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X847, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X845, &
         wf%n_o**2, &
         X846, &
         wf%n_v*wf%n_o, &
         zero, &
         X847, &
         wf%n_o**2)
!
      call mem%dealloc(X845)
      call mem%dealloc(X846)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X847, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X847)
      call mem%alloc(X848, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X848, wf%n_v, wf%n_o)
      call mem%alloc(X849, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X848, 1, &
         zero, &
         X849, 1)
!
      call mem%dealloc(X848)
      call mem%alloc(X850, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X850, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X851, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X849, &
         wf%n_o, &
         X850, &
         wf%n_v*wf%n_o, &
         zero, &
         X851, &
         wf%n_o)
!
      call mem%dealloc(X849)
      call mem%dealloc(X850)
      call mem%alloc(X852, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X851, &
         wf%n_o, &
         zero, &
         X852, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X851)
      call add_1423_to_1234(one, X852, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X852)
      call mem%alloc(X853, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_ovov, X853, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X854, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v**2, &
         -2.00000000000000, &
         X853, &
         wf%n_o**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X854, &
         wf%n_o**2)
!
      call mem%dealloc(X853)
      call mem%alloc(X855, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X854, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X855, &
         wf%n_o**2)
!
      call mem%dealloc(X854)
      call mem%alloc(X856, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X856, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X855, &
         wf%n_o, &
         X856, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X855)
      call mem%dealloc(X856)
      call mem%alloc(X857, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X857, wf%n_v, wf%n_o)
      call mem%alloc(X858, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X857, 1, &
         zero, &
         X858, 1)
!
      call mem%dealloc(X857)
      call mem%alloc(X859, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X858, &
         wf%n_o, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X859, &
         wf%n_o)
!
      call mem%dealloc(X858)
      call mem%alloc(X860, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X860, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X861, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X860, &
         wf%n_o, &
         X859, &
         wf%n_o, &
         zero, &
         X861, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X859)
      call mem%dealloc(X860)
      call add_1423_to_1234(one, X861, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X861)
      call mem%alloc(X862, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_ovov, X862, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X863, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -2.00000000000000, &
         txxxI_vov, &
         wf%n_v, &
         X862, &
         wf%n_v*wf%n_o, &
         zero, &
         X863, &
         wf%n_v)
!
      call mem%dealloc(X862)
      call mem%alloc(X864, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X863, &
         wf%n_v*wf%n_o, &
         zero, &
         X864, &
         wf%n_o)
!
      call mem%dealloc(X863)
      call mem%alloc(X865, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X865, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X864, &
         wf%n_v*wf%n_o, &
         X865, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X864)
      call mem%dealloc(X865)
      call mem%alloc(X866, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X866, wf%n_v, wf%n_o)
      call mem%alloc(X867, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X866, 1, &
         zero, &
         X867, 1)
!
      call mem%dealloc(X866)
      call mem%alloc(X868, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X867, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X868, &
         wf%n_o)
!
      call mem%dealloc(X867)
      call mem%alloc(X869, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(wf%u_aibj, X869, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X868, &
         wf%n_o, &
         X869, &
         wf%n_v**2*wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_o)
!
      call mem%dealloc(X868)
      call mem%dealloc(X869)
      call mem%alloc(X870, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X870, wf%n_v, wf%n_o)
      call mem%alloc(X871, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X870, 1, &
         zero, &
         X871, 1)
!
      call mem%dealloc(X870)
      call mem%alloc(X872, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X871, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X872, &
         wf%n_v)
!
      call mem%dealloc(X871)
      call mem%alloc(X873, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         wf%u_aibj, &
         wf%n_v, &
         X872, &
         wf%n_v, &
         zero, &
         X873, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X872)
      call add_1432_to_1234(one, X873, omega_bjck, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X873)
      call mem%alloc(X874, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X874, wf%n_v, wf%n_o)
      call mem%alloc(X875, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         2.00000000000000, &
         g_ovov, &
         wf%n_v*wf%n_o, &
         X874, 1, &
         zero, &
         X875, 1)
!
      call mem%dealloc(X874)
      call mem%alloc(X876, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X875, &
         wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X876, &
         wf%n_o)
!
      call mem%dealloc(X875)
      call mem%alloc(X877, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X876, X877, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X876)
      call mem%alloc(X878, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X878, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X878, &
         wf%n_o, &
         X877, &
         wf%n_o, &
         one, &
         omega_bjck, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X877)
      call mem%dealloc(X878)
!
   end subroutine omega_μ2_4_s_doublet_ccsd

