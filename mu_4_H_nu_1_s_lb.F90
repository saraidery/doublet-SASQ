   module subroutine mu_4_H_nu_1_s_doublet_ccsd(wf, rho_aibj, LAIxx_oo, LAIxx_vv, LAxxx_vov, LAxxx_vvo, L_ooov, &
      L_vooo, L_vvov, LxIxx_oov, LxxxI_voo, gAIAx_v, gAIxI_o, gAIxx_oo, gAIxx_vv, gAxAx_ov, gAxxI_oo, gAxxI_vv, &
      gAxxx_ooo, gAxxx_ovv, gAxxx_vov, gAxxx_vvo, g_ooov, g_vovv, g_vvov, gxIxI_vo, gxIxx_oov, gxIxx_voo, gxIxx_vvv, &
      gxxxI_voo, rAI, rAx_o, r_vo, rxI_v, tAIAx_o, tAIxI_v, tAIxx_vo, tAxAx_oo, tAxxI_ov, tAxxx_ovo, t_aibj, &
      txIxI_vv, txIxx_vvo, txxxI_vov, uAIxx_vo, uAxxx_ovo, u_aibj, uxIxx_vvo, uxxxI_vov)
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
      real(dp), dimension(wf%n_o), intent(in) :: gAIxI_o, rAx_o, tAIAx_o
      real(dp), dimension(wf%n_v), intent(in) :: gAIAx_v, rxI_v, tAIxI_v
      real(dp), dimension(wf%n_o,wf%n_o), intent(in) :: LAIxx_oo, gAIxx_oo, gAxxI_oo, tAxAx_oo
      real(dp), dimension(wf%n_o,wf%n_v), intent(in) :: gAxAx_ov, tAxxI_ov
      real(dp), dimension(wf%n_v,wf%n_o), intent(in) :: gxIxI_vo, r_vo, tAIxx_vo, uAIxx_vo
      real(dp), dimension(wf%n_v,wf%n_v), intent(in) :: LAIxx_vv, gAIxx_vv, gAxxI_vv, txIxI_vv
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_o), intent(in) :: gAxxx_ooo
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_v), intent(in) :: LxIxx_oov, gxIxx_oov
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_o), intent(in) :: tAxxx_ovo, uAxxx_ovo
      real(dp), dimension(wf%n_o,wf%n_v,wf%n_v), intent(in) :: gAxxx_ovv
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_o), intent(in) :: LxxxI_voo, gxIxx_voo, gxxxI_voo
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v), intent(in) :: LAxxx_vov, gAxxx_vov, txxxI_vov, uxxxI_vov
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_o), intent(in) :: LAxxx_vvo, gAxxx_vvo, txIxx_vvo, uxIxx_vvo
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_v), intent(in) :: gxIxx_vvv
      real(dp), dimension(wf%n_o,wf%n_o,wf%n_o,wf%n_v), intent(in) :: L_ooov, g_ooov
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_o,wf%n_o), intent(in) :: L_vooo
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_o), intent(in) :: t_aibj, u_aibj
      real(dp), dimension(wf%n_v,wf%n_o,wf%n_v,wf%n_v), intent(in) :: g_vovv
      real(dp), dimension(wf%n_v,wf%n_v,wf%n_o,wf%n_v), intent(in) :: L_vvov, g_vvov
!
      real(dp), dimension(:), allocatable :: X156, X158, X161, X163, X199, X240, X1514, X1516, X1570, X1573, &
      X1617, X1624, X1669, X1672, X1719, X1830, X1843, X1954, X2005, X2013, X2070, X2072, X2121, X2128, X2174, &
      X2177, X2236, X2252, X2378, X2410
      real(dp), dimension(:,:), allocatable :: X8, X14, X15, X25, X26, X29, X30, X35, X37, X38, X40, X55, X57, &
      X64, X66, X67, X69, X70, X72, X73, X75, X99, X101, X125, X127, X157, X159, X162, X164, X166, X167, X168, X169, &
      X171, X172, X173, X174, X176, X177, X178, X179, X181, X182, X183, X184, X194, X197, X206, X213, X223, X227, &
      X230, X233, X247, X250, X252, X256, X259, X261, X269, X271, X324, X325, X329, X330, X340, X342, X346, X351, &
      X354, X355, X356, X357, X358, X359, X361, X362, X363, X364, X368, X370, X383, X384, X385, X386, X387, X388, &
      X390, X391, X393, X419, X423, X424, X436, X437, X442, X443, X451, X455, X468, X469, X473, X474, X478, X479, &
      X482, X483, X509, X514, X523, X524, X527, X528, X540, X541, X544, X545, X553, X554, X557, X558, X570, X571, &
      X572, X575, X576, X577, X585, X586, X589, X590, X601, X602, X605, X606, X616, X617, X620, X621, X633, X634, &
      X637, X638, X647, X648, X649, X651, X652, X653, X664, X665, X666, X668, X669, X670, X816, X817, X833, X866, &
      X900, X920, X949, X982, X985, X1021, X1063, X1088, X1089, X1102, X1103, X1109, X1110, X1117, X1118, X1141, &
      X1181, X1182, X1214, X1215, X1244, X1266, X1300, X1316, X1347, X1383, X1403, X1433, X1434, X1451, X1452, &
      X1460, X1461, X1467, X1468, X1474, X1475, X1476, X1477, X1490, X1491, X1494, X1495, X1505, X1506, X1508, &
      X1509, X1515, X1517, X1529, X1530, X1531, X1532, X1545, X1546, X1549, X1550, X1560, X1561, X1563, X1564, &
      X1569, X1571, X1572, X1574, X1586, X1587, X1589, X1590, X1591, X1592, X1595, X1596, X1614, X1615, X1618, &
      X1620, X1621, X1625, X1641, X1642, X1644, X1645, X1655, X1656, X1658, X1659, X1668, X1670, X1671, X1673, &
      X1688, X1690, X1724, X1725, X1727, X1728, X1729, X1734, X1741, X1744, X1748, X1752, X1757, X1762, X1765, &
      X1769, X1774, X1779, X1782, X1786, X1791, X1795, X1799, X1832, X1833, X1834, X1835, X1842, X1845, X1846, &
      X1849, X1850, X1851, X1855, X1859, X1864, X1868, X1872, X1878, X1880, X1885, X1889, X1892, X1895, X1901, &
      X1906, X1910, X1914, X1918, X1921, X1923, X1926, X1930, X1935, X1938, X1941, X1945, X1951, X1953, X1956, &
      X1957, X1960, X1961, X1963, X1965, X1967, X1970, X1971, X1975, X1977, X1978, X1983, X2001, X2002, X2004, &
      X2006, X2008, X2009, X2012, X2014, X2031, X2032, X2034, X2035, X2045, X2046, X2048, X2049, X2061, X2062, &
      X2064, X2065, X2071, X2073, X2089, X2091, X2092, X2096, X2099, X2100, X2118, X2119, X2122, X2124, X2125, &
      X2129, X2147, X2149, X2150, X2153, X2156, X2157, X2173, X2175, X2176, X2178, X2196, X2200, X2204, X2235, &
      X2241, X2242, X2244, X2257, X2261, X2262, X2264, X2269, X2273, X2278, X2283, X2288, X2293, X2297, X2302, &
      X2306, X2310, X2314, X2320, X2325, X2328, X2332, X2337, X2341, X2344, X2348, X2352, X2356, X2360, X2365, &
      X2369, X2374, X2377, X2383, X2386, X2387, X2389, X2392, X2395, X2412, X2413, X2416, X2417, X2421, X2424, &
      X2429, X2434, X2437, X2440, X2444, X2447, X2450, X2453, X2456, X2465, X2468, X2470, X2473, X2477
      real(dp), dimension(:,:,:), allocatable :: X4, X9, X10, X12, X17, X18, X19, X22, X23, X28, X32, X33, &
      X41, X42, X43, X45, X46, X47, X48, X49, X51, X52, X53, X58, X59, X61, X63, X76, X77, X78, X79, X80, X81, X82, &
      X83, X84, X85, X87, X88, X90, X92, X93, X95, X96, X98, X103, X105, X108, X109, X111, X112, X114, X116, X117, &
      X119, X121, X122, X123, X124, X128, X129, X130, X131, X133, X135, X137, X138, X139, X140, X141, X143, X144, &
      X146, X147, X150, X152, X154, X186, X187, X189, X190, X192, X198, X200, X201, X203, X204, X207, X208, X210, &
      X211, X214, X215, X217, X218, X220, X221, X224, X225, X228, X231, X234, X236, X237, X238, X241, X242, X243, &
      X244, X245, X246, X248, X249, X251, X253, X254, X255, X257, X258, X260, X262, X263, X264, X265, X266, X267, &
      X268, X270, X272, X273, X274, X275, X276, X279, X280, X282, X284, X285, X286, X287, X288, X289, X336, X337, &
      X339, X341, X345, X347, X348, X349, X350, X367, X369, X373, X374, X375, X377, X378, X379, X380, X381, X382, &
      X392, X396, X397, X399, X400, X401, X402, X403, X405, X406, X407, X409, X410, X411, X413, X414, X415, X418, &
      X422, X425, X426, X430, X431, X434, X435, X440, X441, X446, X447, X450, X454, X457, X458, X462, X463, X464, &
      X466, X467, X472, X476, X477, X481, X485, X486, X490, X491, X492, X496, X497, X498, X499, X502, X503, X504, &
      X506, X507, X508, X511, X512, X513, X515, X516, X518, X519, X520, X680, X681, X682, X685, X686, X687, X690, &
      X691, X694, X697, X698, X699, X702, X703, X706, X707, X710, X711, X712, X715, X716, X717, X720, X721, X724, &
      X725, X726, X729, X756, X757, X758, X759, X761, X762, X763, X764, X767, X768, X771, X772, X773, X774, X775, &
      X777, X778, X779, X781, X782, X783, X784, X785, X788, X789, X791, X793, X794, X795, X796, X798, X799, X800, &
      X802, X803, X805, X806, X807, X811, X812, X813, X818, X819, X821, X822, X823, X827, X828, X829, X830, X834, &
      X835, X837, X838, X839, X841, X842, X843, X847, X848, X849, X851, X852, X853, X854, X857, X858, X859, X862, &
      X863, X864, X867, X870, X871, X872, X873, X875, X876, X878, X879, X880, X881, X884, X885, X886, X889, X890, &
      X891, X895, X896, X897, X901, X902, X904, X905, X906, X910, X911, X912, X913, X916, X917, X918, X921, X922, &
      X924, X925, X927, X928, X929, X931, X934, X935, X936, X937, X940, X941, X942, X945, X946, X947, X950, X953, &
      X954, X955, X956, X958, X959, X961, X962, X963, X964, X967, X968, X969, X972, X973, X974, X977, X978, X979, &
      X983, X986, X987, X989, X990, X995, X996, X1002, X1003, X1006, X1007, X1008, X1009, X1010, X1012, X1013, &
      X1015, X1016, X1017, X1018, X1022, X1024, X1025, X1026, X1027, X1029, X1030, X1031, X1033, X1034, X1035, &
      X1036, X1039, X1040, X1041, X1042, X1043, X1045, X1046, X1047, X1049, X1050, X1051, X1054, X1055, X1056, &
      X1059, X1060, X1061, X1064, X1065, X1067, X1068, X1070, X1071, X1073, X1074, X1078, X1079, X1080, X1084, &
      X1085, X1090, X1091, X1092, X1094, X1095, X1098, X1099, X1100, X1101, X1104, X1105, X1107, X1108, X1111, &
      X1115, X1116, X1119, X1120, X1121, X1123, X1128, X1129, X1131, X1132, X1133, X1136, X1138, X1142, X1143, &
      X1146, X1147, X1148, X1151, X1152, X1157, X1158, X1159, X1161, X1162, X1163, X1164, X1167, X1168, X1169, &
      X1170, X1173, X1174, X1175, X1177, X1178, X1183, X1185, X1186, X1187, X1189, X1190, X1191, X1192, X1195, &
      X1196, X1197, X1200, X1201, X1202, X1203, X1204, X1205, X1209, X1210, X1211, X1212, X1216, X1219, X1220, &
      X1222, X1223, X1224, X1225, X1226, X1227, X1230, X1231, X1232, X1235, X1236, X1237, X1238, X1241, X1242, &
      X1245, X1246, X1248, X1249, X1252, X1253, X1254, X1255, X1258, X1259, X1260, X1263, X1264, X1267, X1269, &
      X1270, X1271, X1273, X1274, X1275, X1276, X1279, X1280, X1282, X1283, X1284, X1287, X1288, X1289, X1290, &
      X1293, X1294, X1295, X1296, X1297, X1298, X1301, X1303, X1304, X1306, X1307, X1308, X1311, X1312, X1313, &
      X1317, X1318, X1321, X1322, X1323, X1326, X1327, X1331, X1332, X1333, X1334, X1338, X1339, X1340, X1342, &
      X1343, X1344, X1345, X1348, X1351, X1352, X1354, X1355, X1356, X1358, X1359, X1360, X1361, X1364, X1365, &
      X1366, X1369, X1370, X1371, X1372, X1373, X1374, X1378, X1379, X1380, X1381, X1384, X1387, X1388, X1390, &
      X1391, X1392, X1393, X1394, X1395, X1398, X1399, X1400, X1404, X1405, X1408, X1409, X1410, X1413, X1414, &
      X1418, X1419, X1420, X1421, X1425, X1426, X1427, X1429, X1430, X1431, X1435, X1436, X1439, X1440, X1441, &
      X1443, X1444, X1446, X1447, X1448, X1449, X1453, X1454, X1456, X1457, X1458, X1459, X1462, X1463, X1464, &
      X1465, X1469, X1470, X1472, X1473, X1479, X1480, X1483, X1484, X1485, X1488, X1489, X1492, X1493, X1497, &
      X1500, X1501, X1502, X1504, X1507, X1511, X1512, X1519, X1520, X1522, X1523, X1525, X1526, X1527, X1534, &
      X1535, X1538, X1539, X1540, X1543, X1544, X1547, X1548, X1552, X1553, X1554, X1556, X1559, X1562, X1566, &
      X1567, X1576, X1577, X1579, X1580, X1582, X1583, X1584, X1588, X1594, X1598, X1599, X1602, X1606, X1607, &
      X1608, X1610, X1611, X1613, X1616, X1619, X1623, X1627, X1628, X1631, X1632, X1633, X1634, X1635, X1636, &
      X1637, X1638, X1640, X1643, X1647, X1648, X1650, X1651, X1654, X1657, X1661, X1664, X1665, X1675, X1677, &
      X1679, X1680, X1682, X1683, X1686, X1687, X1689, X1693, X1694, X1696, X1698, X1700, X1701, X1702, X1703, &
      X1705, X1706, X1707, X1708, X1711, X1712, X1714, X1715, X1716, X1718, X1720, X1721, X1723, X1726, X1730, &
      X1731, X1733, X1735, X1736, X1737, X1739, X1740, X1742, X1745, X1747, X1749, X1750, X1751, X1753, X1754, &
      X1756, X1758, X1759, X1761, X1763, X1766, X1768, X1770, X1771, X1772, X1773, X1775, X1776, X1778, X1780, &
      X1781, X1783, X1785, X1787, X1788, X1790, X1792, X1794, X1796, X1798, X1800, X1802, X1803, X1804, X1805, &
      X1807, X1808, X1809, X1810, X1811, X1812, X1813, X1815, X1816, X1817, X1818, X1820, X1821, X1823, X1824, &
      X1825, X1826, X1827, X1828, X1829, X1831, X1838, X1839, X1840, X1841, X1844, X1852, X1853, X1854, X1856, &
      X1857, X1858, X1860, X1861, X1862, X1863, X1865, X1866, X1867, X1869, X1870, X1873, X1874, X1876, X1877, &
      X1879, X1881, X1882, X1883, X1884, X1886, X1887, X1888, X1890, X1891, X1893, X1896, X1897, X1898, X1900, &
      X1902, X1903, X1904, X1905, X1907, X1908, X1909, X1911, X1912, X1915, X1916, X1919, X1920, X1922, X1924, &
      X1927, X1929, X1931, X1932, X1933, X1934, X1936, X1937, X1939, X1940, X1942, X1943, X1944, X1946, X1947, &
      X1948, X1949, X1950, X1952, X1955, X1962, X1964, X1966, X1968, X1969, X1972, X1973, X1974, X1976, X1980, &
      X1981, X1982, X1985, X1989, X1990, X1991, X1993, X1994, X1996, X1997, X1998, X2000, X2003, X2007, X2011, &
      X2016, X2017, X2018, X2019, X2023, X2024, X2025, X2026, X2027, X2028, X2030, X2033, X2037, X2038, X2039, &
      X2041, X2042, X2044, X2047, X2051, X2052, X2053, X2056, X2057, X2058, X2060, X2063, X2067, X2068, X2075, &
      X2076, X2077, X2079, X2080, X2082, X2083, X2084, X2086, X2087, X2088, X2090, X2093, X2094, X2095, X2098, &
      X2102, X2103, X2104, X2106, X2110, X2111, X2113, X2114, X2115, X2117, X2120, X2123, X2127, X2131, X2132, &
      X2133, X2134, X2138, X2139, X2140, X2141, X2142, X2143, X2145, X2146, X2148, X2151, X2152, X2155, X2159, &
      X2160, X2161, X2163, X2167, X2168, X2170, X2171, X2180, X2181, X2182, X2183, X2184, X2185, X2187, X2189, &
      X2191, X2195, X2199, X2203, X2205, X2206, X2207, X2209, X2211, X2213, X2214, X2215, X2217, X2219, X2221, &
      X2223, X2225, X2227, X2228, X2230, X2231, X2232, X2234, X2237, X2238, X2240, X2243, X2247, X2248, X2249, &
      X2251, X2253, X2254, X2256, X2260, X2263, X2265, X2266, X2268, X2270, X2272, X2274, X2275, X2277, X2279, &
      X2280, X2282, X2284, X2285, X2287, X2289, X2290, X2292, X2294, X2296, X2298, X2299, X2301, X2303, X2305, &
      X2307, X2309, X2311, X2313, X2315, X2316, X2317, X2319, X2321, X2322, X2324, X2326, X2329, X2330, X2333, &
      X2334, X2336, X2338, X2340, X2342, X2345, X2347, X2349, X2351, X2353, X2355, X2357, X2359, X2361, X2362, &
      X2364, X2366, X2368, X2370, X2371, X2373, X2375, X2379, X2380, X2382, X2388, X2390, X2393, X2394, X2396, &
      X2397, X2398, X2399, X2400, X2401, X2403, X2404, X2405, X2406, X2407, X2408, X2409, X2411, X2420, X2422, &
      X2423, X2425, X2426, X2427, X2428, X2430, X2431, X2432, X2433, X2435, X2436, X2438, X2439, X2441, X2442, &
      X2445, X2448, X2449, X2451, X2452, X2454, X2455, X2457, X2458, X2459, X2461, X2462, X2463, X2464, X2466, &
      X2467, X2469, X2471, X2472, X2474, X2476, X2478
      real(dp), dimension(:,:,:,:), allocatable :: X1, X2, X3, X5, X6, X7, X11, X13, X16, X20, X21, X24, X27, &
      X31, X34, X36, X39, X44, X50, X54, X56, X60, X62, X65, X68, X71, X74, X86, X89, X91, X94, X97, X100, X102, &
      X104, X106, X107, X110, X113, X115, X118, X120, X126, X132, X134, X136, X142, X145, X148, X149, X151, X153, &
      X155, X160, X165, X170, X175, X180, X185, X188, X191, X193, X195, X196, X202, X205, X209, X212, X216, X219, &
      X222, X226, X229, X232, X235, X239, X277, X278, X281, X283, X290, X291, X292, X293, X294, X295, X296, X297, &
      X298, X299, X300, X301, X302, X303, X304, X305, X306, X307, X308, X309, X310, X311, X312, X313, X314, X315, &
      X316, X317, X318, X319, X320, X321, X322, X323, X326, X327, X328, X331, X332, X333, X334, X335, X338, X343, &
      X344, X352, X353, X360, X365, X366, X371, X372, X376, X389, X394, X395, X398, X404, X408, X412, X416, X417, &
      X420, X421, X427, X428, X429, X432, X433, X438, X439, X444, X445, X448, X449, X452, X453, X456, X459, X460, &
      X461, X465, X470, X471, X475, X480, X484, X487, X488, X489, X493, X494, X495, X500, X501, X505, X510, X517, &
      X521, X522, X525, X526, X529, X530, X531, X532, X533, X534, X535, X536, X537, X538, X539, X542, X543, X546, &
      X547, X548, X549, X550, X551, X552, X555, X556, X559, X560, X561, X562, X563, X564, X565, X566, X567, X568, &
      X569, X573, X574, X578, X579, X580, X581, X582, X583, X584, X587, X588, X591, X592, X593, X594, X595, X596, &
      X597, X598, X599, X600, X603, X604, X607, X608, X609, X610, X611, X612, X613, X614, X615, X618, X619, X622, &
      X623, X624, X625, X626, X627, X628, X629, X630, X631, X632, X635, X636, X639, X640, X641, X642, X643, X644, &
      X645, X646, X650, X654, X655, X656, X657, X658, X659, X660, X661, X662, X663, X667, X671, X672, X673, X674, &
      X675, X676, X677, X678, X679, X683, X684, X688, X689, X692, X693, X695, X696, X700, X701, X704, X705, X708, &
      X709, X713, X714, X718, X719, X722, X723, X727, X728, X730, X731, X732, X733, X734, X735, X736, X737, X738, &
      X739, X740, X741, X742, X743, X744, X745, X746, X747, X748, X749, X750, X751, X752, X753, X754, X755, X760, &
      X765, X766, X769, X770, X776, X780, X786, X787, X790, X792, X797, X801, X804, X808, X809, X810, X814, X815, &
      X820, X824, X825, X826, X831, X832, X836, X840, X844, X845, X846, X850, X855, X856, X860, X861, X865, X868, &
      X869, X874, X877, X882, X883, X887, X888, X892, X893, X894, X898, X899, X903, X907, X908, X909, X914, X915, &
      X919, X923, X926, X930, X932, X933, X938, X939, X943, X944, X948, X951, X952, X957, X960, X965, X966, X970, &
      X971, X975, X976, X980, X981, X984, X988, X991, X992, X993, X994, X997, X998, X999, X1000, X1001, X1004, &
      X1005, X1011, X1014, X1019, X1020, X1023, X1028, X1032, X1037, X1038, X1044, X1048, X1052, X1053, X1057, &
      X1058, X1062, X1066, X1069, X1072, X1075, X1076, X1077, X1081, X1082, X1083, X1086, X1087, X1093, X1096, &
      X1097, X1106, X1112, X1113, X1114, X1122, X1124, X1125, X1126, X1127, X1130, X1134, X1135, X1137, X1139, &
      X1140, X1144, X1145, X1149, X1150, X1153, X1154, X1155, X1156, X1160, X1165, X1166, X1171, X1172, X1176, &
      X1179, X1180, X1184, X1188, X1193, X1194, X1198, X1199, X1206, X1207, X1208, X1213, X1217, X1218, X1221, &
      X1228, X1229, X1233, X1234, X1239, X1240, X1243, X1247, X1250, X1251, X1256, X1257, X1261, X1262, X1265, &
      X1268, X1272, X1277, X1278, X1281, X1285, X1286, X1291, X1292, X1299, X1302, X1305, X1309, X1310, X1314, &
      X1315, X1319, X1320, X1324, X1325, X1328, X1329, X1330, X1335, X1336, X1337, X1341, X1346, X1349, X1350, &
      X1353, X1357, X1362, X1363, X1367, X1368, X1375, X1376, X1377, X1382, X1385, X1386, X1389, X1396, X1397, &
      X1401, X1402, X1406, X1407, X1411, X1412, X1415, X1416, X1417, X1422, X1423, X1424, X1428, X1432, X1437, &
      X1438, X1442, X1445, X1450, X1455, X1466, X1471, X1478, X1481, X1482, X1486, X1487, X1496, X1498, X1499, &
      X1503, X1510, X1513, X1518, X1521, X1524, X1528, X1533, X1536, X1537, X1541, X1542, X1551, X1555, X1557, &
      X1558, X1565, X1568, X1575, X1578, X1581, X1585, X1593, X1597, X1600, X1601, X1603, X1604, X1605, X1609, &
      X1612, X1622, X1626, X1629, X1630, X1639, X1646, X1649, X1652, X1653, X1660, X1662, X1663, X1666, X1667, &
      X1674, X1676, X1678, X1681, X1684, X1685, X1691, X1692, X1695, X1697, X1699, X1704, X1709, X1710, X1713, &
      X1717, X1722, X1732, X1738, X1743, X1746, X1755, X1760, X1764, X1767, X1777, X1784, X1789, X1793, X1797, &
      X1801, X1806, X1814, X1819, X1822, X1836, X1837, X1847, X1848, X1871, X1875, X1894, X1899, X1913, X1917, &
      X1925, X1928, X1958, X1959, X1979, X1984, X1986, X1987, X1988, X1992, X1995, X1999, X2010, X2015, X2020, &
      X2021, X2022, X2029, X2036, X2040, X2043, X2050, X2054, X2055, X2059, X2066, X2069, X2074, X2078, X2081, &
      X2085, X2097, X2101, X2105, X2107, X2108, X2109, X2112, X2116, X2126, X2130, X2135, X2136, X2137, X2144, &
      X2154, X2158, X2162, X2164, X2165, X2166, X2169, X2172, X2179, X2186, X2188, X2190, X2192, X2193, X2194, &
      X2197, X2198, X2201, X2202, X2208, X2210, X2212, X2216, X2218, X2220, X2222, X2224, X2226, X2229, X2233, &
      X2239, X2245, X2246, X2250, X2255, X2258, X2259, X2267, X2271, X2276, X2281, X2286, X2291, X2295, X2300, &
      X2304, X2308, X2312, X2318, X2323, X2327, X2331, X2335, X2339, X2343, X2346, X2350, X2354, X2358, X2363, &
      X2367, X2372, X2376, X2381, X2384, X2385, X2391, X2402, X2414, X2415, X2418, X2419, X2443, X2446, X2460, &
      X2475
!
      call mem%alloc(X1, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1243(L_vooo, X1, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X2, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         -two*rAI, &
         X1, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X2, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1)
      call add_1243_to_1234(rAI, X2, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2)
      call mem%alloc(X3, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1243(L_vooo, X3, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X4, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         two, &
         X3, &
         wf%n_v*wf%n_o**2, &
         tAIAx_o, 1, &
         zero, &
         X4, 1)
!
      call mem%dealloc(X3)
      call mem%alloc(X5, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X4, 1, &
         rxI_v, 1, &
         X5, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X4)
      call add_1243_to_1234(one, X5, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X5)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         two*rAI, &
         LAIxx_vv, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%alloc(X6, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X6, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X7, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         -two*rAI, &
         X6, &
         wf%n_v**2*wf%n_o, &
         LAIxx_oo, &
         wf%n_o, &
         zero, &
         X7, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X6)
      call add_1342_to_1234(rAI, X7, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X7)
      call mem%alloc(X8, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         four, &
         LAxxx_vvo, &
         wf%n_v, &
         tAIxI_v, 1, &
         zero, &
         X8, 1)
!
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X8, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X8)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two*rAI, &
         LAxxx_vvo, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X9, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         -two, &
         LAxxx_vvo, &
         wf%n_v, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X9, &
         wf%n_v*wf%n_o)
!
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X9, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X9)
      call mem%alloc(X10, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         LAxxx_vvo, &
         wf%n_v, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X10, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X11, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X10, 1, &
         rxI_v, 1, &
         X11, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X10)
      call add_1243_to_1234(one, X11, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X11)
      call mem%alloc(X12, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         LAxxx_vvo, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X12, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X13, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X12, 1, &
         rxI_v, 1, &
         X13, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X12)
      call add_1243_to_1234(one, X13, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X13)
      call mem%alloc(X14, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         -four, &
         LxxxI_voo, &
         wf%n_v*wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X14, 1)
!
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X14, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X14)
      call mem%alloc(X15, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         two, &
         LxxxI_voo, &
         wf%n_v*wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X15, 1)
!
      call mem%alloc(X16, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X15, 1, &
         r_vo, 1, &
         X16, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X15)
      call add_1432_to_1234(one, X16, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X16)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         -two*rAI, &
         LxxxI_voo, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X17, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         two, &
         LxxxI_voo, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X17, &
         wf%n_v*wf%n_o)
!
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X17, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X17)
      call mem%alloc(X18, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         two, &
         LxxxI_voo, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X18, &
         wf%n_v*wf%n_o)
!
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X18, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X18)
      call mem%alloc(X19, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         two, &
         LxxxI_voo, &
         wf%n_v*wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X19, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X20, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X19, 1, &
         rxI_v, 1, &
         X20, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X19)
      call add_1243_to_1234(one, X20, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X20)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         four*rAI, &
         g_vovv, &
         wf%n_v**2*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%alloc(X21, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two*rAI, &
         g_vovv, &
         wf%n_v**2*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X21, &
         wf%n_v**2*wf%n_o)
!
      call add_1432_to_1234(rAI, X21, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X21)
      call mem%alloc(X22, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -four, &
         g_vovv, &
         wf%n_v**2*wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X22, 1)
!
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X22, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X22)
      call mem%alloc(X23, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         g_vovv, &
         wf%n_v**2*wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X23, 1)
!
      call mem%alloc(X24, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X23, 1, &
         rAx_o, 1, &
         X24, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X23)
      call add_1432_to_1234(one, X24, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X24)
      call mem%alloc(X25, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         four, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         gAIAx_v, 1, &
         zero, &
         X25, 1)
!
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X25, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X25)
      call mem%alloc(X26, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         gAIAx_v, 1, &
         zero, &
         X26, 1)
!
      call mem%alloc(X27, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X26, 1, &
         X27, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X26)
      call add_1432_to_1234(one, X27, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X27)
      call mem%alloc(X28, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         -two, &
         u_aibj, &
         wf%n_v, &
         gAIAx_v, 1, &
         zero, &
         X28, 1)
!
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X28, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X28)
      call mem%alloc(X29, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -four, &
         uAxxx_ovo, &
         wf%n_o, &
         gAIxI_o, 1, &
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
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         uAxxx_ovo, &
         wf%n_o, &
         gAIxI_o, 1, &
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
      call mem%alloc(X32, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         two, &
         u_aibj, &
         wf%n_v**2*wf%n_o, &
         gAIxI_o, 1, &
         zero, &
         X32, 1)
!
      call mem%alloc(X33, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_312(X32, X33, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X32)
      call mem%alloc(X34, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X33, 1, &
         rAx_o, 1, &
         X34, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X33)
      call add_1342_to_1234(one, X34, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X34)
      call mem%alloc(X35, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         gAIxx_vv, &
         wf%n_v, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X35, &
         wf%n_v)
!
      call mem%alloc(X36, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X35, 1, &
         r_vo, 1, &
         X36, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X35)
      call add_1432_to_1234(one, X36, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X36)
      call mem%alloc(X37, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         four, &
         gAIxx_vv, &
         wf%n_v, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X37, &
         wf%n_v)
!
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X37, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X37)
      call mem%alloc(X38, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         two, &
         gAIxx_oo, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X38, &
         wf%n_o)
!
      call mem%alloc(X39, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X38, 1, &
         X39, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X38)
      call add_1423_to_1234(one, X39, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X39)
      call mem%alloc(X40, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         -four, &
         uAIxx_vo, &
         wf%n_v, &
         gAIxx_oo, &
         wf%n_o, &
         zero, &
         X40, &
         wf%n_v)
!
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
      call mem%alloc(X41, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(uxIxx_vvo, X41, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X42, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         gAIxx_vv, &
         wf%n_v, &
         X41, &
         wf%n_v*wf%n_o, &
         zero, &
         X42, &
         wf%n_v)
!
      call mem%dealloc(X41)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X42, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X42)
      call mem%alloc(X43, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         gAIxx_vv, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X43, &
         wf%n_v)
!
      call mem%alloc(X44, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X43, 1, &
         rAx_o, 1, &
         X44, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X43)
      call add_1342_to_1234(one, X44, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X44)
      call mem%alloc(X45, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X45, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X46, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         two, &
         X45, &
         wf%n_v**2, &
         gAIxx_oo, &
         wf%n_o, &
         zero, &
         X46, &
         wf%n_v**2)
!
      call mem%dealloc(X45)
      call mem%alloc(X47, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X46, X47, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X46)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X47, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X47)
      call mem%alloc(X48, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X48, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X49, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v, &
         -two, &
         gAIxx_vv, &
         wf%n_v, &
         X48, &
         wf%n_o**2, &
         zero, &
         X49, &
         wf%n_v)
!
      call mem%dealloc(X48)
      call mem%alloc(X50, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X49, 1, &
         rxI_v, 1, &
         X50, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X49)
      call add_1423_to_1234(one, X50, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X50)
      call mem%alloc(X51, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         two, &
         gAIxx_oo, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X51, &
         wf%n_o)
!
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X51, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X51)
      call mem%alloc(X52, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(uAxxx_ovo, X52, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X53, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         two, &
         X52, &
         wf%n_v*wf%n_o, &
         gAIxx_oo, &
         wf%n_o, &
         zero, &
         X53, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X52)
      call mem%alloc(X54, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X53, 1, &
         rxI_v, 1, &
         X54, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X53)
      call add_1423_to_1234(one, X54, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X54)
      call mem%alloc(X55, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         two, &
         gAxAx_ov, &
         wf%n_o, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X55, &
         wf%n_o)
!
      call mem%alloc(X56, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X55, 1, &
         X56, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X55)
      call add_1423_to_1234(one, X56, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X56)
      call mem%alloc(X57, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         -four, &
         txIxI_vv, &
         wf%n_v, &
         gAxAx_ov, &
         wf%n_o, &
         zero, &
         X57, &
         wf%n_v)
!
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X57, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X57)
      call mem%alloc(X58, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X58, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X59, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         X58, &
         wf%n_v*wf%n_o, &
         gAxAx_ov, &
         wf%n_o, &
         zero, &
         X59, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X58)
      call mem%alloc(X60, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X59, 1, &
         rxI_v, 1, &
         X60, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X59)
      call add_1423_to_1234(one, X60, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X60)
      call mem%alloc(X61, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         gAxAx_ov, &
         wf%n_o, &
         zero, &
         X61, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X62, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X61, 1, &
         rxI_v, 1, &
         X62, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X61)
      call add_1423_to_1234(one, X62, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X62)
      call mem%alloc(X63, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         gAxAx_ov, &
         wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X63, &
         wf%n_o)
!
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X63, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X63)
      call mem%alloc(X64, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         -two, &
         gAxxI_oo, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X64, &
         wf%n_o)
!
      call mem%alloc(X65, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X64, 1, &
         X65, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X64)
      call add_1423_to_1234(one, X65, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X65)
      call mem%alloc(X66, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         four, &
         tAIxx_vo, &
         wf%n_v, &
         gAxxI_oo, &
         wf%n_o, &
         zero, &
         X66, &
         wf%n_v)
!
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X66, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X66)
      call mem%alloc(X67, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         two, &
         gAxxI_vv, &
         wf%n_v, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X67, &
         wf%n_v)
!
      call mem%alloc(X68, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X67, 1, &
         r_vo, 1, &
         X68, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X67)
      call add_1432_to_1234(one, X68, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X68)
      call mem%alloc(X69, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         -four, &
         gAxxI_vv, &
         wf%n_v, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X69, &
         wf%n_v)
!
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X69, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X69)
      call mem%alloc(X70, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         -two, &
         gAxxI_oo, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X70, &
         wf%n_o)
!
      call mem%alloc(X71, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X70, 1, &
         X71, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X70)
      call add_1423_to_1234(one, X71, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X71)
      call mem%alloc(X72, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         four, &
         tAxxI_ov, &
         wf%n_o, &
         gAxxI_oo, &
         wf%n_o, &
         zero, &
         X72, &
         wf%n_v)
!
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X72, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X72)
      call mem%alloc(X73, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         two, &
         gAxxI_vv, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X73, &
         wf%n_v)
!
      call mem%alloc(X74, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X73, 1, &
         r_vo, 1, &
         X74, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X73)
      call add_1432_to_1234(one, X74, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X74)
      call mem%alloc(X75, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         -four, &
         gAxxI_vv, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X75, &
         wf%n_v)
!
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X75, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X75)
      call mem%alloc(X76, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         -two, &
         txIxx_vvo, &
         wf%n_v**2, &
         gAxxI_oo, &
         wf%n_o, &
         zero, &
         X76, &
         wf%n_v**2)
!
      call mem%alloc(X77, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X76, X77, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X76)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X77, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X77)
      call mem%alloc(X78, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(txIxx_vvo, X78, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X79, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         gAxxI_vv, &
         wf%n_v, &
         X78, &
         wf%n_v*wf%n_o, &
         zero, &
         X79, &
         wf%n_v)
!
      call mem%dealloc(X78)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X79, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X79)
      call mem%alloc(X80, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X80, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X81, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         -two, &
         X80, &
         wf%n_v**2, &
         gAxxI_oo, &
         wf%n_o, &
         zero, &
         X81, &
         wf%n_v**2)
!
      call mem%dealloc(X80)
      call mem%alloc(X82, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X81, X82, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X81)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X82, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X82)
      call mem%alloc(X83, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         gAxxI_vv, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X83, &
         wf%n_v)
!
      call mem%alloc(X84, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X83, X84, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X83)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X84, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X84)
      call mem%alloc(X85, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         gAxxI_vv, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X85, &
         wf%n_v)
!
      call mem%alloc(X86, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X85, 1, &
         rAx_o, 1, &
         X86, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X85)
      call add_1342_to_1234(one, X86, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X86)
      call mem%alloc(X87, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(tAxxx_ovo, X87, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X88, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         -two, &
         X87, &
         wf%n_v*wf%n_o, &
         gAxxI_oo, &
         wf%n_o, &
         zero, &
         X88, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X87)
      call mem%alloc(X89, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X88, 1, &
         rxI_v, 1, &
         X89, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X88)
      call add_1423_to_1234(one, X89, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X89)
      call mem%alloc(X90, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         -two, &
         tAxxx_ovo, &
         wf%n_o, &
         gAxxI_oo, &
         wf%n_o, &
         zero, &
         X90, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X91, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X90, 1, &
         rxI_v, 1, &
         X91, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X90)
      call add_1423_to_1234(one, X91, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X91)
      call mem%alloc(X92, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X92, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X93, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v, &
         two, &
         gAxxI_vv, &
         wf%n_v, &
         X92, &
         wf%n_o**2, &
         zero, &
         X93, &
         wf%n_v)
!
      call mem%dealloc(X92)
      call mem%alloc(X94, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X93, 1, &
         rxI_v, 1, &
         X94, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X93)
      call add_1243_to_1234(one, X94, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X94)
      call mem%alloc(X95, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X95, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X96, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v, &
         two, &
         gAxxI_vv, &
         wf%n_v, &
         X95, &
         wf%n_o**2, &
         zero, &
         X96, &
         wf%n_v)
!
      call mem%dealloc(X95)
      call mem%alloc(X97, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X96, 1, &
         rxI_v, 1, &
         X97, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X96)
      call add_1423_to_1234(one, X97, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X97)
      call mem%alloc(X98, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         two, &
         gAxxI_oo, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X98, &
         wf%n_o)
!
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X98, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X98)
      call mem%alloc(X99, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         gAxxx_ovv, &
         wf%n_v*wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X99, 1)
!
      call mem%alloc(X100, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X99, 1, &
         X100, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X99)
      call add_1423_to_1234(one, X100, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X100)
      call mem%alloc(X101, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -four, &
         gAxxx_vvo, &
         wf%n_v, &
         tAIxI_v, 1, &
         zero, &
         X101, 1)
!
      call mem%alloc(X102, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X101, 1, &
         r_vo, 1, &
         X102, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X101)
      call add_1432_to_1234(one, X102, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X102)
      call mem%alloc(X103, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X103, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X104, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two*rAI, &
         X103, &
         wf%n_v*wf%n_o, &
         gAxxx_ovv, &
         wf%n_v*wf%n_o, &
         zero, &
         X104, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X103)
      call add_1423_to_1234(rAI, X104, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X104)
      call mem%alloc(X105, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(gAxxx_ooo, X105, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X106, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         two*rAI, &
         uxIxx_vvo, &
         wf%n_v**2, &
         X105, &
         wf%n_o**2, &
         zero, &
         X106, &
         wf%n_v**2)
!
      call mem%dealloc(X105)
      call add_1324_to_1234(rAI, X106, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X106)
      call mem%alloc(X107, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two*rAI, &
         gAxxx_vvo, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X107, &
         wf%n_v*wf%n_o)
!
      call add_1432_to_1234(rAI, X107, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X107)
      call mem%alloc(X108, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         txIxI_vv, &
         wf%n_v, &
         gAxxx_ovv, &
         wf%n_v*wf%n_o, &
         zero, &
         X108, &
         wf%n_v)
!
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X108, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X108)
      call mem%alloc(X109, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         two, &
         gAxxx_vvo, &
         wf%n_v, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X109, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X110, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X109, 1, &
         rAx_o, 1, &
         X110, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X109)
      call add_1432_to_1234(one, X110, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X110)
      call mem%alloc(X111, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(gAxxx_ooo, X111, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X112, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         -two, &
         tAIxx_vo, &
         wf%n_v, &
         X111, &
         wf%n_o**2, &
         zero, &
         X112, &
         wf%n_v)
!
      call mem%dealloc(X111)
      call mem%alloc(X113, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X112, 1, &
         rxI_v, 1, &
         X113, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X112)
      call add_1243_to_1234(one, X113, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X113)
      call mem%alloc(X114, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         gAxxx_vvo, &
         wf%n_v, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X114, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X115, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X114, 1, &
         rxI_v, 1, &
         X115, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X114)
      call add_1423_to_1234(one, X115, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X115)
      call mem%alloc(X116, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(gAxxx_ooo, X116, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X117, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         -two, &
         tAxxI_ov, &
         wf%n_o, &
         X116, &
         wf%n_o**2, &
         zero, &
         X117, &
         wf%n_v)
!
      call mem%dealloc(X116)
      call mem%alloc(X118, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X117, 1, &
         rxI_v, 1, &
         X118, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X117)
      call add_1243_to_1234(one, X118, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X118)
      call mem%alloc(X119, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         gAxxx_vvo, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X119, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X120, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X119, 1, &
         rxI_v, 1, &
         X120, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X119)
      call add_1423_to_1234(one, X120, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X120)
      call mem%alloc(X121, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         gAxxx_ovv, &
         wf%n_v*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X121, &
         wf%n_v*wf%n_o)
!
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X121, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X121)
      call mem%alloc(X122, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(gAxxx_ooo, X122, wf%n_o, wf%n_o, wf%n_o)
      call mem%alloc(X123, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         two, &
         X122, &
         wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X123, &
         wf%n_o**2)
!
      call mem%dealloc(X122)
      call mem%alloc(X124, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X123, X124, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X123)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X124, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X124)
      call mem%alloc(X125, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         -two, &
         gxIxI_vo, &
         wf%n_v, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X125, &
         wf%n_v)
!
      call mem%alloc(X126, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X125, 1, &
         r_vo, 1, &
         X126, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X125)
      call add_1432_to_1234(one, X126, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X126)
      call mem%alloc(X127, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         four, &
         gxIxI_vo, &
         wf%n_v, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X127, &
         wf%n_v)
!
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X127, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X127)
      call mem%alloc(X128, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         -two, &
         gxIxI_vo, &
         wf%n_v, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X128, &
         wf%n_v)
!
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X128, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X128)
      call mem%alloc(X129, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X129, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X130, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         -two, &
         gxIxI_vo, &
         wf%n_v, &
         X129, &
         wf%n_o, &
         zero, &
         X130, &
         wf%n_v)
!
      call mem%dealloc(X129)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X130, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X130)
      call mem%alloc(X131, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         two, &
         gxIxI_vo, &
         wf%n_v, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X131, &
         wf%n_v)
!
      call mem%alloc(X132, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X131, 1, &
         rAx_o, 1, &
         X132, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X131)
      call add_1342_to_1234(one, X132, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X132)
      call mem%alloc(X133, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X133, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X134, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_v, &
         -two*rAI, &
         gxIxx_vvv, &
         wf%n_v**2, &
         X133, &
         wf%n_o**2, &
         zero, &
         X134, &
         wf%n_v**2)
!
      call mem%dealloc(X133)
      call add_1324_to_1234(rAI, X134, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X134)
      call mem%alloc(X135, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(gxIxx_voo, X135, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X136, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         two*rAI, &
         X135, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X136, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X135)
      call add_1423_to_1234(rAI, X136, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X136)
      call mem%alloc(X137, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         two, &
         gxIxx_vvv, &
         wf%n_v**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X137, &
         wf%n_v**2)
!
      call mem%alloc(X138, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X137, X138, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X137)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X138, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X138)
      call mem%alloc(X139, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         two, &
         gxIxx_vvv, &
         wf%n_v**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X139, &
         wf%n_v**2)
!
      call mem%alloc(X140, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X139, X140, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X139)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X140, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X140)
      call mem%alloc(X141, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         gxIxx_vvv, &
         wf%n_v**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X141, &
         wf%n_v**2)
!
      call mem%alloc(X142, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X141, 1, &
         rAx_o, 1, &
         X142, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X141)
      call add_1342_to_1234(one, X142, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X142)
      call mem%alloc(X143, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(gxIxx_voo, X143, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X144, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         two, &
         X143, &
         wf%n_v*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X144, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X143)
      call mem%alloc(X145, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X144, 1, &
         rAx_o, 1, &
         X145, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X144)
      call add_1432_to_1234(one, X145, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X145)
      call mem%alloc(X146, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(gxIxx_voo, X146, wf%n_v, wf%n_o, wf%n_o)
      call mem%alloc(X147, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         -two, &
         X146, &
         wf%n_v*wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X147, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X146)
      call mem%alloc(X148, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X147, 1, &
         rxI_v, 1, &
         X148, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X147)
      call add_1423_to_1234(one, X148, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X148)
      call mem%alloc(X149, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         two*rAI, &
         gxxxI_voo, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X149, &
         wf%n_v*wf%n_o)
!
      call add_1432_to_1234(rAI, X149, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X149)
      call mem%alloc(X150, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         -two, &
         gxxxI_voo, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X150, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X151, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X150, 1, &
         rAx_o, 1, &
         X151, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X150)
      call add_1432_to_1234(one, X151, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X151)
      call mem%alloc(X152, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         -two, &
         gxxxI_voo, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X152, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X153, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X152, 1, &
         rAx_o, 1, &
         X153, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X152)
      call add_1432_to_1234(one, X153, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X153)
      call mem%alloc(X154, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         -two, &
         gxxxI_voo, &
         wf%n_v*wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X154, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X155, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X154, 1, &
         rxI_v, 1, &
         X155, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X154)
      call add_1423_to_1234(one, X155, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X155)
      call mem%alloc(X156, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v, &
         -four, &
         wf%fock_ia, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X156, 1)
!
      call mem%alloc(X157, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X156, 1, &
         zero, &
         X157, 1)
!
      call mem%dealloc(X156)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X157, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X157)
      call mem%alloc(X158, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v, &
         two, &
         wf%fock_ia, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X158, 1)
!
      call mem%alloc(X159, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X158, 1, &
         zero, &
         X159, 1)
!
      call mem%dealloc(X158)
      call mem%alloc(X160, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X159, 1, &
         X160, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X159)
      call add_1432_to_1234(one, X160, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X160)
      call mem%alloc(X161, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v, &
         -four, &
         wf%fock_ia, &
         wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X161, 1)
!
      call mem%alloc(X162, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X161, 1, &
         zero, &
         X162, 1)
!
      call mem%dealloc(X161)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X162, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X162)
      call mem%alloc(X163, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v, &
         two, &
         wf%fock_ia, &
         wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X163, 1)
!
      call mem%alloc(X164, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X163, 1, &
         zero, &
         X164, 1)
!
      call mem%dealloc(X163)
      call mem%alloc(X165, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X164, 1, &
         X165, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X164)
      call add_1432_to_1234(one, X165, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X165)
      call mem%alloc(X166, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         four, &
         wf%fock_ia, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X166, &
         wf%n_o)
!
      call mem%alloc(X167, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X166, &
         wf%n_o, &
         zero, &
         X167, &
         wf%n_v)
!
      call mem%dealloc(X166)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X167, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X167)
      call mem%alloc(X168, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X168, &
         wf%n_o)
!
      call mem%alloc(X169, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X168, &
         wf%n_o, &
         tAIxx_vo, &
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
      call mem%alloc(X171, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -four, &
         wf%fock_ia, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X171, &
         wf%n_o)
!
      call mem%alloc(X172, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X171, &
         wf%n_o, &
         zero, &
         X172, &
         wf%n_v)
!
      call mem%dealloc(X171)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X172, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X172)
      call mem%alloc(X173, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         wf%fock_ia, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X173, &
         wf%n_o)
!
      call mem%alloc(X174, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X173, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X174, &
         wf%n_o)
!
      call mem%dealloc(X173)
      call mem%alloc(X175, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X174, 1, &
         X175, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X174)
      call add_1423_to_1234(one, X175, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X175)
      call mem%alloc(X176, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         four, &
         wf%fock_ia, &
         wf%n_o, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X176, &
         wf%n_o)
!
      call mem%alloc(X177, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X176, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X177, &
         wf%n_v)
!
      call mem%dealloc(X176)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X177, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X177)
      call mem%alloc(X178, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X178, &
         wf%n_o)
!
      call mem%alloc(X179, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X178, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X179, &
         wf%n_v)
!
      call mem%dealloc(X178)
      call mem%alloc(X180, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X179, 1, &
         X180, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X179)
      call add_1432_to_1234(one, X180, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X180)
      call mem%alloc(X181, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         four, &
         wf%fock_ia, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X181, &
         wf%n_o)
!
      call mem%alloc(X182, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X181, &
         wf%n_o, &
         zero, &
         X182, &
         wf%n_v)
!
      call mem%dealloc(X181)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X182, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X182)
      call mem%alloc(X183, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X183, &
         wf%n_o)
!
      call mem%alloc(X184, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X183, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X184, &
         wf%n_o)
!
      call mem%dealloc(X183)
      call mem%alloc(X185, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X184, 1, &
         X185, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X184)
      call add_1423_to_1234(one, X185, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X185)
      call mem%alloc(X186, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X186, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X187, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         wf%fock_ia, &
         wf%n_o, &
         X186, &
         wf%n_v*wf%n_o, &
         zero, &
         X187, &
         wf%n_o)
!
      call mem%dealloc(X186)
      call mem%alloc(X188, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         rAI, &
         X187, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X188, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X187)
      call add_1423_to_1234(rAI, X188, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X188)
      call mem%alloc(X189, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X189, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X190, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         two, &
         wf%fock_ia, &
         wf%n_o, &
         X189, &
         wf%n_o**2, &
         zero, &
         X190, &
         wf%n_o)
!
      call mem%dealloc(X189)
      call mem%alloc(X191, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         rAI, &
         uxIxx_vvo, &
         wf%n_v**2, &
         X190, &
         wf%n_o, &
         zero, &
         X191, &
         wf%n_v**2)
!
      call mem%dealloc(X190)
      call add_1324_to_1234(rAI, X191, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X191)
      call mem%alloc(X192, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         wf%fock_ia, &
         wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X192, &
         wf%n_o)
!
      call mem%alloc(X193, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         rAI, &
         tAxxx_ovo, &
         wf%n_o, &
         X192, &
         wf%n_o, &
         zero, &
         X193, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X192)
      call add_1432_to_1234(rAI, X193, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X193)
      call mem%alloc(X194, wf%n_o, wf%n_o)
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
         X194, &
         wf%n_o)
!
      call mem%alloc(X195, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X195, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X196, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         rAI, &
         X195, &
         wf%n_v**2*wf%n_o, &
         X194, &
         wf%n_o, &
         zero, &
         X196, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X194)
      call mem%dealloc(X195)
      call add_1342_to_1234(rAI, X196, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X196)
      call mem%alloc(X197, wf%n_v, wf%n_v)
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
         X197, &
         wf%n_v)
!
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         rAI, &
         X197, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X197)
      call mem%alloc(X198, wf%n_o, wf%n_v, wf%n_o)
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
         X198, &
         wf%n_o)
!
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         rAI, &
         uAxxx_ovo, &
         wf%n_o, &
         X198, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X198)
      call mem%alloc(X199, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v, &
         two, &
         wf%fock_ia, &
         wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X199, 1)
!
      call mem%alloc(X200, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v**2*wf%n_o, &
         X199, 1, &
         zero, &
         X200, 1)
!
      call mem%dealloc(X199)
      call mem%alloc(X201, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_312(X200, X201, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X200)
      call mem%alloc(X202, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X201, 1, &
         rAx_o, 1, &
         X202, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X201)
      call add_1342_to_1234(one, X202, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X202)
      call mem%alloc(X203, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X203, &
         wf%n_o)
!
      call mem%alloc(X204, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X203, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X204, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X203)
      call mem%alloc(X205, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X204, 1, &
         rAx_o, 1, &
         X205, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X204)
      call add_1432_to_1234(one, X205, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X205)
      call mem%alloc(X206, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X206, &
         wf%n_o)
!
      call mem%alloc(X207, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X207, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X208, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X207, &
         wf%n_v**2, &
         X206, &
         wf%n_o, &
         zero, &
         X208, &
         wf%n_v**2)
!
      call mem%dealloc(X206)
      call mem%dealloc(X207)
      call mem%alloc(X209, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X208, 1, &
         rAx_o, 1, &
         X209, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X208)
      call add_1342_to_1234(one, X209, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X209)
      call mem%alloc(X210, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         wf%fock_ia, &
         wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X210, &
         wf%n_o)
!
      call mem%alloc(X211, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X210, &
         wf%n_o, &
         zero, &
         X211, &
         wf%n_v)
!
      call mem%dealloc(X210)
      call mem%alloc(X212, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X211, 1, &
         rAx_o, 1, &
         X212, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X211)
      call add_1342_to_1234(one, X212, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X212)
      call mem%alloc(X213, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X213, &
         wf%n_o)
!
      call mem%alloc(X214, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X214, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X215, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X214, &
         wf%n_v**2, &
         X213, &
         wf%n_o, &
         zero, &
         X215, &
         wf%n_v**2)
!
      call mem%dealloc(X213)
      call mem%dealloc(X214)
      call mem%alloc(X216, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X215, 1, &
         rAx_o, 1, &
         X216, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X215)
      call add_1342_to_1234(one, X216, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X216)
      call mem%alloc(X217, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X217, &
         wf%n_o)
!
      call mem%alloc(X218, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X217, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X218, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X217)
      call mem%alloc(X219, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X218, 1, &
         rAx_o, 1, &
         X219, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X218)
      call add_1432_to_1234(one, X219, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X219)
      call mem%alloc(X220, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         wf%fock_ia, &
         wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X220, &
         wf%n_o)
!
      call mem%alloc(X221, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X220, &
         wf%n_o, &
         zero, &
         X221, &
         wf%n_v)
!
      call mem%dealloc(X220)
      call mem%alloc(X222, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X221, 1, &
         rAx_o, 1, &
         X222, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X221)
      call add_1342_to_1234(one, X222, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X222)
      call mem%alloc(X223, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X223, &
         wf%n_o)
!
      call mem%alloc(X224, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(tAxxx_ovo, X224, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X225, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X224, &
         wf%n_v*wf%n_o, &
         X223, &
         wf%n_o, &
         zero, &
         X225, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X223)
      call mem%dealloc(X224)
      call mem%alloc(X226, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X225, 1, &
         rAx_o, 1, &
         X226, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X225)
      call add_1432_to_1234(one, X226, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X226)
      call mem%alloc(X227, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X227, &
         wf%n_o)
!
      call mem%alloc(X228, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X227, &
         wf%n_o, &
         zero, &
         X228, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X227)
      call mem%alloc(X229, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X228, 1, &
         rAx_o, 1, &
         X229, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X228)
      call add_1432_to_1234(one, X229, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X229)
      call mem%alloc(X230, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         two, &
         wf%fock_ia, &
         wf%n_o, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X230, &
         wf%n_o)
!
      call mem%alloc(X231, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X230, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X231, &
         wf%n_v)
!
      call mem%dealloc(X230)
      call mem%alloc(X232, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X231, 1, &
         rAx_o, 1, &
         X232, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X231)
      call add_1342_to_1234(one, X232, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X232)
      call mem%alloc(X233, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         wf%fock_ia, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X233, &
         wf%n_o)
!
      call mem%alloc(X234, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X233, &
         wf%n_o, &
         zero, &
         X234, &
         wf%n_v**2)
!
      call mem%dealloc(X233)
      call mem%alloc(X235, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X234, 1, &
         rAx_o, 1, &
         X235, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X234)
      call add_1342_to_1234(one, X235, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X235)
      call mem%alloc(X236, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X236, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X237, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         wf%fock_ia, &
         wf%n_o, &
         X236, &
         wf%n_v*wf%n_o, &
         zero, &
         X237, &
         wf%n_o)
!
      call mem%dealloc(X236)
      call mem%alloc(X238, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X237, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X238, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X237)
      call mem%alloc(X239, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X238, 1, &
         rAx_o, 1, &
         X239, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X238)
      call add_1432_to_1234(one, X239, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X239)
      call mem%alloc(X240, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v, &
         two, &
         wf%fock_ia, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X240, 1)
!
      call mem%alloc(X241, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         u_aibj, &
         wf%n_v, &
         X240, 1, &
         zero, &
         X241, 1)
!
      call mem%dealloc(X240)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X241, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X241)
      call mem%alloc(X242, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X242, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X243, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         X242, &
         wf%n_o**2, &
         zero, &
         X243, &
         wf%n_o)
!
      call mem%dealloc(X242)
      call mem%alloc(X244, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X243, X244, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X243)
      call mem%alloc(X245, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X244, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X245, &
         wf%n_o**2)
!
      call mem%dealloc(X244)
      call mem%alloc(X246, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X245, X246, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X245)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X246, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X246)
      call mem%alloc(X247, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X247, &
         wf%n_o)
!
      call mem%alloc(X248, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X248, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X249, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X248, &
         wf%n_o, &
         X247, &
         wf%n_o, &
         zero, &
         X249, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X247)
      call mem%dealloc(X248)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X249, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X249)
      call mem%alloc(X250, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         wf%fock_ia, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X250, &
         wf%n_o)
!
      call mem%alloc(X251, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X250, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X251, &
         wf%n_o)
!
      call mem%dealloc(X250)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X251, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X251)
      call mem%alloc(X252, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X252, &
         wf%n_v)
!
      call mem%alloc(X253, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X253, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X254, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X253, &
         wf%n_v*wf%n_o, &
         X252, &
         wf%n_v, &
         zero, &
         X254, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X252)
      call mem%dealloc(X253)
      call mem%alloc(X255, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_213(X254, X255, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X254)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X255, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X255)
      call mem%alloc(X256, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X256, &
         wf%n_v)
!
      call mem%alloc(X257, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         X256, &
         wf%n_v, &
         zero, &
         X257, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X256)
      call mem%alloc(X258, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_213(X257, X258, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X257)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X258, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X258)
      call mem%alloc(X259, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         two, &
         wf%fock_ia, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X259, &
         wf%n_v)
!
      call mem%alloc(X260, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X259, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X260, &
         wf%n_o)
!
      call mem%dealloc(X259)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X260, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X260)
      call mem%alloc(X261, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X261, &
         wf%n_o)
!
      call mem%alloc(X262, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X262, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X263, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X262, &
         wf%n_o, &
         X261, &
         wf%n_o, &
         zero, &
         X263, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X261)
      call mem%dealloc(X262)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X263, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X263)
      call mem%alloc(X264, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X264, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X265, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         -two, &
         wf%fock_ia, &
         wf%n_o, &
         X264, &
         wf%n_o**2, &
         zero, &
         X265, &
         wf%n_o)
!
      call mem%dealloc(X264)
      call mem%alloc(X266, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X265, X266, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X265)
      call mem%alloc(X267, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X266, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X267, &
         wf%n_o**2)
!
      call mem%dealloc(X266)
      call mem%alloc(X268, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X267, X268, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X267)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X268, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X268)
      call mem%alloc(X269, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         wf%fock_ia, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X269, &
         wf%n_o)
!
      call mem%alloc(X270, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X269, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X270, &
         wf%n_o)
!
      call mem%dealloc(X269)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X270, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X270)
      call mem%alloc(X271, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         wf%fock_ia, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X271, &
         wf%n_o)
!
      call mem%alloc(X272, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X271, &
         wf%n_o, &
         zero, &
         X272, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X271)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X272, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X272)
      call mem%alloc(X273, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X273, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X274, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         two, &
         wf%fock_ia, &
         wf%n_o, &
         X273, &
         wf%n_o**2, &
         zero, &
         X274, &
         wf%n_o)
!
      call mem%dealloc(X273)
      call mem%alloc(X275, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X274, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X275, &
         wf%n_o**2)
!
      call mem%dealloc(X274)
      call mem%alloc(X276, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X275, X276, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X275)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X276, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X276)
      call mem%alloc(X277, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(L_vvov, X277, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X278, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -two, &
         r_vo, &
         wf%n_v, &
         X277, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X278, &
         wf%n_o)
!
      call mem%dealloc(X277)
      call mem%alloc(X279, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X278, &
         wf%n_v**2*wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X279, 1)
!
      call mem%dealloc(X278)
      call mem%alloc(X280, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_213(X279, X280, wf%n_o, wf%n_v, wf%n_v)
      call mem%dealloc(X279)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X280, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X280)
      call mem%alloc(X281, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(L_ooov, X281, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X282, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         two, &
         X281, &
         wf%n_v*wf%n_o**2, &
         tAIAx_o, 1, &
         zero, &
         X282, 1)
!
      call mem%dealloc(X281)
      call mem%alloc(X283, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X282, &
         wf%n_o**2, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X283, &
         wf%n_o**2)
!
      call mem%dealloc(X282)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X283, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X283)
      call mem%alloc(X284, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -two, &
         L_vvov, &
         wf%n_v**2*wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X284, 1)
!
      call mem%alloc(X285, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X284, X285, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X284)
      call mem%alloc(X286, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X285, &
         wf%n_v*wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X286, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X285)
      call mem%alloc(X287, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X286, X287, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X286)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X287, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X287)
      call mem%alloc(X288, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**3, &
         wf%n_v, &
         two, &
         L_ooov, &
         wf%n_o**3, &
         tAIxI_v, 1, &
         zero, &
         X288, 1)
!
      call mem%alloc(X289, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X288, &
         wf%n_o, &
         zero, &
         X289, &
         wf%n_v)
!
      call mem%dealloc(X288)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X289, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X289)
      call mem%alloc(X290, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(L_vvov, X290, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X291, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         r_vo, &
         wf%n_v, &
         X290, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X291, &
         wf%n_o)
!
      call mem%dealloc(X290)
      call mem%alloc(X292, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X291, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X292, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X291)
      call mem%alloc(X293, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_2143(X292, X293, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X292)
      call mem%alloc(X294, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X293, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X294, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X293)
      call add_1243_to_1234(one, X294, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X294)
      call mem%alloc(X295, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**3, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         L_ooov, &
         wf%n_o**3, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X295, &
         wf%n_o**3)
!
      call mem%alloc(X296, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1243(X295, X296, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X295)
      call mem%alloc(X297, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X296, &
         wf%n_o**3, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X297, &
         wf%n_o**3)
!
      call mem%dealloc(X296)
      call mem%alloc(X298, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(X297, X298, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X297)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X298, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X298)
      call mem%alloc(X299, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(L_vvov, X299, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X300, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -two, &
         r_vo, &
         wf%n_v, &
         X299, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X300, &
         wf%n_o)
!
      call mem%dealloc(X299)
      call mem%alloc(X301, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X300, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X301, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X300)
      call mem%alloc(X302, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_2143(X301, X302, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X301)
      call mem%alloc(X303, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X302, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X303, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X302)
      call add_1243_to_1234(one, X303, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X303)
      call mem%alloc(X304, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**3, &
         wf%n_v, &
         two, &
         tAIxx_vo, &
         wf%n_v, &
         L_ooov, &
         wf%n_o**3, &
         zero, &
         X304, &
         wf%n_o)
!
      call mem%alloc(X305, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X304, X305, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X304)
      call mem%alloc(X306, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**3, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X305, &
         wf%n_o**3, &
         zero, &
         X306, &
         wf%n_v)
!
      call mem%dealloc(X305)
      call mem%alloc(X307, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X306, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X307, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X306)
      call add_1423_to_1234(one, X307, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X307)
      call mem%alloc(X308, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(L_vvov, X308, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X309, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         r_vo, &
         wf%n_v, &
         X308, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X309, &
         wf%n_o)
!
      call mem%dealloc(X308)
      call mem%alloc(X310, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         tAxAx_oo, &
         wf%n_o, &
         X309, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X310, &
         wf%n_o)
!
      call mem%dealloc(X309)
      call mem%alloc(X311, wf%n_o, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X310, &
         wf%n_v*wf%n_o**2, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X311, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X310)
      call add_4213_to_1234(one, X311, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X311)
      call mem%alloc(X312, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_v, &
         -two, &
         L_ooov, &
         wf%n_o**3, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X312, &
         wf%n_o**3)
!
      call mem%alloc(X313, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(X312, X313, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X312)
      call mem%alloc(X314, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X313, &
         wf%n_v*wf%n_o**2, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X314, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X313)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X314, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X314)
      call mem%alloc(X315, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(L_vvov, X315, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X316, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         r_vo, &
         wf%n_v, &
         X315, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X316, &
         wf%n_o)
!
      call mem%dealloc(X315)
      call mem%alloc(X317, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X316, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X317, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X316)
      call mem%alloc(X318, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_2143(X317, X318, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X317)
      call mem%alloc(X319, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X318, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X319, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X318)
      call add_1243_to_1234(one, X319, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X319)
      call mem%alloc(X320, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**3, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         L_ooov, &
         wf%n_o**3, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X320, &
         wf%n_o**3)
!
      call mem%alloc(X321, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1243(X320, X321, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X320)
      call mem%alloc(X322, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X321, &
         wf%n_o**3, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X322, &
         wf%n_o**3)
!
      call mem%dealloc(X321)
      call mem%alloc(X323, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(X322, X323, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X322)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X323, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X323)
      call mem%alloc(X324, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X324, wf%n_v, wf%n_o)
      call mem%alloc(X325, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         two, &
         L_vvov, &
         wf%n_v**2, &
         X324, 1, &
         zero, &
         X325, 1)
!
      call mem%dealloc(X324)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         rAI, &
         X325, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X325)
      call mem%alloc(X326, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(L_vvov, X326, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X327, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         X326, &
         wf%n_v**2*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X327, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X326)
      call mem%alloc(X328, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(X327, X328, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X327)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         rAI, &
         X328, &
         wf%n_v*wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X328)
      call mem%alloc(X329, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X329, wf%n_v, wf%n_o)
      call mem%alloc(X330, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -two, &
         L_ooov, &
         wf%n_o**2, &
         X329, 1, &
         zero, &
         X330, 1)
!
      call mem%dealloc(X329)
      call mem%alloc(X331, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X331, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X332, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         rAI, &
         X331, &
         wf%n_v**2*wf%n_o, &
         X330, &
         wf%n_o, &
         zero, &
         X332, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X330)
      call mem%dealloc(X331)
      call add_1342_to_1234(rAI, X332, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X332)
      call mem%alloc(X333, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(L_ooov, X333, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X334, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X333, &
         wf%n_o**2, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X334, &
         wf%n_o**2)
!
      call mem%dealloc(X333)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         rAI, &
         uAIxx_vo, &
         wf%n_v, &
         X334, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X334)
      call mem%alloc(X335, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(L_vvov, X335, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X336, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -two, &
         X335, &
         wf%n_v**2*wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X336, 1)
!
      call mem%dealloc(X335)
      call mem%alloc(X337, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X336, &
         wf%n_v, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X337, &
         wf%n_v)
!
      call mem%dealloc(X336)
      call mem%alloc(X338, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X337, 1, &
         rAx_o, 1, &
         X338, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X337)
      call add_1342_to_1234(one, X338, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X338)
      call mem%alloc(X339, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -two, &
         L_vvov, &
         wf%n_v**2*wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X339, 1)
!
      call mem%alloc(X340, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X339, &
         wf%n_v**2, &
         rAx_o, 1, &
         zero, &
         X340, 1)
!
      call mem%dealloc(X339)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X340, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X340)
      call mem%alloc(X341, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**3, &
         wf%n_v, &
         two, &
         L_ooov, &
         wf%n_o**3, &
         tAIxI_v, 1, &
         zero, &
         X341, 1)
!
      call mem%alloc(X342, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X341, &
         wf%n_o**2, &
         rAx_o, 1, &
         zero, &
         X342, 1)
!
      call mem%dealloc(X341)
      call mem%alloc(X343, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X343, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X344, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X343, &
         wf%n_v**2*wf%n_o, &
         X342, &
         wf%n_o, &
         zero, &
         X344, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X342)
      call mem%dealloc(X343)
      call add_1342_to_1234(one, X344, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X344)
      call mem%alloc(X345, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -two, &
         L_vvov, &
         wf%n_v**2*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X345, 1)
!
      call mem%alloc(X346, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_o, &
         one, &
         X345, &
         wf%n_v**2, &
         tAIAx_o, 1, &
         zero, &
         X346, 1)
!
      call mem%dealloc(X345)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X346, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X346)
      call mem%alloc(X347, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         two, &
         L_ooov, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X347, 1)
!
      call mem%alloc(X348, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X347, X348, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X347)
      call mem%alloc(X349, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X348, &
         wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X349, &
         wf%n_o)
!
      call mem%dealloc(X348)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X349, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X349)
      call mem%alloc(X350, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**3, &
         wf%n_v, &
         two, &
         L_ooov, &
         wf%n_o**3, &
         rxI_v, 1, &
         zero, &
         X350, 1)
!
      call mem%alloc(X351, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X350, &
         wf%n_o**2, &
         tAIAx_o, 1, &
         zero, &
         X351, 1)
!
      call mem%dealloc(X350)
      call mem%alloc(X352, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X352, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X353, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X352, &
         wf%n_v**2*wf%n_o, &
         X351, &
         wf%n_o, &
         zero, &
         X353, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X351)
      call mem%dealloc(X352)
      call add_1342_to_1234(one, X353, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X353)
      call mem%alloc(X354, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         four, &
         LAxxx_vov, &
         wf%n_v, &
         tAIxI_v, 1, &
         zero, &
         X354, 1)
!
      call mem%alloc(X355, wf%n_v, wf%n_o)
      call sort_to_21(X354, X355, wf%n_o, wf%n_v)
      call mem%dealloc(X354)
      call mem%alloc(X356, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X355, 1, &
         zero, &
         X356, 1)
!
      call mem%dealloc(X355)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X356, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X356)
      call mem%alloc(X357, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         LAxxx_vov, &
         wf%n_v, &
         tAIxI_v, 1, &
         zero, &
         X357, 1)
!
      call mem%alloc(X358, wf%n_v, wf%n_o)
      call sort_to_21(X357, X358, wf%n_o, wf%n_v)
      call mem%dealloc(X357)
      call mem%alloc(X359, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X358, 1, &
         zero, &
         X359, 1)
!
      call mem%dealloc(X358)
      call mem%alloc(X360, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X359, 1, &
         X360, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X359)
      call add_1432_to_1234(one, X360, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X360)
      call mem%alloc(X361, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         LAxxx_vov, &
         wf%n_v, &
         tAIxI_v, 1, &
         zero, &
         X361, 1)
!
      call mem%alloc(X362, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X361, &
         wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X362, &
         wf%n_v)
!
      call mem%dealloc(X361)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X362, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X362)
      call mem%alloc(X363, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         LAxxx_vov, &
         wf%n_v, &
         tAIxI_v, 1, &
         zero, &
         X363, 1)
!
      call mem%alloc(X364, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X363, &
         wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X364, &
         wf%n_o)
!
      call mem%dealloc(X363)
      call mem%alloc(X365, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X365, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X366, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X365, &
         wf%n_v**2*wf%n_o, &
         X364, &
         wf%n_o, &
         zero, &
         X366, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X364)
      call mem%dealloc(X365)
      call add_1342_to_1234(one, X366, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X366)
      call mem%alloc(X367, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(LAxxx_vov, X367, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X368, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         X367, &
         wf%n_v, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X368, &
         wf%n_v)
!
      call mem%dealloc(X367)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         rAI, &
         X368, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X368)
      call mem%alloc(X369, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X369, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X370, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         LAxxx_vov, &
         wf%n_v*wf%n_o, &
         X369, &
         wf%n_v, &
         zero, &
         X370, &
         wf%n_v)
!
      call mem%dealloc(X369)
      call mem%alloc(X371, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1243(u_aibj, X371, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X372, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         rAI, &
         X371, &
         wf%n_v*wf%n_o**2, &
         X370, &
         wf%n_v, &
         zero, &
         X372, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X370)
      call mem%dealloc(X371)
      call add_1243_to_1234(rAI, X372, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X372)
      call mem%alloc(X373, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(LAxxx_vov, X373, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X374, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X373, &
         wf%n_v, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X374, &
         wf%n_v)
!
      call mem%dealloc(X373)
      call mem%alloc(X375, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X374, &
         wf%n_v, &
         zero, &
         X375, &
         wf%n_v)
!
      call mem%dealloc(X374)
      call mem%alloc(X376, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X375, 1, &
         rAx_o, 1, &
         X376, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X375)
      call add_1342_to_1234(one, X376, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X376)
      call mem%alloc(X377, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         tAIxx_vo, &
         wf%n_v, &
         LAxxx_vov, &
         wf%n_v, &
         zero, &
         X377, &
         wf%n_o)
!
      call mem%alloc(X378, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X377, X378, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X377)
      call mem%alloc(X379, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X378, &
         wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X379, &
         wf%n_o)
!
      call mem%dealloc(X378)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X379, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X379)
      call mem%alloc(X380, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         tAxxI_ov, &
         wf%n_o, &
         LAxxx_vov, &
         wf%n_v, &
         zero, &
         X380, &
         wf%n_o)
!
      call mem%alloc(X381, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X380, X381, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X380)
      call mem%alloc(X382, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X381, &
         wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X382, &
         wf%n_o)
!
      call mem%dealloc(X381)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X382, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X382)
      call mem%alloc(X383, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -four, &
         LxIxx_oov, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X383, 1)
!
      call mem%alloc(X384, wf%n_v, wf%n_o)
      call sort_to_21(X383, X384, wf%n_o, wf%n_v)
      call mem%dealloc(X383)
      call mem%alloc(X385, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X384, 1, &
         zero, &
         X385, 1)
!
      call mem%dealloc(X384)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X385, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X385)
      call mem%alloc(X386, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         LxIxx_oov, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X386, 1)
!
      call mem%alloc(X387, wf%n_v, wf%n_o)
      call sort_to_21(X386, X387, wf%n_o, wf%n_v)
      call mem%dealloc(X386)
      call mem%alloc(X388, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X387, 1, &
         zero, &
         X388, 1)
!
      call mem%dealloc(X387)
      call mem%alloc(X389, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X388, 1, &
         X389, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X388)
      call add_1432_to_1234(one, X389, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X389)
      call mem%alloc(X390, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         LxIxx_oov, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X390, 1)
!
      call mem%alloc(X391, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X390, &
         wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X391, &
         wf%n_v)
!
      call mem%dealloc(X390)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X391, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X391)
      call mem%alloc(X392, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         two, &
         LxIxx_oov, &
         wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X392, &
         wf%n_o**2)
!
      call mem%alloc(X393, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X392, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X393, 1)
!
      call mem%dealloc(X392)
      call mem%alloc(X394, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X394, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X395, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X394, &
         wf%n_v**2*wf%n_o, &
         X393, &
         wf%n_o, &
         zero, &
         X395, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X393)
      call mem%dealloc(X394)
      call add_1342_to_1234(one, X395, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X395)
      call mem%alloc(X396, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(LxIxx_oov, X396, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X397, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X396, &
         wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X397, &
         wf%n_o)
!
      call mem%dealloc(X396)
      call mem%alloc(X398, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         rAI, &
         tAxxx_ovo, &
         wf%n_o, &
         X397, &
         wf%n_o, &
         zero, &
         X398, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X397)
      call add_1432_to_1234(rAI, X398, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X398)
      call mem%alloc(X399, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(LxIxx_oov, X399, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X400, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X399, &
         wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X400, &
         wf%n_o)
!
      call mem%dealloc(X399)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         rAI, &
         uAxxx_ovo, &
         wf%n_o, &
         X400, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X400)
      call mem%alloc(X401, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(LxIxx_oov, X401, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X402, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X401, &
         wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X402, &
         wf%n_o)
!
      call mem%dealloc(X401)
      call mem%alloc(X403, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X402, &
         wf%n_o, &
         zero, &
         X403, &
         wf%n_v)
!
      call mem%dealloc(X402)
      call mem%alloc(X404, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X403, 1, &
         rAx_o, 1, &
         X404, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X403)
      call add_1342_to_1234(one, X404, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X404)
      call mem%alloc(X405, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(LxIxx_oov, X405, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X406, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X405, &
         wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X406, &
         wf%n_o)
!
      call mem%dealloc(X405)
      call mem%alloc(X407, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X406, &
         wf%n_o, &
         zero, &
         X407, &
         wf%n_v)
!
      call mem%dealloc(X406)
      call mem%alloc(X408, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X407, 1, &
         rAx_o, 1, &
         X408, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X407)
      call add_1342_to_1234(one, X408, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X408)
      call mem%alloc(X409, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(LxIxx_oov, X409, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X410, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X409, &
         wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X410, &
         wf%n_o)
!
      call mem%dealloc(X409)
      call mem%alloc(X411, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxAx_oo, &
         wf%n_o, &
         X410, &
         wf%n_o, &
         zero, &
         X411, &
         wf%n_o)
!
      call mem%dealloc(X410)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X411, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X411)
      call mem%alloc(X412, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         r_vo, &
         wf%n_v, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X412, &
         wf%n_o)
!
      call mem%alloc(X413, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X412, &
         wf%n_v**2*wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X413, 1)
!
      call mem%dealloc(X412)
      call mem%alloc(X414, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_213(X413, X414, wf%n_o, wf%n_v, wf%n_v)
      call mem%dealloc(X413)
      call mem%alloc(X415, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X415, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X416, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X414, &
         wf%n_v*wf%n_o, &
         X415, &
         wf%n_v*wf%n_o, &
         zero, &
         X416, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X414)
      call mem%dealloc(X415)
      call add_1432_to_1234(one, X416, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X416)
      call mem%alloc(X417, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X417, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X418, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         X417, &
         wf%n_o**2, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X418, &
         wf%n_o**2)
!
      call mem%dealloc(X417)
      call mem%alloc(X419, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X418, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X419, 1)
!
      call mem%dealloc(X418)
      call mem%alloc(X420, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X419, 1, &
         X420, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X419)
      call add_1423_to_1234(one, X420, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X420)
      call mem%alloc(X421, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X421, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X422, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         four, &
         X421, &
         wf%n_o**2, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X422, &
         wf%n_o**2)
!
      call mem%dealloc(X421)
      call mem%alloc(X423, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X422, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X423, 1)
!
      call mem%dealloc(X422)
      call mem%alloc(X424, wf%n_v, wf%n_o)
      call sort_to_21(X423, X424, wf%n_o, wf%n_v)
      call mem%dealloc(X423)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X424, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X424)
      call mem%alloc(X425, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         -two, &
         g_ooov, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X425, 1)
!
      call mem%alloc(X426, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X426, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X427, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X426, &
         wf%n_v*wf%n_o, &
         X425, &
         wf%n_o**2, &
         zero, &
         X427, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X425)
      call mem%dealloc(X426)
      call mem%alloc(X428, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X427, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X428, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X427)
      call add_1423_to_1234(one, X428, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X428)
      call mem%alloc(X429, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**3, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         g_ooov, &
         wf%n_o**3, &
         r_vo, &
         wf%n_v, &
         zero, &
         X429, &
         wf%n_o**3)
!
      call mem%alloc(X430, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_o**3, &
         one, &
         X429, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X430, 1)
!
      call mem%dealloc(X429)
      call mem%alloc(X431, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X430, X431, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X430)
      call mem%alloc(X432, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         uxIxx_vvo, &
         wf%n_v**2, &
         X431, &
         wf%n_o**2, &
         zero, &
         X432, &
         wf%n_v**2)
!
      call mem%dealloc(X431)
      call add_1324_to_1234(one, X432, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X432)
      call mem%alloc(X433, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X433, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X434, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X434, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X435, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v**2, &
         two, &
         X434, &
         wf%n_v**2, &
         X433, &
         wf%n_v*wf%n_o, &
         zero, &
         X435, &
         wf%n_o)
!
      call mem%dealloc(X433)
      call mem%dealloc(X434)
      call mem%alloc(X436, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X435, &
         wf%n_v*wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X436, 1)
!
      call mem%dealloc(X435)
      call mem%alloc(X437, wf%n_v, wf%n_o)
      call sort_to_21(X436, X437, wf%n_o, wf%n_v)
      call mem%dealloc(X436)
      call mem%alloc(X438, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X437, 1, &
         r_vo, 1, &
         X438, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X437)
      call add_1432_to_1234(one, X438, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X438)
      call mem%alloc(X439, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X439, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X440, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X440, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X441, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v**2, &
         -four, &
         X440, &
         wf%n_v**2, &
         X439, &
         wf%n_v*wf%n_o, &
         zero, &
         X441, &
         wf%n_o)
!
      call mem%dealloc(X439)
      call mem%dealloc(X440)
      call mem%alloc(X442, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X441, &
         wf%n_v*wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X442, 1)
!
      call mem%dealloc(X441)
      call mem%alloc(X443, wf%n_v, wf%n_o)
      call sort_to_21(X442, X443, wf%n_o, wf%n_v)
      call mem%dealloc(X442)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X443, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X443)
      call mem%alloc(X444, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X444, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X445, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         r_vo, &
         wf%n_v, &
         X444, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X445, &
         wf%n_o)
!
      call mem%dealloc(X444)
      call mem%alloc(X446, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X445, &
         wf%n_v**2*wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X446, 1)
!
      call mem%dealloc(X445)
      call mem%alloc(X447, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_213(X446, X447, wf%n_o, wf%n_v, wf%n_v)
      call mem%dealloc(X446)
      call mem%alloc(X448, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X447, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X448, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X447)
      call add_1432_to_1234(one, X448, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X448)
      call mem%alloc(X449, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X449, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X450, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -two, &
         uxxxI_vov, &
         wf%n_v, &
         X449, &
         wf%n_v*wf%n_o, &
         zero, &
         X450, &
         wf%n_v)
!
      call mem%dealloc(X449)
      call mem%alloc(X451, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X450, &
         wf%n_v*wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X451, 1)
!
      call mem%dealloc(X450)
      call mem%alloc(X452, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X451, 1, &
         X452, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X451)
      call add_1432_to_1234(one, X452, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X452)
      call mem%alloc(X453, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X453, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X454, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         four, &
         uxxxI_vov, &
         wf%n_v, &
         X453, &
         wf%n_v*wf%n_o, &
         zero, &
         X454, &
         wf%n_v)
!
      call mem%dealloc(X453)
      call mem%alloc(X455, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X454, &
         wf%n_v*wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X455, 1)
!
      call mem%dealloc(X454)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X455, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X455)
      call mem%alloc(X456, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X456, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X457, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         -two, &
         X456, &
         wf%n_v*wf%n_o**2, &
         tAIAx_o, 1, &
         zero, &
         X457, 1)
!
      call mem%dealloc(X456)
      call mem%alloc(X458, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_213(X457, X458, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X457)
      call mem%alloc(X459, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X458, &
         wf%n_o**2, &
         zero, &
         X459, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X458)
      call mem%alloc(X460, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X459, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X460, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X459)
      call add_1423_to_1234(one, X460, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X460)
      call mem%alloc(X461, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X461, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X462, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         -two, &
         X461, &
         wf%n_v*wf%n_o**2, &
         tAIAx_o, 1, &
         zero, &
         X462, 1)
!
      call mem%dealloc(X461)
      call mem%alloc(X463, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X462, &
         wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X463, &
         wf%n_o**2)
!
      call mem%dealloc(X462)
      call mem%alloc(X464, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X464, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X465, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X464, &
         wf%n_v**2, &
         X463, &
         wf%n_o, &
         zero, &
         X465, &
         wf%n_v**2)
!
      call mem%dealloc(X463)
      call mem%dealloc(X464)
      call add_1324_to_1234(one, X465, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X465)
      call mem%alloc(X466, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X466, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X467, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         two, &
         X466, &
         wf%n_o, &
         g_vvov, &
         wf%n_v**2, &
         zero, &
         X467, &
         wf%n_o)
!
      call mem%dealloc(X466)
      call mem%alloc(X468, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X467, &
         wf%n_v*wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X468, 1)
!
      call mem%dealloc(X467)
      call mem%alloc(X469, wf%n_v, wf%n_o)
      call sort_to_21(X468, X469, wf%n_o, wf%n_v)
      call mem%dealloc(X468)
      call mem%alloc(X470, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X469, 1, &
         r_vo, 1, &
         X470, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X469)
      call add_1432_to_1234(one, X470, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X470)
      call mem%alloc(X471, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X471, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X472, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         two, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X471, &
         wf%n_v**2, &
         zero, &
         X472, &
         wf%n_o)
!
      call mem%dealloc(X471)
      call mem%alloc(X473, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X472, &
         wf%n_v*wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X473, 1)
!
      call mem%dealloc(X472)
      call mem%alloc(X474, wf%n_v, wf%n_o)
      call sort_to_21(X473, X474, wf%n_o, wf%n_v)
      call mem%dealloc(X473)
      call mem%alloc(X475, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X474, 1, &
         r_vo, 1, &
         X475, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X474)
      call add_1432_to_1234(one, X475, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X475)
      call mem%alloc(X476, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X476, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X477, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -four, &
         X476, &
         wf%n_o, &
         g_vvov, &
         wf%n_v**2, &
         zero, &
         X477, &
         wf%n_o)
!
      call mem%dealloc(X476)
      call mem%alloc(X478, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X477, &
         wf%n_v*wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X478, 1)
!
      call mem%dealloc(X477)
      call mem%alloc(X479, wf%n_v, wf%n_o)
      call sort_to_21(X478, X479, wf%n_o, wf%n_v)
      call mem%dealloc(X478)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X479, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X479)
      call mem%alloc(X480, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X480, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X481, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -four, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X480, &
         wf%n_v**2, &
         zero, &
         X481, &
         wf%n_o)
!
      call mem%dealloc(X480)
      call mem%alloc(X482, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X481, &
         wf%n_v*wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X482, 1)
!
      call mem%dealloc(X481)
      call mem%alloc(X483, wf%n_v, wf%n_o)
      call sort_to_21(X482, X483, wf%n_o, wf%n_v)
      call mem%dealloc(X482)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X483, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X483)
      call mem%alloc(X484, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_vvov, X484, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X485, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         X484, &
         wf%n_v**2*wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X485, 1)
!
      call mem%dealloc(X484)
      call mem%alloc(X486, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X486, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X487, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X485, &
         wf%n_v*wf%n_o, &
         X486, &
         wf%n_o**2, &
         zero, &
         X487, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X485)
      call mem%dealloc(X486)
      call mem%alloc(X488, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X487, X488, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X487)
      call mem%alloc(X489, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X488, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X489, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X488)
      call add_1243_to_1234(one, X489, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X489)
      call mem%alloc(X490, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X490, 1)
!
      call mem%alloc(X491, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X490, X491, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X490)
      call mem%alloc(X492, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X492, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X493, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X491, &
         wf%n_v*wf%n_o, &
         X492, &
         wf%n_o**2, &
         zero, &
         X493, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X491)
      call mem%dealloc(X492)
      call mem%alloc(X494, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X493, X494, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X493)
      call mem%alloc(X495, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X494, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X495, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X494)
      call add_1423_to_1234(one, X495, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X495)
      call mem%alloc(X496, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X496, 1)
!
      call mem%alloc(X497, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X496, X497, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X496)
      call mem%alloc(X498, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X497, &
         wf%n_v*wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X498, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X497)
      call mem%alloc(X499, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X498, X499, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X498)
      call mem%alloc(X500, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X499, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X500, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X499)
      call add_1432_to_1234(one, X500, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X500)
      call mem%alloc(X501, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_vvov, X501, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X502, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         X501, &
         wf%n_v**2*wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X502, 1)
!
      call mem%dealloc(X501)
      call mem%alloc(X503, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X502, &
         wf%n_v*wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X503, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X502)
      call mem%alloc(X504, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X503, X504, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X503)
      call mem%alloc(X505, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X504, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X505, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X504)
      call add_1423_to_1234(one, X505, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X505)
      call mem%alloc(X506, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**3, &
         wf%n_v, &
         -two, &
         g_ooov, &
         wf%n_o**3, &
         tAIxI_v, 1, &
         zero, &
         X506, 1)
!
      call mem%alloc(X507, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_312(X506, X507, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X506)
      call mem%alloc(X508, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X508, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X509, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X507, &
         wf%n_o**2, &
         X508, &
         wf%n_o**2, &
         zero, &
         X509, &
         wf%n_o)
!
      call mem%dealloc(X507)
      call mem%dealloc(X508)
      call mem%alloc(X510, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X509, 1, &
         X510, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X509)
      call add_1423_to_1234(one, X510, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X510)
      call mem%alloc(X511, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**3, &
         wf%n_v, &
         four, &
         g_ooov, &
         wf%n_o**3, &
         tAIxI_v, 1, &
         zero, &
         X511, 1)
!
      call mem%alloc(X512, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_312(X511, X512, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X511)
      call mem%alloc(X513, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X513, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X514, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X513, &
         wf%n_o**2, &
         X512, &
         wf%n_o**2, &
         zero, &
         X514, &
         wf%n_v)
!
      call mem%dealloc(X512)
      call mem%dealloc(X513)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X514, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X514)
      call mem%alloc(X515, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**3, &
         wf%n_v, &
         -two, &
         g_ooov, &
         wf%n_o**3, &
         tAIxI_v, 1, &
         zero, &
         X515, 1)
!
      call mem%alloc(X516, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X515, &
         wf%n_o, &
         zero, &
         X516, &
         wf%n_v)
!
      call mem%dealloc(X515)
      call mem%alloc(X517, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X516, &
         wf%n_v*wf%n_o, &
         zero, &
         X517, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X516)
      call add_1432_to_1234(one, X517, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X517)
      call mem%alloc(X518, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**3, &
         wf%n_v, &
         -two, &
         g_ooov, &
         wf%n_o**3, &
         tAIxI_v, 1, &
         zero, &
         X518, 1)
!
      call mem%alloc(X519, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X518, &
         wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X519, &
         wf%n_o**2)
!
      call mem%dealloc(X518)
      call mem%alloc(X520, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(uAxxx_ovo, X520, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X521, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X520, &
         wf%n_v*wf%n_o, &
         X519, &
         wf%n_o, &
         zero, &
         X521, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X519)
      call mem%dealloc(X520)
      call add_1423_to_1234(one, X521, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X521)
      call mem%alloc(X522, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X522, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X523, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -two, &
         X522, &
         wf%n_v**2, &
         tAIxx_vo, 1, &
         zero, &
         X523, 1)
!
      call mem%dealloc(X522)
      call mem%alloc(X524, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X523, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X524, &
         wf%n_v)
!
      call mem%dealloc(X523)
      call mem%alloc(X525, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X524, 1, &
         r_vo, 1, &
         X525, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X524)
      call add_1432_to_1234(one, X525, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X525)
      call mem%alloc(X526, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X526, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X527, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         four, &
         X526, &
         wf%n_v**2, &
         tAIxx_vo, 1, &
         zero, &
         X527, 1)
!
      call mem%dealloc(X526)
      call mem%alloc(X528, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X527, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X528, &
         wf%n_v)
!
      call mem%dealloc(X527)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X528, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X528)
      call mem%alloc(X529, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X529, &
         wf%n_v**2*wf%n_o)
!
      call mem%alloc(X530, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1342(X529, X530, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X529)
      call mem%alloc(X531, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X530, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X531, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X530)
      call mem%alloc(X532, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X531, X532, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X531)
      call mem%alloc(X533, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X532, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X533, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X532)
      call add_1243_to_1234(one, X533, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X533)
      call mem%alloc(X534, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X534, &
         wf%n_v**2*wf%n_o)
!
      call mem%alloc(X535, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1342(X534, X535, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X534)
      call mem%alloc(X536, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X535, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X536, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X535)
      call mem%alloc(X537, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X536, X537, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X536)
      call mem%alloc(X538, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X537, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X538, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X537)
      call add_1243_to_1234(one, X538, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X538)
      call mem%alloc(X539, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X539, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X540, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         two, &
         X539, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X540, 1)
!
      call mem%dealloc(X539)
      call mem%alloc(X541, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X540, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X541, &
         wf%n_o)
!
      call mem%dealloc(X540)
      call mem%alloc(X542, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X541, 1, &
         X542, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X541)
      call add_1423_to_1234(one, X542, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X542)
      call mem%alloc(X543, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X543, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X544, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -four, &
         X543, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X544, 1)
!
      call mem%dealloc(X543)
      call mem%alloc(X545, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X544, &
         wf%n_o, &
         zero, &
         X545, &
         wf%n_v)
!
      call mem%dealloc(X544)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X545, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X545)
      call mem%alloc(X546, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**3, &
         wf%n_o, &
         wf%n_v, &
         two, &
         g_ooov, &
         wf%n_o**3, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X546, &
         wf%n_o**3)
!
      call mem%alloc(X547, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X546, &
         wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X547, &
         wf%n_o**3)
!
      call mem%dealloc(X546)
      call mem%alloc(X548, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1432(X547, X548, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X547)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X548, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X548)
      call mem%alloc(X549, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**3, &
         wf%n_o, &
         wf%n_v, &
         two, &
         g_ooov, &
         wf%n_o**3, &
         r_vo, &
         wf%n_v, &
         zero, &
         X549, &
         wf%n_o**3)
!
      call mem%alloc(X550, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X549, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X550, &
         wf%n_o**3)
!
      call mem%dealloc(X549)
      call mem%alloc(X551, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1432(X550, X551, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X550)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X551, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X551)
      call mem%alloc(X552, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X552, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X553, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         two, &
         X552, &
         wf%n_v**2, &
         uAIxx_vo, 1, &
         zero, &
         X553, 1)
!
      call mem%dealloc(X552)
      call mem%alloc(X554, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X553, &
         wf%n_v, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X554, &
         wf%n_v)
!
      call mem%dealloc(X553)
      call mem%alloc(X555, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X554, 1, &
         r_vo, 1, &
         X555, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X554)
      call add_1432_to_1234(one, X555, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X555)
      call mem%alloc(X556, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X556, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X557, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -four, &
         X556, &
         wf%n_v**2, &
         uAIxx_vo, 1, &
         zero, &
         X557, 1)
!
      call mem%dealloc(X556)
      call mem%alloc(X558, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X557, &
         wf%n_v, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X558, &
         wf%n_v)
!
      call mem%dealloc(X557)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X558, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X558)
      call mem%alloc(X559, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X559, &
         wf%n_v**2*wf%n_o)
!
      call mem%alloc(X560, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1342(X559, X560, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X559)
      call mem%alloc(X561, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X560, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X561, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X560)
      call mem%alloc(X562, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X561, X562, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X561)
      call mem%alloc(X563, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X562, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X563, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X562)
      call add_1243_to_1234(one, X563, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X563)
      call mem%alloc(X564, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_vvov, X564, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X565, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         r_vo, &
         wf%n_v, &
         X564, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X565, &
         wf%n_o)
!
      call mem%dealloc(X564)
      call mem%alloc(X566, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X565, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X566, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X565)
      call mem%alloc(X567, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_2143(X566, X567, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X566)
      call mem%alloc(X568, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X567, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X568, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X567)
      call add_1423_to_1234(one, X568, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X568)
      call mem%alloc(X569, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X569, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X570, wf%n_o, wf%n_v)
      call sort_to_21(tAIxx_vo, X570, wf%n_v, wf%n_o)
      call mem%alloc(X571, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -two, &
         X569, &
         wf%n_v*wf%n_o, &
         X570, 1, &
         zero, &
         X571, 1)
!
      call mem%dealloc(X569)
      call mem%dealloc(X570)
      call mem%alloc(X572, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X571, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X572, &
         wf%n_o)
!
      call mem%dealloc(X571)
      call mem%alloc(X573, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X572, 1, &
         X573, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X572)
      call add_1423_to_1234(one, X573, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X573)
      call mem%alloc(X574, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X574, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X575, wf%n_o, wf%n_v)
      call sort_to_21(tAIxx_vo, X575, wf%n_v, wf%n_o)
      call mem%alloc(X576, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         four, &
         X574, &
         wf%n_v*wf%n_o, &
         X575, 1, &
         zero, &
         X576, 1)
!
      call mem%dealloc(X574)
      call mem%dealloc(X575)
      call mem%alloc(X577, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X576, &
         wf%n_o, &
         zero, &
         X577, &
         wf%n_v)
!
      call mem%dealloc(X576)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X577, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X577)
      call mem%alloc(X578, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**3, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         g_ooov, &
         wf%n_o**3, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X578, &
         wf%n_o**3)
!
      call mem%alloc(X579, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X578, &
         wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X579, &
         wf%n_o**3)
!
      call mem%dealloc(X578)
      call mem%alloc(X580, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1432(X579, X580, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X579)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X580, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X580)
      call mem%alloc(X581, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**3, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         g_ooov, &
         wf%n_o**3, &
         r_vo, &
         wf%n_v, &
         zero, &
         X581, &
         wf%n_o**3)
!
      call mem%alloc(X582, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X581, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X582, &
         wf%n_o**3)
!
      call mem%dealloc(X581)
      call mem%alloc(X583, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1432(X582, X583, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X582)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X583, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X583)
      call mem%alloc(X584, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X584, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X585, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v**2, &
         -two, &
         X584, &
         wf%n_v*wf%n_o, &
         txIxI_vv, 1, &
         zero, &
         X585, 1)
!
      call mem%dealloc(X584)
      call mem%alloc(X586, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X585, &
         wf%n_v, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X586, &
         wf%n_v)
!
      call mem%dealloc(X585)
      call mem%alloc(X587, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X586, 1, &
         r_vo, 1, &
         X587, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X586)
      call add_1432_to_1234(one, X587, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X587)
      call mem%alloc(X588, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X588, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X589, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v**2, &
         four, &
         X588, &
         wf%n_v*wf%n_o, &
         txIxI_vv, 1, &
         zero, &
         X589, 1)
!
      call mem%dealloc(X588)
      call mem%alloc(X590, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X589, &
         wf%n_v, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X590, &
         wf%n_v)
!
      call mem%dealloc(X589)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X590, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X590)
      call mem%alloc(X591, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_vvov, X591, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X592, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -two, &
         r_vo, &
         wf%n_v, &
         X591, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X592, &
         wf%n_o)
!
      call mem%dealloc(X591)
      call mem%alloc(X593, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X592, &
         wf%n_v*wf%n_o**2, &
         zero, &
         X593, &
         wf%n_v)
!
      call mem%dealloc(X592)
      call mem%alloc(X594, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X593, &
         wf%n_v**2*wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X594, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X593)
      call add_3412_to_1234(one, X594, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X594)
      call mem%alloc(X595, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X595, &
         wf%n_v**2*wf%n_o)
!
      call mem%alloc(X596, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1342(X595, X596, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X595)
      call mem%alloc(X597, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X596, &
         wf%n_v*wf%n_o**2, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X597, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X596)
      call mem%alloc(X598, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1342(X597, X598, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X597)
      call mem%alloc(X599, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X598, &
         wf%n_v**2*wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X599, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X598)
      call add_1432_to_1234(one, X599, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X599)
      call mem%alloc(X600, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1324(g_ooov, X600, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X601, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         two, &
         X600, &
         wf%n_o**2, &
         tAxAx_oo, 1, &
         zero, &
         X601, 1)
!
      call mem%dealloc(X600)
      call mem%alloc(X602, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X601, &
         wf%n_o, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X602, &
         wf%n_o)
!
      call mem%dealloc(X601)
      call mem%alloc(X603, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X602, 1, &
         X603, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X602)
      call add_1423_to_1234(one, X603, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X603)
      call mem%alloc(X604, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1324(g_ooov, X604, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X605, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -four, &
         X604, &
         wf%n_o**2, &
         tAxAx_oo, 1, &
         zero, &
         X605, 1)
!
      call mem%dealloc(X604)
      call mem%alloc(X606, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X605, &
         wf%n_o, &
         zero, &
         X606, &
         wf%n_v)
!
      call mem%dealloc(X605)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X606, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X606)
      call mem%alloc(X607, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**3, &
         wf%n_v, &
         two, &
         txIxI_vv, &
         wf%n_v, &
         g_ooov, &
         wf%n_o**3, &
         zero, &
         X607, &
         wf%n_v)
!
      call mem%alloc(X608, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X607, &
         wf%n_v*wf%n_o**2, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X608, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X607)
      call mem%alloc(X609, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X608, X609, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X608)
      call mem%alloc(X610, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X609, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X610, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X609)
      call add_1243_to_1234(one, X610, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X610)
      call mem%alloc(X611, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_v, &
         two, &
         g_ooov, &
         wf%n_o**3, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X611, &
         wf%n_o**3)
!
      call mem%alloc(X612, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1342(X611, X612, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X611)
      call mem%alloc(X613, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X612, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X613, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X612)
      call mem%alloc(X614, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X613, &
         wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X614, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X613)
      call add_1243_to_1234(one, X614, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X614)
      call mem%alloc(X615, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X615, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X616, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -two, &
         X615, &
         wf%n_v**2, &
         tAxxI_ov, 1, &
         zero, &
         X616, 1)
!
      call mem%dealloc(X615)
      call mem%alloc(X617, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X616, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X617, &
         wf%n_v)
!
      call mem%dealloc(X616)
      call mem%alloc(X618, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X617, 1, &
         r_vo, 1, &
         X618, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X617)
      call add_1432_to_1234(one, X618, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X618)
      call mem%alloc(X619, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X619, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X620, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         four, &
         X619, &
         wf%n_v**2, &
         tAxxI_ov, 1, &
         zero, &
         X620, 1)
!
      call mem%dealloc(X619)
      call mem%alloc(X621, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X620, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X621, &
         wf%n_v)
!
      call mem%dealloc(X620)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X621, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X621)
      call mem%alloc(X622, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_vvov, X622, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X623, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -two, &
         tAxxI_ov, &
         wf%n_o, &
         X622, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X623, &
         wf%n_o)
!
      call mem%dealloc(X622)
      call mem%alloc(X624, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X623, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X624, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X623)
      call mem%alloc(X625, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_2143(X624, X625, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X624)
      call mem%alloc(X626, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X625, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X626, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X625)
      call add_1423_to_1234(one, X626, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X626)
      call mem%alloc(X627, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X627, &
         wf%n_v**2*wf%n_o)
!
      call mem%alloc(X628, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1342(X627, X628, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X627)
      call mem%alloc(X629, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X628, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X629, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X628)
      call mem%alloc(X630, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X629, X630, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X629)
      call mem%alloc(X631, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X630, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X631, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X630)
      call add_1243_to_1234(one, X631, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X631)
      call mem%alloc(X632, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X632, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X633, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         two, &
         X632, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X633, 1)
!
      call mem%dealloc(X632)
      call mem%alloc(X634, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X633, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X634, &
         wf%n_o)
!
      call mem%dealloc(X633)
      call mem%alloc(X635, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X634, 1, &
         X635, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X634)
      call add_1423_to_1234(one, X635, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X635)
      call mem%alloc(X636, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X636, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X637, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -four, &
         X636, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X637, 1)
!
      call mem%dealloc(X636)
      call mem%alloc(X638, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X637, &
         wf%n_o, &
         zero, &
         X638, &
         wf%n_v)
!
      call mem%dealloc(X637)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X638, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X638)
      call mem%alloc(X639, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**3, &
         wf%n_v, &
         two, &
         tAxxI_ov, &
         wf%n_o, &
         g_ooov, &
         wf%n_o**3, &
         zero, &
         X639, &
         wf%n_o)
!
      call mem%alloc(X640, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1324(X639, X640, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X639)
      call mem%alloc(X641, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o**3, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X640, &
         wf%n_o**3, &
         zero, &
         X641, &
         wf%n_v)
!
      call mem%dealloc(X640)
      call mem%alloc(X642, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X641, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X642, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X641)
      call add_1423_to_1234(one, X642, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X642)
      call mem%alloc(X643, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**3, &
         wf%n_v, &
         two, &
         r_vo, &
         wf%n_v, &
         g_ooov, &
         wf%n_o**3, &
         zero, &
         X643, &
         wf%n_o)
!
      call mem%alloc(X644, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1324(X643, X644, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X643)
      call mem%alloc(X645, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o**3, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X644, &
         wf%n_o**3, &
         zero, &
         X645, &
         wf%n_v)
!
      call mem%dealloc(X644)
      call mem%alloc(X646, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X645, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X646, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X645)
      call add_1423_to_1234(one, X646, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X646)
      call mem%alloc(X647, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X647, wf%n_v, wf%n_o)
      call mem%alloc(X648, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -two, &
         g_vvov, &
         wf%n_v**2, &
         X647, 1, &
         zero, &
         X648, 1)
!
      call mem%dealloc(X647)
      call mem%alloc(X649, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X648, &
         wf%n_v, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X649, &
         wf%n_v)
!
      call mem%dealloc(X648)
      call mem%alloc(X650, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X649, 1, &
         r_vo, 1, &
         X650, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X649)
      call add_1432_to_1234(one, X650, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X650)
      call mem%alloc(X651, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X651, wf%n_v, wf%n_o)
      call mem%alloc(X652, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         four, &
         g_vvov, &
         wf%n_v**2, &
         X651, 1, &
         zero, &
         X652, 1)
!
      call mem%dealloc(X651)
      call mem%alloc(X653, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X652, &
         wf%n_v, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X653, &
         wf%n_v)
!
      call mem%dealloc(X652)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X653, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X653)
      call mem%alloc(X654, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X654, &
         wf%n_v**2*wf%n_o)
!
      call mem%alloc(X655, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1342(X654, X655, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X654)
      call mem%alloc(X656, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X655, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X656, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X655)
      call mem%alloc(X657, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X656, X657, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X656)
      call mem%alloc(X658, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X657, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X658, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X657)
      call add_1423_to_1234(one, X658, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X658)
      call mem%alloc(X659, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_vvov, X659, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X660, wf%n_o, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -two, &
         uAIxx_vo, &
         wf%n_v, &
         X659, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X660, &
         wf%n_o)
!
      call mem%dealloc(X659)
      call mem%alloc(X661, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X660, &
         wf%n_v*wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X661, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X660)
      call mem%alloc(X662, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_2143(X661, X662, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X661)
      call mem%alloc(X663, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X662, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X663, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X662)
      call add_1243_to_1234(one, X663, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X663)
      call mem%alloc(X664, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X664, wf%n_v, wf%n_o)
      call mem%alloc(X665, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         two, &
         g_ooov, &
         wf%n_o**2, &
         X664, 1, &
         zero, &
         X665, 1)
!
      call mem%dealloc(X664)
      call mem%alloc(X666, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X665, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X666, &
         wf%n_o)
!
      call mem%dealloc(X665)
      call mem%alloc(X667, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X666, 1, &
         X667, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X666)
      call add_1423_to_1234(one, X667, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X667)
      call mem%alloc(X668, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X668, wf%n_v, wf%n_o)
      call mem%alloc(X669, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -four, &
         g_ooov, &
         wf%n_o**2, &
         X668, 1, &
         zero, &
         X669, 1)
!
      call mem%dealloc(X668)
      call mem%alloc(X670, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X669, &
         wf%n_o, &
         zero, &
         X670, &
         wf%n_v)
!
      call mem%dealloc(X669)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X670, 1, &
         r_vo, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X670)
      call mem%alloc(X671, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**3, &
         wf%n_o, &
         wf%n_v, &
         two, &
         g_ooov, &
         wf%n_o**3, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X671, &
         wf%n_o**3)
!
      call mem%alloc(X672, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1243(X671, X672, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X671)
      call mem%alloc(X673, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X672, &
         wf%n_o**3, &
         r_vo, &
         wf%n_v, &
         zero, &
         X673, &
         wf%n_o**3)
!
      call mem%dealloc(X672)
      call mem%alloc(X674, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(X673, X674, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X673)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X674, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X674)
      call mem%alloc(X675, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**3, &
         wf%n_o, &
         wf%n_v, &
         two, &
         g_ooov, &
         wf%n_o**3, &
         r_vo, &
         wf%n_v, &
         zero, &
         X675, &
         wf%n_o**3)
!
      call mem%alloc(X676, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1243(X675, X676, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X675)
      call mem%alloc(X677, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X676, &
         wf%n_o**3, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X677, &
         wf%n_o**3)
!
      call mem%dealloc(X676)
      call mem%alloc(X678, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(X677, X678, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X677)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X678, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X678)
      call mem%alloc(X679, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X679, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X680, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         X679, &
         wf%n_v**2, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X680, &
         wf%n_v**2)
!
      call mem%dealloc(X679)
      call mem%alloc(X681, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_132(X680, X681, wf%n_v, wf%n_v, wf%n_v)
      call mem%dealloc(X680)
      call mem%alloc(X682, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X682, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X683, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_v, &
         rAI, &
         X681, &
         wf%n_v**2, &
         X682, &
         wf%n_o**2, &
         zero, &
         X683, &
         wf%n_v**2)
!
      call mem%dealloc(X681)
      call mem%dealloc(X682)
      call add_1342_to_1234(rAI, X683, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X683)
      call mem%alloc(X684, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X684, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X685, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X684, &
         wf%n_v**2, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X685, &
         wf%n_v**2)
!
      call mem%dealloc(X684)
      call mem%alloc(X686, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X685, X686, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X685)
      call mem%alloc(X687, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X687, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X688, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         rAI, &
         X686, &
         wf%n_v*wf%n_o, &
         X687, &
         wf%n_v*wf%n_o, &
         zero, &
         X688, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X686)
      call mem%dealloc(X687)
      call add_1432_to_1234(rAI, X688, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X688)
      call mem%alloc(X689, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X689, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X690, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         two, &
         X689, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X690, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X689)
      call mem%alloc(X691, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X690, X691, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X690)
      call mem%alloc(X692, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         rAI, &
         X691, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X692, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X691)
      call add_1423_to_1234(rAI, X692, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X692)
      call mem%alloc(X693, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X693, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X694, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -two, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X693, &
         wf%n_v*wf%n_o, &
         zero, &
         X694, &
         wf%n_o)
!
      call mem%dealloc(X693)
      call mem%alloc(X695, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         rAI, &
         txIxx_vvo, &
         wf%n_v**2, &
         X694, &
         wf%n_o**2, &
         zero, &
         X695, &
         wf%n_v**2)
!
      call mem%dealloc(X694)
      call add_1342_to_1234(rAI, X695, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X695)
      call mem%alloc(X696, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1324(g_ooov, X696, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X697, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X697, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X698, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -two, &
         X697, &
         wf%n_o**2, &
         X696, &
         wf%n_o**2, &
         zero, &
         X698, &
         wf%n_v)
!
      call mem%dealloc(X696)
      call mem%dealloc(X697)
      call mem%alloc(X699, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X699, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X700, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         rAI, &
         X699, &
         wf%n_v*wf%n_o, &
         X698, &
         wf%n_v*wf%n_o, &
         zero, &
         X700, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X698)
      call mem%dealloc(X699)
      call add_1432_to_1234(rAI, X700, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X700)
      call mem%alloc(X701, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_4123(g_ooov, X701, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X702, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -two, &
         txIxx_vvo, &
         wf%n_v, &
         X701, &
         wf%n_v*wf%n_o, &
         zero, &
         X702, &
         wf%n_v)
!
      call mem%dealloc(X701)
      call mem%alloc(X703, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(uAxxx_ovo, X703, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X704, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         rAI, &
         X703, &
         wf%n_v*wf%n_o, &
         X702, &
         wf%n_v*wf%n_o, &
         zero, &
         X704, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X702)
      call mem%dealloc(X703)
      call add_1432_to_1234(rAI, X704, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X704)
      call mem%alloc(X705, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X705, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X706, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X705, &
         wf%n_v**2, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X706, &
         wf%n_v**2)
!
      call mem%dealloc(X705)
      call mem%alloc(X707, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X706, X707, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X706)
      call mem%alloc(X708, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         rAI, &
         X707, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X708, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X707)
      call add_1432_to_1234(rAI, X708, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X708)
      call mem%alloc(X709, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X709, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X710, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         X709, &
         wf%n_v**2, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X710, &
         wf%n_v**2)
!
      call mem%dealloc(X709)
      call mem%alloc(X711, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_132(X710, X711, wf%n_v, wf%n_v, wf%n_v)
      call mem%dealloc(X710)
      call mem%alloc(X712, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X712, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X713, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_v, &
         rAI, &
         X711, &
         wf%n_v**2, &
         X712, &
         wf%n_o**2, &
         zero, &
         X713, &
         wf%n_v**2)
!
      call mem%dealloc(X711)
      call mem%dealloc(X712)
      call add_1324_to_1234(rAI, X713, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X713)
      call mem%alloc(X714, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X714, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X715, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X715, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X716, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         two, &
         X714, &
         wf%n_v*wf%n_o, &
         X715, &
         wf%n_v**2, &
         zero, &
         X716, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X714)
      call mem%dealloc(X715)
      call mem%alloc(X717, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X716, X717, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X716)
      call mem%alloc(X718, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         rAI, &
         X717, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X718, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X717)
      call add_1432_to_1234(rAI, X718, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X718)
      call mem%alloc(X719, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1324(g_ooov, X719, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X720, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(uAxxx_ovo, X720, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X721, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -two, &
         X720, &
         wf%n_o**2, &
         X719, &
         wf%n_o**2, &
         zero, &
         X721, &
         wf%n_v)
!
      call mem%dealloc(X719)
      call mem%dealloc(X720)
      call mem%alloc(X722, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         rAI, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         X721, &
         wf%n_v*wf%n_o, &
         zero, &
         X722, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X721)
      call add_1432_to_1234(rAI, X722, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X722)
      call mem%alloc(X723, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X723, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X724, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X724, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X725, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -two, &
         X724, &
         wf%n_o, &
         X723, &
         wf%n_v*wf%n_o, &
         zero, &
         X725, &
         wf%n_o)
!
      call mem%dealloc(X723)
      call mem%dealloc(X724)
      call mem%alloc(X726, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X726, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X727, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         rAI, &
         X726, &
         wf%n_v**2, &
         X725, &
         wf%n_o**2, &
         zero, &
         X727, &
         wf%n_v**2)
!
      call mem%dealloc(X725)
      call mem%dealloc(X726)
      call add_1342_to_1234(rAI, X727, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X727)
      call mem%alloc(X728, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X728, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X729, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -two, &
         txxxI_vov, &
         wf%n_v, &
         X728, &
         wf%n_v*wf%n_o, &
         zero, &
         X729, &
         wf%n_v)
!
      call mem%dealloc(X728)
      call mem%alloc(X730, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         rAI, &
         uAxxx_ovo, &
         wf%n_o, &
         X729, &
         wf%n_v*wf%n_o, &
         zero, &
         X730, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X729)
      call add_1432_to_1234(rAI, X730, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X730)
      call mem%alloc(X731, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_vvov, X731, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X732, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         X731, &
         wf%n_v**2*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X732, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X731)
      call mem%alloc(X733, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(X732, X733, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X732)
      call mem%alloc(X734, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         rAI, &
         X733, &
         wf%n_v*wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X734, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X733)
      call add_1432_to_1234(rAI, X734, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X734)
      call mem%alloc(X735, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X735, &
         wf%n_v**2*wf%n_o)
!
      call mem%alloc(X736, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1432(X735, X736, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X735)
      call mem%alloc(X737, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(u_aibj, X737, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X738, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         rAI, &
         X736, &
         wf%n_v*wf%n_o, &
         X737, &
         wf%n_v*wf%n_o, &
         zero, &
         X738, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X736)
      call mem%dealloc(X737)
      call add_1432_to_1234(rAI, X738, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X738)
      call mem%alloc(X739, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X739, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X740, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X740, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X741, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v**2, &
         -two, &
         X739, &
         wf%n_v*wf%n_o, &
         X740, &
         wf%n_v**2, &
         zero, &
         X741, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X739)
      call mem%dealloc(X740)
      call mem%alloc(X742, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X741, X742, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X741)
      call mem%alloc(X743, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         rAI, &
         X742, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X743, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X742)
      call add_1243_to_1234(rAI, X743, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X743)
      call mem%alloc(X744, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X744, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X745, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         two, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X744, &
         wf%n_o**2, &
         zero, &
         X745, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X744)
      call mem%alloc(X746, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1243(X745, X746, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X745)
      call mem%alloc(X747, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         rAI, &
         X746, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X747, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X746)
      call add_1423_to_1234(rAI, X747, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X747)
      call mem%alloc(X748, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**3, &
         wf%n_o, &
         wf%n_v, &
         two, &
         g_ooov, &
         wf%n_o**3, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X748, &
         wf%n_o**3)
!
      call mem%alloc(X749, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1324(X748, X749, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X748)
      call mem%alloc(X750, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X750, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X751, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o**2, &
         rAI, &
         X750, &
         wf%n_v**2, &
         X749, &
         wf%n_o**2, &
         zero, &
         X751, &
         wf%n_v**2)
!
      call mem%dealloc(X749)
      call mem%dealloc(X750)
      call add_1324_to_1234(rAI, X751, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X751)
      call mem%alloc(X752, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X752, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X753, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(u_aibj, X753, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X754, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         two, &
         X753, &
         wf%n_v*wf%n_o, &
         X752, &
         wf%n_v*wf%n_o, &
         zero, &
         X754, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X752)
      call mem%dealloc(X753)
      call mem%alloc(X755, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         rAI, &
         X754, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X755, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X754)
      call add_1423_to_1234(rAI, X755, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X755)
      call mem%alloc(X756, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X756, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X757, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         g_vvov, &
         wf%n_v**2, &
         X756, &
         wf%n_v, &
         zero, &
         X757, &
         wf%n_v**2)
!
      call mem%dealloc(X756)
      call mem%alloc(X758, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_132(X757, X758, wf%n_v, wf%n_v, wf%n_v)
      call mem%dealloc(X757)
      call mem%alloc(X759, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X759, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X760, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_v, &
         rAI, &
         X758, &
         wf%n_v**2, &
         X759, &
         wf%n_o**2, &
         zero, &
         X760, &
         wf%n_v**2)
!
      call mem%dealloc(X758)
      call mem%dealloc(X759)
      call add_1342_to_1234(rAI, X760, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X760)
      call mem%alloc(X761, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X761, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X762, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         g_vvov, &
         wf%n_v**2, &
         X761, &
         wf%n_o, &
         zero, &
         X762, &
         wf%n_v**2)
!
      call mem%dealloc(X761)
      call mem%alloc(X763, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X762, X763, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X762)
      call mem%alloc(X764, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X764, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X765, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         rAI, &
         X763, &
         wf%n_v*wf%n_o, &
         X764, &
         wf%n_v*wf%n_o, &
         zero, &
         X765, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X763)
      call mem%dealloc(X764)
      call add_1432_to_1234(rAI, X765, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X765)
      call mem%alloc(X766, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X766, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X767, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         X766, &
         wf%n_o**2, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X767, &
         wf%n_o**2)
!
      call mem%dealloc(X766)
      call mem%alloc(X768, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(uAxxx_ovo, X768, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X769, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         rAI, &
         X768, &
         wf%n_v*wf%n_o, &
         X767, &
         wf%n_o, &
         zero, &
         X769, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X767)
      call mem%dealloc(X768)
      call add_1423_to_1234(rAI, X769, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X769)
      call mem%alloc(X770, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X770, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X771, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         two, &
         uxIxx_vvo, &
         wf%n_v, &
         X770, &
         wf%n_o**2, &
         zero, &
         X771, &
         wf%n_v)
!
      call mem%dealloc(X770)
      call mem%alloc(X772, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X771, X772, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X771)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         rAI, &
         X772, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X772)
      call mem%alloc(X773, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X773, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X774, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         g_vvov, &
         wf%n_v**2, &
         X773, &
         wf%n_o, &
         zero, &
         X774, &
         wf%n_v**2)
!
      call mem%dealloc(X773)
      call mem%alloc(X775, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X774, X775, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X774)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         rAI, &
         X775, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X775)
      call mem%alloc(X776, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X776, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X777, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X777, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X778, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         -two, &
         X776, &
         wf%n_v*wf%n_o, &
         X777, &
         wf%n_v**2, &
         zero, &
         X778, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X776)
      call mem%dealloc(X777)
      call mem%alloc(X779, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X778, X779, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X778)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         rAI, &
         X779, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X779)
      call mem%alloc(X780, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X780, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X781, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X780, &
         wf%n_v**2, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X781, &
         wf%n_v**2)
!
      call mem%dealloc(X780)
      call mem%alloc(X782, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X781, X782, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X781)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         rAI, &
         X782, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X782)
      call mem%alloc(X783, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X783, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X784, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         g_ooov, &
         wf%n_o**2, &
         X783, &
         wf%n_o, &
         zero, &
         X784, &
         wf%n_o**2)
!
      call mem%dealloc(X783)
      call mem%alloc(X785, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X785, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X786, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         rAI, &
         X785, &
         wf%n_v**2, &
         X784, &
         wf%n_o, &
         zero, &
         X786, &
         wf%n_v**2)
!
      call mem%dealloc(X784)
      call mem%dealloc(X785)
      call add_1324_to_1234(rAI, X786, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X786)
      call mem%alloc(X787, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1324(g_ooov, X787, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X788, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(uAxxx_ovo, X788, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X789, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         two, &
         X788, &
         wf%n_o**2, &
         X787, &
         wf%n_o**2, &
         zero, &
         X789, &
         wf%n_v)
!
      call mem%dealloc(X787)
      call mem%dealloc(X788)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         rAI, &
         X789, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X789)
      call mem%alloc(X790, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X790, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X791, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         two, &
         uxxxI_vov, &
         wf%n_v, &
         X790, &
         wf%n_v*wf%n_o, &
         zero, &
         X791, &
         wf%n_v)
!
      call mem%dealloc(X790)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         rAI, &
         X791, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X791)
      call mem%alloc(X792, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X792, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X793, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         X792, &
         wf%n_v**2*wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X793, 1)
!
      call mem%dealloc(X792)
      call mem%alloc(X794, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X793, &
         wf%n_v, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X794, &
         wf%n_v)
!
      call mem%dealloc(X793)
      call mem%alloc(X795, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X794, X795, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X794)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X795, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X795)
      call mem%alloc(X796, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         tAIxI_v, 1, &
         zero, &
         X796, 1)
!
      call mem%alloc(X797, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(u_aibj, X797, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X798, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X796, &
         wf%n_v, &
         X797, &
         wf%n_v*wf%n_o, &
         zero, &
         X798, &
         wf%n_v)
!
      call mem%dealloc(X796)
      call mem%dealloc(X797)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X798, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X798)
      call mem%alloc(X799, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**3, &
         wf%n_v, &
         -two, &
         g_ooov, &
         wf%n_o**3, &
         tAIxI_v, 1, &
         zero, &
         X799, 1)
!
      call mem%alloc(X800, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X799, X800, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X799)
      call mem%alloc(X801, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X801, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X802, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X801, &
         wf%n_v**2, &
         X800, &
         wf%n_o**2, &
         zero, &
         X802, &
         wf%n_v**2)
!
      call mem%dealloc(X800)
      call mem%dealloc(X801)
      call mem%alloc(X803, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X802, X803, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X802)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X803, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X803)
      call mem%alloc(X804, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X804, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X805, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -two, &
         txIxx_vvo, &
         wf%n_v, &
         X804, &
         wf%n_v**2, &
         zero, &
         X805, &
         wf%n_v)
!
      call mem%dealloc(X804)
      call mem%alloc(X806, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X805, &
         wf%n_v**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X806, &
         wf%n_v**2)
!
      call mem%dealloc(X805)
      call mem%alloc(X807, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_213(X806, X807, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X806)
      call mem%alloc(X808, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X807, 1, &
         rAx_o, 1, &
         X808, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X807)
      call add_1342_to_1234(one, X808, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X808)
      call mem%alloc(X809, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X809, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X810, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -two, &
         tAIxx_vo, &
         wf%n_v, &
         X809, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X810, &
         wf%n_o)
!
      call mem%dealloc(X809)
      call mem%alloc(X811, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X810, &
         wf%n_v**2*wf%n_o, &
         rAx_o, 1, &
         zero, &
         X811, 1)
!
      call mem%dealloc(X810)
      call mem%alloc(X812, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_213(X811, X812, wf%n_o, wf%n_v, wf%n_v)
      call mem%dealloc(X811)
      call mem%alloc(X813, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X813, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X814, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X812, &
         wf%n_v*wf%n_o, &
         X813, &
         wf%n_v*wf%n_o, &
         zero, &
         X814, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X812)
      call mem%dealloc(X813)
      call add_1432_to_1234(one, X814, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X814)
      call mem%alloc(X815, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X815, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X816, wf%n_o, wf%n_v)
      call sort_to_21(tAIxx_vo, X816, wf%n_v, wf%n_o)
      call mem%alloc(X817, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         two, &
         X815, &
         wf%n_v*wf%n_o, &
         X816, 1, &
         zero, &
         X817, 1)
!
      call mem%dealloc(X815)
      call mem%dealloc(X816)
      call mem%alloc(X818, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X817, &
         wf%n_o, &
         zero, &
         X818, &
         wf%n_v**2)
!
      call mem%dealloc(X817)
      call mem%alloc(X819, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X818, X819, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X818)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X819, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X819)
      call mem%alloc(X820, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X820, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X821, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         two, &
         X820, &
         wf%n_v*wf%n_o**2, &
         rAx_o, 1, &
         zero, &
         X821, 1)
!
      call mem%dealloc(X820)
      call mem%alloc(X822, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_213(X821, X822, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X821)
      call mem%alloc(X823, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X823, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X824, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X823, &
         wf%n_v*wf%n_o, &
         X822, &
         wf%n_o**2, &
         zero, &
         X824, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X822)
      call mem%dealloc(X823)
      call mem%alloc(X825, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X824, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X825, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X824)
      call add_1423_to_1234(one, X825, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X825)
      call mem%alloc(X826, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X826, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X827, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X827, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X828, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         -two, &
         X826, &
         wf%n_v*wf%n_o, &
         X827, &
         wf%n_v**2, &
         zero, &
         X828, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X826)
      call mem%dealloc(X827)
      call mem%alloc(X829, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X828, X829, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X828)
      call mem%alloc(X830, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X829, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X830, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X829)
      call mem%alloc(X831, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X830, 1, &
         rAx_o, 1, &
         X831, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X830)
      call add_1432_to_1234(one, X831, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X831)
      call mem%alloc(X832, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X832, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X833, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -two, &
         X832, &
         wf%n_v**2, &
         tAIxx_vo, 1, &
         zero, &
         X833, 1)
!
      call mem%dealloc(X832)
      call mem%alloc(X834, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X833, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X834, &
         wf%n_v)
!
      call mem%dealloc(X833)
      call mem%alloc(X835, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X834, X835, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X834)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X835, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X835)
      call mem%alloc(X836, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X836, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X837, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -two, &
         txxxI_vov, &
         wf%n_v, &
         X836, &
         wf%n_v**2, &
         zero, &
         X837, &
         wf%n_v)
!
      call mem%dealloc(X836)
      call mem%alloc(X838, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X837, &
         wf%n_v**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X838, &
         wf%n_v**2)
!
      call mem%dealloc(X837)
      call mem%alloc(X839, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_231(X838, X839, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X838)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X839, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X839)
      call mem%alloc(X840, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1432(g_ooov, X840, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X841, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         X840, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X841, &
         wf%n_o**2)
!
      call mem%dealloc(X840)
      call mem%alloc(X842, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X841, &
         wf%n_o, &
         zero, &
         X842, &
         wf%n_v)
!
      call mem%dealloc(X841)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X842, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X842)
      call mem%alloc(X843, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         two, &
         g_ooov, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X843, 1)
!
      call mem%alloc(X844, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         X843, &
         wf%n_o**2, &
         zero, &
         X844, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X843)
      call mem%alloc(X845, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X844, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X845, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X844)
      call add_1423_to_1234(one, X845, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X845)
      call mem%alloc(X846, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**3, &
         wf%n_o, &
         wf%n_v, &
         two, &
         g_ooov, &
         wf%n_o**3, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X846, &
         wf%n_o**3)
!
      call mem%alloc(X847, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_o**3, &
         one, &
         X846, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X847, 1)
!
      call mem%dealloc(X846)
      call mem%alloc(X848, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X847, X848, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X847)
      call mem%alloc(X849, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X849, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X850, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X849, &
         wf%n_v**2, &
         X848, &
         wf%n_o**2, &
         zero, &
         X850, &
         wf%n_v**2)
!
      call mem%dealloc(X848)
      call mem%dealloc(X849)
      call add_1324_to_1234(one, X850, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X850)
      call mem%alloc(X851, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X851, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X852, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         two, &
         X851, &
         wf%n_v, &
         g_vvov, &
         wf%n_v**2, &
         zero, &
         X852, &
         wf%n_v)
!
      call mem%dealloc(X851)
      call mem%alloc(X853, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X852, &
         wf%n_v**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X853, &
         wf%n_v**2)
!
      call mem%dealloc(X852)
      call mem%alloc(X854, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_213(X853, X854, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X853)
      call mem%alloc(X855, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X854, 1, &
         rAx_o, 1, &
         X855, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X854)
      call add_1342_to_1234(one, X855, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X855)
      call mem%alloc(X856, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         tAIxx_vo, &
         wf%n_v, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X856, &
         wf%n_o)
!
      call mem%alloc(X857, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X856, &
         wf%n_v**2*wf%n_o, &
         rAx_o, 1, &
         zero, &
         X857, 1)
!
      call mem%dealloc(X856)
      call mem%alloc(X858, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_213(X857, X858, wf%n_o, wf%n_v, wf%n_v)
      call mem%dealloc(X857)
      call mem%alloc(X859, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X859, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X860, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X858, &
         wf%n_v*wf%n_o, &
         X859, &
         wf%n_v*wf%n_o, &
         zero, &
         X860, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X858)
      call mem%dealloc(X859)
      call add_1432_to_1234(one, X860, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X860)
      call mem%alloc(X861, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X861, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X862, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -two, &
         uxIxx_vvo, &
         wf%n_v, &
         X861, &
         wf%n_o**2, &
         zero, &
         X862, &
         wf%n_v)
!
      call mem%dealloc(X861)
      call mem%alloc(X863, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X862, X863, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X862)
      call mem%alloc(X864, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X863, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X864, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X863)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X864, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X864)
      call mem%alloc(X865, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X865, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X866, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         two, &
         X865, &
         wf%n_v**2, &
         tAIxx_vo, 1, &
         zero, &
         X866, 1)
!
      call mem%dealloc(X865)
      call mem%alloc(X867, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X866, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X867, &
         wf%n_v)
!
      call mem%dealloc(X866)
      call mem%alloc(X868, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X867, 1, &
         rAx_o, 1, &
         X868, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X867)
      call add_1342_to_1234(one, X868, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X868)
      call mem%alloc(X869, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X869, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X870, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X870, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X871, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         two, &
         X869, &
         wf%n_v*wf%n_o, &
         X870, &
         wf%n_v**2, &
         zero, &
         X871, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X869)
      call mem%dealloc(X870)
      call mem%alloc(X872, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X871, X872, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X871)
      call mem%alloc(X873, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X872, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X873, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X872)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X873, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X873)
      call mem%alloc(X874, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         tAIxx_vo, &
         wf%n_v, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X874, &
         wf%n_o)
!
      call mem%alloc(X875, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X874, &
         wf%n_v**2*wf%n_o, &
         rAx_o, 1, &
         zero, &
         X875, 1)
!
      call mem%dealloc(X874)
      call mem%alloc(X876, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_213(X875, X876, wf%n_o, wf%n_v, wf%n_v)
      call mem%dealloc(X875)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X876, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X876)
      call mem%alloc(X877, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X877, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X878, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -two, &
         uxxxI_vov, &
         wf%n_v, &
         X877, &
         wf%n_v*wf%n_o, &
         zero, &
         X878, &
         wf%n_v)
!
      call mem%dealloc(X877)
      call mem%alloc(X879, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X878, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X879, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X878)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X879, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X879)
      call mem%alloc(X880, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         -two, &
         g_ooov, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X880, 1)
!
      call mem%alloc(X881, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_213(X880, X881, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X880)
      call mem%alloc(X882, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X881, &
         wf%n_o**2, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X882, &
         wf%n_o**2)
!
      call mem%dealloc(X881)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X882, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X882)
      call mem%alloc(X883, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**3, &
         wf%n_v, &
         -two, &
         tAIxx_vo, &
         wf%n_v, &
         g_ooov, &
         wf%n_o**3, &
         zero, &
         X883, &
         wf%n_o)
!
      call mem%alloc(X884, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**3, &
         wf%n_o, &
         one, &
         X883, &
         wf%n_o**3, &
         rAx_o, 1, &
         zero, &
         X884, 1)
!
      call mem%dealloc(X883)
      call mem%alloc(X885, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X884, X885, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X884)
      call mem%alloc(X886, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X886, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X887, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X886, &
         wf%n_v**2, &
         X885, &
         wf%n_o**2, &
         zero, &
         X887, &
         wf%n_v**2)
!
      call mem%dealloc(X885)
      call mem%dealloc(X886)
      call add_1342_to_1234(one, X887, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X887)
      call mem%alloc(X888, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X888, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X889, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -two, &
         txIxx_vvo, &
         wf%n_v, &
         X888, &
         wf%n_v**2, &
         zero, &
         X889, &
         wf%n_v)
!
      call mem%dealloc(X888)
      call mem%alloc(X890, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X889, &
         wf%n_v**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X890, &
         wf%n_v**2)
!
      call mem%dealloc(X889)
      call mem%alloc(X891, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_213(X890, X891, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X890)
      call mem%alloc(X892, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X891, 1, &
         rAx_o, 1, &
         X892, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X891)
      call add_1342_to_1234(one, X892, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X892)
      call mem%alloc(X893, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X893, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X894, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -two, &
         tAxxI_ov, &
         wf%n_o, &
         X893, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X894, &
         wf%n_o)
!
      call mem%dealloc(X893)
      call mem%alloc(X895, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X894, &
         wf%n_v**2*wf%n_o, &
         rAx_o, 1, &
         zero, &
         X895, 1)
!
      call mem%dealloc(X894)
      call mem%alloc(X896, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_213(X895, X896, wf%n_o, wf%n_v, wf%n_v)
      call mem%dealloc(X895)
      call mem%alloc(X897, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X897, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X898, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X896, &
         wf%n_v*wf%n_o, &
         X897, &
         wf%n_v*wf%n_o, &
         zero, &
         X898, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X896)
      call mem%dealloc(X897)
      call add_1432_to_1234(one, X898, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X898)
      call mem%alloc(X899, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X899, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X900, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         two, &
         X899, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X900, 1)
!
      call mem%dealloc(X899)
      call mem%alloc(X901, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X900, &
         wf%n_o, &
         zero, &
         X901, &
         wf%n_v**2)
!
      call mem%dealloc(X900)
      call mem%alloc(X902, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X901, X902, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X901)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X902, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X902)
      call mem%alloc(X903, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X903, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X904, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         two, &
         X903, &
         wf%n_v*wf%n_o**2, &
         rAx_o, 1, &
         zero, &
         X904, 1)
!
      call mem%dealloc(X903)
      call mem%alloc(X905, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_213(X904, X905, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X904)
      call mem%alloc(X906, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X906, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X907, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X906, &
         wf%n_v*wf%n_o, &
         X905, &
         wf%n_o**2, &
         zero, &
         X907, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X905)
      call mem%dealloc(X906)
      call mem%alloc(X908, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X907, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X908, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X907)
      call add_1423_to_1234(one, X908, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X908)
      call mem%alloc(X909, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X909, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X910, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X910, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X911, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         -two, &
         X909, &
         wf%n_v*wf%n_o, &
         X910, &
         wf%n_v**2, &
         zero, &
         X911, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X909)
      call mem%dealloc(X910)
      call mem%alloc(X912, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X911, X912, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X911)
      call mem%alloc(X913, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X912, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X913, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X912)
      call mem%alloc(X914, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X913, 1, &
         rAx_o, 1, &
         X914, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X913)
      call add_1432_to_1234(one, X914, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X914)
      call mem%alloc(X915, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X915, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X916, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -two, &
         txxxI_vov, &
         wf%n_v, &
         X915, &
         wf%n_v**2, &
         zero, &
         X916, &
         wf%n_v)
!
      call mem%dealloc(X915)
      call mem%alloc(X917, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X916, &
         wf%n_v**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X917, &
         wf%n_v**2)
!
      call mem%dealloc(X916)
      call mem%alloc(X918, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_231(X917, X918, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X917)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X918, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X918)
      call mem%alloc(X919, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X919, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X920, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -two, &
         X919, &
         wf%n_v**2, &
         tAxxI_ov, 1, &
         zero, &
         X920, 1)
!
      call mem%dealloc(X919)
      call mem%alloc(X921, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X920, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X921, &
         wf%n_v)
!
      call mem%dealloc(X920)
      call mem%alloc(X922, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X921, X922, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X921)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X922, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X922)
      call mem%alloc(X923, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1432(g_ooov, X923, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X924, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         X923, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X924, &
         wf%n_o**2)
!
      call mem%dealloc(X923)
      call mem%alloc(X925, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X924, &
         wf%n_o, &
         zero, &
         X925, &
         wf%n_v)
!
      call mem%dealloc(X924)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X925, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X925)
      call mem%alloc(X926, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**3, &
         wf%n_o, &
         wf%n_v, &
         two, &
         g_ooov, &
         wf%n_o**3, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X926, &
         wf%n_o**3)
!
      call mem%alloc(X927, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_o**3, &
         one, &
         X926, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X927, 1)
!
      call mem%dealloc(X926)
      call mem%alloc(X928, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X927, X928, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X927)
      call mem%alloc(X929, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X929, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X930, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X929, &
         wf%n_v**2, &
         X928, &
         wf%n_o**2, &
         zero, &
         X930, &
         wf%n_v**2)
!
      call mem%dealloc(X928)
      call mem%dealloc(X929)
      call add_1324_to_1234(one, X930, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X930)
      call mem%alloc(X931, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         two, &
         g_ooov, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X931, 1)
!
      call mem%alloc(X932, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         X931, &
         wf%n_o**2, &
         zero, &
         X932, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X931)
      call mem%alloc(X933, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X932, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X933, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X932)
      call add_1423_to_1234(one, X933, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X933)
      call mem%alloc(X934, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X934, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X935, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         two, &
         X934, &
         wf%n_v, &
         g_vvov, &
         wf%n_v**2, &
         zero, &
         X935, &
         wf%n_v)
!
      call mem%dealloc(X934)
      call mem%alloc(X936, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X935, &
         wf%n_v**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X936, &
         wf%n_v**2)
!
      call mem%dealloc(X935)
      call mem%alloc(X937, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_213(X936, X937, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X936)
      call mem%alloc(X938, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X937, 1, &
         rAx_o, 1, &
         X938, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X937)
      call add_1342_to_1234(one, X938, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X938)
      call mem%alloc(X939, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         tAxxI_ov, &
         wf%n_o, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X939, &
         wf%n_o)
!
      call mem%alloc(X940, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X939, &
         wf%n_v**2*wf%n_o, &
         rAx_o, 1, &
         zero, &
         X940, 1)
!
      call mem%dealloc(X939)
      call mem%alloc(X941, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_213(X940, X941, wf%n_o, wf%n_v, wf%n_v)
      call mem%dealloc(X940)
      call mem%alloc(X942, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X942, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X943, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X941, &
         wf%n_v*wf%n_o, &
         X942, &
         wf%n_v*wf%n_o, &
         zero, &
         X943, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X941)
      call mem%dealloc(X942)
      call add_1432_to_1234(one, X943, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X943)
      call mem%alloc(X944, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X944, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X945, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -two, &
         uxIxx_vvo, &
         wf%n_v, &
         X944, &
         wf%n_o**2, &
         zero, &
         X945, &
         wf%n_v)
!
      call mem%dealloc(X944)
      call mem%alloc(X946, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X945, X946, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X945)
      call mem%alloc(X947, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X946, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X947, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X946)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X947, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X947)
      call mem%alloc(X948, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X948, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X949, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         two, &
         X948, &
         wf%n_v**2, &
         tAxxI_ov, 1, &
         zero, &
         X949, 1)
!
      call mem%dealloc(X948)
      call mem%alloc(X950, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X949, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X950, &
         wf%n_v)
!
      call mem%dealloc(X949)
      call mem%alloc(X951, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X950, 1, &
         rAx_o, 1, &
         X951, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X950)
      call add_1342_to_1234(one, X951, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X951)
      call mem%alloc(X952, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X952, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X953, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X953, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X954, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         two, &
         X952, &
         wf%n_v*wf%n_o, &
         X953, &
         wf%n_v**2, &
         zero, &
         X954, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X952)
      call mem%dealloc(X953)
      call mem%alloc(X955, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X954, X955, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X954)
      call mem%alloc(X956, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X955, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X956, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X955)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X956, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X956)
      call mem%alloc(X957, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         tAxxI_ov, &
         wf%n_o, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X957, &
         wf%n_o)
!
      call mem%alloc(X958, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X957, &
         wf%n_v**2*wf%n_o, &
         rAx_o, 1, &
         zero, &
         X958, 1)
!
      call mem%dealloc(X957)
      call mem%alloc(X959, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_213(X958, X959, wf%n_o, wf%n_v, wf%n_v)
      call mem%dealloc(X958)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X959, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X959)
      call mem%alloc(X960, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X960, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X961, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -two, &
         uxxxI_vov, &
         wf%n_v, &
         X960, &
         wf%n_v*wf%n_o, &
         zero, &
         X961, &
         wf%n_v)
!
      call mem%dealloc(X960)
      call mem%alloc(X962, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X961, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X962, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X961)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X962, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X962)
      call mem%alloc(X963, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         -two, &
         g_ooov, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X963, 1)
!
      call mem%alloc(X964, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_213(X963, X964, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X963)
      call mem%alloc(X965, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X964, &
         wf%n_o**2, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X965, &
         wf%n_o**2)
!
      call mem%dealloc(X964)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X965, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X965)
      call mem%alloc(X966, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**3, &
         wf%n_v, &
         -two, &
         tAxxI_ov, &
         wf%n_o, &
         g_ooov, &
         wf%n_o**3, &
         zero, &
         X966, &
         wf%n_o)
!
      call mem%alloc(X967, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**3, &
         wf%n_o, &
         one, &
         X966, &
         wf%n_o**3, &
         rAx_o, 1, &
         zero, &
         X967, 1)
!
      call mem%dealloc(X966)
      call mem%alloc(X968, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X967, X968, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X967)
      call mem%alloc(X969, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X969, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X970, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X969, &
         wf%n_v**2, &
         X968, &
         wf%n_o**2, &
         zero, &
         X970, &
         wf%n_v**2)
!
      call mem%dealloc(X968)
      call mem%dealloc(X969)
      call add_1342_to_1234(one, X970, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X970)
      call mem%alloc(X971, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X971, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X972, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X971, &
         wf%n_v**2, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X972, &
         wf%n_v**2)
!
      call mem%dealloc(X971)
      call mem%alloc(X973, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X972, X973, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X972)
      call mem%alloc(X974, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X973, &
         wf%n_v*wf%n_o, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X974, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X973)
      call mem%alloc(X975, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X974, 1, &
         rAx_o, 1, &
         X975, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X974)
      call add_1432_to_1234(one, X975, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X975)
      call mem%alloc(X976, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X976, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X977, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X976, &
         wf%n_v**2, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X977, &
         wf%n_v**2)
!
      call mem%dealloc(X976)
      call mem%alloc(X978, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X977, X978, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X977)
      call mem%alloc(X979, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X978, &
         wf%n_v*wf%n_o, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X979, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X978)
      call mem%alloc(X980, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X979, 1, &
         rAx_o, 1, &
         X980, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X979)
      call add_1432_to_1234(one, X980, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X980)
      call mem%alloc(X981, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X981, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X982, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v**2, &
         -two, &
         X981, &
         wf%n_v*wf%n_o, &
         txIxI_vv, 1, &
         zero, &
         X982, 1)
!
      call mem%dealloc(X981)
      call mem%alloc(X983, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X982, &
         wf%n_v, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X983, &
         wf%n_v)
!
      call mem%dealloc(X982)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X983, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X983)
      call mem%alloc(X984, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X984, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X985, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v**2, &
         -two, &
         X984, &
         wf%n_v*wf%n_o, &
         txIxI_vv, 1, &
         zero, &
         X985, 1)
!
      call mem%dealloc(X984)
      call mem%alloc(X986, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X986, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X987, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X985, &
         wf%n_v, &
         X986, &
         wf%n_o, &
         zero, &
         X987, &
         wf%n_v)
!
      call mem%dealloc(X985)
      call mem%dealloc(X986)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X987, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X987)
      call mem%alloc(X988, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1243(g_vvov, X988, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X989, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**3, &
         wf%n_o, &
         -two, &
         X988, &
         wf%n_v**3, &
         rAx_o, 1, &
         zero, &
         X989, 1)
!
      call mem%dealloc(X988)
      call mem%alloc(X990, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X990, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X991, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X989, &
         wf%n_v**2, &
         X990, &
         wf%n_o**2, &
         zero, &
         X991, &
         wf%n_v**2)
!
      call mem%dealloc(X989)
      call mem%dealloc(X990)
      call mem%alloc(X992, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1342(X991, X992, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X991)
      call mem%alloc(X993, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X992, &
         wf%n_v*wf%n_o**2, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X993, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X992)
      call add_1243_to_1234(one, X993, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X993)
      call mem%alloc(X994, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1243(g_vvov, X994, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X995, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**3, &
         wf%n_o, &
         -two, &
         X994, &
         wf%n_v**3, &
         rAx_o, 1, &
         zero, &
         X995, 1)
!
      call mem%dealloc(X994)
      call mem%alloc(X996, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X996, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X997, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X995, &
         wf%n_v**2, &
         X996, &
         wf%n_o**2, &
         zero, &
         X997, &
         wf%n_v**2)
!
      call mem%dealloc(X995)
      call mem%dealloc(X996)
      call mem%alloc(X998, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1342(X997, X998, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X997)
      call mem%alloc(X999, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X998, &
         wf%n_v*wf%n_o**2, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X999, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X998)
      call add_1423_to_1234(one, X999, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X999)
      call mem%alloc(X1000, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**3, &
         wf%n_v, &
         two, &
         txIxI_vv, &
         wf%n_v, &
         g_ooov, &
         wf%n_o**3, &
         zero, &
         X1000, &
         wf%n_v)
!
      call mem%alloc(X1001, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1324(X1000, X1001, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X1000)
      call mem%alloc(X1002, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X1002, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1003, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X1001, &
         wf%n_v*wf%n_o, &
         X1002, &
         wf%n_o**2, &
         zero, &
         X1003, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1001)
      call mem%dealloc(X1002)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1003, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1003)
      call mem%alloc(X1004, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**3, &
         wf%n_v, &
         two, &
         txIxI_vv, &
         wf%n_v, &
         g_ooov, &
         wf%n_o**3, &
         zero, &
         X1004, &
         wf%n_v)
!
      call mem%alloc(X1005, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X1004, X1005, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X1004)
      call mem%alloc(X1006, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X1006, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1007, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X1005, &
         wf%n_v*wf%n_o, &
         X1006, &
         wf%n_o**2, &
         zero, &
         X1007, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1005)
      call mem%dealloc(X1006)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1007, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1007)
      call mem%alloc(X1008, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         two, &
         g_ooov, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X1008, 1)
!
      call mem%alloc(X1009, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X1008, &
         wf%n_o**2, &
         zero, &
         X1009, &
         wf%n_v)
!
      call mem%dealloc(X1008)
      call mem%alloc(X1010, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(tAxxx_ovo, X1010, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1011, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1010, &
         wf%n_v*wf%n_o, &
         X1009, &
         wf%n_v*wf%n_o, &
         zero, &
         X1011, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1009)
      call mem%dealloc(X1010)
      call add_1432_to_1234(one, X1011, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1011)
      call mem%alloc(X1012, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         two, &
         g_ooov, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X1012, 1)
!
      call mem%alloc(X1013, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X1012, &
         wf%n_o**2, &
         zero, &
         X1013, &
         wf%n_v)
!
      call mem%dealloc(X1012)
      call mem%alloc(X1014, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X1013, &
         wf%n_v*wf%n_o, &
         zero, &
         X1014, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1013)
      call add_1432_to_1234(one, X1014, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1014)
      call mem%alloc(X1015, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X1015, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1016, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         g_vvov, &
         wf%n_v**2, &
         X1015, &
         wf%n_o, &
         zero, &
         X1016, &
         wf%n_v**2)
!
      call mem%dealloc(X1015)
      call mem%alloc(X1017, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X1016, X1017, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X1016)
      call mem%alloc(X1018, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X1017, &
         wf%n_v*wf%n_o, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X1018, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1017)
      call mem%alloc(X1019, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1018, 1, &
         rAx_o, 1, &
         X1019, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1018)
      call add_1432_to_1234(one, X1019, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1019)
      call mem%alloc(X1020, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X1020, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1021, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v**2, &
         two, &
         X1020, &
         wf%n_v*wf%n_o, &
         txIxI_vv, 1, &
         zero, &
         X1021, 1)
!
      call mem%dealloc(X1020)
      call mem%alloc(X1022, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1021, &
         wf%n_v, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X1022, &
         wf%n_v)
!
      call mem%dealloc(X1021)
      call mem%alloc(X1023, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1022, 1, &
         rAx_o, 1, &
         X1023, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1022)
      call add_1342_to_1234(one, X1023, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1023)
      call mem%alloc(X1024, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X1024, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1025, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         g_vvov, &
         wf%n_v**2, &
         X1024, &
         wf%n_o, &
         zero, &
         X1025, &
         wf%n_v**2)
!
      call mem%dealloc(X1024)
      call mem%alloc(X1026, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X1025, X1026, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X1025)
      call mem%alloc(X1027, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X1026, &
         wf%n_v*wf%n_o, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X1027, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1026)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1027, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1027)
      call mem%alloc(X1028, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X1028, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1029, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X1028, &
         wf%n_v**2, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X1029, &
         wf%n_v**2)
!
      call mem%dealloc(X1028)
      call mem%alloc(X1030, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X1029, X1030, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X1029)
      call mem%alloc(X1031, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X1030, &
         wf%n_v*wf%n_o, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X1031, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1030)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1031, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1031)
      call mem%alloc(X1032, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1243(g_vvov, X1032, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1033, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**3, &
         wf%n_o, &
         two, &
         X1032, &
         wf%n_v**3, &
         rAx_o, 1, &
         zero, &
         X1033, 1)
!
      call mem%dealloc(X1032)
      call mem%alloc(X1034, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X1033, &
         wf%n_v**2, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X1034, &
         wf%n_v**2)
!
      call mem%dealloc(X1033)
      call mem%alloc(X1035, wf%n_v, wf%n_v, wf%n_v)
      call sort_to_132(X1034, X1035, wf%n_v, wf%n_v, wf%n_v)
      call mem%dealloc(X1034)
      call mem%alloc(X1036, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X1036, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1037, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X1035, &
         wf%n_v**2, &
         X1036, &
         wf%n_o**2, &
         zero, &
         X1037, &
         wf%n_v**2)
!
      call mem%dealloc(X1035)
      call mem%dealloc(X1036)
      call add_1342_to_1234(one, X1037, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1037)
      call mem%alloc(X1038, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1324(g_ooov, X1038, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1039, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(uAxxx_ovo, X1039, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1040, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -two, &
         X1039, &
         wf%n_o**2, &
         X1038, &
         wf%n_o**2, &
         zero, &
         X1040, &
         wf%n_v)
!
      call mem%dealloc(X1038)
      call mem%dealloc(X1039)
      call mem%alloc(X1041, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X1040, &
         wf%n_v*wf%n_o, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X1041, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1040)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1041, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1041)
      call mem%alloc(X1042, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         -two, &
         g_ooov, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X1042, 1)
!
      call mem%alloc(X1043, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X1042, &
         wf%n_o**2, &
         zero, &
         X1043, &
         wf%n_v)
!
      call mem%dealloc(X1042)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1043, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1043)
      call mem%alloc(X1044, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X1044, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1045, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         -two, &
         X1044, &
         wf%n_v*wf%n_o**2, &
         rAx_o, 1, &
         zero, &
         X1045, 1)
!
      call mem%dealloc(X1044)
      call mem%alloc(X1046, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X1045, &
         wf%n_o**2, &
         zero, &
         X1046, &
         wf%n_v)
!
      call mem%dealloc(X1045)
      call mem%alloc(X1047, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X1046, X1047, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1046)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1047, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1047)
      call mem%alloc(X1048, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X1048, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1049, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         -two, &
         X1048, &
         wf%n_v*wf%n_o**2, &
         rAx_o, 1, &
         zero, &
         X1049, 1)
!
      call mem%dealloc(X1048)
      call mem%alloc(X1050, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X1049, &
         wf%n_o**2, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X1050, &
         wf%n_o**2)
!
      call mem%dealloc(X1049)
      call mem%alloc(X1051, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(uAxxx_ovo, X1051, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1052, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1051, &
         wf%n_v*wf%n_o, &
         X1050, &
         wf%n_o, &
         zero, &
         X1052, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1050)
      call mem%dealloc(X1051)
      call add_1423_to_1234(one, X1052, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1052)
      call mem%alloc(X1053, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X1053, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1054, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         two, &
         X1053, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X1054, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1053)
      call mem%alloc(X1055, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X1054, X1055, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1054)
      call mem%alloc(X1056, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1055, &
         wf%n_v*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1056, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1055)
      call mem%alloc(X1057, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1056, 1, &
         rAx_o, 1, &
         X1057, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1056)
      call add_1432_to_1234(one, X1057, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1057)
      call mem%alloc(X1058, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X1058, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1059, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         two, &
         txIxx_vvo, &
         wf%n_v, &
         X1058, &
         wf%n_v**2, &
         zero, &
         X1059, &
         wf%n_v)
!
      call mem%dealloc(X1058)
      call mem%alloc(X1060, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1059, &
         wf%n_v**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1060, &
         wf%n_v**2)
!
      call mem%dealloc(X1059)
      call mem%alloc(X1061, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_231(X1060, X1061, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X1060)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1061, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1061)
      call mem%alloc(X1062, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X1062, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1063, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         two, &
         X1062, &
         wf%n_v**2, &
         uAIxx_vo, 1, &
         zero, &
         X1063, 1)
!
      call mem%dealloc(X1062)
      call mem%alloc(X1064, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(txIxx_vvo, X1064, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1065, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1063, &
         wf%n_v, &
         X1064, &
         wf%n_v*wf%n_o, &
         zero, &
         X1065, &
         wf%n_v)
!
      call mem%dealloc(X1063)
      call mem%dealloc(X1064)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1065, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1065)
      call mem%alloc(X1066, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_4132(g_ooov, X1066, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1067, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         X1066, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X1067, &
         wf%n_o**2)
!
      call mem%dealloc(X1066)
      call mem%alloc(X1068, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X1067, &
         wf%n_o, &
         zero, &
         X1068, &
         wf%n_v)
!
      call mem%dealloc(X1067)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1068, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1068)
      call mem%alloc(X1069, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**3, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         g_ooov, &
         wf%n_o**3, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1069, &
         wf%n_o**3)
!
      call mem%alloc(X1070, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_o**3, &
         one, &
         X1069, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X1070, 1)
!
      call mem%dealloc(X1069)
      call mem%alloc(X1071, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X1070, X1071, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X1070)
      call mem%alloc(X1072, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X1071, &
         wf%n_o**2, &
         zero, &
         X1072, &
         wf%n_v**2)
!
      call mem%dealloc(X1071)
      call add_1324_to_1234(one, X1072, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1072)
      call mem%alloc(X1073, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         -two, &
         g_ooov, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X1073, 1)
!
      call mem%alloc(X1074, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X1074, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1075, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X1074, &
         wf%n_v*wf%n_o, &
         X1073, &
         wf%n_o**2, &
         zero, &
         X1075, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1073)
      call mem%dealloc(X1074)
      call mem%alloc(X1076, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1075, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1076, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1075)
      call add_1423_to_1234(one, X1076, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1076)
      call mem%alloc(X1077, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X1077, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1078, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         two, &
         txxxI_vov, &
         wf%n_v, &
         X1077, &
         wf%n_v**2, &
         zero, &
         X1078, &
         wf%n_v)
!
      call mem%dealloc(X1077)
      call mem%alloc(X1079, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1078, &
         wf%n_v**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1079, &
         wf%n_v**2)
!
      call mem%dealloc(X1078)
      call mem%alloc(X1080, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_213(X1079, X1080, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X1079)
      call mem%alloc(X1081, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1080, 1, &
         rAx_o, 1, &
         X1081, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1080)
      call add_1342_to_1234(one, X1081, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1081)
      call mem%alloc(X1082, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X1082, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1083, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         uAIxx_vo, &
         wf%n_v, &
         X1082, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X1083, &
         wf%n_o)
!
      call mem%dealloc(X1082)
      call mem%alloc(X1084, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1083, &
         wf%n_v**2*wf%n_o, &
         rAx_o, 1, &
         zero, &
         X1084, 1)
!
      call mem%dealloc(X1083)
      call mem%alloc(X1085, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_213(X1084, X1085, wf%n_o, wf%n_v, wf%n_v)
      call mem%dealloc(X1084)
      call mem%alloc(X1086, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1085, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1086, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1085)
      call add_1432_to_1234(one, X1086, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1086)
      call mem%alloc(X1087, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X1087, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1088, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X1088, wf%n_v, wf%n_o)
      call mem%alloc(X1089, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -two, &
         X1087, &
         wf%n_v*wf%n_o, &
         X1088, 1, &
         zero, &
         X1089, 1)
!
      call mem%dealloc(X1087)
      call mem%dealloc(X1088)
      call mem%alloc(X1090, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X1090, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1091, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X1090, &
         wf%n_v**2, &
         X1089, &
         wf%n_o, &
         zero, &
         X1091, &
         wf%n_v**2)
!
      call mem%dealloc(X1089)
      call mem%dealloc(X1090)
      call mem%alloc(X1092, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X1091, X1092, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X1091)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1092, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1092)
      call mem%alloc(X1093, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X1093, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1094, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         -two, &
         X1093, &
         wf%n_v*wf%n_o**2, &
         rAx_o, 1, &
         zero, &
         X1094, 1)
!
      call mem%dealloc(X1093)
      call mem%alloc(X1095, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_213(X1094, X1095, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X1094)
      call mem%alloc(X1096, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         X1095, &
         wf%n_o**2, &
         zero, &
         X1096, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1095)
      call mem%alloc(X1097, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1096, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1097, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1096)
      call add_1423_to_1234(one, X1097, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1097)
      call mem%alloc(X1098, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X1098, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1099, wf%n_v, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -two, &
         X1098, &
         wf%n_v, &
         g_vvov, &
         wf%n_v**2, &
         zero, &
         X1099, &
         wf%n_v)
!
      call mem%dealloc(X1098)
      call mem%alloc(X1100, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1099, &
         wf%n_v**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1100, &
         wf%n_v**2)
!
      call mem%dealloc(X1099)
      call mem%alloc(X1101, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_231(X1100, X1101, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X1100)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1101, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1101)
      call mem%alloc(X1102, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X1102, wf%n_v, wf%n_o)
      call mem%alloc(X1103, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -two, &
         g_vvov, &
         wf%n_v**2, &
         X1102, 1, &
         zero, &
         X1103, 1)
!
      call mem%dealloc(X1102)
      call mem%alloc(X1104, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(uxIxx_vvo, X1104, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1105, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1103, &
         wf%n_v, &
         X1104, &
         wf%n_v*wf%n_o, &
         zero, &
         X1105, &
         wf%n_v)
!
      call mem%dealloc(X1103)
      call mem%dealloc(X1104)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1105, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1105)
      call mem%alloc(X1106, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X1106, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1107, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         X1106, &
         wf%n_o**2, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X1107, &
         wf%n_o**2)
!
      call mem%dealloc(X1106)
      call mem%alloc(X1108, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X1107, &
         wf%n_o, &
         zero, &
         X1108, &
         wf%n_v)
!
      call mem%dealloc(X1107)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1108, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1108)
      call mem%alloc(X1109, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X1109, wf%n_v, wf%n_o)
      call mem%alloc(X1110, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -two, &
         g_vvov, &
         wf%n_v**2, &
         X1109, 1, &
         zero, &
         X1110, 1)
!
      call mem%dealloc(X1109)
      call mem%alloc(X1111, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1110, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1111, &
         wf%n_v)
!
      call mem%dealloc(X1110)
      call mem%alloc(X1112, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1111, 1, &
         rAx_o, 1, &
         X1112, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1111)
      call add_1342_to_1234(one, X1112, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1112)
      call mem%alloc(X1113, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X1113, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1114, wf%n_o, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -two, &
         uAIxx_vo, &
         wf%n_v, &
         X1113, &
         wf%n_v**2*wf%n_o, &
         zero, &
         X1114, &
         wf%n_o)
!
      call mem%dealloc(X1113)
      call mem%alloc(X1115, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1114, &
         wf%n_v**2*wf%n_o, &
         rAx_o, 1, &
         zero, &
         X1115, 1)
!
      call mem%dealloc(X1114)
      call mem%alloc(X1116, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_213(X1115, X1116, wf%n_o, wf%n_v, wf%n_v)
      call mem%dealloc(X1115)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1116, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1116)
      call mem%alloc(X1117, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X1117, wf%n_v, wf%n_o)
      call mem%alloc(X1118, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         two, &
         g_ooov, &
         wf%n_o**2, &
         X1117, 1, &
         zero, &
         X1118, 1)
!
      call mem%dealloc(X1117)
      call mem%alloc(X1119, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X1119, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1120, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X1119, &
         wf%n_v**2, &
         X1118, &
         wf%n_o, &
         zero, &
         X1120, &
         wf%n_v**2)
!
      call mem%dealloc(X1118)
      call mem%dealloc(X1119)
      call mem%alloc(X1121, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X1120, X1121, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X1120)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1121, 1, &
         rAx_o, 1, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1121)
      call mem%alloc(X1122, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X1122, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1123, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         two, &
         X1122, &
         wf%n_v*wf%n_o**2, &
         rAx_o, 1, &
         zero, &
         X1123, 1)
!
      call mem%dealloc(X1122)
      call mem%alloc(X1124, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1123, &
         wf%n_o**2, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1124, &
         wf%n_o**2)
!
      call mem%dealloc(X1123)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X1124, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1124)
      call mem%alloc(X1125, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X1125, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1126, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X1126, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1127, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v**2, &
         two, &
         X1126, &
         wf%n_v**2, &
         X1125, &
         wf%n_v*wf%n_o, &
         zero, &
         X1127, &
         wf%n_o**2)
!
      call mem%dealloc(X1125)
      call mem%dealloc(X1126)
      call mem%alloc(X1128, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         X1127, &
         wf%n_v*wf%n_o**2, &
         tAIAx_o, 1, &
         zero, &
         X1128, 1)
!
      call mem%dealloc(X1127)
      call mem%alloc(X1129, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_312(X1128, X1129, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X1128)
      call mem%alloc(X1130, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1129, 1, &
         rxI_v, 1, &
         X1130, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1129)
      call add_1243_to_1234(one, X1130, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1130)
      call mem%alloc(X1131, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o**2, &
         -two, &
         g_ooov, &
         wf%n_o, &
         tAIAx_o, 1, &
         zero, &
         X1131, 1)
!
      call mem%alloc(X1132, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X1131, X1132, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X1131)
      call mem%alloc(X1133, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X1132, &
         wf%n_o, &
         zero, &
         X1133, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1132)
      call mem%alloc(X1134, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1133, 1, &
         rxI_v, 1, &
         X1134, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1133)
      call add_1423_to_1234(one, X1134, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1134)
      call mem%alloc(X1135, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X1135, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1136, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         -two, &
         X1135, &
         wf%n_v*wf%n_o**2, &
         tAIAx_o, 1, &
         zero, &
         X1136, 1)
!
      call mem%dealloc(X1135)
      call mem%alloc(X1137, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(u_aibj, X1137, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1138, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X1137, &
         wf%n_v*wf%n_o, &
         X1136, &
         wf%n_v*wf%n_o, &
         zero, &
         X1138, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1136)
      call mem%dealloc(X1137)
      call mem%alloc(X1139, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1138, 1, &
         rxI_v, 1, &
         X1139, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1138)
      call add_1423_to_1234(one, X1139, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1139)
      call mem%alloc(X1140, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X1140, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1141, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -two, &
         X1140, &
         wf%n_v**2, &
         tAIxx_vo, 1, &
         zero, &
         X1141, 1)
!
      call mem%dealloc(X1140)
      call mem%alloc(X1142, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X1142, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1143, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X1141, &
         wf%n_v, &
         X1142, &
         wf%n_o**2, &
         zero, &
         X1143, &
         wf%n_v)
!
      call mem%dealloc(X1141)
      call mem%dealloc(X1142)
      call mem%alloc(X1144, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1143, 1, &
         rxI_v, 1, &
         X1144, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1143)
      call add_1243_to_1234(one, X1144, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1144)
      call mem%alloc(X1145, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X1145, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1146, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -two, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X1145, &
         wf%n_v**2, &
         zero, &
         X1146, &
         wf%n_o)
!
      call mem%dealloc(X1145)
      call mem%alloc(X1147, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1146, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1147, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1146)
      call mem%alloc(X1148, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(X1147, X1148, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1147)
      call mem%alloc(X1149, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1148, 1, &
         rxI_v, 1, &
         X1149, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1148)
      call add_1423_to_1234(one, X1149, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1149)
      call mem%alloc(X1150, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_vvov, X1150, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1151, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -two, &
         X1150, &
         wf%n_v**2*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1151, 1)
!
      call mem%dealloc(X1150)
      call mem%alloc(X1152, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X1152, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1153, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X1151, &
         wf%n_v*wf%n_o, &
         X1152, &
         wf%n_o**2, &
         zero, &
         X1153, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1151)
      call mem%dealloc(X1152)
      call mem%alloc(X1154, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X1153, X1154, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X1153)
      call mem%alloc(X1155, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1154, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1155, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1154)
      call add_1423_to_1234(one, X1155, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1155)
      call mem%alloc(X1156, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_vvov, X1156, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1157, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -two, &
         X1156, &
         wf%n_v**2*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1157, 1)
!
      call mem%dealloc(X1156)
      call mem%alloc(X1158, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1157, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1158, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1157)
      call mem%alloc(X1159, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X1158, X1159, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1158)
      call mem%alloc(X1160, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1159, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X1160, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1159)
      call add_1432_to_1234(one, X1160, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1160)
      call mem%alloc(X1161, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -two, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1161, 1)
!
      call mem%alloc(X1162, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X1161, X1162, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X1161)
      call mem%alloc(X1163, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1162, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1163, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1162)
      call mem%alloc(X1164, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X1163, X1164, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1163)
      call mem%alloc(X1165, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1164, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X1165, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1164)
      call add_1423_to_1234(one, X1165, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1165)
      call mem%alloc(X1166, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1432(g_ooov, X1166, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1167, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X1167, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1168, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X1166, &
         wf%n_v*wf%n_o, &
         X1167, &
         wf%n_o, &
         zero, &
         X1168, &
         wf%n_o**2)
!
      call mem%dealloc(X1166)
      call mem%dealloc(X1167)
      call mem%alloc(X1169, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1168, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1169, &
         wf%n_o**2)
!
      call mem%dealloc(X1168)
      call mem%alloc(X1170, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X1169, X1170, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X1169)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1170, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1170)
      call mem%alloc(X1171, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**3, &
         wf%n_o, &
         wf%n_v, &
         two, &
         g_ooov, &
         wf%n_o**3, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1171, &
         wf%n_o**3)
!
      call mem%alloc(X1172, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_3124(X1171, X1172, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X1171)
      call mem%alloc(X1173, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X1173, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1174, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X1172, &
         wf%n_o**2, &
         X1173, &
         wf%n_o**2, &
         zero, &
         X1174, &
         wf%n_o**2)
!
      call mem%dealloc(X1172)
      call mem%dealloc(X1173)
      call mem%alloc(X1175, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X1174, X1175, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X1174)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1175, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1175)
      call mem%alloc(X1176, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X1176, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1177, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         two, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X1176, &
         wf%n_v*wf%n_o, &
         zero, &
         X1177, &
         wf%n_o)
!
      call mem%dealloc(X1176)
      call mem%alloc(X1178, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X1177, &
         wf%n_o**2, &
         zero, &
         X1178, &
         wf%n_v)
!
      call mem%dealloc(X1177)
      call mem%alloc(X1179, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1178, 1, &
         rxI_v, 1, &
         X1179, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1178)
      call add_1423_to_1234(one, X1179, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1179)
      call mem%alloc(X1180, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X1180, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1181, wf%n_o, wf%n_v)
      call sort_to_21(tAIxx_vo, X1181, wf%n_v, wf%n_o)
      call mem%alloc(X1182, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         two, &
         X1180, &
         wf%n_v*wf%n_o, &
         X1181, 1, &
         zero, &
         X1182, 1)
!
      call mem%dealloc(X1180)
      call mem%dealloc(X1181)
      call mem%alloc(X1183, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X1182, &
         wf%n_o, &
         zero, &
         X1183, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1182)
      call mem%alloc(X1184, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1183, 1, &
         rxI_v, 1, &
         X1184, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1183)
      call add_1423_to_1234(one, X1184, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1184)
      call mem%alloc(X1185, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**3, &
         wf%n_v, &
         two, &
         g_ooov, &
         wf%n_o**3, &
         rxI_v, 1, &
         zero, &
         X1185, 1)
!
      call mem%alloc(X1186, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X1185, &
         wf%n_o, &
         zero, &
         X1186, &
         wf%n_v)
!
      call mem%dealloc(X1185)
      call mem%alloc(X1187, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(tAxxx_ovo, X1187, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1188, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1187, &
         wf%n_v*wf%n_o, &
         X1186, &
         wf%n_v*wf%n_o, &
         zero, &
         X1188, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1186)
      call mem%dealloc(X1187)
      call add_1432_to_1234(one, X1188, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1188)
      call mem%alloc(X1189, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X1189, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1190, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         two, &
         X1189, &
         wf%n_o, &
         g_vvov, &
         wf%n_v**2, &
         zero, &
         X1190, &
         wf%n_o)
!
      call mem%dealloc(X1189)
      call mem%alloc(X1191, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1190, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1191, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1190)
      call mem%alloc(X1192, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(X1191, X1192, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1191)
      call mem%alloc(X1193, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1192, 1, &
         rxI_v, 1, &
         X1193, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1192)
      call add_1243_to_1234(one, X1193, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1193)
      call mem%alloc(X1194, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X1194, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1195, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         two, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X1194, &
         wf%n_v**2, &
         zero, &
         X1195, &
         wf%n_o)
!
      call mem%dealloc(X1194)
      call mem%alloc(X1196, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1195, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1196, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1195)
      call mem%alloc(X1197, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(X1196, X1197, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1196)
      call mem%alloc(X1198, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1197, 1, &
         rxI_v, 1, &
         X1198, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1197)
      call add_1243_to_1234(one, X1198, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1198)
      call mem%alloc(X1199, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_vvov, X1199, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1200, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         X1199, &
         wf%n_v**2*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1200, 1)
!
      call mem%dealloc(X1199)
      call mem%alloc(X1201, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1200, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1201, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1200)
      call mem%alloc(X1202, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X1201, X1202, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1201)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1202, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1202)
      call mem%alloc(X1203, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1203, 1)
!
      call mem%alloc(X1204, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X1203, X1204, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X1203)
      call mem%alloc(X1205, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X1205, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1206, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X1204, &
         wf%n_v*wf%n_o, &
         X1205, &
         wf%n_o**2, &
         zero, &
         X1206, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1204)
      call mem%dealloc(X1205)
      call mem%alloc(X1207, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X1206, X1207, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X1206)
      call mem%alloc(X1208, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1207, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1208, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1207)
      call add_1423_to_1234(one, X1208, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1208)
      call mem%alloc(X1209, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X1209, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1210, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         g_ooov, &
         wf%n_o**2, &
         X1209, &
         wf%n_o, &
         zero, &
         X1210, &
         wf%n_o**2)
!
      call mem%dealloc(X1209)
      call mem%alloc(X1211, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1210, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1211, &
         wf%n_o**2)
!
      call mem%dealloc(X1210)
      call mem%alloc(X1212, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X1211, X1212, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X1211)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1212, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1212)
      call mem%alloc(X1213, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X1213, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1214, wf%n_o, wf%n_v)
      call sort_to_21(tAIxx_vo, X1214, wf%n_v, wf%n_o)
      call mem%alloc(X1215, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -two, &
         X1213, &
         wf%n_v*wf%n_o, &
         X1214, 1, &
         zero, &
         X1215, 1)
!
      call mem%dealloc(X1213)
      call mem%dealloc(X1214)
      call mem%alloc(X1216, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1215, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X1216, &
         wf%n_o)
!
      call mem%dealloc(X1215)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1216, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1216)
      call mem%alloc(X1217, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**3, &
         wf%n_v, &
         -two, &
         tAIxx_vo, &
         wf%n_v, &
         g_ooov, &
         wf%n_o**3, &
         zero, &
         X1217, &
         wf%n_o)
!
      call mem%alloc(X1218, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X1217, X1218, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X1217)
      call mem%alloc(X1219, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X1219, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1220, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o**2, &
         one, &
         X1219, &
         wf%n_o**2, &
         X1218, &
         wf%n_o**2, &
         zero, &
         X1220, &
         wf%n_v)
!
      call mem%dealloc(X1218)
      call mem%dealloc(X1219)
      call mem%alloc(X1221, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1220, 1, &
         rxI_v, 1, &
         X1221, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1220)
      call add_1423_to_1234(one, X1221, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1221)
      call mem%alloc(X1222, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**3, &
         wf%n_v, &
         -two, &
         g_ooov, &
         wf%n_o**3, &
         rxI_v, 1, &
         zero, &
         X1222, 1)
!
      call mem%alloc(X1223, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_213(X1222, X1223, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X1222)
      call mem%alloc(X1224, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X1223, &
         wf%n_o**2, &
         zero, &
         X1224, &
         wf%n_v)
!
      call mem%dealloc(X1223)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1224, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1224)
      call mem%alloc(X1225, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**3, &
         wf%n_v, &
         -two, &
         g_ooov, &
         wf%n_o**3, &
         rxI_v, 1, &
         zero, &
         X1225, 1)
!
      call mem%alloc(X1226, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1225, &
         wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1226, &
         wf%n_o**2)
!
      call mem%dealloc(X1225)
      call mem%alloc(X1227, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(uAxxx_ovo, X1227, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1228, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1227, &
         wf%n_v*wf%n_o, &
         X1226, &
         wf%n_o, &
         zero, &
         X1228, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1226)
      call mem%dealloc(X1227)
      call add_1423_to_1234(one, X1228, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1228)
      call mem%alloc(X1229, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X1229, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1230, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         -two, &
         X1229, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X1230, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1229)
      call mem%alloc(X1231, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X1230, X1231, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1230)
      call mem%alloc(X1232, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X1231, &
         wf%n_v*wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X1232, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1231)
      call mem%alloc(X1233, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1232, 1, &
         rxI_v, 1, &
         X1233, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1232)
      call add_1423_to_1234(one, X1233, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1233)
      call mem%alloc(X1234, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X1234, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1235, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -two, &
         X1234, &
         wf%n_v**2*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1235, 1)
!
      call mem%dealloc(X1234)
      call mem%alloc(X1236, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X1235, &
         wf%n_v**2, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X1236, &
         wf%n_v**2)
!
      call mem%dealloc(X1235)
      call mem%alloc(X1237, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X1236, X1237, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X1236)
      call mem%alloc(X1238, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X1238, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1239, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1237, &
         wf%n_v*wf%n_o, &
         X1238, &
         wf%n_v*wf%n_o, &
         zero, &
         X1239, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1237)
      call mem%dealloc(X1238)
      call add_1432_to_1234(one, X1239, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1239)
      call mem%alloc(X1240, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_4132(g_ooov, X1240, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1241, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         X1240, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X1241, &
         wf%n_o**2)
!
      call mem%dealloc(X1240)
      call mem%alloc(X1242, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X1241, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X1242, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1241)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1242, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1242)
      call mem%alloc(X1243, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1324(g_ooov, X1243, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1244, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         two, &
         X1243, &
         wf%n_o**2, &
         tAxAx_oo, 1, &
         zero, &
         X1244, 1)
!
      call mem%dealloc(X1243)
      call mem%alloc(X1245, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X1245, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1246, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1245, &
         wf%n_v*wf%n_o, &
         X1244, &
         wf%n_o, &
         zero, &
         X1246, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1244)
      call mem%dealloc(X1245)
      call mem%alloc(X1247, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1246, 1, &
         rxI_v, 1, &
         X1247, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1246)
      call add_1423_to_1234(one, X1247, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1247)
      call mem%alloc(X1248, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**3, &
         wf%n_v, &
         two, &
         g_ooov, &
         wf%n_o**3, &
         rxI_v, 1, &
         zero, &
         X1248, 1)
!
      call mem%alloc(X1249, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         tAxAx_oo, &
         wf%n_o, &
         X1248, &
         wf%n_o, &
         zero, &
         X1249, &
         wf%n_o)
!
      call mem%dealloc(X1248)
      call mem%alloc(X1250, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X1249, &
         wf%n_o**2, &
         zero, &
         X1250, &
         wf%n_v**2)
!
      call mem%dealloc(X1249)
      call add_1342_to_1234(one, X1250, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1250)
      call mem%alloc(X1251, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X1251, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1252, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X1252, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1253, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         -two, &
         X1251, &
         wf%n_v*wf%n_o, &
         X1252, &
         wf%n_v**2, &
         zero, &
         X1253, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1251)
      call mem%dealloc(X1252)
      call mem%alloc(X1254, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X1253, X1254, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1253)
      call mem%alloc(X1255, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X1254, &
         wf%n_v*wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X1255, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1254)
      call mem%alloc(X1256, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1255, 1, &
         rxI_v, 1, &
         X1256, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1255)
      call add_1423_to_1234(one, X1256, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1256)
      call mem%alloc(X1257, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X1257, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1258, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -two, &
         X1257, &
         wf%n_v**2*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1258, 1)
!
      call mem%dealloc(X1257)
      call mem%alloc(X1259, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X1258, &
         wf%n_v**2, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X1259, &
         wf%n_v**2)
!
      call mem%dealloc(X1258)
      call mem%alloc(X1260, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X1259, X1260, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X1259)
      call mem%alloc(X1261, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1260, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1261, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1260)
      call add_1432_to_1234(one, X1261, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1261)
      call mem%alloc(X1262, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1432(g_ooov, X1262, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1263, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         X1262, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X1263, &
         wf%n_o**2)
!
      call mem%dealloc(X1262)
      call mem%alloc(X1264, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X1263, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X1264, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1263)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1264, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1264)
      call mem%alloc(X1265, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1324(g_ooov, X1265, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1266, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         two, &
         X1265, &
         wf%n_o**2, &
         tAxAx_oo, 1, &
         zero, &
         X1266, 1)
!
      call mem%dealloc(X1265)
      call mem%alloc(X1267, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         X1266, &
         wf%n_o, &
         zero, &
         X1267, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1266)
      call mem%alloc(X1268, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1267, 1, &
         rxI_v, 1, &
         X1268, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1267)
      call add_1423_to_1234(one, X1268, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1268)
      call mem%alloc(X1269, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**3, &
         wf%n_v, &
         two, &
         g_ooov, &
         wf%n_o**3, &
         rxI_v, 1, &
         zero, &
         X1269, 1)
!
      call mem%alloc(X1270, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         tAxAx_oo, &
         wf%n_o, &
         X1269, &
         wf%n_o, &
         zero, &
         X1270, &
         wf%n_o)
!
      call mem%dealloc(X1269)
      call mem%alloc(X1271, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X1271, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1272, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X1271, &
         wf%n_v**2, &
         X1270, &
         wf%n_o**2, &
         zero, &
         X1272, &
         wf%n_v**2)
!
      call mem%dealloc(X1270)
      call mem%dealloc(X1271)
      call add_1342_to_1234(one, X1272, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1272)
      call mem%alloc(X1273, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1273, 1)
!
      call mem%alloc(X1274, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X1273, &
         wf%n_v**2, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X1274, &
         wf%n_v**2)
!
      call mem%dealloc(X1273)
      call mem%alloc(X1275, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X1274, X1275, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X1274)
      call mem%alloc(X1276, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X1276, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1277, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1275, &
         wf%n_v*wf%n_o, &
         X1276, &
         wf%n_v*wf%n_o, &
         zero, &
         X1277, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1275)
      call mem%dealloc(X1276)
      call add_1432_to_1234(one, X1277, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1277)
      call mem%alloc(X1278, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X1278, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1279, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         X1278, &
         wf%n_o**2, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X1279, &
         wf%n_o**2)
!
      call mem%dealloc(X1278)
      call mem%alloc(X1280, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X1279, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X1280, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1279)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1280, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1280)
      call mem%alloc(X1281, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1243(g_ooov, X1281, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1282, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -two, &
         uxIxx_vvo, &
         wf%n_v, &
         X1281, &
         wf%n_o**2, &
         zero, &
         X1282, &
         wf%n_v)
!
      call mem%dealloc(X1281)
      call mem%alloc(X1283, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X1282, X1283, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1282)
      call mem%alloc(X1284, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X1283, &
         wf%n_v*wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X1284, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1283)
      call mem%alloc(X1285, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1284, 1, &
         rxI_v, 1, &
         X1285, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1284)
      call add_1243_to_1234(one, X1285, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1285)
      call mem%alloc(X1286, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1324(g_vvov, X1286, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1287, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X1287, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1288, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         two, &
         X1286, &
         wf%n_v*wf%n_o, &
         X1287, &
         wf%n_v**2, &
         zero, &
         X1288, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1286)
      call mem%dealloc(X1287)
      call mem%alloc(X1289, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X1288, X1289, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1288)
      call mem%alloc(X1290, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X1289, &
         wf%n_v*wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X1290, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1289)
      call mem%alloc(X1291, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1290, 1, &
         rxI_v, 1, &
         X1291, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1290)
      call add_1243_to_1234(one, X1291, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1291)
      call mem%alloc(X1292, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X1292, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1293, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         X1292, &
         wf%n_v**2*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1293, 1)
!
      call mem%dealloc(X1292)
      call mem%alloc(X1294, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X1293, &
         wf%n_v**2, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X1294, &
         wf%n_v**2)
!
      call mem%dealloc(X1293)
      call mem%alloc(X1295, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X1294, X1295, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X1294)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1295, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1295)
      call mem%alloc(X1296, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1296, 1)
!
      call mem%alloc(X1297, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X1296, &
         wf%n_v**2, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X1297, &
         wf%n_v**2)
!
      call mem%dealloc(X1296)
      call mem%alloc(X1298, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X1297, X1298, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X1297)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1298, &
         wf%n_v*wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1298)
      call mem%alloc(X1299, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1324(g_ooov, X1299, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1300, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -two, &
         X1299, &
         wf%n_o**2, &
         tAxAx_oo, 1, &
         zero, &
         X1300, 1)
!
      call mem%dealloc(X1299)
      call mem%alloc(X1301, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1300, &
         wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1301, &
         wf%n_o)
!
      call mem%dealloc(X1300)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1301, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1301)
      call mem%alloc(X1302, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X1302, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1303, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -two, &
         uxxxI_vov, &
         wf%n_v, &
         X1302, &
         wf%n_v*wf%n_o, &
         zero, &
         X1303, &
         wf%n_v)
!
      call mem%dealloc(X1302)
      call mem%alloc(X1304, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X1303, &
         wf%n_v*wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X1304, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1303)
      call mem%alloc(X1305, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1304, 1, &
         rxI_v, 1, &
         X1305, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1304)
      call add_1243_to_1234(one, X1305, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1305)
      call mem%alloc(X1306, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**3, &
         wf%n_v, &
         -two, &
         g_ooov, &
         wf%n_o**3, &
         rxI_v, 1, &
         zero, &
         X1306, 1)
!
      call mem%alloc(X1307, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X1306, &
         wf%n_o**2, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X1307, &
         wf%n_o**2)
!
      call mem%dealloc(X1306)
      call mem%alloc(X1308, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X1308, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1309, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X1308, &
         wf%n_v**2, &
         X1307, &
         wf%n_o, &
         zero, &
         X1309, &
         wf%n_v**2)
!
      call mem%dealloc(X1307)
      call mem%dealloc(X1308)
      call add_1324_to_1234(one, X1309, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1309)
      call mem%alloc(X1310, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X1310, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1311, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -two, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X1310, &
         wf%n_v**2, &
         zero, &
         X1311, &
         wf%n_o)
!
      call mem%dealloc(X1310)
      call mem%alloc(X1312, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1311, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1312, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1311)
      call mem%alloc(X1313, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(X1312, X1313, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1312)
      call mem%alloc(X1314, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1313, 1, &
         rxI_v, 1, &
         X1314, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1313)
      call add_1423_to_1234(one, X1314, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1314)
      call mem%alloc(X1315, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X1315, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1316, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -two, &
         X1315, &
         wf%n_v**2, &
         tAxxI_ov, 1, &
         zero, &
         X1316, 1)
!
      call mem%dealloc(X1315)
      call mem%alloc(X1317, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X1317, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1318, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X1316, &
         wf%n_v, &
         X1317, &
         wf%n_o**2, &
         zero, &
         X1318, &
         wf%n_v)
!
      call mem%dealloc(X1316)
      call mem%dealloc(X1317)
      call mem%alloc(X1319, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1318, 1, &
         rxI_v, 1, &
         X1319, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1318)
      call add_1243_to_1234(one, X1319, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1319)
      call mem%alloc(X1320, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_vvov, X1320, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1321, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -two, &
         X1320, &
         wf%n_v**2*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1321, 1)
!
      call mem%dealloc(X1320)
      call mem%alloc(X1322, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1321, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1322, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1321)
      call mem%alloc(X1323, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X1322, X1323, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1322)
      call mem%alloc(X1324, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1323, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X1324, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1323)
      call add_1432_to_1234(one, X1324, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1324)
      call mem%alloc(X1325, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_vvov, X1325, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1326, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -two, &
         X1325, &
         wf%n_v**2*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1326, 1)
!
      call mem%dealloc(X1325)
      call mem%alloc(X1327, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X1327, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1328, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X1326, &
         wf%n_v*wf%n_o, &
         X1327, &
         wf%n_o**2, &
         zero, &
         X1328, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1326)
      call mem%dealloc(X1327)
      call mem%alloc(X1329, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X1328, X1329, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X1328)
      call mem%alloc(X1330, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1329, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1330, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1329)
      call add_1423_to_1234(one, X1330, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1330)
      call mem%alloc(X1331, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -two, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1331, 1)
!
      call mem%alloc(X1332, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X1331, X1332, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X1331)
      call mem%alloc(X1333, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1332, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1333, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1332)
      call mem%alloc(X1334, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X1333, X1334, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1333)
      call mem%alloc(X1335, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1334, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X1335, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1334)
      call add_1423_to_1234(one, X1335, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1335)
      call mem%alloc(X1336, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**3, &
         wf%n_o, &
         wf%n_v, &
         two, &
         g_ooov, &
         wf%n_o**3, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1336, &
         wf%n_o**3)
!
      call mem%alloc(X1337, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_3124(X1336, X1337, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X1336)
      call mem%alloc(X1338, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X1338, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1339, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X1337, &
         wf%n_o**2, &
         X1338, &
         wf%n_o**2, &
         zero, &
         X1339, &
         wf%n_o**2)
!
      call mem%dealloc(X1337)
      call mem%dealloc(X1338)
      call mem%alloc(X1340, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X1339, X1340, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X1339)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1340, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1340)
      call mem%alloc(X1341, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1432(g_ooov, X1341, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1342, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X1342, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1343, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X1341, &
         wf%n_v*wf%n_o, &
         X1342, &
         wf%n_o, &
         zero, &
         X1343, &
         wf%n_o**2)
!
      call mem%dealloc(X1341)
      call mem%dealloc(X1342)
      call mem%alloc(X1344, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1343, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1344, &
         wf%n_o**2)
!
      call mem%dealloc(X1343)
      call mem%alloc(X1345, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X1344, X1345, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X1344)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1345, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1345)
      call mem%alloc(X1346, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X1346, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1347, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         two, &
         X1346, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X1347, 1)
!
      call mem%dealloc(X1346)
      call mem%alloc(X1348, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X1347, &
         wf%n_o, &
         zero, &
         X1348, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1347)
      call mem%alloc(X1349, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1348, 1, &
         rxI_v, 1, &
         X1349, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1348)
      call add_1423_to_1234(one, X1349, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1349)
      call mem%alloc(X1350, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X1350, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1351, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         two, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X1350, &
         wf%n_v*wf%n_o, &
         zero, &
         X1351, &
         wf%n_o)
!
      call mem%dealloc(X1350)
      call mem%alloc(X1352, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X1351, &
         wf%n_o**2, &
         zero, &
         X1352, &
         wf%n_v)
!
      call mem%dealloc(X1351)
      call mem%alloc(X1353, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1352, 1, &
         rxI_v, 1, &
         X1353, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1352)
      call add_1423_to_1234(one, X1353, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1353)
      call mem%alloc(X1354, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**3, &
         wf%n_v, &
         two, &
         g_ooov, &
         wf%n_o**3, &
         rxI_v, 1, &
         zero, &
         X1354, 1)
!
      call mem%alloc(X1355, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X1354, &
         wf%n_o, &
         zero, &
         X1355, &
         wf%n_v)
!
      call mem%dealloc(X1354)
      call mem%alloc(X1356, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(tAxxx_ovo, X1356, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1357, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1356, &
         wf%n_v*wf%n_o, &
         X1355, &
         wf%n_v*wf%n_o, &
         zero, &
         X1357, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1355)
      call mem%dealloc(X1356)
      call add_1432_to_1234(one, X1357, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1357)
      call mem%alloc(X1358, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X1358, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1359, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         two, &
         X1358, &
         wf%n_o, &
         g_vvov, &
         wf%n_v**2, &
         zero, &
         X1359, &
         wf%n_o)
!
      call mem%dealloc(X1358)
      call mem%alloc(X1360, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1359, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1360, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1359)
      call mem%alloc(X1361, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(X1360, X1361, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1360)
      call mem%alloc(X1362, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1361, 1, &
         rxI_v, 1, &
         X1362, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1361)
      call add_1243_to_1234(one, X1362, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1362)
      call mem%alloc(X1363, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_1432(g_vvov, X1363, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1364, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         two, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X1363, &
         wf%n_v**2, &
         zero, &
         X1364, &
         wf%n_o)
!
      call mem%dealloc(X1363)
      call mem%alloc(X1365, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1364, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1365, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1364)
      call mem%alloc(X1366, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(X1365, X1366, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1365)
      call mem%alloc(X1367, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1366, 1, &
         rxI_v, 1, &
         X1367, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1366)
      call add_1243_to_1234(one, X1367, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1367)
      call mem%alloc(X1368, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_vvov, X1368, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1369, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         X1368, &
         wf%n_v**2*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1369, 1)
!
      call mem%dealloc(X1368)
      call mem%alloc(X1370, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1369, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1370, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1369)
      call mem%alloc(X1371, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X1370, X1371, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1370)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1371, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1371)
      call mem%alloc(X1372, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1372, 1)
!
      call mem%alloc(X1373, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X1372, X1373, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X1372)
      call mem%alloc(X1374, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X1374, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1375, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X1373, &
         wf%n_v*wf%n_o, &
         X1374, &
         wf%n_o**2, &
         zero, &
         X1375, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1373)
      call mem%dealloc(X1374)
      call mem%alloc(X1376, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X1375, X1376, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X1375)
      call mem%alloc(X1377, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1376, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1377, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1376)
      call add_1423_to_1234(one, X1377, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1377)
      call mem%alloc(X1378, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X1378, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1379, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         g_ooov, &
         wf%n_o**2, &
         X1378, &
         wf%n_o, &
         zero, &
         X1379, &
         wf%n_o**2)
!
      call mem%dealloc(X1378)
      call mem%alloc(X1380, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1379, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1380, &
         wf%n_o**2)
!
      call mem%dealloc(X1379)
      call mem%alloc(X1381, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X1380, X1381, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X1380)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1381, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1381)
      call mem%alloc(X1382, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X1382, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1383, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -two, &
         X1382, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X1383, 1)
!
      call mem%dealloc(X1382)
      call mem%alloc(X1384, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1383, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X1384, &
         wf%n_o)
!
      call mem%dealloc(X1383)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1384, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1384)
      call mem%alloc(X1385, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**3, &
         wf%n_v, &
         -two, &
         tAxxI_ov, &
         wf%n_o, &
         g_ooov, &
         wf%n_o**3, &
         zero, &
         X1385, &
         wf%n_o)
!
      call mem%alloc(X1386, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X1385, X1386, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X1385)
      call mem%alloc(X1387, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X1387, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1388, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o**2, &
         one, &
         X1387, &
         wf%n_o**2, &
         X1386, &
         wf%n_o**2, &
         zero, &
         X1388, &
         wf%n_v)
!
      call mem%dealloc(X1386)
      call mem%dealloc(X1387)
      call mem%alloc(X1389, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1388, 1, &
         rxI_v, 1, &
         X1389, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1388)
      call add_1423_to_1234(one, X1389, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1389)
      call mem%alloc(X1390, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**3, &
         wf%n_v, &
         -two, &
         g_ooov, &
         wf%n_o**3, &
         rxI_v, 1, &
         zero, &
         X1390, 1)
!
      call mem%alloc(X1391, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_213(X1390, X1391, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X1390)
      call mem%alloc(X1392, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X1391, &
         wf%n_o**2, &
         zero, &
         X1392, &
         wf%n_v)
!
      call mem%dealloc(X1391)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1392, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1392)
      call mem%alloc(X1393, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**3, &
         wf%n_v, &
         -two, &
         g_ooov, &
         wf%n_o**3, &
         rxI_v, 1, &
         zero, &
         X1393, 1)
!
      call mem%alloc(X1394, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1393, &
         wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1394, &
         wf%n_o**2)
!
      call mem%dealloc(X1393)
      call mem%alloc(X1395, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(uAxxx_ovo, X1395, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1396, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1395, &
         wf%n_v*wf%n_o, &
         X1394, &
         wf%n_o, &
         zero, &
         X1396, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1394)
      call mem%dealloc(X1395)
      call add_1423_to_1234(one, X1396, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1396)
      call mem%alloc(X1397, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X1397, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1398, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         two, &
         tAxxx_ovo, &
         wf%n_o, &
         X1397, &
         wf%n_v**2, &
         zero, &
         X1398, &
         wf%n_o)
!
      call mem%dealloc(X1397)
      call mem%alloc(X1399, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1398, &
         wf%n_v*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1399, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1398)
      call mem%alloc(X1400, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(X1399, X1400, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1399)
      call mem%alloc(X1401, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1400, 1, &
         rxI_v, 1, &
         X1401, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1400)
      call add_1423_to_1234(one, X1401, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1401)
      call mem%alloc(X1402, wf%n_v, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_1423(g_vvov, X1402, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1403, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         two, &
         X1402, &
         wf%n_v**2, &
         uAIxx_vo, 1, &
         zero, &
         X1403, 1)
!
      call mem%dealloc(X1402)
      call mem%alloc(X1404, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X1404, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1405, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X1403, &
         wf%n_v, &
         X1404, &
         wf%n_o**2, &
         zero, &
         X1405, &
         wf%n_v)
!
      call mem%dealloc(X1403)
      call mem%dealloc(X1404)
      call mem%alloc(X1406, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1405, 1, &
         rxI_v, 1, &
         X1406, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1405)
      call add_1423_to_1234(one, X1406, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1406)
      call mem%alloc(X1407, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_vvov, X1407, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1408, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         X1407, &
         wf%n_v**2*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1408, 1)
!
      call mem%dealloc(X1407)
      call mem%alloc(X1409, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1408, &
         wf%n_v*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1409, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1408)
      call mem%alloc(X1410, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X1409, X1410, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1409)
      call mem%alloc(X1411, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1410, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X1411, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1410)
      call add_1423_to_1234(one, X1411, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1411)
      call mem%alloc(X1412, wf%n_v, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_1342(g_vvov, X1412, wf%n_v, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1413, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         X1412, &
         wf%n_v**2*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1413, 1)
!
      call mem%dealloc(X1412)
      call mem%alloc(X1414, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X1414, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1415, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X1413, &
         wf%n_v*wf%n_o, &
         X1414, &
         wf%n_o**2, &
         zero, &
         X1415, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1413)
      call mem%dealloc(X1414)
      call mem%alloc(X1416, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1342(X1415, X1416, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X1415)
      call mem%alloc(X1417, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1416, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1417, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1416)
      call add_1243_to_1234(one, X1417, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1417)
      call mem%alloc(X1418, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         two, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1418, 1)
!
      call mem%alloc(X1419, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X1418, X1419, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X1418)
      call mem%alloc(X1420, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1419, &
         wf%n_v*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1420, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1419)
      call mem%alloc(X1421, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X1420, X1421, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1420)
      call mem%alloc(X1422, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1421, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X1422, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1421)
      call add_1432_to_1234(one, X1422, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1422)
      call mem%alloc(X1423, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**3, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         g_ooov, &
         wf%n_o**3, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1423, &
         wf%n_o**3)
!
      call mem%alloc(X1424, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_1324(X1423, X1424, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X1423)
      call mem%alloc(X1425, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X1425, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1426, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X1424, &
         wf%n_o**2, &
         X1425, &
         wf%n_o**2, &
         zero, &
         X1426, &
         wf%n_o**2)
!
      call mem%dealloc(X1424)
      call mem%dealloc(X1425)
      call mem%alloc(X1427, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X1426, X1427, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X1426)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1427, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1427)
      call mem%alloc(X1428, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1432(g_ooov, X1428, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1429, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X1428, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X1429, &
         wf%n_o**2)
!
      call mem%dealloc(X1428)
      call mem%alloc(X1430, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1429, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1430, &
         wf%n_o**2)
!
      call mem%dealloc(X1429)
      call mem%alloc(X1431, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X1430, X1431, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X1430)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1431, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1431)
      call mem%alloc(X1432, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X1432, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1433, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X1433, wf%n_v, wf%n_o)
      call mem%alloc(X1434, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         -two, &
         X1432, &
         wf%n_v*wf%n_o, &
         X1433, 1, &
         zero, &
         X1434, 1)
!
      call mem%dealloc(X1432)
      call mem%dealloc(X1433)
      call mem%alloc(X1435, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(tAxxx_ovo, X1435, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1436, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X1435, &
         wf%n_v*wf%n_o, &
         X1434, &
         wf%n_o, &
         zero, &
         X1436, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1434)
      call mem%dealloc(X1435)
      call mem%alloc(X1437, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1436, 1, &
         rxI_v, 1, &
         X1437, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1436)
      call add_1423_to_1234(one, X1437, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1437)
      call mem%alloc(X1438, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(g_ooov, X1438, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1439, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X1439, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1440, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         -two, &
         X1439, &
         wf%n_o, &
         X1438, &
         wf%n_v*wf%n_o, &
         zero, &
         X1440, &
         wf%n_o)
!
      call mem%dealloc(X1438)
      call mem%dealloc(X1439)
      call mem%alloc(X1441, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X1440, &
         wf%n_o**2, &
         zero, &
         X1441, &
         wf%n_v)
!
      call mem%dealloc(X1440)
      call mem%alloc(X1442, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1441, 1, &
         rxI_v, 1, &
         X1442, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1441)
      call add_1423_to_1234(one, X1442, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1442)
      call mem%alloc(X1443, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**3, &
         wf%n_v, &
         -two, &
         g_ooov, &
         wf%n_o**3, &
         rxI_v, 1, &
         zero, &
         X1443, 1)
!
      call mem%alloc(X1444, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X1443, &
         wf%n_o, &
         zero, &
         X1444, &
         wf%n_v)
!
      call mem%dealloc(X1443)
      call mem%alloc(X1445, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X1444, &
         wf%n_v*wf%n_o, &
         zero, &
         X1445, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1444)
      call add_1432_to_1234(one, X1445, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1445)
      call mem%alloc(X1446, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X1446, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1447, wf%n_o, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -two, &
         X1446, &
         wf%n_o, &
         g_vvov, &
         wf%n_v**2, &
         zero, &
         X1447, &
         wf%n_o)
!
      call mem%dealloc(X1446)
      call mem%alloc(X1448, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1447, &
         wf%n_v*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1448, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1447)
      call mem%alloc(X1449, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(X1448, X1449, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1448)
      call mem%alloc(X1450, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1449, 1, &
         rxI_v, 1, &
         X1450, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1449)
      call add_1423_to_1234(one, X1450, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1450)
      call mem%alloc(X1451, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X1451, wf%n_v, wf%n_o)
      call mem%alloc(X1452, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_v*wf%n_o, &
         -two, &
         g_vvov, &
         wf%n_v**2, &
         X1451, 1, &
         zero, &
         X1452, 1)
!
      call mem%dealloc(X1451)
      call mem%alloc(X1453, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X1453, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1454, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X1452, &
         wf%n_v, &
         X1453, &
         wf%n_o**2, &
         zero, &
         X1454, &
         wf%n_v)
!
      call mem%dealloc(X1452)
      call mem%dealloc(X1453)
      call mem%alloc(X1455, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1454, 1, &
         rxI_v, 1, &
         X1455, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1454)
      call add_1423_to_1234(one, X1455, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1455)
      call mem%alloc(X1456, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_v, &
         -two, &
         g_vvov, &
         wf%n_v**2*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1456, 1)
!
      call mem%alloc(X1457, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(X1456, X1457, wf%n_v, wf%n_v, wf%n_o)
      call mem%dealloc(X1456)
      call mem%alloc(X1458, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1457, &
         wf%n_v*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1458, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1457)
      call mem%alloc(X1459, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X1458, X1459, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1458)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1459, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1459)
      call mem%alloc(X1460, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X1460, wf%n_v, wf%n_o)
      call mem%alloc(X1461, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         two, &
         g_ooov, &
         wf%n_o**2, &
         X1460, 1, &
         zero, &
         X1461, 1)
!
      call mem%dealloc(X1460)
      call mem%alloc(X1462, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1461, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X1462, &
         wf%n_o)
!
      call mem%dealloc(X1461)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1462, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1462)
      call mem%alloc(X1463, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X1463, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1464, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         g_ooov, &
         wf%n_o**2, &
         X1463, &
         wf%n_o, &
         zero, &
         X1464, &
         wf%n_o**2)
!
      call mem%dealloc(X1463)
      call mem%alloc(X1465, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X1464, &
         wf%n_o, &
         zero, &
         X1465, &
         wf%n_v)
!
      call mem%dealloc(X1464)
      call mem%alloc(X1466, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1465, 1, &
         rxI_v, 1, &
         X1466, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1465)
      call add_1243_to_1234(one, X1466, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1466)
      call mem%alloc(X1467, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X1467, wf%n_v, wf%n_o)
      call mem%alloc(X1468, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         two, &
         g_ooov, &
         wf%n_o**2, &
         X1467, 1, &
         zero, &
         X1468, 1)
!
      call mem%dealloc(X1467)
      call mem%alloc(X1469, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(uAxxx_ovo, X1469, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1470, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X1469, &
         wf%n_v*wf%n_o, &
         X1468, &
         wf%n_o, &
         zero, &
         X1470, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1468)
      call mem%dealloc(X1469)
      call mem%alloc(X1471, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1470, 1, &
         rxI_v, 1, &
         X1471, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1470)
      call add_1423_to_1234(one, X1471, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1471)
      call mem%alloc(X1472, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**3, &
         wf%n_v, &
         two, &
         g_ooov, &
         wf%n_o**3, &
         rxI_v, 1, &
         zero, &
         X1472, 1)
!
      call mem%alloc(X1473, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X1472, &
         wf%n_o, &
         zero, &
         X1473, &
         wf%n_v)
!
      call mem%dealloc(X1472)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1473, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1473)
      call mem%alloc(X1474, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         four, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X1474, &
         wf%n_v)
!
      call mem%alloc(X1475, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1474, &
         wf%n_v, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1475, &
         wf%n_v)
!
      call mem%dealloc(X1474)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1475, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1475)
      call mem%alloc(X1476, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X1476, &
         wf%n_v)
!
      call mem%alloc(X1477, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1476, &
         wf%n_v, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1477, &
         wf%n_v)
!
      call mem%dealloc(X1476)
      call mem%alloc(X1478, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1477, 1, &
         X1478, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1477)
      call add_1432_to_1234(one, X1478, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1478)
      call mem%alloc(X1479, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1479, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X1480, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X1480, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1481, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1479, &
         wf%n_v, &
         X1480, &
         wf%n_v*wf%n_o, &
         zero, &
         X1481, &
         wf%n_o**2)
!
      call mem%dealloc(X1479)
      call mem%dealloc(X1480)
      call mem%alloc(X1482, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(X1481, X1482, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1481)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X1482, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1482)
      call mem%alloc(X1483, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         r_vo, &
         wf%n_v, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1483, &
         wf%n_o)
!
      call mem%alloc(X1484, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X1483, X1484, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1483)
      call mem%alloc(X1485, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X1485, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1486, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X1485, &
         wf%n_v*wf%n_o, &
         X1484, &
         wf%n_o**2, &
         zero, &
         X1486, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1484)
      call mem%dealloc(X1485)
      call mem%alloc(X1487, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1486, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1487, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1486)
      call add_1423_to_1234(one, X1487, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1487)
      call mem%alloc(X1488, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1488, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1489, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X1489, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1490, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         four, &
         X1488, &
         wf%n_v**2, &
         X1489, &
         wf%n_v**2, &
         zero, &
         X1490, &
         wf%n_o)
!
      call mem%dealloc(X1488)
      call mem%dealloc(X1489)
      call mem%alloc(X1491, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X1490, &
         wf%n_o, &
         zero, &
         X1491, &
         wf%n_v)
!
      call mem%dealloc(X1490)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1491, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1491)
      call mem%alloc(X1492, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1492, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1493, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X1493, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1494, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         -two, &
         X1492, &
         wf%n_v**2, &
         X1493, &
         wf%n_v**2, &
         zero, &
         X1494, &
         wf%n_o)
!
      call mem%dealloc(X1492)
      call mem%dealloc(X1493)
      call mem%alloc(X1495, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1494, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1495, &
         wf%n_o)
!
      call mem%dealloc(X1494)
      call mem%alloc(X1496, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1495, 1, &
         X1496, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1495)
      call add_1423_to_1234(one, X1496, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1496)
      call mem%alloc(X1497, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         r_vo, &
         wf%n_v, &
         gAxxx_vov, &
         wf%n_v, &
         zero, &
         X1497, &
         wf%n_o)
!
      call mem%alloc(X1498, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         X1497, &
         wf%n_o**2, &
         zero, &
         X1498, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1497)
      call mem%alloc(X1499, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1498, &
         wf%n_v*wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1499, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1498)
      call add_1423_to_1234(one, X1499, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1499)
      call mem%alloc(X1500, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         r_vo, &
         wf%n_v, &
         gAxxx_vov, &
         wf%n_v, &
         zero, &
         X1500, &
         wf%n_o)
!
      call mem%alloc(X1501, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X1500, &
         wf%n_o**2, &
         zero, &
         X1501, &
         wf%n_o)
!
      call mem%dealloc(X1500)
      call mem%alloc(X1502, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X1502, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1503, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X1502, &
         wf%n_v**2, &
         X1501, &
         wf%n_o**2, &
         zero, &
         X1503, &
         wf%n_v**2)
!
      call mem%dealloc(X1501)
      call mem%dealloc(X1502)
      call add_1342_to_1234(one, X1503, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1503)
      call mem%alloc(X1504, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1504, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1505, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -four, &
         X1504, &
         wf%n_v, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X1505, &
         wf%n_v)
!
      call mem%dealloc(X1504)
      call mem%alloc(X1506, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1505, &
         wf%n_v, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1506, &
         wf%n_v)
!
      call mem%dealloc(X1505)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1506, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1506)
      call mem%alloc(X1507, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1507, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1508, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         X1507, &
         wf%n_v, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X1508, &
         wf%n_v)
!
      call mem%dealloc(X1507)
      call mem%alloc(X1509, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1508, &
         wf%n_v, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1509, &
         wf%n_v)
!
      call mem%dealloc(X1508)
      call mem%alloc(X1510, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1509, 1, &
         X1510, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1509)
      call add_1432_to_1234(one, X1510, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1510)
      call mem%alloc(X1511, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         tAIxx_vo, &
         wf%n_v, &
         gAxxx_vov, &
         wf%n_v, &
         zero, &
         X1511, &
         wf%n_o)
!
      call mem%alloc(X1512, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(uxIxx_vvo, X1512, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1513, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X1512, &
         wf%n_v*wf%n_o, &
         X1511, &
         wf%n_o**2, &
         zero, &
         X1513, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1511)
      call mem%dealloc(X1512)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X1513, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1513)
      call mem%alloc(X1514, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -four, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, 1, &
         zero, &
         X1514, 1)
!
      call mem%alloc(X1515, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X1514, 1, &
         zero, &
         X1515, 1)
!
      call mem%dealloc(X1514)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1515, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1515)
      call mem%alloc(X1516, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, 1, &
         zero, &
         X1516, 1)
!
      call mem%alloc(X1517, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X1516, 1, &
         zero, &
         X1517, 1)
!
      call mem%dealloc(X1516)
      call mem%alloc(X1518, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1517, 1, &
         X1518, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1517)
      call add_1432_to_1234(one, X1518, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1518)
      call mem%alloc(X1519, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         gAxxx_vov, &
         wf%n_v, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1519, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X1520, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X1519, X1520, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1519)
      call mem%alloc(X1521, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1520, &
         wf%n_o**2, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1521, &
         wf%n_o**2)
!
      call mem%dealloc(X1520)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X1521, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1521)
      call mem%alloc(X1522, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         gAxxx_vov, &
         wf%n_v, &
         r_vo, &
         wf%n_v, &
         zero, &
         X1522, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X1523, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X1522, X1523, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1522)
      call mem%alloc(X1524, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1523, &
         wf%n_o**2, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1524, &
         wf%n_o**2)
!
      call mem%dealloc(X1523)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X1524, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1524)
      call mem%alloc(X1525, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X1525, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X1526, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1525, &
         wf%n_v, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1526, &
         wf%n_o**2)
!
      call mem%dealloc(X1525)
      call mem%alloc(X1527, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X1527, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1528, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X1527, &
         wf%n_v**2, &
         X1526, &
         wf%n_o, &
         zero, &
         X1528, &
         wf%n_v**2)
!
      call mem%dealloc(X1526)
      call mem%dealloc(X1527)
      call add_1324_to_1234(one, X1528, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1528)
      call mem%alloc(X1529, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         four, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X1529, &
         wf%n_v)
!
      call mem%alloc(X1530, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1529, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1530, &
         wf%n_v)
!
      call mem%dealloc(X1529)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1530, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1530)
      call mem%alloc(X1531, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X1531, &
         wf%n_v)
!
      call mem%alloc(X1532, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1531, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1532, &
         wf%n_v)
!
      call mem%dealloc(X1531)
      call mem%alloc(X1533, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1532, 1, &
         X1533, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1532)
      call add_1432_to_1234(one, X1533, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1533)
      call mem%alloc(X1534, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1534, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X1535, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X1535, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1536, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1534, &
         wf%n_v, &
         X1535, &
         wf%n_v*wf%n_o, &
         zero, &
         X1536, &
         wf%n_o**2)
!
      call mem%dealloc(X1534)
      call mem%dealloc(X1535)
      call mem%alloc(X1537, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(X1536, X1537, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1536)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X1537, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1537)
      call mem%alloc(X1538, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         r_vo, &
         wf%n_v, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1538, &
         wf%n_o)
!
      call mem%alloc(X1539, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X1538, X1539, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1538)
      call mem%alloc(X1540, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X1540, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1541, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X1540, &
         wf%n_v*wf%n_o, &
         X1539, &
         wf%n_o**2, &
         zero, &
         X1541, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1539)
      call mem%dealloc(X1540)
      call mem%alloc(X1542, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1541, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1542, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1541)
      call add_1423_to_1234(one, X1542, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1542)
      call mem%alloc(X1543, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1543, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1544, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X1544, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1545, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         four, &
         X1543, &
         wf%n_v**2, &
         X1544, &
         wf%n_v**2, &
         zero, &
         X1545, &
         wf%n_o)
!
      call mem%dealloc(X1543)
      call mem%dealloc(X1544)
      call mem%alloc(X1546, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X1545, &
         wf%n_o, &
         zero, &
         X1546, &
         wf%n_v)
!
      call mem%dealloc(X1545)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1546, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1546)
      call mem%alloc(X1547, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1547, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1548, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X1548, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1549, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         -two, &
         X1547, &
         wf%n_v**2, &
         X1548, &
         wf%n_v**2, &
         zero, &
         X1549, &
         wf%n_o)
!
      call mem%dealloc(X1547)
      call mem%dealloc(X1548)
      call mem%alloc(X1550, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1549, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1550, &
         wf%n_o)
!
      call mem%dealloc(X1549)
      call mem%alloc(X1551, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1550, 1, &
         X1551, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1550)
      call add_1423_to_1234(one, X1551, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1551)
      call mem%alloc(X1552, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1552, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X1553, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1552, &
         wf%n_v, &
         r_vo, &
         wf%n_v, &
         zero, &
         X1553, &
         wf%n_o**2)
!
      call mem%dealloc(X1552)
      call mem%alloc(X1554, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X1554, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1555, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X1554, &
         wf%n_v**2, &
         X1553, &
         wf%n_o, &
         zero, &
         X1555, &
         wf%n_v**2)
!
      call mem%dealloc(X1553)
      call mem%dealloc(X1554)
      call add_1342_to_1234(one, X1555, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1555)
      call mem%alloc(X1556, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         r_vo, &
         wf%n_v, &
         gAxxx_vov, &
         wf%n_v, &
         zero, &
         X1556, &
         wf%n_o)
!
      call mem%alloc(X1557, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         X1556, &
         wf%n_o**2, &
         zero, &
         X1557, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1556)
      call mem%alloc(X1558, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1557, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1558, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1557)
      call add_1423_to_1234(one, X1558, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1558)
      call mem%alloc(X1559, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1559, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1560, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -four, &
         X1559, &
         wf%n_v, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X1560, &
         wf%n_v)
!
      call mem%dealloc(X1559)
      call mem%alloc(X1561, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1560, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1561, &
         wf%n_v)
!
      call mem%dealloc(X1560)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1561, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1561)
      call mem%alloc(X1562, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1562, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1563, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         X1562, &
         wf%n_v, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X1563, &
         wf%n_v)
!
      call mem%dealloc(X1562)
      call mem%alloc(X1564, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1563, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1564, &
         wf%n_v)
!
      call mem%dealloc(X1563)
      call mem%alloc(X1565, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1564, 1, &
         X1565, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1564)
      call add_1432_to_1234(one, X1565, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1565)
      call mem%alloc(X1566, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         tAxxI_ov, &
         wf%n_o, &
         gAxxx_vov, &
         wf%n_v, &
         zero, &
         X1566, &
         wf%n_o)
!
      call mem%alloc(X1567, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(uxIxx_vvo, X1567, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1568, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X1567, &
         wf%n_v*wf%n_o, &
         X1566, &
         wf%n_o**2, &
         zero, &
         X1568, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1566)
      call mem%dealloc(X1567)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X1568, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1568)
      call mem%alloc(X1569, wf%n_v, wf%n_o)
      call sort_to_21(tAxxI_ov, X1569, wf%n_o, wf%n_v)
      call mem%alloc(X1570, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -four, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X1569, 1, &
         zero, &
         X1570, 1)
!
      call mem%dealloc(X1569)
      call mem%alloc(X1571, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X1570, 1, &
         zero, &
         X1571, 1)
!
      call mem%dealloc(X1570)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1571, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1571)
      call mem%alloc(X1572, wf%n_v, wf%n_o)
      call sort_to_21(tAxxI_ov, X1572, wf%n_o, wf%n_v)
      call mem%alloc(X1573, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X1572, 1, &
         zero, &
         X1573, 1)
!
      call mem%dealloc(X1572)
      call mem%alloc(X1574, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X1573, 1, &
         zero, &
         X1574, 1)
!
      call mem%dealloc(X1573)
      call mem%alloc(X1575, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1574, 1, &
         X1575, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1574)
      call add_1432_to_1234(one, X1575, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1575)
      call mem%alloc(X1576, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         gAxxx_vov, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1576, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X1577, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X1576, X1577, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1576)
      call mem%alloc(X1578, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1577, &
         wf%n_o**2, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1578, &
         wf%n_o**2)
!
      call mem%dealloc(X1577)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X1578, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1578)
      call mem%alloc(X1579, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         gAxxx_vov, &
         wf%n_v, &
         r_vo, &
         wf%n_v, &
         zero, &
         X1579, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X1580, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X1579, X1580, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1579)
      call mem%alloc(X1581, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1580, &
         wf%n_o**2, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1581, &
         wf%n_o**2)
!
      call mem%dealloc(X1580)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X1581, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1581)
      call mem%alloc(X1582, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         tAxxI_ov, &
         wf%n_o, &
         gAxxx_vov, &
         wf%n_v, &
         zero, &
         X1582, &
         wf%n_o)
!
      call mem%alloc(X1583, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         r_vo, &
         wf%n_v, &
         X1582, &
         wf%n_o**2, &
         zero, &
         X1583, &
         wf%n_o)
!
      call mem%dealloc(X1582)
      call mem%alloc(X1584, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X1584, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1585, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X1584, &
         wf%n_v**2, &
         X1583, &
         wf%n_o**2, &
         zero, &
         X1585, &
         wf%n_v**2)
!
      call mem%dealloc(X1583)
      call mem%dealloc(X1584)
      call add_1324_to_1234(one, X1585, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1585)
      call mem%alloc(X1586, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         four, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X1586, &
         wf%n_v)
!
      call mem%alloc(X1587, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X1586, &
         wf%n_v, &
         zero, &
         X1587, &
         wf%n_v)
!
      call mem%dealloc(X1586)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1587, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1587)
      call mem%alloc(X1588, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(tAxxx_ovo, X1588, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1589, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         four, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X1588, &
         wf%n_v*wf%n_o, &
         zero, &
         X1589, &
         wf%n_v)
!
      call mem%dealloc(X1588)
      call mem%alloc(X1590, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X1589, &
         wf%n_v, &
         zero, &
         X1590, &
         wf%n_v)
!
      call mem%dealloc(X1589)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1590, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1590)
      call mem%alloc(X1591, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X1591, &
         wf%n_v)
!
      call mem%alloc(X1592, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X1591, &
         wf%n_v, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X1592, &
         wf%n_o)
!
      call mem%dealloc(X1591)
      call mem%alloc(X1593, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1592, 1, &
         X1593, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1592)
      call add_1423_to_1234(one, X1593, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1593)
      call mem%alloc(X1594, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(tAxxx_ovo, X1594, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1595, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X1594, &
         wf%n_v*wf%n_o, &
         zero, &
         X1595, &
         wf%n_v)
!
      call mem%dealloc(X1594)
      call mem%alloc(X1596, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X1595, &
         wf%n_v, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X1596, &
         wf%n_o)
!
      call mem%dealloc(X1595)
      call mem%alloc(X1597, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1596, 1, &
         X1597, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1596)
      call add_1423_to_1234(one, X1597, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1597)
      call mem%alloc(X1598, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X1598, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X1599, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X1599, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1600, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1599, &
         wf%n_o**2, &
         X1598, &
         wf%n_v, &
         zero, &
         X1600, &
         wf%n_o**2)
!
      call mem%dealloc(X1598)
      call mem%dealloc(X1599)
      call mem%alloc(X1601, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(X1600, X1601, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X1600)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X1601, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1601)
      call mem%alloc(X1602, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(tAxxx_ovo, X1602, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1603, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         X1602, &
         wf%n_o**2, &
         gAxxx_vov, &
         wf%n_v, &
         zero, &
         X1603, &
         wf%n_o**2)
!
      call mem%dealloc(X1602)
      call mem%alloc(X1604, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X1603, &
         wf%n_o**3, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X1604, &
         wf%n_o**3)
!
      call mem%dealloc(X1603)
      call mem%alloc(X1605, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(X1604, X1605, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X1604)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X1605, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1605)
      call mem%alloc(X1606, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         r_vo, &
         wf%n_v, &
         gAxxx_vov, &
         wf%n_v, &
         zero, &
         X1606, &
         wf%n_o)
!
      call mem%alloc(X1607, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X1606, &
         wf%n_o**2, &
         zero, &
         X1607, &
         wf%n_v)
!
      call mem%dealloc(X1606)
      call mem%alloc(X1608, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(tAxxx_ovo, X1608, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1609, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1608, &
         wf%n_v*wf%n_o, &
         X1607, &
         wf%n_v*wf%n_o, &
         zero, &
         X1609, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1607)
      call mem%dealloc(X1608)
      call add_1432_to_1234(one, X1609, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1609)
      call mem%alloc(X1610, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         r_vo, &
         wf%n_v, &
         gAxxx_vov, &
         wf%n_v, &
         zero, &
         X1610, &
         wf%n_o)
!
      call mem%alloc(X1611, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X1610, &
         wf%n_o**2, &
         zero, &
         X1611, &
         wf%n_v)
!
      call mem%dealloc(X1610)
      call mem%alloc(X1612, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X1611, &
         wf%n_v*wf%n_o, &
         zero, &
         X1612, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1611)
      call add_1432_to_1234(one, X1612, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1612)
      call mem%alloc(X1613, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X1613, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1614, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -four, &
         gAxxx_vov, &
         wf%n_v, &
         X1613, &
         wf%n_o, &
         zero, &
         X1614, &
         wf%n_v)
!
      call mem%dealloc(X1613)
      call mem%alloc(X1615, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X1614, &
         wf%n_v, &
         zero, &
         X1615, &
         wf%n_v)
!
      call mem%dealloc(X1614)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1615, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1615)
      call mem%alloc(X1616, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1616, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1617, wf%n_o)
!
      call dgemv('T', &
         wf%n_v**2, &
         wf%n_o, &
         -four, &
         X1616, &
         wf%n_v**2, &
         txIxI_vv, 1, &
         zero, &
         X1617, 1)
!
      call mem%dealloc(X1616)
      call mem%alloc(X1618, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X1617, 1, &
         zero, &
         X1618, 1)
!
      call mem%dealloc(X1617)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1618, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1618)
      call mem%alloc(X1619, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X1619, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1620, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         gAxxx_vov, &
         wf%n_v, &
         X1619, &
         wf%n_o, &
         zero, &
         X1620, &
         wf%n_v)
!
      call mem%dealloc(X1619)
      call mem%alloc(X1621, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X1620, &
         wf%n_v, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X1621, &
         wf%n_o)
!
      call mem%dealloc(X1620)
      call mem%alloc(X1622, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1621, 1, &
         X1622, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1621)
      call add_1423_to_1234(one, X1622, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1622)
      call mem%alloc(X1623, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1623, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1624, wf%n_o)
!
      call dgemv('T', &
         wf%n_v**2, &
         wf%n_o, &
         two, &
         X1623, &
         wf%n_v**2, &
         txIxI_vv, 1, &
         zero, &
         X1624, 1)
!
      call mem%dealloc(X1623)
      call mem%alloc(X1625, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X1624, 1, &
         zero, &
         X1625, 1)
!
      call mem%dealloc(X1624)
      call mem%alloc(X1626, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1625, 1, &
         X1626, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1625)
      call add_1432_to_1234(one, X1626, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1626)
      call mem%alloc(X1627, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         txIxI_vv, &
         wf%n_v, &
         gAxxx_vov, &
         wf%n_v, &
         zero, &
         X1627, &
         wf%n_v)
!
      call mem%alloc(X1628, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(uAxxx_ovo, X1628, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1629, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1628, &
         wf%n_o**2, &
         X1627, &
         wf%n_v*wf%n_o, &
         zero, &
         X1629, &
         wf%n_o**2)
!
      call mem%dealloc(X1627)
      call mem%dealloc(X1628)
      call mem%alloc(X1630, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(X1629, X1630, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1629)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X1630, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1630)
      call mem%alloc(X1631, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         r_vo, &
         wf%n_v, &
         gAxxx_vov, &
         wf%n_v, &
         zero, &
         X1631, &
         wf%n_o)
!
      call mem%alloc(X1632, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X1631, &
         wf%n_o**2, &
         zero, &
         X1632, &
         wf%n_v)
!
      call mem%dealloc(X1631)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1632, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1632)
      call mem%alloc(X1633, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X1633, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X1634, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         txIxI_vv, &
         wf%n_v, &
         X1633, &
         wf%n_v, &
         zero, &
         X1634, &
         wf%n_v)
!
      call mem%dealloc(X1633)
      call mem%alloc(X1635, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_132(X1634, X1635, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1634)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1635, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1635)
      call mem%alloc(X1636, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X1636, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X1637, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X1636, &
         wf%n_v, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X1637, &
         wf%n_o**2)
!
      call mem%dealloc(X1636)
      call mem%alloc(X1638, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(uAxxx_ovo, X1638, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1639, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1638, &
         wf%n_v*wf%n_o, &
         X1637, &
         wf%n_o, &
         zero, &
         X1639, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1637)
      call mem%dealloc(X1638)
      call add_1423_to_1234(one, X1639, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1639)
      call mem%alloc(X1640, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1640, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1641, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         -four, &
         X1640, &
         wf%n_v**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X1641, &
         wf%n_o)
!
      call mem%dealloc(X1640)
      call mem%alloc(X1642, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X1641, &
         wf%n_o, &
         zero, &
         X1642, &
         wf%n_v)
!
      call mem%dealloc(X1641)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1642, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1642)
      call mem%alloc(X1643, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1643, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1644, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         two, &
         X1643, &
         wf%n_v**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X1644, &
         wf%n_o)
!
      call mem%dealloc(X1643)
      call mem%alloc(X1645, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1644, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1645, &
         wf%n_o)
!
      call mem%dealloc(X1644)
      call mem%alloc(X1646, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1645, 1, &
         X1646, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1645)
      call add_1423_to_1234(one, X1646, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1646)
      call mem%alloc(X1647, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1647, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X1648, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1647, &
         wf%n_v, &
         r_vo, &
         wf%n_v, &
         zero, &
         X1648, &
         wf%n_o**2)
!
      call mem%dealloc(X1647)
      call mem%alloc(X1649, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X1648, &
         wf%n_o, &
         zero, &
         X1649, &
         wf%n_v**2)
!
      call mem%dealloc(X1648)
      call add_1342_to_1234(one, X1649, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1649)
      call mem%alloc(X1650, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         r_vo, &
         wf%n_v, &
         gAxxx_vov, &
         wf%n_v, &
         zero, &
         X1650, &
         wf%n_o)
!
      call mem%alloc(X1651, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X1651, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1652, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X1651, &
         wf%n_v*wf%n_o, &
         X1650, &
         wf%n_o**2, &
         zero, &
         X1652, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1650)
      call mem%dealloc(X1651)
      call mem%alloc(X1653, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1652, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1653, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1652)
      call add_1423_to_1234(one, X1653, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1653)
      call mem%alloc(X1654, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X1654, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1655, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -four, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X1654, &
         wf%n_v, &
         zero, &
         X1655, &
         wf%n_v)
!
      call mem%dealloc(X1654)
      call mem%alloc(X1656, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1655, &
         wf%n_v, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1656, &
         wf%n_v)
!
      call mem%dealloc(X1655)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1656, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1656)
      call mem%alloc(X1657, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X1657, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1658, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X1657, &
         wf%n_v, &
         zero, &
         X1658, &
         wf%n_v)
!
      call mem%dealloc(X1657)
      call mem%alloc(X1659, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1658, &
         wf%n_v, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1659, &
         wf%n_v)
!
      call mem%dealloc(X1658)
      call mem%alloc(X1660, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1659, 1, &
         X1660, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1659)
      call add_1432_to_1234(one, X1660, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1660)
      call mem%alloc(X1661, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1661, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X1662, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1661, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1662, &
         wf%n_o**2)
!
      call mem%dealloc(X1661)
      call mem%alloc(X1663, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(X1662, X1663, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1662)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X1663, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1663)
      call mem%alloc(X1664, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         r_vo, &
         wf%n_v, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1664, &
         wf%n_o)
!
      call mem%alloc(X1665, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X1664, X1665, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1664)
      call mem%alloc(X1666, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         X1665, &
         wf%n_o**2, &
         zero, &
         X1666, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1665)
      call mem%alloc(X1667, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1666, &
         wf%n_v*wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1667, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X1666)
      call add_1423_to_1234(one, X1667, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1667)
      call mem%alloc(X1668, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X1668, wf%n_v, wf%n_o)
      call mem%alloc(X1669, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         four, &
         gAxxx_vov, &
         wf%n_v, &
         X1668, 1, &
         zero, &
         X1669, 1)
!
      call mem%dealloc(X1668)
      call mem%alloc(X1670, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X1669, 1, &
         zero, &
         X1670, 1)
!
      call mem%dealloc(X1669)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1670, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1670)
      call mem%alloc(X1671, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X1671, wf%n_v, wf%n_o)
      call mem%alloc(X1672, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         gAxxx_vov, &
         wf%n_v, &
         X1671, 1, &
         zero, &
         X1672, 1)
!
      call mem%dealloc(X1671)
      call mem%alloc(X1673, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X1672, 1, &
         zero, &
         X1673, 1)
!
      call mem%dealloc(X1672)
      call mem%alloc(X1674, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1673, 1, &
         X1674, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1673)
      call add_1432_to_1234(one, X1674, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1674)
      call mem%alloc(X1675, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1675, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X1676, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1675, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1676, &
         wf%n_o**2)
!
      call mem%dealloc(X1675)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X1676, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1676)
      call mem%alloc(X1677, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         r_vo, &
         wf%n_v, &
         zero, &
         X1677, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X1678, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1677, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1678, &
         wf%n_o**2)
!
      call mem%dealloc(X1677)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X1678, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1678)
      call mem%alloc(X1679, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         t_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X1679, &
         wf%n_v)
!
      call mem%alloc(X1680, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X1680, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1681, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         rAI, &
         X1680, &
         wf%n_v*wf%n_o, &
         X1679, &
         wf%n_v, &
         zero, &
         X1681, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1679)
      call mem%dealloc(X1680)
      call add_1432_to_1234(rAI, X1681, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1681)
      call mem%alloc(X1682, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -eight, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         t_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X1682, &
         wf%n_v)
!
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         rAI, &
         X1682, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1682)
      call mem%alloc(X1683, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         four, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         t_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X1683, &
         wf%n_v)
!
      call mem%alloc(X1684, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         rAI, &
         X1683, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1684, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1683)
      call add_1432_to_1234(rAI, X1684, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1684)
      call mem%alloc(X1685, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(t_aibj, X1685, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1686, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         four, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X1685, &
         wf%n_v*wf%n_o, &
         zero, &
         X1686, &
         wf%n_v)
!
      call mem%dealloc(X1685)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         rAI, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         X1686, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1686)
      call mem%alloc(X1687, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1687, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1688, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         -four, &
         X1687, &
         wf%n_v**2, &
         uxIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X1688, &
         wf%n_o)
!
      call mem%dealloc(X1687)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         rAI, &
         t_aibj, &
         wf%n_v**2*wf%n_o, &
         X1688, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1688)
      call mem%alloc(X1689, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1689, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1690, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         two, &
         X1689, &
         wf%n_v**2, &
         uxIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X1690, &
         wf%n_o)
!
      call mem%dealloc(X1689)
      call mem%alloc(X1691, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         rAI, &
         t_aibj, &
         wf%n_v**2*wf%n_o, &
         X1690, &
         wf%n_o, &
         zero, &
         X1691, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1690)
      call add_1432_to_1234(rAI, X1691, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1691)
      call mem%alloc(X1692, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(t_aibj, X1692, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1693, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X1692, &
         wf%n_v*wf%n_o, &
         zero, &
         X1693, &
         wf%n_v)
!
      call mem%dealloc(X1692)
      call mem%alloc(X1694, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X1694, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1695, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         rAI, &
         X1694, &
         wf%n_v*wf%n_o, &
         X1693, &
         wf%n_v, &
         zero, &
         X1695, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1693)
      call mem%dealloc(X1694)
      call add_1432_to_1234(rAI, X1695, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1695)
      call mem%alloc(X1696, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1696, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1697, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X1697, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1698, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v**2, &
         two, &
         X1696, &
         wf%n_v**2, &
         X1697, &
         wf%n_v**2, &
         zero, &
         X1698, &
         wf%n_o)
!
      call mem%dealloc(X1696)
      call mem%dealloc(X1697)
      call mem%alloc(X1699, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         rAI, &
         txIxx_vvo, &
         wf%n_v**2, &
         X1698, &
         wf%n_o, &
         zero, &
         X1699, &
         wf%n_v**2)
!
      call mem%dealloc(X1698)
      call add_1324_to_1234(rAI, X1699, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1699)
      call mem%alloc(X1700, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X1700, &
         wf%n_v)
!
      call mem%alloc(X1701, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X1701, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         rAI, &
         X1701, &
         wf%n_v*wf%n_o, &
         X1700, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1700)
      call mem%dealloc(X1701)
      call mem%alloc(X1702, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1702, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1703, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X1702, &
         wf%n_v, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X1703, &
         wf%n_v)
!
      call mem%dealloc(X1702)
      call mem%alloc(X1704, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         rAI, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X1703, &
         wf%n_v, &
         zero, &
         X1704, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1703)
      call add_1432_to_1234(rAI, X1704, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1704)
      call mem%alloc(X1705, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1705, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1706, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         four, &
         X1705, &
         wf%n_v, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X1706, &
         wf%n_v)
!
      call mem%dealloc(X1705)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         rAI, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X1706, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1706)
      call mem%alloc(X1707, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         t_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X1707, &
         wf%n_v)
!
      call mem%alloc(X1708, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X1707, &
         wf%n_v, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X1708, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1707)
      call mem%alloc(X1709, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1708, 1, &
         rAx_o, 1, &
         X1709, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1708)
      call add_1432_to_1234(one, X1709, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1709)
      call mem%alloc(X1710, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(t_aibj, X1710, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1711, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X1710, &
         wf%n_v*wf%n_o, &
         zero, &
         X1711, &
         wf%n_v)
!
      call mem%dealloc(X1710)
      call mem%alloc(X1712, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X1711, &
         wf%n_v, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X1712, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1711)
      call mem%alloc(X1713, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1712, 1, &
         rAx_o, 1, &
         X1713, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1712)
      call add_1432_to_1234(one, X1713, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1713)
      call mem%alloc(X1714, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1714, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1715, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X1714, &
         wf%n_v, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X1715, &
         wf%n_v)
!
      call mem%dealloc(X1714)
      call mem%alloc(X1716, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X1715, &
         wf%n_v, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X1716, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1715)
      call mem%alloc(X1717, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1716, 1, &
         rAx_o, 1, &
         X1717, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1716)
      call add_1432_to_1234(one, X1717, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1717)
      call mem%alloc(X1718, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1718, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1719, wf%n_o)
!
      call dgemv('T', &
         wf%n_v**2, &
         wf%n_o, &
         two, &
         X1718, &
         wf%n_v**2, &
         txIxI_vv, 1, &
         zero, &
         X1719, 1)
!
      call mem%dealloc(X1718)
      call mem%alloc(X1720, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v**2*wf%n_o, &
         X1719, 1, &
         zero, &
         X1720, 1)
!
      call mem%dealloc(X1719)
      call mem%alloc(X1721, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_312(X1720, X1721, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X1720)
      call mem%alloc(X1722, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1721, 1, &
         rAx_o, 1, &
         X1722, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1721)
      call add_1342_to_1234(one, X1722, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1722)
      call mem%alloc(X1723, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1723, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1724, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_o, &
         two, &
         X1723, &
         wf%n_v**2, &
         rAx_o, 1, &
         zero, &
         X1724, 1)
!
      call mem%dealloc(X1723)
      call mem%alloc(X1725, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X1724, &
         wf%n_v, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X1725, &
         wf%n_v)
!
      call mem%dealloc(X1724)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1725, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1725)
      call mem%alloc(X1726, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1726, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1727, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_o, &
         two, &
         X1726, &
         wf%n_v**2, &
         rAx_o, 1, &
         zero, &
         X1727, 1)
!
      call mem%dealloc(X1726)
      call mem%alloc(X1728, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X1727, &
         wf%n_v, &
         txIxI_vv, &
         wf%n_v, &
         zero, &
         X1728, &
         wf%n_v)
!
      call mem%dealloc(X1727)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1728, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1728)
      call mem%alloc(X1729, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X1729, &
         wf%n_v)
!
      call mem%alloc(X1730, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X1730, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1731, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X1730, &
         wf%n_v*wf%n_o, &
         X1729, &
         wf%n_v, &
         zero, &
         X1731, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1729)
      call mem%dealloc(X1730)
      call mem%alloc(X1732, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1731, 1, &
         rAx_o, 1, &
         X1732, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1731)
      call add_1432_to_1234(one, X1732, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1732)
      call mem%alloc(X1733, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1733, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1734, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_o, &
         -two, &
         X1733, &
         wf%n_v**2, &
         rAx_o, 1, &
         zero, &
         X1734, 1)
!
      call mem%dealloc(X1733)
      call mem%alloc(X1735, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X1735, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1736, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1734, &
         wf%n_v, &
         X1735, &
         wf%n_v*wf%n_o, &
         zero, &
         X1736, &
         wf%n_v)
!
      call mem%dealloc(X1734)
      call mem%dealloc(X1735)
      call mem%alloc(X1737, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X1737, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1738, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1737, &
         wf%n_v*wf%n_o, &
         X1736, &
         wf%n_v, &
         zero, &
         X1738, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1736)
      call mem%dealloc(X1737)
      call add_1432_to_1234(one, X1738, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1738)
      call mem%alloc(X1739, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1739, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1740, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X1740, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1741, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         -two, &
         X1739, &
         wf%n_v**2, &
         X1740, &
         wf%n_v**2, &
         zero, &
         X1741, &
         wf%n_o)
!
      call mem%dealloc(X1739)
      call mem%dealloc(X1740)
      call mem%alloc(X1742, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X1741, &
         wf%n_o, &
         zero, &
         X1742, &
         wf%n_v**2)
!
      call mem%dealloc(X1741)
      call mem%alloc(X1743, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1742, 1, &
         rAx_o, 1, &
         X1743, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1742)
      call add_1342_to_1234(one, X1743, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1743)
      call mem%alloc(X1744, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X1744, &
         wf%n_v)
!
      call mem%alloc(X1745, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         X1744, &
         wf%n_v, &
         zero, &
         X1745, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1744)
      call mem%alloc(X1746, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1745, 1, &
         rAx_o, 1, &
         X1746, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1745)
      call add_1432_to_1234(one, X1746, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1746)
      call mem%alloc(X1747, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1747, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1748, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_o, &
         four, &
         X1747, &
         wf%n_v**2, &
         rAx_o, 1, &
         zero, &
         X1748, 1)
!
      call mem%dealloc(X1747)
      call mem%alloc(X1749, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X1749, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1750, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1748, &
         wf%n_v, &
         X1749, &
         wf%n_v*wf%n_o, &
         zero, &
         X1750, &
         wf%n_v)
!
      call mem%dealloc(X1748)
      call mem%dealloc(X1749)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1750, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1750)
      call mem%alloc(X1751, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1751, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1752, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_o, &
         -two, &
         X1751, &
         wf%n_v**2, &
         rAx_o, 1, &
         zero, &
         X1752, 1)
!
      call mem%dealloc(X1751)
      call mem%alloc(X1753, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X1753, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1754, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1752, &
         wf%n_v, &
         X1753, &
         wf%n_v*wf%n_o, &
         zero, &
         X1754, &
         wf%n_v)
!
      call mem%dealloc(X1752)
      call mem%dealloc(X1753)
      call mem%alloc(X1755, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1754, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1755, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1754)
      call add_1432_to_1234(one, X1755, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1755)
      call mem%alloc(X1756, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1756, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1757, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         X1756, &
         wf%n_v, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X1757, &
         wf%n_v)
!
      call mem%dealloc(X1756)
      call mem%alloc(X1758, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X1758, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1759, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X1758, &
         wf%n_v*wf%n_o, &
         X1757, &
         wf%n_v, &
         zero, &
         X1759, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1757)
      call mem%dealloc(X1758)
      call mem%alloc(X1760, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1759, 1, &
         rAx_o, 1, &
         X1760, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1759)
      call add_1432_to_1234(one, X1760, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1760)
      call mem%alloc(X1761, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1761, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1762, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         two, &
         X1761, &
         wf%n_v**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X1762, &
         wf%n_o)
!
      call mem%dealloc(X1761)
      call mem%alloc(X1763, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         uxIxx_vvo, &
         wf%n_v**2, &
         X1762, &
         wf%n_o, &
         zero, &
         X1763, &
         wf%n_v**2)
!
      call mem%dealloc(X1762)
      call mem%alloc(X1764, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1763, 1, &
         rAx_o, 1, &
         X1764, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1763)
      call add_1342_to_1234(one, X1764, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1764)
      call mem%alloc(X1765, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X1765, &
         wf%n_v)
!
      call mem%alloc(X1766, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1765, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1766, &
         wf%n_v)
!
      call mem%dealloc(X1765)
      call mem%alloc(X1767, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1766, 1, &
         rAx_o, 1, &
         X1767, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1766)
      call add_1342_to_1234(one, X1767, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1767)
      call mem%alloc(X1768, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1768, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1769, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_o, &
         two, &
         X1768, &
         wf%n_v**2, &
         rAx_o, 1, &
         zero, &
         X1769, 1)
!
      call mem%dealloc(X1768)
      call mem%alloc(X1770, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1769, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1770, &
         wf%n_v)
!
      call mem%dealloc(X1769)
      call mem%alloc(X1771, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X1771, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1771, &
         wf%n_v*wf%n_o, &
         X1770, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1770)
      call mem%dealloc(X1771)
      call mem%alloc(X1772, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1772, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1773, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X1773, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1774, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         -two, &
         X1772, &
         wf%n_v**2, &
         X1773, &
         wf%n_v**2, &
         zero, &
         X1774, &
         wf%n_o)
!
      call mem%dealloc(X1772)
      call mem%dealloc(X1773)
      call mem%alloc(X1775, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X1775, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1776, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X1775, &
         wf%n_v**2, &
         X1774, &
         wf%n_o, &
         zero, &
         X1776, &
         wf%n_v**2)
!
      call mem%dealloc(X1774)
      call mem%dealloc(X1775)
      call mem%alloc(X1777, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1776, 1, &
         rAx_o, 1, &
         X1777, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1776)
      call add_1342_to_1234(one, X1777, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1777)
      call mem%alloc(X1778, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1778, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1779, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_o, &
         -eight, &
         X1778, &
         wf%n_v**2, &
         rAx_o, 1, &
         zero, &
         X1779, 1)
!
      call mem%dealloc(X1778)
      call mem%alloc(X1780, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1779, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1780, &
         wf%n_v)
!
      call mem%dealloc(X1779)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         X1780, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1780)
      call mem%alloc(X1781, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1781, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1782, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         X1781, &
         wf%n_v, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X1782, &
         wf%n_v)
!
      call mem%dealloc(X1781)
      call mem%alloc(X1783, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         X1782, &
         wf%n_v, &
         zero, &
         X1783, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1782)
      call mem%alloc(X1784, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1783, 1, &
         rAx_o, 1, &
         X1784, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1783)
      call add_1432_to_1234(one, X1784, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1784)
      call mem%alloc(X1785, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X1785, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1786, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X1785, &
         wf%n_v, &
         zero, &
         X1786, &
         wf%n_v)
!
      call mem%dealloc(X1785)
      call mem%alloc(X1787, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X1787, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1788, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X1787, &
         wf%n_v*wf%n_o, &
         X1786, &
         wf%n_v, &
         zero, &
         X1788, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1786)
      call mem%dealloc(X1787)
      call mem%alloc(X1789, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1788, 1, &
         rAx_o, 1, &
         X1789, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1788)
      call add_1432_to_1234(one, X1789, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1789)
      call mem%alloc(X1790, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X1790, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1791, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X1790, &
         wf%n_v, &
         zero, &
         X1791, &
         wf%n_v)
!
      call mem%dealloc(X1790)
      call mem%alloc(X1792, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1791, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1792, &
         wf%n_v)
!
      call mem%dealloc(X1791)
      call mem%alloc(X1793, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1792, 1, &
         rAx_o, 1, &
         X1793, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1792)
      call add_1342_to_1234(one, X1793, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1793)
      call mem%alloc(X1794, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1794, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1795, wf%n_v, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2, &
         wf%n_o, &
         two, &
         X1794, &
         wf%n_v**2, &
         rAx_o, 1, &
         zero, &
         X1795, 1)
!
      call mem%dealloc(X1794)
      call mem%alloc(X1796, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1795, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1796, &
         wf%n_v)
!
      call mem%dealloc(X1795)
      call mem%alloc(X1797, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X1796, &
         wf%n_v, &
         zero, &
         X1797, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1796)
      call add_1432_to_1234(one, X1797, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1797)
      call mem%alloc(X1798, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1798, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1799, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         X1798, &
         wf%n_v, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X1799, &
         wf%n_v)
!
      call mem%dealloc(X1798)
      call mem%alloc(X1800, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1799, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1800, &
         wf%n_v)
!
      call mem%dealloc(X1799)
      call mem%alloc(X1801, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X1800, 1, &
         rAx_o, 1, &
         X1801, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1800)
      call add_1342_to_1234(one, X1801, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1801)
      call mem%alloc(X1802, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1802, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X1803, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         t_aibj, &
         wf%n_v*wf%n_o, &
         X1802, &
         wf%n_v*wf%n_o, &
         zero, &
         X1803, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1802)
      call mem%alloc(X1804, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_213(X1803, X1804, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1803)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1804, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1804)
      call mem%alloc(X1805, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1805, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1806, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(t_aibj, X1806, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1807, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v**2, &
         -two, &
         X1805, &
         wf%n_v**2, &
         X1806, &
         wf%n_v**2, &
         zero, &
         X1807, &
         wf%n_o)
!
      call mem%dealloc(X1805)
      call mem%dealloc(X1806)
      call mem%alloc(X1808, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1807, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1808, &
         wf%n_o**2)
!
      call mem%dealloc(X1807)
      call mem%alloc(X1809, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X1808, X1809, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X1808)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1809, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1809)
      call mem%alloc(X1810, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1810, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X1811, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         t_aibj, &
         wf%n_v*wf%n_o, &
         X1810, &
         wf%n_v*wf%n_o, &
         zero, &
         X1811, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1810)
      call mem%alloc(X1812, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_213(X1811, X1812, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1811)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1812, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1812)
      call mem%alloc(X1813, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1813, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1814, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(t_aibj, X1814, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1815, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v**2, &
         -two, &
         X1813, &
         wf%n_v**2, &
         X1814, &
         wf%n_v**2, &
         zero, &
         X1815, &
         wf%n_o)
!
      call mem%dealloc(X1813)
      call mem%dealloc(X1814)
      call mem%alloc(X1816, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1815, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1816, &
         wf%n_o**2)
!
      call mem%dealloc(X1815)
      call mem%alloc(X1817, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X1816, X1817, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X1816)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1817, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1817)
      call mem%alloc(X1818, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1818, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X1819, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(t_aibj, X1819, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1820, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         X1819, &
         wf%n_v*wf%n_o, &
         X1818, &
         wf%n_v*wf%n_o, &
         zero, &
         X1820, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1818)
      call mem%dealloc(X1819)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1820, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1820)
      call mem%alloc(X1821, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1821, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1822, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(t_aibj, X1822, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1823, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v**2, &
         two, &
         X1821, &
         wf%n_v**2, &
         X1822, &
         wf%n_v**2, &
         zero, &
         X1823, &
         wf%n_o)
!
      call mem%dealloc(X1821)
      call mem%dealloc(X1822)
      call mem%alloc(X1824, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1823, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1824, &
         wf%n_o**2)
!
      call mem%dealloc(X1823)
      call mem%alloc(X1825, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X1824, X1825, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X1824)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1825, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1825)
      call mem%alloc(X1826, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         tAIxx_vo, &
         wf%n_v, &
         gAxxx_vov, &
         wf%n_v, &
         zero, &
         X1826, &
         wf%n_o)
!
      call mem%alloc(X1827, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X1826, X1827, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X1826)
      call mem%alloc(X1828, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X1827, &
         wf%n_o, &
         zero, &
         X1828, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1827)
      call mem%alloc(X1829, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_213(X1828, X1829, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1828)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1829, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1829)
      call mem%alloc(X1830, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         tAIxx_vo, 1, &
         zero, &
         X1830, 1)
!
      call mem%alloc(X1831, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         u_aibj, &
         wf%n_v, &
         X1830, 1, &
         zero, &
         X1831, 1)
!
      call mem%dealloc(X1830)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1831, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1831)
      call mem%alloc(X1832, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1832, 1)
!
      call mem%alloc(X1833, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1832, &
         wf%n_v, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1833, &
         wf%n_v)
!
      call mem%dealloc(X1832)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1833, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1833)
      call mem%alloc(X1834, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1834, 1)
!
      call mem%alloc(X1835, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1834, &
         wf%n_v, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1835, &
         wf%n_o)
!
      call mem%dealloc(X1834)
      call mem%alloc(X1836, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X1836, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1837, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X1836, &
         wf%n_v**2*wf%n_o, &
         X1835, &
         wf%n_o, &
         zero, &
         X1837, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1835)
      call mem%dealloc(X1836)
      call add_1342_to_1234(one, X1837, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1837)
      call mem%alloc(X1838, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         tAxxI_ov, &
         wf%n_o, &
         gAxxx_vov, &
         wf%n_v, &
         zero, &
         X1838, &
         wf%n_o)
!
      call mem%alloc(X1839, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X1838, X1839, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X1838)
      call mem%alloc(X1840, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         X1839, &
         wf%n_o, &
         zero, &
         X1840, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1839)
      call mem%alloc(X1841, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_213(X1840, X1841, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1840)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1841, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1841)
      call mem%alloc(X1842, wf%n_v, wf%n_o)
      call sort_to_21(tAxxI_ov, X1842, wf%n_o, wf%n_v)
      call mem%alloc(X1843, wf%n_v)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X1842, 1, &
         zero, &
         X1843, 1)
!
      call mem%dealloc(X1842)
      call mem%alloc(X1844, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         u_aibj, &
         wf%n_v, &
         X1843, 1, &
         zero, &
         X1844, 1)
!
      call mem%dealloc(X1843)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1844, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1844)
      call mem%alloc(X1845, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1845, 1)
!
      call mem%alloc(X1846, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1845, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1846, &
         wf%n_o)
!
      call mem%dealloc(X1845)
      call mem%alloc(X1847, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X1847, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1848, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X1847, &
         wf%n_v**2*wf%n_o, &
         X1846, &
         wf%n_o, &
         zero, &
         X1848, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1846)
      call mem%dealloc(X1847)
      call add_1342_to_1234(one, X1848, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1848)
      call mem%alloc(X1849, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1849, 1)
!
      call mem%alloc(X1850, wf%n_v, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1849, &
         wf%n_v, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X1850, &
         wf%n_v)
!
      call mem%dealloc(X1849)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1850, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1850)
      call mem%alloc(X1851, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X1851, &
         wf%n_v)
!
      call mem%alloc(X1852, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X1852, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1853, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X1852, &
         wf%n_o**2, &
         X1851, &
         wf%n_v, &
         zero, &
         X1853, &
         wf%n_o**2)
!
      call mem%dealloc(X1851)
      call mem%dealloc(X1852)
      call mem%alloc(X1854, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X1853, X1854, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X1853)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1854, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1854)
      call mem%alloc(X1855, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X1855, &
         wf%n_v)
!
      call mem%alloc(X1856, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X1856, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1857, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1856, &
         wf%n_v*wf%n_o, &
         X1855, &
         wf%n_v, &
         zero, &
         X1857, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1855)
      call mem%dealloc(X1856)
      call mem%alloc(X1858, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_213(X1857, X1858, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1857)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1858, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1858)
      call mem%alloc(X1859, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X1859, &
         wf%n_v)
!
      call mem%alloc(X1860, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(tAxxx_ovo, X1860, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1861, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X1860, &
         wf%n_o**2, &
         X1859, &
         wf%n_v, &
         zero, &
         X1861, &
         wf%n_o**2)
!
      call mem%dealloc(X1859)
      call mem%dealloc(X1860)
      call mem%alloc(X1862, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X1861, X1862, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X1861)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1862, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1862)
      call mem%alloc(X1863, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(tAxxx_ovo, X1863, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1864, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X1863, &
         wf%n_v*wf%n_o, &
         zero, &
         X1864, &
         wf%n_v)
!
      call mem%dealloc(X1863)
      call mem%alloc(X1865, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X1865, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1866, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1865, &
         wf%n_v*wf%n_o, &
         X1864, &
         wf%n_v, &
         zero, &
         X1866, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1864)
      call mem%dealloc(X1865)
      call mem%alloc(X1867, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_213(X1866, X1867, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1866)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1867, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1867)
      call mem%alloc(X1868, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1868, 1)
!
      call mem%alloc(X1869, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X1869, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1870, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1868, &
         wf%n_v, &
         X1869, &
         wf%n_v*wf%n_o, &
         zero, &
         X1870, &
         wf%n_o)
!
      call mem%dealloc(X1868)
      call mem%dealloc(X1869)
      call mem%alloc(X1871, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1870, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X1871, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1870)
      call add_1423_to_1234(one, X1871, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1871)
      call mem%alloc(X1872, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1872, 1)
!
      call mem%alloc(X1873, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X1873, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1874, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X1872, &
         wf%n_v, &
         X1873, &
         wf%n_o**2, &
         zero, &
         X1874, &
         wf%n_o)
!
      call mem%dealloc(X1872)
      call mem%dealloc(X1873)
      call mem%alloc(X1875, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X1874, &
         wf%n_o, &
         zero, &
         X1875, &
         wf%n_v**2)
!
      call mem%dealloc(X1874)
      call add_1324_to_1234(one, X1875, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1875)
      call mem%alloc(X1876, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1876, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1877, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X1877, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1878, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         -two, &
         X1876, &
         wf%n_v**2, &
         X1877, &
         wf%n_v**2, &
         zero, &
         X1878, &
         wf%n_o)
!
      call mem%dealloc(X1876)
      call mem%dealloc(X1877)
      call mem%alloc(X1879, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X1878, &
         wf%n_o, &
         zero, &
         X1879, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1878)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1879, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1879)
      call mem%alloc(X1880, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X1880, &
         wf%n_v)
!
      call mem%alloc(X1881, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         X1880, &
         wf%n_v, &
         zero, &
         X1881, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1880)
      call mem%alloc(X1882, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_213(X1881, X1882, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1881)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1882, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1882)
      call mem%alloc(X1883, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1883, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1884, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X1884, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1885, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         -two, &
         X1883, &
         wf%n_v**2, &
         X1884, &
         wf%n_v**2, &
         zero, &
         X1885, &
         wf%n_o)
!
      call mem%dealloc(X1883)
      call mem%dealloc(X1884)
      call mem%alloc(X1886, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X1886, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1887, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X1886, &
         wf%n_o, &
         X1885, &
         wf%n_o, &
         zero, &
         X1887, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1885)
      call mem%dealloc(X1886)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1887, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1887)
      call mem%alloc(X1888, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(tAxxx_ovo, X1888, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1889, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X1888, &
         wf%n_v*wf%n_o, &
         zero, &
         X1889, &
         wf%n_v)
!
      call mem%dealloc(X1888)
      call mem%alloc(X1890, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         X1889, &
         wf%n_v, &
         zero, &
         X1890, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1889)
      call mem%alloc(X1891, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_213(X1890, X1891, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1890)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1891, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1891)
      call mem%alloc(X1892, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1892, 1)
!
      call mem%alloc(X1893, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1892, &
         wf%n_v, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1893, &
         wf%n_o)
!
      call mem%dealloc(X1892)
      call mem%alloc(X1894, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1893, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X1894, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1893)
      call add_1423_to_1234(one, X1894, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1894)
      call mem%alloc(X1895, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1895, 1)
!
      call mem%alloc(X1896, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X1896, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1897, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X1895, &
         wf%n_v, &
         X1896, &
         wf%n_o**2, &
         zero, &
         X1897, &
         wf%n_o)
!
      call mem%dealloc(X1895)
      call mem%dealloc(X1896)
      call mem%alloc(X1898, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X1898, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1899, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X1898, &
         wf%n_v**2, &
         X1897, &
         wf%n_o, &
         zero, &
         X1899, &
         wf%n_v**2)
!
      call mem%dealloc(X1897)
      call mem%dealloc(X1898)
      call add_1324_to_1234(one, X1899, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1899)
      call mem%alloc(X1900, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1900, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1901, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         X1900, &
         wf%n_v, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X1901, &
         wf%n_v)
!
      call mem%dealloc(X1900)
      call mem%alloc(X1902, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X1902, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1903, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X1902, &
         wf%n_o**2, &
         X1901, &
         wf%n_v, &
         zero, &
         X1903, &
         wf%n_o**2)
!
      call mem%dealloc(X1901)
      call mem%dealloc(X1902)
      call mem%alloc(X1904, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X1903, X1904, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X1903)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1904, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1904)
      call mem%alloc(X1905, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1905, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1906, wf%n_v, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         X1905, &
         wf%n_v, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X1906, &
         wf%n_v)
!
      call mem%dealloc(X1905)
      call mem%alloc(X1907, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(tAxxx_ovo, X1907, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1908, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X1907, &
         wf%n_o**2, &
         X1906, &
         wf%n_v, &
         zero, &
         X1908, &
         wf%n_o**2)
!
      call mem%dealloc(X1906)
      call mem%dealloc(X1907)
      call mem%alloc(X1909, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X1908, X1909, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X1908)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1909, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1909)
      call mem%alloc(X1910, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         gAxxx_vov, &
         wf%n_v, &
         rxI_v, 1, &
         zero, &
         X1910, 1)
!
      call mem%alloc(X1911, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X1911, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1912, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1910, &
         wf%n_o, &
         X1911, &
         wf%n_v*wf%n_o, &
         zero, &
         X1912, &
         wf%n_o)
!
      call mem%dealloc(X1910)
      call mem%dealloc(X1911)
      call mem%alloc(X1913, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1912, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X1913, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1912)
      call add_1423_to_1234(one, X1913, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1913)
      call mem%alloc(X1914, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         gAxxx_vov, &
         wf%n_v, &
         rxI_v, 1, &
         zero, &
         X1914, 1)
!
      call mem%alloc(X1915, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X1915, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1916, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X1914, &
         wf%n_o, &
         X1915, &
         wf%n_o**2, &
         zero, &
         X1916, &
         wf%n_o)
!
      call mem%dealloc(X1914)
      call mem%dealloc(X1915)
      call mem%alloc(X1917, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         uxIxx_vvo, &
         wf%n_v**2, &
         X1916, &
         wf%n_o, &
         zero, &
         X1917, &
         wf%n_v**2)
!
      call mem%dealloc(X1916)
      call add_1324_to_1234(one, X1917, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1917)
      call mem%alloc(X1918, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X1918, &
         wf%n_v)
!
      call mem%alloc(X1919, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1918, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1919, &
         wf%n_o)
!
      call mem%dealloc(X1918)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1919, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1919)
      call mem%alloc(X1920, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(tAxxx_ovo, X1920, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1921, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X1920, &
         wf%n_v*wf%n_o, &
         zero, &
         X1921, &
         wf%n_v)
!
      call mem%dealloc(X1920)
      call mem%alloc(X1922, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1921, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1922, &
         wf%n_o)
!
      call mem%dealloc(X1921)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1922, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1922)
      call mem%alloc(X1923, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         gAxxx_vov, &
         wf%n_v, &
         rxI_v, 1, &
         zero, &
         X1923, 1)
!
      call mem%alloc(X1924, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1923, &
         wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1924, &
         wf%n_o)
!
      call mem%dealloc(X1923)
      call mem%alloc(X1925, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X1924, &
         wf%n_o, &
         zero, &
         X1925, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1924)
      call add_1432_to_1234(one, X1925, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1925)
      call mem%alloc(X1926, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1926, 1)
!
      call mem%alloc(X1927, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1926, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1927, &
         wf%n_o)
!
      call mem%dealloc(X1926)
      call mem%alloc(X1928, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X1927, &
         wf%n_o, &
         zero, &
         X1928, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1927)
      call add_1432_to_1234(one, X1928, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1928)
      call mem%alloc(X1929, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X1929, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1930, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         gAxxx_vov, &
         wf%n_v, &
         X1929, &
         wf%n_o, &
         zero, &
         X1930, &
         wf%n_v)
!
      call mem%dealloc(X1929)
      call mem%alloc(X1931, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X1931, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X1932, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1931, &
         wf%n_v*wf%n_o, &
         X1930, &
         wf%n_v, &
         zero, &
         X1932, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1930)
      call mem%dealloc(X1931)
      call mem%alloc(X1933, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_213(X1932, X1933, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1932)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1933, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1933)
      call mem%alloc(X1934, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1934, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1935, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         two, &
         X1934, &
         wf%n_v**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X1935, &
         wf%n_o)
!
      call mem%dealloc(X1934)
      call mem%alloc(X1936, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1935, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X1936, &
         wf%n_o)
!
      call mem%dealloc(X1935)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1936, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1936)
      call mem%alloc(X1937, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1937, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1938, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         two, &
         X1937, &
         wf%n_v**2, &
         txIxx_vvo, &
         wf%n_v**2, &
         zero, &
         X1938, &
         wf%n_o)
!
      call mem%dealloc(X1937)
      call mem%alloc(X1939, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X1938, &
         wf%n_o, &
         zero, &
         X1939, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1938)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1939, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1939)
      call mem%alloc(X1940, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X1940, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1941, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         gAxxx_vov, &
         wf%n_v, &
         X1940, &
         wf%n_o, &
         zero, &
         X1941, &
         wf%n_v)
!
      call mem%dealloc(X1940)
      call mem%alloc(X1942, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         X1941, &
         wf%n_v, &
         zero, &
         X1942, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1941)
      call mem%alloc(X1943, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_213(X1942, X1943, wf%n_v, wf%n_o, wf%n_o)
      call mem%dealloc(X1942)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1943, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1943)
      call mem%alloc(X1944, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X1944, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1945, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         X1944, &
         wf%n_v, &
         zero, &
         X1945, &
         wf%n_v)
!
      call mem%dealloc(X1944)
      call mem%alloc(X1946, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X1946, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1947, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X1946, &
         wf%n_o**2, &
         X1945, &
         wf%n_v, &
         zero, &
         X1947, &
         wf%n_o**2)
!
      call mem%dealloc(X1945)
      call mem%dealloc(X1946)
      call mem%alloc(X1948, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X1947, X1948, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X1947)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1948, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1948)
      call mem%alloc(X1949, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(gAxxx_vov, X1949, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1950, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X1950, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X1951, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v**2, &
         two, &
         X1949, &
         wf%n_v**2, &
         X1950, &
         wf%n_v**2, &
         zero, &
         X1951, &
         wf%n_o)
!
      call mem%dealloc(X1949)
      call mem%dealloc(X1950)
      call mem%alloc(X1952, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1951, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X1952, &
         wf%n_o)
!
      call mem%dealloc(X1951)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1952, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1952)
      call mem%alloc(X1953, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X1953, wf%n_v, wf%n_o)
      call mem%alloc(X1954, wf%n_v)
!
      call dgemv('N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         gAxxx_vov, &
         wf%n_v, &
         X1953, 1, &
         zero, &
         X1954, 1)
!
      call mem%dealloc(X1953)
      call mem%alloc(X1955, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         u_aibj, &
         wf%n_v, &
         X1954, 1, &
         zero, &
         X1955, 1)
!
      call mem%dealloc(X1954)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1955, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1955)
      call mem%alloc(X1956, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         gAxxx_vov, &
         wf%n_v, &
         rxI_v, 1, &
         zero, &
         X1956, 1)
!
      call mem%alloc(X1957, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v, &
         one, &
         X1956, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1957, &
         wf%n_o)
!
      call mem%dealloc(X1956)
      call mem%alloc(X1958, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X1958, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1959, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X1958, &
         wf%n_v**2*wf%n_o, &
         X1957, &
         wf%n_o, &
         zero, &
         X1959, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X1957)
      call mem%dealloc(X1958)
      call add_1342_to_1234(one, X1959, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1959)
      call mem%alloc(X1960, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         gAxxx_vov, &
         wf%n_v, &
         rxI_v, 1, &
         zero, &
         X1960, 1)
!
      call mem%alloc(X1961, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1960, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X1961, &
         wf%n_v)
!
      call mem%dealloc(X1960)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X1961, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1961)
      call mem%alloc(X1962, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X1962, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1963, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         gAxxx_vov, &
         wf%n_v, &
         X1962, &
         wf%n_o, &
         zero, &
         X1963, &
         wf%n_v)
!
      call mem%dealloc(X1962)
      call mem%alloc(X1964, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1963, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1964, &
         wf%n_o)
!
      call mem%dealloc(X1963)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X1964, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1964)
      call mem%alloc(X1965, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         gAxxx_vov, &
         wf%n_v, &
         rxI_v, 1, &
         zero, &
         X1965, 1)
!
      call mem%alloc(X1966, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1965, &
         wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1966, &
         wf%n_o)
!
      call mem%dealloc(X1965)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X1966, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1966)
      call mem%alloc(X1967, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         -two, &
         gAxxx_vov, &
         wf%n_v*wf%n_o, &
         rxI_v, 1, &
         zero, &
         X1967, 1)
!
      call mem%alloc(X1968, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X1967, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X1968, &
         wf%n_o)
!
      call mem%dealloc(X1967)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X1968, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1968)
      call mem%alloc(X1969, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_312(gxIxx_oov, X1969, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1970, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -four, &
         X1969, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X1970, &
         wf%n_o)
!
      call mem%dealloc(X1969)
      call mem%alloc(X1971, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X1970, &
         wf%n_o, &
         zero, &
         X1971, &
         wf%n_v)
!
      call mem%dealloc(X1970)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1971, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1971)
      call mem%alloc(X1972, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         -four, &
         tAIxx_vo, &
         wf%n_v, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X1972, &
         wf%n_o)
!
      call mem%alloc(X1973, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X1972, X1973, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X1972)
      call mem%alloc(X1974, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X1974, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1975, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X1974, &
         wf%n_o**2, &
         X1973, &
         wf%n_o, &
         zero, &
         X1975, &
         wf%n_v)
!
      call mem%dealloc(X1973)
      call mem%dealloc(X1974)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1975, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1975)
      call mem%alloc(X1976, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_312(gxIxx_oov, X1976, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X1977, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X1976, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X1977, &
         wf%n_o)
!
      call mem%dealloc(X1976)
      call mem%alloc(X1978, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1977, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1978, &
         wf%n_o)
!
      call mem%dealloc(X1977)
      call mem%alloc(X1979, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1978, 1, &
         X1979, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1978)
      call add_1423_to_1234(one, X1979, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1979)
      call mem%alloc(X1980, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         two, &
         tAIxx_vo, &
         wf%n_v, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X1980, &
         wf%n_o)
!
      call mem%alloc(X1981, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X1980, X1981, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X1980)
      call mem%alloc(X1982, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X1982, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1983, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X1981, &
         wf%n_o, &
         X1982, &
         wf%n_o**2, &
         zero, &
         X1983, &
         wf%n_o)
!
      call mem%dealloc(X1981)
      call mem%dealloc(X1982)
      call mem%alloc(X1984, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X1983, 1, &
         X1984, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1983)
      call add_1423_to_1234(one, X1984, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1984)
      call mem%alloc(X1985, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(tAxxx_ovo, X1985, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1986, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v, &
         two, &
         X1985, &
         wf%n_o**2, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X1986, &
         wf%n_o**2)
!
      call mem%dealloc(X1985)
      call mem%alloc(X1987, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X1986, &
         wf%n_o**3, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X1987, &
         wf%n_o**3)
!
      call mem%dealloc(X1986)
      call mem%alloc(X1988, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(X1987, X1988, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X1987)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X1988, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X1988)
      call mem%alloc(X1989, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         two, &
         tAIxx_vo, &
         wf%n_v, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X1989, &
         wf%n_o)
!
      call mem%alloc(X1990, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X1989, X1990, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X1989)
      call mem%alloc(X1991, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X1990, &
         wf%n_o**2, &
         zero, &
         X1991, &
         wf%n_v)
!
      call mem%dealloc(X1990)
      call mem%alloc(X1992, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1991, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X1992, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1991)
      call add_1432_to_1234(one, X1992, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1992)
      call mem%alloc(X1993, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         two, &
         tAIxx_vo, &
         wf%n_v, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X1993, &
         wf%n_o)
!
      call mem%alloc(X1994, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X1993, &
         wf%n_o**2, &
         zero, &
         X1994, &
         wf%n_v)
!
      call mem%dealloc(X1993)
      call mem%alloc(X1995, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1994, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X1995, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1994)
      call add_1423_to_1234(one, X1995, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1995)
      call mem%alloc(X1996, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         two, &
         r_vo, &
         wf%n_v, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X1996, &
         wf%n_o)
!
      call mem%alloc(X1997, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X1996, &
         wf%n_o**2, &
         zero, &
         X1997, &
         wf%n_v)
!
      call mem%dealloc(X1996)
      call mem%alloc(X1998, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(tAxxx_ovo, X1998, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X1999, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X1998, &
         wf%n_v*wf%n_o, &
         X1997, &
         wf%n_v*wf%n_o, &
         zero, &
         X1999, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X1997)
      call mem%dealloc(X1998)
      call add_1432_to_1234(one, X1999, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X1999)
      call mem%alloc(X2000, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2000, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2001, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         four, &
         X2000, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2001, &
         wf%n_o)
!
      call mem%dealloc(X2000)
      call mem%alloc(X2002, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X2001, &
         wf%n_o, &
         zero, &
         X2002, &
         wf%n_v)
!
      call mem%dealloc(X2001)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2002, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2002)
      call mem%alloc(X2003, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2003, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2004, wf%n_o, wf%n_v)
      call sort_to_21(tAIxx_vo, X2004, wf%n_v, wf%n_o)
      call mem%alloc(X2005, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         four, &
         X2003, &
         wf%n_v*wf%n_o, &
         X2004, 1, &
         zero, &
         X2005, 1)
!
      call mem%dealloc(X2003)
      call mem%dealloc(X2004)
      call mem%alloc(X2006, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X2005, 1, &
         zero, &
         X2006, 1)
!
      call mem%dealloc(X2005)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2006, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2006)
      call mem%alloc(X2007, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2007, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2008, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X2007, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2008, &
         wf%n_o)
!
      call mem%dealloc(X2007)
      call mem%alloc(X2009, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X2008, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X2009, &
         wf%n_o)
!
      call mem%dealloc(X2008)
      call mem%alloc(X2010, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2009, 1, &
         X2010, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2009)
      call add_1423_to_1234(one, X2010, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2010)
      call mem%alloc(X2011, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2011, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2012, wf%n_o, wf%n_v)
      call sort_to_21(tAIxx_vo, X2012, wf%n_v, wf%n_o)
      call mem%alloc(X2013, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         -two, &
         X2011, &
         wf%n_v*wf%n_o, &
         X2012, 1, &
         zero, &
         X2013, 1)
!
      call mem%dealloc(X2011)
      call mem%dealloc(X2012)
      call mem%alloc(X2014, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X2013, 1, &
         zero, &
         X2014, 1)
!
      call mem%dealloc(X2013)
      call mem%alloc(X2015, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2014, 1, &
         X2015, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2014)
      call add_1432_to_1234(one, X2015, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2015)
      call mem%alloc(X2016, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         -two, &
         tAIxx_vo, &
         wf%n_v, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X2016, &
         wf%n_o)
!
      call mem%alloc(X2017, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X2016, X2017, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X2016)
      call mem%alloc(X2018, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X2017, &
         wf%n_o**2, &
         zero, &
         X2018, &
         wf%n_v)
!
      call mem%dealloc(X2017)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2018, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2018)
      call mem%alloc(X2019, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X2019, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2020, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v, &
         -two, &
         gxIxx_oov, &
         wf%n_o**2, &
         X2019, &
         wf%n_o**2, &
         zero, &
         X2020, &
         wf%n_o**2)
!
      call mem%dealloc(X2019)
      call mem%alloc(X2021, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X2020, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X2021, &
         wf%n_o**3)
!
      call mem%dealloc(X2020)
      call mem%alloc(X2022, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1342(X2021, X2022, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X2021)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X2022, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2022)
      call mem%alloc(X2023, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         -two, &
         r_vo, &
         wf%n_v, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X2023, &
         wf%n_o)
!
      call mem%alloc(X2024, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X2023, X2024, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X2023)
      call mem%alloc(X2025, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         tAIxx_vo, &
         wf%n_v, &
         X2024, &
         wf%n_o**2, &
         zero, &
         X2025, &
         wf%n_v)
!
      call mem%dealloc(X2024)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2025, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2025)
      call mem%alloc(X2026, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         gxIxx_oov, &
         wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X2026, &
         wf%n_o**2)
!
      call mem%alloc(X2027, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X2026, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X2027, &
         wf%n_o**2)
!
      call mem%dealloc(X2026)
      call mem%alloc(X2028, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(uAxxx_ovo, X2028, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2029, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2028, &
         wf%n_v*wf%n_o, &
         X2027, &
         wf%n_o, &
         zero, &
         X2029, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2027)
      call mem%dealloc(X2028)
      call add_1423_to_1234(one, X2029, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2029)
      call mem%alloc(X2030, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_312(gxIxx_oov, X2030, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2031, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -four, &
         X2030, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X2031, &
         wf%n_o)
!
      call mem%dealloc(X2030)
      call mem%alloc(X2032, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X2031, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X2032, &
         wf%n_v)
!
      call mem%dealloc(X2031)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2032, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2032)
      call mem%alloc(X2033, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_312(gxIxx_oov, X2033, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2034, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         X2033, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X2034, &
         wf%n_o)
!
      call mem%dealloc(X2033)
      call mem%alloc(X2035, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X2034, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X2035, &
         wf%n_v)
!
      call mem%dealloc(X2034)
      call mem%alloc(X2036, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2035, 1, &
         X2036, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2035)
      call add_1432_to_1234(one, X2036, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2036)
      call mem%alloc(X2037, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2037, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2038, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         two, &
         tAxAx_oo, &
         wf%n_o, &
         X2037, &
         wf%n_v*wf%n_o, &
         zero, &
         X2038, &
         wf%n_o)
!
      call mem%dealloc(X2037)
      call mem%alloc(X2039, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(txIxx_vvo, X2039, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X2040, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X2039, &
         wf%n_v*wf%n_o, &
         X2038, &
         wf%n_o**2, &
         zero, &
         X2040, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2038)
      call mem%dealloc(X2039)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X2040, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2040)
      call mem%alloc(X2041, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         two, &
         r_vo, &
         wf%n_v, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X2041, &
         wf%n_o)
!
      call mem%alloc(X2042, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         tAxAx_oo, &
         wf%n_o, &
         X2041, &
         wf%n_o**2, &
         zero, &
         X2042, &
         wf%n_o)
!
      call mem%dealloc(X2041)
      call mem%alloc(X2043, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X2042, &
         wf%n_o**2, &
         zero, &
         X2043, &
         wf%n_v**2)
!
      call mem%dealloc(X2042)
      call add_1342_to_1234(one, X2043, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2043)
      call mem%alloc(X2044, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2044, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2045, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -four, &
         X2044, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X2045, &
         wf%n_o)
!
      call mem%dealloc(X2044)
      call mem%alloc(X2046, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X2045, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X2046, &
         wf%n_v)
!
      call mem%dealloc(X2045)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2046, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2046)
      call mem%alloc(X2047, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2047, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2048, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         X2047, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X2048, &
         wf%n_o)
!
      call mem%dealloc(X2047)
      call mem%alloc(X2049, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X2048, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X2049, &
         wf%n_v)
!
      call mem%dealloc(X2048)
      call mem%alloc(X2050, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2049, 1, &
         X2050, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2049)
      call add_1432_to_1234(one, X2050, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2050)
      call mem%alloc(X2051, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2051, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2052, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         two, &
         X2051, &
         wf%n_v*wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X2052, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2051)
      call mem%alloc(X2053, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X2052, X2053, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2052)
      call mem%alloc(X2054, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X2053, &
         wf%n_o**2, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X2054, &
         wf%n_o**2)
!
      call mem%dealloc(X2053)
      call mem%alloc(X2055, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_1432(X2054, X2055, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2054)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X2055, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2055)
      call mem%alloc(X2056, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         two, &
         r_vo, &
         wf%n_v, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X2056, &
         wf%n_o)
!
      call mem%alloc(X2057, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         tAxAx_oo, &
         wf%n_o, &
         X2056, &
         wf%n_o**2, &
         zero, &
         X2057, &
         wf%n_o)
!
      call mem%dealloc(X2056)
      call mem%alloc(X2058, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X2058, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X2059, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X2058, &
         wf%n_v**2, &
         X2057, &
         wf%n_o**2, &
         zero, &
         X2059, &
         wf%n_v**2)
!
      call mem%dealloc(X2057)
      call mem%dealloc(X2058)
      call add_1342_to_1234(one, X2059, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2059)
      call mem%alloc(X2060, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2060, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2061, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         four, &
         X2060, &
         wf%n_o, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X2061, &
         wf%n_o)
!
      call mem%dealloc(X2060)
      call mem%alloc(X2062, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X2061, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X2062, &
         wf%n_v)
!
      call mem%dealloc(X2061)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2062, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2062)
      call mem%alloc(X2063, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2063, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2064, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         X2063, &
         wf%n_o, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X2064, &
         wf%n_o)
!
      call mem%dealloc(X2063)
      call mem%alloc(X2065, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X2064, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X2065, &
         wf%n_v)
!
      call mem%dealloc(X2064)
      call mem%alloc(X2066, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2065, 1, &
         X2066, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2065)
      call add_1432_to_1234(one, X2066, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2066)
      call mem%alloc(X2067, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         -two, &
         tAxAx_oo, &
         wf%n_o, &
         gxIxx_oov, &
         wf%n_o, &
         zero, &
         X2067, &
         wf%n_o)
!
      call mem%alloc(X2068, wf%n_o, wf%n_v, wf%n_v)
      call sort_to_312(uxIxx_vvo, X2068, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X2069, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X2068, &
         wf%n_v*wf%n_o, &
         X2067, &
         wf%n_o**2, &
         zero, &
         X2069, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2067)
      call mem%dealloc(X2068)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X2069, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2069)
      call mem%alloc(X2070, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v, &
         four, &
         gxIxx_oov, &
         wf%n_o**2, &
         tAxAx_oo, 1, &
         zero, &
         X2070, 1)
!
      call mem%alloc(X2071, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X2070, 1, &
         zero, &
         X2071, 1)
!
      call mem%dealloc(X2070)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2071, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2071)
      call mem%alloc(X2072, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v, &
         -two, &
         gxIxx_oov, &
         wf%n_o**2, &
         tAxAx_oo, 1, &
         zero, &
         X2072, 1)
!
      call mem%alloc(X2073, wf%n_v, wf%n_o)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         X2072, 1, &
         zero, &
         X2073, 1)
!
      call mem%dealloc(X2072)
      call mem%alloc(X2074, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2073, 1, &
         X2074, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2073)
      call add_1432_to_1234(one, X2074, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2074)
      call mem%alloc(X2075, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2075, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2076, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         -two, &
         X2075, &
         wf%n_v*wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X2076, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2075)
      call mem%alloc(X2077, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X2076, X2077, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2076)
      call mem%alloc(X2078, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X2077, &
         wf%n_o**2, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X2078, &
         wf%n_o**2)
!
      call mem%dealloc(X2077)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X2078, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2078)
      call mem%alloc(X2079, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         -two, &
         gxIxx_oov, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X2079, &
         wf%n_v*wf%n_o)
!
      call mem%alloc(X2080, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X2079, X2080, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2079)
      call mem%alloc(X2081, wf%n_o, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X2080, &
         wf%n_o**2, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X2081, &
         wf%n_o**2)
!
      call mem%dealloc(X2080)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X2081, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2081)
      call mem%alloc(X2082, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         gxIxx_oov, &
         wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X2082, &
         wf%n_o**2)
!
      call mem%alloc(X2083, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X2082, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X2083, &
         wf%n_o**2)
!
      call mem%dealloc(X2082)
      call mem%alloc(X2084, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(uxxxI_vov, X2084, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X2085, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X2084, &
         wf%n_v**2, &
         X2083, &
         wf%n_o, &
         zero, &
         X2085, &
         wf%n_v**2)
!
      call mem%dealloc(X2083)
      call mem%dealloc(X2084)
      call add_1324_to_1234(one, X2085, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2085)
      call mem%alloc(X2086, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         -four, &
         tAxxI_ov, &
         wf%n_o, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X2086, &
         wf%n_o)
!
      call mem%alloc(X2087, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X2086, X2087, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X2086)
      call mem%alloc(X2088, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X2088, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2089, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X2088, &
         wf%n_o**2, &
         X2087, &
         wf%n_o, &
         zero, &
         X2089, &
         wf%n_v)
!
      call mem%dealloc(X2087)
      call mem%dealloc(X2088)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2089, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2089)
      call mem%alloc(X2090, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_312(gxIxx_oov, X2090, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2091, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -four, &
         X2090, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2091, &
         wf%n_o)
!
      call mem%dealloc(X2090)
      call mem%alloc(X2092, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X2091, &
         wf%n_o, &
         zero, &
         X2092, &
         wf%n_v)
!
      call mem%dealloc(X2091)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2092, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2092)
      call mem%alloc(X2093, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         two, &
         tAxxI_ov, &
         wf%n_o, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X2093, &
         wf%n_o)
!
      call mem%alloc(X2094, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X2093, X2094, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X2093)
      call mem%alloc(X2095, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X2095, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2096, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X2094, &
         wf%n_o, &
         X2095, &
         wf%n_o**2, &
         zero, &
         X2096, &
         wf%n_o)
!
      call mem%dealloc(X2094)
      call mem%dealloc(X2095)
      call mem%alloc(X2097, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2096, 1, &
         X2097, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2096)
      call add_1423_to_1234(one, X2097, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2097)
      call mem%alloc(X2098, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_312(gxIxx_oov, X2098, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2099, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X2098, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2099, &
         wf%n_o)
!
      call mem%dealloc(X2098)
      call mem%alloc(X2100, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X2099, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X2100, &
         wf%n_o)
!
      call mem%dealloc(X2099)
      call mem%alloc(X2101, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2100, 1, &
         X2101, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2100)
      call add_1423_to_1234(one, X2101, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2101)
      call mem%alloc(X2102, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         two, &
         tAxxI_ov, &
         wf%n_o, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X2102, &
         wf%n_o)
!
      call mem%alloc(X2103, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X2102, X2103, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X2102)
      call mem%alloc(X2104, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X2103, &
         wf%n_o**2, &
         zero, &
         X2104, &
         wf%n_v)
!
      call mem%dealloc(X2103)
      call mem%alloc(X2105, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2104, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2105, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2104)
      call add_1432_to_1234(one, X2105, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2105)
      call mem%alloc(X2106, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(tAxxx_ovo, X2106, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2107, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v, &
         two, &
         X2106, &
         wf%n_o**2, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X2107, &
         wf%n_o**2)
!
      call mem%dealloc(X2106)
      call mem%alloc(X2108, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X2107, &
         wf%n_o**3, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X2108, &
         wf%n_o**3)
!
      call mem%dealloc(X2107)
      call mem%alloc(X2109, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(X2108, X2109, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X2108)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X2109, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2109)
      call mem%alloc(X2110, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         two, &
         tAxxI_ov, &
         wf%n_o, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X2110, &
         wf%n_o)
!
      call mem%alloc(X2111, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X2110, &
         wf%n_o**2, &
         zero, &
         X2111, &
         wf%n_v)
!
      call mem%dealloc(X2110)
      call mem%alloc(X2112, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2111, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X2112, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2111)
      call add_1423_to_1234(one, X2112, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2112)
      call mem%alloc(X2113, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         two, &
         r_vo, &
         wf%n_v, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X2113, &
         wf%n_o)
!
      call mem%alloc(X2114, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X2113, &
         wf%n_o**2, &
         zero, &
         X2114, &
         wf%n_v)
!
      call mem%dealloc(X2113)
      call mem%alloc(X2115, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(tAxxx_ovo, X2115, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2116, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2115, &
         wf%n_v*wf%n_o, &
         X2114, &
         wf%n_v*wf%n_o, &
         zero, &
         X2116, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2114)
      call mem%dealloc(X2115)
      call add_1432_to_1234(one, X2116, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2116)
      call mem%alloc(X2117, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2117, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2118, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         four, &
         X2117, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2118, &
         wf%n_o)
!
      call mem%dealloc(X2117)
      call mem%alloc(X2119, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X2118, &
         wf%n_o, &
         zero, &
         X2119, &
         wf%n_v)
!
      call mem%dealloc(X2118)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2119, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2119)
      call mem%alloc(X2120, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2120, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2121, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         four, &
         X2120, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X2121, 1)
!
      call mem%dealloc(X2120)
      call mem%alloc(X2122, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X2121, 1, &
         zero, &
         X2122, 1)
!
      call mem%dealloc(X2121)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2122, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2122)
      call mem%alloc(X2123, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2123, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2124, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X2123, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2124, &
         wf%n_o)
!
      call mem%dealloc(X2123)
      call mem%alloc(X2125, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X2124, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X2125, &
         wf%n_o)
!
      call mem%dealloc(X2124)
      call mem%alloc(X2126, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2125, 1, &
         X2126, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2125)
      call add_1423_to_1234(one, X2126, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2126)
      call mem%alloc(X2127, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2127, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2128, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         -two, &
         X2127, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X2128, 1)
!
      call mem%dealloc(X2127)
      call mem%alloc(X2129, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X2128, 1, &
         zero, &
         X2129, 1)
!
      call mem%dealloc(X2128)
      call mem%alloc(X2130, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2129, 1, &
         X2130, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2129)
      call add_1432_to_1234(one, X2130, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2130)
      call mem%alloc(X2131, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         -two, &
         tAxxI_ov, &
         wf%n_o, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X2131, &
         wf%n_o)
!
      call mem%alloc(X2132, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X2131, X2132, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X2131)
      call mem%alloc(X2133, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X2132, &
         wf%n_o**2, &
         zero, &
         X2133, &
         wf%n_v)
!
      call mem%dealloc(X2132)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2133, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2133)
      call mem%alloc(X2134, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X2134, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2135, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v, &
         -two, &
         X2134, &
         wf%n_o**2, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X2135, &
         wf%n_o**2)
!
      call mem%dealloc(X2134)
      call mem%alloc(X2136, wf%n_v, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**3, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X2135, &
         wf%n_o**3, &
         zero, &
         X2136, &
         wf%n_v)
!
      call mem%dealloc(X2135)
      call mem%alloc(X2137, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X2136, &
         wf%n_v*wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X2137, &
         wf%n_v*wf%n_o**2)
!
      call mem%dealloc(X2136)
      call add_1423_to_1234(one, X2137, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2137)
      call mem%alloc(X2138, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         -two, &
         r_vo, &
         wf%n_v, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X2138, &
         wf%n_o)
!
      call mem%alloc(X2139, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X2138, X2139, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X2138)
      call mem%alloc(X2140, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         tAxxI_ov, &
         wf%n_o, &
         X2139, &
         wf%n_o**2, &
         zero, &
         X2140, &
         wf%n_v)
!
      call mem%dealloc(X2139)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2140, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2140)
      call mem%alloc(X2141, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         gxIxx_oov, &
         wf%n_o**2, &
         r_vo, &
         wf%n_v, &
         zero, &
         X2141, &
         wf%n_o**2)
!
      call mem%alloc(X2142, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X2141, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X2142, &
         wf%n_o**2)
!
      call mem%dealloc(X2141)
      call mem%alloc(X2143, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(uAxxx_ovo, X2143, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2144, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2143, &
         wf%n_v*wf%n_o, &
         X2142, &
         wf%n_o, &
         zero, &
         X2144, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2142)
      call mem%dealloc(X2143)
      call add_1423_to_1234(one, X2144, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2144)
      call mem%alloc(X2145, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         four, &
         gxIxx_oov, &
         wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X2145, &
         wf%n_o**2)
!
      call mem%alloc(X2146, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X2146, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2147, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X2146, &
         wf%n_o**2, &
         X2145, &
         wf%n_o**2, &
         zero, &
         X2147, &
         wf%n_v)
!
      call mem%dealloc(X2145)
      call mem%dealloc(X2146)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2147, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2147)
      call mem%alloc(X2148, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2148, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2149, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         four, &
         X2148, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X2149, &
         wf%n_o)
!
      call mem%dealloc(X2148)
      call mem%alloc(X2150, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v, &
         wf%n_o, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X2149, &
         wf%n_o, &
         zero, &
         X2150, &
         wf%n_v)
!
      call mem%dealloc(X2149)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2150, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2150)
      call mem%alloc(X2151, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         gxIxx_oov, &
         wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X2151, &
         wf%n_o**2)
!
      call mem%alloc(X2152, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X2152, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2153, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X2151, &
         wf%n_o**2, &
         X2152, &
         wf%n_o**2, &
         zero, &
         X2153, &
         wf%n_o)
!
      call mem%dealloc(X2151)
      call mem%dealloc(X2152)
      call mem%alloc(X2154, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2153, 1, &
         X2154, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2153)
      call add_1423_to_1234(one, X2154, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2154)
      call mem%alloc(X2155, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2155, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2156, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X2155, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X2156, &
         wf%n_o)
!
      call mem%dealloc(X2155)
      call mem%alloc(X2157, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X2156, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X2157, &
         wf%n_o)
!
      call mem%dealloc(X2156)
      call mem%alloc(X2158, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2157, 1, &
         X2158, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2157)
      call add_1423_to_1234(one, X2158, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2158)
      call mem%alloc(X2159, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         -two, &
         uAIxx_vo, &
         wf%n_v, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X2159, &
         wf%n_o)
!
      call mem%alloc(X2160, wf%n_o, wf%n_o, wf%n_o)
      call sort_to_132(X2159, X2160, wf%n_o, wf%n_o, wf%n_o)
      call mem%dealloc(X2159)
      call mem%alloc(X2161, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X2160, &
         wf%n_o**2, &
         zero, &
         X2161, &
         wf%n_v)
!
      call mem%dealloc(X2160)
      call mem%alloc(X2162, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2161, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X2162, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2161)
      call add_1423_to_1234(one, X2162, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2162)
      call mem%alloc(X2163, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X2163, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2164, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v, &
         -two, &
         X2163, &
         wf%n_o**2, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X2164, &
         wf%n_o**2)
!
      call mem%dealloc(X2163)
      call mem%alloc(X2165, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o**3, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X2164, &
         wf%n_o**3, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X2165, &
         wf%n_o**3)
!
      call mem%dealloc(X2164)
      call mem%alloc(X2166, wf%n_o, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1423(X2165, X2166, wf%n_o, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X2165)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X2166, &
         wf%n_v*wf%n_o**2, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2166)
      call mem%alloc(X2167, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         -two, &
         uAIxx_vo, &
         wf%n_v, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X2167, &
         wf%n_o)
!
      call mem%alloc(X2168, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X2167, &
         wf%n_o**2, &
         zero, &
         X2168, &
         wf%n_v)
!
      call mem%dealloc(X2167)
      call mem%alloc(X2169, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2168, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2169, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2168)
      call add_1432_to_1234(one, X2169, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2169)
      call mem%alloc(X2170, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         -two, &
         r_vo, &
         wf%n_v, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X2170, &
         wf%n_o)
!
      call mem%alloc(X2171, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X2170, &
         wf%n_o**2, &
         zero, &
         X2171, &
         wf%n_v)
!
      call mem%dealloc(X2170)
      call mem%alloc(X2172, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X2171, &
         wf%n_v*wf%n_o, &
         zero, &
         X2172, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2171)
      call add_1432_to_1234(one, X2172, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2172)
      call mem%alloc(X2173, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X2173, wf%n_v, wf%n_o)
      call mem%alloc(X2174, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -four, &
         gxIxx_oov, &
         wf%n_o, &
         X2173, 1, &
         zero, &
         X2174, 1)
!
      call mem%dealloc(X2173)
      call mem%alloc(X2175, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X2174, 1, &
         zero, &
         X2175, 1)
!
      call mem%dealloc(X2174)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2175, 1, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2175)
      call mem%alloc(X2176, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X2176, wf%n_v, wf%n_o)
      call mem%alloc(X2177, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         gxIxx_oov, &
         wf%n_o, &
         X2176, 1, &
         zero, &
         X2177, 1)
!
      call mem%dealloc(X2176)
      call mem%alloc(X2178, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X2177, 1, &
         zero, &
         X2178, 1)
!
      call mem%dealloc(X2177)
      call mem%alloc(X2179, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         one, &
         r_vo, 1, &
         X2178, 1, &
         X2179, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2178)
      call add_1432_to_1234(one, X2179, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2179)
      call mem%alloc(X2180, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         two, &
         uAIxx_vo, &
         wf%n_v, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X2180, &
         wf%n_o)
!
      call mem%alloc(X2181, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         r_vo, &
         wf%n_v, &
         X2180, &
         wf%n_o**2, &
         zero, &
         X2181, &
         wf%n_v)
!
      call mem%dealloc(X2180)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2181, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2181)
      call mem%alloc(X2182, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         two, &
         r_vo, &
         wf%n_v, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X2182, &
         wf%n_o)
!
      call mem%alloc(X2183, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         uAIxx_vo, &
         wf%n_v, &
         X2182, &
         wf%n_o**2, &
         zero, &
         X2183, &
         wf%n_v)
!
      call mem%dealloc(X2182)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2183, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2183)
      call mem%alloc(X2184, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2184, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2185, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X2184, &
         wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X2185, &
         wf%n_o)
!
      call mem%dealloc(X2184)
      call mem%alloc(X2186, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         rAI, &
         X2185, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X2186, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2185)
      call add_1423_to_1234(rAI, X2186, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2186)
      call mem%alloc(X2187, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2187, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2188, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(u_aibj, X2188, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2189, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X2187, &
         wf%n_v*wf%n_o, &
         X2188, &
         wf%n_v*wf%n_o, &
         zero, &
         X2189, &
         wf%n_o)
!
      call mem%dealloc(X2187)
      call mem%dealloc(X2188)
      call mem%alloc(X2190, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         rAI, &
         X2189, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X2190, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2189)
      call add_1423_to_1234(rAI, X2190, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2190)
      call mem%alloc(X2191, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X2191, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2192, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v, &
         -two, &
         gxIxx_oov, &
         wf%n_o**2, &
         X2191, &
         wf%n_o**2, &
         zero, &
         X2192, &
         wf%n_o**2)
!
      call mem%dealloc(X2191)
      call mem%alloc(X2193, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(u_aibj, X2193, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2194, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o**2, &
         rAI, &
         X2193, &
         wf%n_v**2, &
         X2192, &
         wf%n_o**2, &
         zero, &
         X2194, &
         wf%n_v**2)
!
      call mem%dealloc(X2192)
      call mem%dealloc(X2193)
      call add_1324_to_1234(rAI, X2194, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2194)
      call mem%alloc(X2195, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2195, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2196, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X2195, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2196, &
         wf%n_o)
!
      call mem%dealloc(X2195)
      call mem%alloc(X2197, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X2197, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2198, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         rAI, &
         X2197, &
         wf%n_v**2*wf%n_o, &
         X2196, &
         wf%n_o, &
         zero, &
         X2198, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2196)
      call mem%dealloc(X2197)
      call add_1342_to_1234(rAI, X2198, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2198)
      call mem%alloc(X2199, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2199, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2200, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X2199, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X2200, &
         wf%n_o)
!
      call mem%dealloc(X2199)
      call mem%alloc(X2201, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X2201, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2202, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         rAI, &
         X2201, &
         wf%n_v**2*wf%n_o, &
         X2200, &
         wf%n_o, &
         zero, &
         X2202, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2200)
      call mem%dealloc(X2201)
      call add_1342_to_1234(rAI, X2202, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2202)
      call mem%alloc(X2203, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X2203, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2204, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o**2, &
         two, &
         gxIxx_oov, &
         wf%n_o**2, &
         X2203, &
         wf%n_o**2, &
         zero, &
         X2204, &
         wf%n_v)
!
      call mem%dealloc(X2203)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         rAI, &
         X2204, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2204)
      call mem%alloc(X2205, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_312(gxIxx_oov, X2205, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2206, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X2205, &
         wf%n_v*wf%n_o, &
         t_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X2206, &
         wf%n_o)
!
      call mem%dealloc(X2205)
      call mem%alloc(X2207, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X2206, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X2207, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2206)
      call mem%alloc(X2208, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2207, 1, &
         rAx_o, 1, &
         X2208, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2207)
      call add_1432_to_1234(one, X2208, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2208)
      call mem%alloc(X2209, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         two, &
         gxIxx_oov, &
         wf%n_o**2, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X2209, &
         wf%n_o**2)
!
      call mem%alloc(X2210, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(t_aibj, X2210, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2211, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X2210, &
         wf%n_v**2, &
         X2209, &
         wf%n_o**2, &
         zero, &
         X2211, &
         wf%n_v**2)
!
      call mem%dealloc(X2209)
      call mem%dealloc(X2210)
      call mem%alloc(X2212, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2211, 1, &
         rAx_o, 1, &
         X2212, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2211)
      call add_1342_to_1234(one, X2212, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2212)
      call mem%alloc(X2213, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_312(gxIxx_oov, X2213, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2214, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X2213, &
         wf%n_v*wf%n_o, &
         t_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X2214, &
         wf%n_o)
!
      call mem%dealloc(X2213)
      call mem%alloc(X2215, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X2214, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X2215, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2214)
      call mem%alloc(X2216, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2215, 1, &
         rAx_o, 1, &
         X2216, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2215)
      call add_1432_to_1234(one, X2216, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2216)
      call mem%alloc(X2217, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         two, &
         gxIxx_oov, &
         wf%n_o**2, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X2217, &
         wf%n_o**2)
!
      call mem%alloc(X2218, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(t_aibj, X2218, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2219, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X2218, &
         wf%n_v**2, &
         X2217, &
         wf%n_o**2, &
         zero, &
         X2219, &
         wf%n_v**2)
!
      call mem%dealloc(X2217)
      call mem%dealloc(X2218)
      call mem%alloc(X2220, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2219, 1, &
         rAx_o, 1, &
         X2220, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2219)
      call add_1342_to_1234(one, X2220, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2220)
      call mem%alloc(X2221, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         -two, &
         gxIxx_oov, &
         wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X2221, &
         wf%n_o**2)
!
      call mem%alloc(X2222, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1324(t_aibj, X2222, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2223, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X2222, &
         wf%n_v**2, &
         X2221, &
         wf%n_o**2, &
         zero, &
         X2223, &
         wf%n_v**2)
!
      call mem%dealloc(X2221)
      call mem%dealloc(X2222)
      call mem%alloc(X2224, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2223, 1, &
         rAx_o, 1, &
         X2224, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2223)
      call add_1342_to_1234(one, X2224, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2224)
      call mem%alloc(X2225, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2225, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2226, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(t_aibj, X2226, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2227, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X2225, &
         wf%n_v*wf%n_o, &
         X2226, &
         wf%n_v*wf%n_o, &
         zero, &
         X2227, &
         wf%n_o)
!
      call mem%dealloc(X2225)
      call mem%dealloc(X2226)
      call mem%alloc(X2228, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X2227, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X2228, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2227)
      call mem%alloc(X2229, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2228, 1, &
         rAx_o, 1, &
         X2229, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2228)
      call add_1432_to_1234(one, X2229, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2229)
      call mem%alloc(X2230, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2230, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2231, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X2230, &
         wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X2231, &
         wf%n_o)
!
      call mem%dealloc(X2230)
      call mem%alloc(X2232, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X2231, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X2232, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2231)
      call mem%alloc(X2233, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2232, 1, &
         rAx_o, 1, &
         X2233, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2232)
      call add_1432_to_1234(one, X2233, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2233)
      call mem%alloc(X2234, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2234, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2235, wf%n_o, wf%n_v)
      call sort_to_21(tAIxx_vo, X2235, wf%n_v, wf%n_o)
      call mem%alloc(X2236, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         -two, &
         X2234, &
         wf%n_v*wf%n_o, &
         X2235, 1, &
         zero, &
         X2236, 1)
!
      call mem%dealloc(X2234)
      call mem%dealloc(X2235)
      call mem%alloc(X2237, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v**2*wf%n_o, &
         X2236, 1, &
         zero, &
         X2237, 1)
!
      call mem%dealloc(X2236)
      call mem%alloc(X2238, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_312(X2237, X2238, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X2237)
      call mem%alloc(X2239, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2238, 1, &
         rAx_o, 1, &
         X2239, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2238)
      call add_1342_to_1234(one, X2239, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2239)
      call mem%alloc(X2240, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2240, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2241, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         -two, &
         X2240, &
         wf%n_v*wf%n_o, &
         rAx_o, 1, &
         zero, &
         X2241, 1)
!
      call mem%dealloc(X2240)
      call mem%alloc(X2242, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X2241, &
         wf%n_o, &
         tAIxx_vo, &
         wf%n_v, &
         zero, &
         X2242, &
         wf%n_v)
!
      call mem%dealloc(X2241)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X2242, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2242)
      call mem%alloc(X2243, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         -two, &
         tAIxx_vo, &
         wf%n_v, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X2243, &
         wf%n_o)
!
      call mem%alloc(X2244, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X2243, &
         wf%n_o**2, &
         rAx_o, 1, &
         zero, &
         X2244, 1)
!
      call mem%dealloc(X2243)
      call mem%alloc(X2245, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X2245, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2246, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X2245, &
         wf%n_v**2*wf%n_o, &
         X2244, &
         wf%n_o, &
         zero, &
         X2246, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2244)
      call mem%dealloc(X2245)
      call add_1342_to_1234(one, X2246, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2246)
      call mem%alloc(X2247, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2247, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2248, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X2247, &
         wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X2248, &
         wf%n_o)
!
      call mem%dealloc(X2247)
      call mem%alloc(X2249, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X2248, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X2249, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2248)
      call mem%alloc(X2250, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2249, 1, &
         rAx_o, 1, &
         X2250, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2249)
      call add_1432_to_1234(one, X2250, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2250)
      call mem%alloc(X2251, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2251, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2252, wf%n_o)
!
      call dgemv('T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         -two, &
         X2251, &
         wf%n_v*wf%n_o, &
         tAxxI_ov, 1, &
         zero, &
         X2252, 1)
!
      call mem%dealloc(X2251)
      call mem%alloc(X2253, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v**2*wf%n_o, &
         X2252, 1, &
         zero, &
         X2253, 1)
!
      call mem%dealloc(X2252)
      call mem%alloc(X2254, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_312(X2253, X2254, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X2253)
      call mem%alloc(X2255, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2254, 1, &
         rAx_o, 1, &
         X2255, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2254)
      call add_1342_to_1234(one, X2255, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2255)
      call mem%alloc(X2256, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         -two, &
         tAxxI_ov, &
         wf%n_o, &
         gxIxx_oov, &
         wf%n_o**2, &
         zero, &
         X2256, &
         wf%n_o)
!
      call mem%alloc(X2257, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X2256, &
         wf%n_o**2, &
         rAx_o, 1, &
         zero, &
         X2257, 1)
!
      call mem%dealloc(X2256)
      call mem%alloc(X2258, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X2258, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2259, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X2258, &
         wf%n_v**2*wf%n_o, &
         X2257, &
         wf%n_o, &
         zero, &
         X2259, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2257)
      call mem%dealloc(X2258)
      call add_1342_to_1234(one, X2259, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2259)
      call mem%alloc(X2260, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2260, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2261, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         -two, &
         X2260, &
         wf%n_v*wf%n_o, &
         rAx_o, 1, &
         zero, &
         X2261, 1)
!
      call mem%dealloc(X2260)
      call mem%alloc(X2262, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X2261, &
         wf%n_o, &
         tAxxI_ov, &
         wf%n_o, &
         zero, &
         X2262, &
         wf%n_v)
!
      call mem%dealloc(X2261)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X2262, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2262)
      call mem%alloc(X2263, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_312(gxIxx_oov, X2263, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2264, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         X2263, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X2264, &
         wf%n_o)
!
      call mem%dealloc(X2263)
      call mem%alloc(X2265, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(tAxxx_ovo, X2265, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2266, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X2265, &
         wf%n_v*wf%n_o, &
         X2264, &
         wf%n_o, &
         zero, &
         X2266, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2264)
      call mem%dealloc(X2265)
      call mem%alloc(X2267, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2266, 1, &
         rAx_o, 1, &
         X2267, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2266)
      call add_1432_to_1234(one, X2267, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2267)
      call mem%alloc(X2268, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_312(gxIxx_oov, X2268, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2269, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         X2268, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X2269, &
         wf%n_o)
!
      call mem%dealloc(X2268)
      call mem%alloc(X2270, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X2269, &
         wf%n_o, &
         zero, &
         X2270, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2269)
      call mem%alloc(X2271, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2270, 1, &
         rAx_o, 1, &
         X2271, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2270)
      call add_1432_to_1234(one, X2271, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2271)
      call mem%alloc(X2272, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2272, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2273, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         two, &
         X2272, &
         wf%n_v*wf%n_o, &
         rAx_o, 1, &
         zero, &
         X2273, 1)
!
      call mem%dealloc(X2272)
      call mem%alloc(X2274, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X2274, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X2275, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X2273, &
         wf%n_o, &
         X2274, &
         wf%n_v*wf%n_o, &
         zero, &
         X2275, &
         wf%n_o)
!
      call mem%dealloc(X2273)
      call mem%dealloc(X2274)
      call mem%alloc(X2276, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2275, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X2276, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2275)
      call add_1423_to_1234(one, X2276, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2276)
      call mem%alloc(X2277, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2277, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2278, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         two, &
         X2277, &
         wf%n_v*wf%n_o, &
         rAx_o, 1, &
         zero, &
         X2278, 1)
!
      call mem%dealloc(X2277)
      call mem%alloc(X2279, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X2279, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2280, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X2278, &
         wf%n_o, &
         X2279, &
         wf%n_o**2, &
         zero, &
         X2280, &
         wf%n_o)
!
      call mem%dealloc(X2278)
      call mem%dealloc(X2279)
      call mem%alloc(X2281, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X2280, &
         wf%n_o, &
         zero, &
         X2281, &
         wf%n_v**2)
!
      call mem%dealloc(X2280)
      call add_1324_to_1234(one, X2281, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2281)
      call mem%alloc(X2282, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2282, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2283, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         X2282, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X2283, &
         wf%n_o)
!
      call mem%dealloc(X2282)
      call mem%alloc(X2284, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(tAxxx_ovo, X2284, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2285, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X2284, &
         wf%n_v*wf%n_o, &
         X2283, &
         wf%n_o, &
         zero, &
         X2285, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2283)
      call mem%dealloc(X2284)
      call mem%alloc(X2286, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2285, 1, &
         rAx_o, 1, &
         X2286, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2285)
      call add_1432_to_1234(one, X2286, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2286)
      call mem%alloc(X2287, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_312(gxIxx_oov, X2287, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2288, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X2287, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2288, &
         wf%n_o)
!
      call mem%dealloc(X2287)
      call mem%alloc(X2289, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X2289, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X2290, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X2289, &
         wf%n_v**2, &
         X2288, &
         wf%n_o, &
         zero, &
         X2290, &
         wf%n_v**2)
!
      call mem%dealloc(X2288)
      call mem%dealloc(X2289)
      call mem%alloc(X2291, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2290, 1, &
         rAx_o, 1, &
         X2291, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2290)
      call add_1342_to_1234(one, X2291, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2291)
      call mem%alloc(X2292, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X2292, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2293, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o**2, &
         two, &
         gxIxx_oov, &
         wf%n_o**2, &
         X2292, &
         wf%n_o**2, &
         zero, &
         X2293, &
         wf%n_v)
!
      call mem%dealloc(X2292)
      call mem%alloc(X2294, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         X2293, &
         wf%n_v, &
         zero, &
         X2294, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2293)
      call mem%alloc(X2295, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2294, 1, &
         rAx_o, 1, &
         X2295, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2294)
      call add_1432_to_1234(one, X2295, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2295)
      call mem%alloc(X2296, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2296, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2297, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X2296, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X2297, &
         wf%n_o)
!
      call mem%dealloc(X2296)
      call mem%alloc(X2298, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X2298, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X2299, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X2298, &
         wf%n_v**2, &
         X2297, &
         wf%n_o, &
         zero, &
         X2299, &
         wf%n_v**2)
!
      call mem%dealloc(X2297)
      call mem%dealloc(X2298)
      call mem%alloc(X2300, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2299, 1, &
         rAx_o, 1, &
         X2300, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2299)
      call add_1342_to_1234(one, X2300, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2300)
      call mem%alloc(X2301, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2301, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2302, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         X2301, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X2302, &
         wf%n_o)
!
      call mem%dealloc(X2301)
      call mem%alloc(X2303, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X2302, &
         wf%n_o, &
         zero, &
         X2303, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2302)
      call mem%alloc(X2304, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2303, 1, &
         rAx_o, 1, &
         X2304, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2303)
      call add_1432_to_1234(one, X2304, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2304)
      call mem%alloc(X2305, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(tAxxx_ovo, X2305, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2306, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o**2, &
         two, &
         gxIxx_oov, &
         wf%n_o**2, &
         X2305, &
         wf%n_o**2, &
         zero, &
         X2306, &
         wf%n_v)
!
      call mem%dealloc(X2305)
      call mem%alloc(X2307, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         X2306, &
         wf%n_v, &
         zero, &
         X2307, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2306)
      call mem%alloc(X2308, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2307, 1, &
         rAx_o, 1, &
         X2308, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2307)
      call add_1432_to_1234(one, X2308, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2308)
      call mem%alloc(X2309, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2309, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2310, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         two, &
         X2309, &
         wf%n_v*wf%n_o, &
         rAx_o, 1, &
         zero, &
         X2310, 1)
!
      call mem%dealloc(X2309)
      call mem%alloc(X2311, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X2310, &
         wf%n_o, &
         txxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X2311, &
         wf%n_o)
!
      call mem%dealloc(X2310)
      call mem%alloc(X2312, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2311, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X2312, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2311)
      call add_1423_to_1234(one, X2312, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2312)
      call mem%alloc(X2313, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2313, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2314, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         two, &
         X2313, &
         wf%n_v*wf%n_o, &
         rAx_o, 1, &
         zero, &
         X2314, 1)
!
      call mem%dealloc(X2313)
      call mem%alloc(X2315, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X2315, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2316, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X2314, &
         wf%n_o, &
         X2315, &
         wf%n_o**2, &
         zero, &
         X2316, &
         wf%n_o)
!
      call mem%dealloc(X2314)
      call mem%dealloc(X2315)
      call mem%alloc(X2317, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X2317, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X2318, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         X2317, &
         wf%n_v**2, &
         X2316, &
         wf%n_o, &
         zero, &
         X2318, &
         wf%n_v**2)
!
      call mem%dealloc(X2316)
      call mem%dealloc(X2317)
      call add_1324_to_1234(one, X2318, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2318)
      call mem%alloc(X2319, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2319, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2320, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         X2319, &
         wf%n_o, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X2320, &
         wf%n_o)
!
      call mem%dealloc(X2319)
      call mem%alloc(X2321, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(tAxxx_ovo, X2321, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2322, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X2321, &
         wf%n_v*wf%n_o, &
         X2320, &
         wf%n_o, &
         zero, &
         X2322, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2320)
      call mem%dealloc(X2321)
      call mem%alloc(X2323, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2322, 1, &
         rAx_o, 1, &
         X2323, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2322)
      call add_1432_to_1234(one, X2323, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2323)
      call mem%alloc(X2324, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2324, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2325, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         X2324, &
         wf%n_o, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X2325, &
         wf%n_o)
!
      call mem%dealloc(X2324)
      call mem%alloc(X2326, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X2325, &
         wf%n_o, &
         zero, &
         X2326, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2325)
      call mem%alloc(X2327, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2326, 1, &
         rAx_o, 1, &
         X2327, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2326)
      call add_1432_to_1234(one, X2327, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2327)
      call mem%alloc(X2328, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         gxIxx_oov, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X2328, 1)
!
      call mem%alloc(X2329, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(uxIxx_vvo, X2329, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X2330, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X2328, &
         wf%n_o, &
         X2329, &
         wf%n_v*wf%n_o, &
         zero, &
         X2330, &
         wf%n_o)
!
      call mem%dealloc(X2328)
      call mem%dealloc(X2329)
      call mem%alloc(X2331, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2330, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X2331, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2330)
      call add_1423_to_1234(one, X2331, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2331)
      call mem%alloc(X2332, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         gxIxx_oov, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X2332, 1)
!
      call mem%alloc(X2333, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X2333, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2334, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o**2, &
         wf%n_v, &
         one, &
         X2332, &
         wf%n_o, &
         X2333, &
         wf%n_o**2, &
         zero, &
         X2334, &
         wf%n_o)
!
      call mem%dealloc(X2332)
      call mem%dealloc(X2333)
      call mem%alloc(X2335, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o**2, &
         wf%n_o, &
         one, &
         uxIxx_vvo, &
         wf%n_v**2, &
         X2334, &
         wf%n_o, &
         zero, &
         X2335, &
         wf%n_v**2)
!
      call mem%dealloc(X2334)
      call add_1324_to_1234(one, X2335, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2335)
      call mem%alloc(X2336, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X2336, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2337, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o**2, &
         -two, &
         gxIxx_oov, &
         wf%n_o**2, &
         X2336, &
         wf%n_o**2, &
         zero, &
         X2337, &
         wf%n_v)
!
      call mem%dealloc(X2336)
      call mem%alloc(X2338, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X2337, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X2338, &
         wf%n_v)
!
      call mem%dealloc(X2337)
      call mem%alloc(X2339, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2338, 1, &
         rAx_o, 1, &
         X2339, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2338)
      call add_1342_to_1234(one, X2339, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2339)
      call mem%alloc(X2340, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(tAxxx_ovo, X2340, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2341, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o**2, &
         -two, &
         gxIxx_oov, &
         wf%n_o**2, &
         X2340, &
         wf%n_o**2, &
         zero, &
         X2341, &
         wf%n_v)
!
      call mem%dealloc(X2340)
      call mem%alloc(X2342, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X2341, &
         wf%n_v, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X2342, &
         wf%n_v)
!
      call mem%dealloc(X2341)
      call mem%alloc(X2343, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2342, 1, &
         rAx_o, 1, &
         X2343, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2342)
      call add_1342_to_1234(one, X2343, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2343)
      call mem%alloc(X2344, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         gxIxx_oov, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X2344, 1)
!
      call mem%alloc(X2345, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X2344, &
         wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X2345, &
         wf%n_o)
!
      call mem%dealloc(X2344)
      call mem%alloc(X2346, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X2345, &
         wf%n_o, &
         zero, &
         X2346, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2345)
      call add_1432_to_1234(one, X2346, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2346)
      call mem%alloc(X2347, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2347, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2348, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         -two, &
         X2347, &
         wf%n_v*wf%n_o, &
         rAx_o, 1, &
         zero, &
         X2348, 1)
!
      call mem%dealloc(X2347)
      call mem%alloc(X2349, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X2348, &
         wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X2349, &
         wf%n_o)
!
      call mem%dealloc(X2348)
      call mem%alloc(X2350, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X2349, &
         wf%n_o, &
         zero, &
         X2350, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2349)
      call add_1432_to_1234(one, X2350, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2350)
      call mem%alloc(X2351, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2351, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2352, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X2351, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2352, &
         wf%n_o)
!
      call mem%dealloc(X2351)
      call mem%alloc(X2353, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X2352, &
         wf%n_o, &
         zero, &
         X2353, &
         wf%n_v**2)
!
      call mem%dealloc(X2352)
      call mem%alloc(X2354, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2353, 1, &
         rAx_o, 1, &
         X2354, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2353)
      call add_1342_to_1234(one, X2354, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2354)
      call mem%alloc(X2355, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2355, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2356, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X2355, &
         wf%n_v*wf%n_o, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X2356, &
         wf%n_o)
!
      call mem%dealloc(X2355)
      call mem%alloc(X2357, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         txIxx_vvo, &
         wf%n_v**2, &
         X2356, &
         wf%n_o, &
         zero, &
         X2357, &
         wf%n_v**2)
!
      call mem%dealloc(X2356)
      call mem%alloc(X2358, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2357, 1, &
         rAx_o, 1, &
         X2358, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2357)
      call add_1342_to_1234(one, X2358, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2358)
      call mem%alloc(X2359, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X2359, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2360, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o**2, &
         -two, &
         gxIxx_oov, &
         wf%n_o**2, &
         X2359, &
         wf%n_o**2, &
         zero, &
         X2360, &
         wf%n_v)
!
      call mem%dealloc(X2359)
      call mem%alloc(X2361, wf%n_v, wf%n_o, wf%n_v)
      call sort_to_132(txIxx_vvo, X2361, wf%n_v, wf%n_v, wf%n_o)
      call mem%alloc(X2362, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X2361, &
         wf%n_v*wf%n_o, &
         X2360, &
         wf%n_v, &
         zero, &
         X2362, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2360)
      call mem%dealloc(X2361)
      call mem%alloc(X2363, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2362, 1, &
         rAx_o, 1, &
         X2363, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2362)
      call add_1432_to_1234(one, X2363, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2363)
      call mem%alloc(X2364, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_312(gxIxx_oov, X2364, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2365, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         X2364, &
         wf%n_v*wf%n_o, &
         txIxx_vvo, &
         wf%n_v, &
         zero, &
         X2365, &
         wf%n_o)
!
      call mem%dealloc(X2364)
      call mem%alloc(X2366, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2365, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2366, &
         wf%n_v)
!
      call mem%dealloc(X2365)
      call mem%alloc(X2367, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2366, 1, &
         rAx_o, 1, &
         X2367, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2366)
      call add_1342_to_1234(one, X2367, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2367)
      call mem%alloc(X2368, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2368, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2369, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X2368, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2369, &
         wf%n_o)
!
      call mem%dealloc(X2368)
      call mem%alloc(X2370, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_132(txxxI_vov, X2370, wf%n_v, wf%n_o, wf%n_v)
      call mem%alloc(X2371, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X2370, &
         wf%n_v**2, &
         X2369, &
         wf%n_o, &
         zero, &
         X2371, &
         wf%n_v**2)
!
      call mem%dealloc(X2369)
      call mem%dealloc(X2370)
      call mem%alloc(X2372, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2371, 1, &
         rAx_o, 1, &
         X2372, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2371)
      call add_1342_to_1234(one, X2372, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2372)
      call mem%alloc(X2373, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2373, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2374, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         -two, &
         X2373, &
         wf%n_v*wf%n_o, &
         txxxI_vov, &
         wf%n_v, &
         zero, &
         X2374, &
         wf%n_o)
!
      call mem%dealloc(X2373)
      call mem%alloc(X2375, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2374, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2375, &
         wf%n_v)
!
      call mem%dealloc(X2374)
      call mem%alloc(X2376, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2375, 1, &
         rAx_o, 1, &
         X2376, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2375)
      call add_1342_to_1234(one, X2376, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2376)
      call mem%alloc(X2377, wf%n_o, wf%n_v)
      call sort_to_21(uAIxx_vo, X2377, wf%n_v, wf%n_o)
      call mem%alloc(X2378, wf%n_o)
!
      call dgemv('N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         gxIxx_oov, &
         wf%n_o, &
         X2377, 1, &
         zero, &
         X2378, 1)
!
      call mem%dealloc(X2377)
      call mem%alloc(X2379, wf%n_v, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         u_aibj, &
         wf%n_v**2*wf%n_o, &
         X2378, 1, &
         zero, &
         X2379, 1)
!
      call mem%dealloc(X2378)
      call mem%alloc(X2380, wf%n_v, wf%n_v, wf%n_o)
      call sort_to_312(X2379, X2380, wf%n_v, wf%n_o, wf%n_v)
      call mem%dealloc(X2379)
      call mem%alloc(X2381, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2380, 1, &
         rAx_o, 1, &
         X2381, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2380)
      call add_1342_to_1234(one, X2381, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2381)
      call mem%alloc(X2382, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_o, &
         wf%n_v, &
         two, &
         gxIxx_oov, &
         wf%n_o**2, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X2382, &
         wf%n_o**2)
!
      call mem%alloc(X2383, wf%n_o, wf%n_o)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_o**2, &
         one, &
         X2382, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X2383, 1)
!
      call mem%dealloc(X2382)
      call mem%alloc(X2384, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X2384, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2385, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X2384, &
         wf%n_v**2*wf%n_o, &
         X2383, &
         wf%n_o, &
         zero, &
         X2385, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2383)
      call mem%dealloc(X2384)
      call add_1342_to_1234(one, X2385, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2385)
      call mem%alloc(X2386, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         gxIxx_oov, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X2386, 1)
!
      call mem%alloc(X2387, wf%n_v, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o, &
         one, &
         X2386, &
         wf%n_o, &
         uAIxx_vo, &
         wf%n_v, &
         zero, &
         X2387, &
         wf%n_v)
!
      call mem%dealloc(X2386)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         wf%n_v, &
         one, &
         X2387, &
         wf%n_v, &
         u_aibj, &
         wf%n_v, &
         one, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2387)
      call mem%alloc(X2388, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2388, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2389, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         two, &
         X2388, &
         wf%n_o, &
         uxIxx_vvo, &
         wf%n_v, &
         zero, &
         X2389, &
         wf%n_o)
!
      call mem%dealloc(X2388)
      call mem%alloc(X2390, wf%n_v, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2389, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2390, &
         wf%n_v)
!
      call mem%dealloc(X2389)
      call mem%alloc(X2391, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dger(wf%n_v**2*wf%n_o, &
         wf%n_o, &
         one, &
         X2390, 1, &
         rAx_o, 1, &
         X2391, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2390)
      call add_1342_to_1234(one, X2391, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2391)
      call mem%alloc(X2392, wf%n_o, wf%n_v)
!
      call dgemv('T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         gxIxx_oov, &
         wf%n_o, &
         rAx_o, 1, &
         zero, &
         X2392, 1)
!
      call mem%alloc(X2393, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X2392, &
         wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X2393, &
         wf%n_o)
!
      call mem%dealloc(X2392)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X2393, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2393)
      call mem%alloc(X2394, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2394, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2395, wf%n_o, wf%n_v)
!
      call dgemv('N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         two, &
         X2394, &
         wf%n_v*wf%n_o, &
         rAx_o, 1, &
         zero, &
         X2395, 1)
!
      call mem%dealloc(X2394)
      call mem%alloc(X2396, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v, &
         one, &
         X2395, &
         wf%n_o, &
         uxxxI_vov, &
         wf%n_v*wf%n_o, &
         zero, &
         X2396, &
         wf%n_o)
!
      call mem%dealloc(X2395)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_o, &
         X2396, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2396)
      call mem%alloc(X2397, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_312(gxIxx_oov, X2397, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2398, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X2397, &
         wf%n_v*wf%n_o, &
         t_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X2398, &
         wf%n_o)
!
      call mem%dealloc(X2397)
      call mem%alloc(X2399, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X2398, X2399, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2398)
      call mem%alloc(X2400, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X2399, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X2400, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2399)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X2400, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2400)
      call mem%alloc(X2401, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2401, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2402, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_1423(t_aibj, X2402, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2403, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X2401, &
         wf%n_v*wf%n_o, &
         X2402, &
         wf%n_v*wf%n_o, &
         zero, &
         X2403, &
         wf%n_o)
!
      call mem%dealloc(X2401)
      call mem%dealloc(X2402)
      call mem%alloc(X2404, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X2403, X2404, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2403)
      call mem%alloc(X2405, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X2404, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X2405, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2404)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X2405, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2405)
      call mem%alloc(X2406, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2406, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2407, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X2406, &
         wf%n_o, &
         u_aibj, &
         wf%n_v*wf%n_o, &
         zero, &
         X2407, &
         wf%n_o)
!
      call mem%dealloc(X2406)
      call mem%alloc(X2408, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(X2407, X2408, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2407)
      call mem%alloc(X2409, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X2408, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X2409, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2408)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X2409, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2409)
      call mem%alloc(X2410, wf%n_v)
!
      call dgemv('T', &
         wf%n_o**2, &
         wf%n_v, &
         -two, &
         gxIxx_oov, &
         wf%n_o**2, &
         tAxAx_oo, 1, &
         zero, &
         X2410, 1)
!
      call mem%alloc(X2411, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemv('T', &
         wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         u_aibj, &
         wf%n_v, &
         X2410, 1, &
         zero, &
         X2411, 1)
!
      call mem%dealloc(X2410)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X2411, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2411)
      call mem%alloc(X2412, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v, &
         -two, &
         gxIxx_oov, &
         wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X2412, 1)
!
      call mem%alloc(X2413, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X2412, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X2413, &
         wf%n_o)
!
      call mem%dealloc(X2412)
      call mem%alloc(X2414, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X2414, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2415, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X2414, &
         wf%n_v**2*wf%n_o, &
         X2413, &
         wf%n_o, &
         zero, &
         X2415, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2413)
      call mem%dealloc(X2414)
      call add_1342_to_1234(one, X2415, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2415)
      call mem%alloc(X2416, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v, &
         -two, &
         gxIxx_oov, &
         wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X2416, 1)
!
      call mem%alloc(X2417, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X2416, &
         wf%n_o, &
         tAxAx_oo, &
         wf%n_o, &
         zero, &
         X2417, &
         wf%n_o)
!
      call mem%dealloc(X2416)
      call mem%alloc(X2418, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_1342(u_aibj, X2418, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2419, wf%n_v, wf%n_v, wf%n_o, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v**2*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X2418, &
         wf%n_v**2*wf%n_o, &
         X2417, &
         wf%n_o, &
         zero, &
         X2419, &
         wf%n_v**2*wf%n_o)
!
      call mem%dealloc(X2417)
      call mem%dealloc(X2418)
      call add_1342_to_1234(one, X2419, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2419)
      call mem%alloc(X2420, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_312(gxIxx_oov, X2420, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2421, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X2420, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2421, &
         wf%n_o)
!
      call mem%dealloc(X2420)
      call mem%alloc(X2422, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X2421, &
         wf%n_o, &
         zero, &
         X2422, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2421)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X2422, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2422)
      call mem%alloc(X2423, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(tAxxx_ovo, X2423, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2424, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o**2, &
         two, &
         gxIxx_oov, &
         wf%n_o**2, &
         X2423, &
         wf%n_o**2, &
         zero, &
         X2424, &
         wf%n_v)
!
      call mem%dealloc(X2423)
      call mem%alloc(X2425, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X2425, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2426, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X2425, &
         wf%n_o**2, &
         X2424, &
         wf%n_v, &
         zero, &
         X2426, &
         wf%n_o**2)
!
      call mem%dealloc(X2424)
      call mem%dealloc(X2425)
      call mem%alloc(X2427, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X2426, X2427, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X2426)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X2427, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2427)
      call mem%alloc(X2428, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(tAxxx_ovo, X2428, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2429, wf%n_v, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_v, &
         wf%n_v, &
         wf%n_o**2, &
         two, &
         gxIxx_oov, &
         wf%n_o**2, &
         X2428, &
         wf%n_o**2, &
         zero, &
         X2429, &
         wf%n_v)
!
      call mem%dealloc(X2428)
      call mem%alloc(X2430, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_312(tAxxx_ovo, X2430, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2431, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_v, &
         one, &
         X2430, &
         wf%n_o**2, &
         X2429, &
         wf%n_v, &
         zero, &
         X2431, &
         wf%n_o**2)
!
      call mem%dealloc(X2429)
      call mem%dealloc(X2430)
      call mem%alloc(X2432, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X2431, X2432, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X2431)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X2432, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2432)
      call mem%alloc(X2433, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_312(gxIxx_oov, X2433, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2434, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X2433, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2434, &
         wf%n_o)
!
      call mem%dealloc(X2433)
      call mem%alloc(X2435, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X2435, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2436, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X2435, &
         wf%n_o, &
         X2434, &
         wf%n_o, &
         zero, &
         X2436, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2434)
      call mem%dealloc(X2435)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X2436, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2436)
      call mem%alloc(X2437, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v, &
         -four, &
         gxIxx_oov, &
         wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X2437, 1)
!
      call mem%alloc(X2438, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2437, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X2438, &
         wf%n_o)
!
      call mem%dealloc(X2437)
      call mem%alloc(X2439, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X2438, X2439, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X2438)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2439, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2439)
      call mem%alloc(X2440, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v, &
         two, &
         gxIxx_oov, &
         wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X2440, 1)
!
      call mem%alloc(X2441, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2440, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X2441, &
         wf%n_o)
!
      call mem%dealloc(X2440)
      call mem%alloc(X2442, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_213(tAxxx_ovo, X2442, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2443, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2442, &
         wf%n_v*wf%n_o, &
         X2441, &
         wf%n_o, &
         zero, &
         X2443, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2441)
      call mem%dealloc(X2442)
      call add_1423_to_1234(one, X2443, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2443)
      call mem%alloc(X2444, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v, &
         two, &
         gxIxx_oov, &
         wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X2444, 1)
!
      call mem%alloc(X2445, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2444, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2445, &
         wf%n_o)
!
      call mem%dealloc(X2444)
      call mem%alloc(X2446, wf%n_v, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2445, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X2446, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2445)
      call add_1423_to_1234(one, X2446, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2446)
      call mem%alloc(X2447, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v, &
         eight, &
         gxIxx_oov, &
         wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X2447, 1)
!
      call mem%alloc(X2448, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2447, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2448, &
         wf%n_o)
!
      call mem%dealloc(X2447)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X2448, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2448)
      call mem%alloc(X2449, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2449, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2450, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X2449, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2450, &
         wf%n_o)
!
      call mem%dealloc(X2449)
      call mem%alloc(X2451, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X2450, &
         wf%n_o, &
         zero, &
         X2451, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2450)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X2451, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2451)
      call mem%alloc(X2452, wf%n_v, wf%n_o, wf%n_o)
      call sort_to_312(gxIxx_oov, X2452, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2453, wf%n_o, wf%n_o)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X2452, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2453, &
         wf%n_o)
!
      call mem%dealloc(X2452)
      call mem%alloc(X2454, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2453, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2454, &
         wf%n_o)
!
      call mem%dealloc(X2453)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X2454, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2454)
      call mem%alloc(X2455, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2455, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2456, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X2455, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2456, &
         wf%n_o)
!
      call mem%dealloc(X2455)
      call mem%alloc(X2457, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X2457, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2458, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         X2457, &
         wf%n_o, &
         X2456, &
         wf%n_o, &
         zero, &
         X2458, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2456)
      call mem%dealloc(X2457)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X2458, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2458)
      call mem%alloc(X2459, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(uAxxx_ovo, X2459, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2460, wf%n_o, wf%n_o, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o**2, &
         wf%n_o**2, &
         wf%n_v, &
         -two, &
         gxIxx_oov, &
         wf%n_o**2, &
         X2459, &
         wf%n_o**2, &
         zero, &
         X2460, &
         wf%n_o**2)
!
      call mem%dealloc(X2459)
      call mem%alloc(X2461, wf%n_o, wf%n_o, wf%n_v)
      call sort_to_132(tAxxx_ovo, X2461, wf%n_o, wf%n_v, wf%n_o)
      call mem%alloc(X2462, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'N', &
         wf%n_o**2, &
         wf%n_v, &
         wf%n_o**2, &
         one, &
         X2460, &
         wf%n_o**2, &
         X2461, &
         wf%n_o**2, &
         zero, &
         X2462, &
         wf%n_o**2)
!
      call mem%dealloc(X2460)
      call mem%dealloc(X2461)
      call mem%alloc(X2463, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X2462, X2463, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X2462)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X2463, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2463)
      call mem%alloc(X2464, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2464, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2465, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X2464, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X2465, &
         wf%n_o)
!
      call mem%dealloc(X2464)
      call mem%alloc(X2466, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2465, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2466, &
         wf%n_o)
!
      call mem%dealloc(X2465)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X2466, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2466)
      call mem%alloc(X2467, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2467, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2468, wf%n_o, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         -two, &
         X2467, &
         wf%n_v*wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X2468, &
         wf%n_o)
!
      call mem%dealloc(X2467)
      call mem%alloc(X2469, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         wf%n_o, &
         one, &
         uAxxx_ovo, &
         wf%n_v*wf%n_o, &
         X2468, &
         wf%n_o, &
         zero, &
         X2469, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2468)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X2469, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2469)
      call mem%alloc(X2470, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v, &
         -two, &
         gxIxx_oov, &
         wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X2470, 1)
!
      call mem%alloc(X2471, wf%n_o, wf%n_o, wf%n_v)
!
      call dgemm('T', 'T', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2470, &
         wf%n_o, &
         tAxxx_ovo, &
         wf%n_v*wf%n_o, &
         zero, &
         X2471, &
         wf%n_o)
!
      call mem%dealloc(X2470)
      call mem%alloc(X2472, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(X2471, X2472, wf%n_o, wf%n_o, wf%n_v)
      call mem%dealloc(X2471)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2472, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         one, &
         rho_aibj, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2472)
      call mem%alloc(X2473, wf%n_o, wf%n_o)
!
      call dgemv('N', &
         wf%n_o**2, &
         wf%n_v, &
         -two, &
         gxIxx_oov, &
         wf%n_o**2, &
         rxI_v, 1, &
         zero, &
         X2473, 1)
!
      call mem%alloc(X2474, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('N', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2473, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2474, &
         wf%n_o)
!
      call mem%dealloc(X2473)
      call mem%alloc(X2475, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_v*wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         tAxxx_ovo, &
         wf%n_o, &
         X2474, &
         wf%n_o, &
         zero, &
         X2475, &
         wf%n_v*wf%n_o)
!
      call mem%dealloc(X2474)
      call add_1432_to_1234(one, X2475, rho_aibj, wf%n_v, wf%n_o, wf%n_v, wf%n_o)
      call mem%dealloc(X2475)
      call mem%alloc(X2476, wf%n_o, wf%n_v, wf%n_o)
      call sort_to_132(gxIxx_oov, X2476, wf%n_o, wf%n_o, wf%n_v)
      call mem%alloc(X2477, wf%n_o, wf%n_o)
!
      call dgemm('N', 'T', &
         wf%n_o, &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         two, &
         X2476, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2477, &
         wf%n_o)
!
      call mem%dealloc(X2476)
      call mem%alloc(X2478, wf%n_o, wf%n_v, wf%n_o)
!
      call dgemm('T', 'N', &
         wf%n_o, &
         wf%n_v*wf%n_o, &
         wf%n_o, &
         one, &
         X2477, &
         wf%n_o, &
         uAxxx_ovo, &
         wf%n_o, &
         zero, &
         X2478, &
         wf%n_o)
!
      call mem%dealloc(X2477)
!
      call dger(wf%n_v, &
         wf%n_v*wf%n_o**2, &
         one, &
         rxI_v, 1, &
         X2478, 1, &
         rho_aibj, &
         wf%n_v)
!
      call mem%dealloc(X2478)
!
   end subroutine mu_4_H_nu_1_s_doublet_ccsd

