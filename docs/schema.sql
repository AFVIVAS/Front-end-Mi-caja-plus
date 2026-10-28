-- MiCaja Plus: esquema de base de datos (MySQL 8) y catálogo base de productos.
-- Sin datos de usuarios: tenderos, clientes y operaciones se crean desde la app.

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abonos`
--

CREATE TABLE `abonos` (
  `idAbonos` int NOT NULL,
  `idTendero` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `idCliente` int NOT NULL,
  `abono` int NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apertura`
--

CREATE TABLE `apertura` (
  `idApertura` int NOT NULL,
  `idTendero` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `baseInicial` int NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idCategorias` int NOT NULL,
  `nombre` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idCategorias`, `nombre`) VALUES
(1, 'abarrotes'),
(2, 'bebidas'),
(3, 'dulcería'),
(4, 'licores'),
(5, 'fruver'),
(6, 'lácteos'),
(7, 'aseo personal'),
(8, 'aseo general'),
(9, 'cárnicos'),
(10, 'papelería'),
(11, 'fármacos'),
(12, 'mascotas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int NOT NULL,
  `idTendero` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `cedula` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `nombre` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `saldo` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `costos`
--

CREATE TABLE `costos` (
  `idCostos` int NOT NULL,
  `idTendero` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `mensaje` text COLLATE utf8mb4_general_ci NOT NULL,
  `valor` int NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `proveedor` varchar(40) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `creditos`
--

CREATE TABLE `creditos` (
  `idCreditos` int NOT NULL,
  `idVentas` int NOT NULL,
  `idCliente` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diccionarioproductos`
--

CREATE TABLE `diccionarioproductos` (
  `idDiccionario` int NOT NULL,
  `idProductos` int NOT NULL,
  `sinonimo` varchar(150) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `diccionarioproductos`
--

INSERT INTO `diccionarioproductos` (`idDiccionario`, `idProductos`, `sinonimo`) VALUES
(1, 1, 'arroz diana'),
(2, 1, 'diana arroz'),
(3, 2, 'arroz roa'),
(4, 2, 'roa arroz'),
(5, 3, 'florhuila arroz'),
(6, 3, 'arroz florhuila'),
(7, 4, 'arroz granel'),
(8, 5, 'azucar granel'),
(9, 6, 'azucar manuelita'),
(10, 6, 'manuelita azucar'),
(11, 7, 'providencia azucar'),
(12, 7, 'azucar providencia'),
(13, 8, 'azucar la cabaña'),
(14, 8, 'la cabaña azucar'),
(15, 9, 'azucar carmelita'),
(16, 9, 'carmelita azucar'),
(17, 10, 'frijol diana'),
(18, 10, 'diana frijol'),
(19, 11, 'la constancia frijol'),
(20, 11, 'frijol la constancia'),
(21, 12, 'frijol cargamanto'),
(22, 13, 'frijol bola roja'),
(23, 14, 'frijol calima'),
(24, 15, 'lentejas sabroson'),
(25, 15, 'sabroson lentejas'),
(26, 16, 'aburra lentejas'),
(27, 16, 'lentejas aburra'),
(28, 17, 'diana lentejas'),
(29, 17, 'lentejas diana'),
(30, 18, 'lentejas la castellana'),
(31, 18, 'la castellana lentejas'),
(32, 19, 'refisal sal'),
(33, 19, 'sal refisal'),
(34, 20, 'natusal sal'),
(35, 20, 'sal natusal'),
(36, 21, 'cristal sal'),
(37, 21, 'sal cristal'),
(38, 22, 'donarepa harina amarilla'),
(39, 22, 'harina amarilla donarepa'),
(40, 23, 'donarepa harina blanca'),
(41, 23, 'harina blanca donarepa'),
(42, 24, 'harina haz oros'),
(43, 25, 'pasta espagueti doria'),
(44, 25, 'doria pasta espagueti'),
(45, 26, 'pasta tornillo doria'),
(46, 26, 'doria pasta tornillo'),
(47, 27, 'la muñeca pasta espagueti'),
(48, 27, 'pasta espagueti la muñeca'),
(49, 28, 'pasta tornillo la muñeca'),
(50, 28, 'la muñeca pasta tornillo'),
(51, 29, 'diana garbanzo'),
(52, 29, 'garbanzo diana'),
(53, 30, 'diana maiz pira'),
(54, 30, 'maiz pira diana'),
(55, 31, 'avena quaker'),
(56, 31, 'quaker avena'),
(57, 32, 'sello rojo cafe tradicional'),
(58, 32, 'cafe tradicional sello rojo'),
(59, 33, 'aguila roja cafe tradicional'),
(60, 33, 'cafe tradicional aguila roja'),
(61, 34, 'cafe lukafe'),
(62, 34, 'lukafe cafe'),
(63, 35, 'corona chocolate tradicional'),
(64, 35, 'chocolate tradicional corona'),
(65, 36, 'leche en polvo klim'),
(66, 36, 'klim leche en polvo'),
(67, 37, 'leche en polvo colanta'),
(68, 37, 'colanta leche en polvo'),
(69, 38, 'alqueria leche en polvo'),
(70, 38, 'leche en polvo alqueria'),
(71, 39, 'aceite premier'),
(72, 39, 'premier aceite'),
(73, 40, 'ricaceite aceite'),
(74, 40, 'aceite ricaceite'),
(75, 41, 'fino aceite'),
(76, 41, 'aceite fino'),
(77, 42, 'diana aceite'),
(78, 42, 'aceite diana'),
(79, 43, 'manuelita aceite'),
(80, 43, 'aceite manuelita'),
(81, 44, 'vinagre blanco la constancia'),
(82, 44, 'la constancia vinagre blanco'),
(83, 45, 'fruco salsa tomate'),
(84, 45, 'salsa tomate fruco'),
(85, 46, 'fruco mayonesa'),
(86, 46, 'mayonesa fruco'),
(87, 47, 'mostaza fruco'),
(88, 47, 'fruco mostaza'),
(89, 48, 'maggi'),
(90, 49, 'ricostilla'),
(91, 50, 'atun van camps'),
(92, 50, 'van camps atun'),
(93, 51, 'sardinas van camps'),
(94, 51, 'van camps sardinas'),
(95, 52, 'la constancia arveja'),
(96, 52, 'arveja la constancia'),
(97, 53, 'gelatina royal'),
(98, 54, 'natilla maizena'),
(99, 55, 'colada maizena'),
(100, 56, 'nestle milo'),
(101, 56, 'milo nestle'),
(102, 57, 'mermelada mora fruco'),
(103, 57, 'fruco mermelada mora'),
(104, 58, 'galletas saltin noel'),
(105, 58, 'saltin noel galletas'),
(106, 59, 'galletas noel ducales'),
(107, 59, 'ducales galletas noel'),
(108, 60, 'bicarbonato haz oros'),
(109, 61, 'coca cola'),
(110, 65, 'coca cola sin azucar'),
(111, 65, 'sin azucar coca cola'),
(112, 68, 'manzana postobon'),
(113, 68, 'postobon manzana'),
(114, 72, 'colombiana postobon'),
(115, 72, 'postobon colombiana'),
(116, 76, 'uva postobon'),
(117, 76, 'postobon uva'),
(118, 80, 'pepsi'),
(119, 83, 'cero pepsi'),
(120, 83, 'pepsi cero'),
(121, 85, 'premio'),
(122, 88, 'mango hit'),
(123, 88, 'hit mango'),
(124, 90, 'hit mora'),
(125, 90, 'mora hit'),
(126, 92, 'hit tropical'),
(127, 92, 'tropical hit'),
(128, 94, 'del valle jugo naranja'),
(129, 94, 'jugo naranja del valle'),
(130, 96, 'cristal agua'),
(131, 96, 'agua cristal'),
(132, 99, 'brisa agua'),
(133, 99, 'agua brisa'),
(134, 102, 'cristal agua con gas'),
(135, 102, 'agua con gas cristal'),
(136, 103, 'brisa agua con gas'),
(137, 103, 'agua con gas brisa'),
(138, 104, 'pony malta'),
(139, 108, 'leona malta'),
(140, 108, 'malta leona'),
(141, 112, 'vive 100'),
(142, 114, 'speed max'),
(143, 116, 'gatorade naranja'),
(144, 116, 'naranja gatorade'),
(145, 117, 'power azul'),
(146, 117, 'azul power'),
(147, 118, 'power mora'),
(148, 118, 'mora power'),
(149, 119, 'alpina avena original'),
(150, 119, 'avena original alpina'),
(151, 121, 'alpin chocolate'),
(152, 122, 'colanta leche achocolatada'),
(153, 122, 'leche achocolatada colanta'),
(154, 123, 'alpina leche achocolatada'),
(155, 123, 'leche achocolatada alpina'),
(156, 124, 'trebol panela'),
(157, 124, 'panela trebol'),
(158, 125, 'triangulo panela'),
(159, 125, 'panela triangulo'),
(160, 126, 'jet chocolatina'),
(161, 126, 'chocolatina jet'),
(162, 129, 'jet chocolatina mani'),
(163, 129, 'chocolatina mani jet'),
(164, 130, 'trululu gusanos acidos'),
(165, 130, 'gusanos acidos trululu'),
(166, 131, 'aros acidos trululu'),
(167, 131, 'trululu aros acidos'),
(168, 132, 'trululu ositos'),
(169, 132, 'ositos trululu'),
(170, 133, 'bon bon bum'),
(171, 134, 'festival galletas fresa'),
(172, 134, 'galletas fresa festival'),
(173, 135, 'galletas chocolate festival'),
(174, 135, 'festival galletas chocolate'),
(175, 136, 'oreo galletas'),
(176, 136, 'galletas oreo'),
(177, 137, 'galletas mini oreo'),
(178, 137, 'oreo galletas mini'),
(179, 138, 'galletas miel tosh'),
(180, 138, 'tosh galletas miel'),
(181, 139, 'ramo chocoramo'),
(182, 139, 'chocoramo ramo'),
(183, 140, 'gansito ramo'),
(184, 140, 'ramo gansito'),
(185, 141, 'mani moto'),
(186, 142, 'mani salado la especial'),
(187, 142, 'la especial mani salado'),
(188, 143, 'bocadillo veleño'),
(189, 144, 'cocadas artesanales'),
(190, 145, 'margarita papas bbq'),
(191, 145, 'papas bbq margarita'),
(192, 146, 'margarita papas natural'),
(193, 146, 'papas natural margarita'),
(194, 147, 'papas limon margarita'),
(195, 147, 'margarita papas limon'),
(196, 148, 'yupi cheetos'),
(197, 148, 'cheetos yupi'),
(198, 149, 'chitos yupi'),
(199, 149, 'yupi chitos'),
(200, 150, 'nucita'),
(201, 151, 'confites barrilete'),
(202, 151, 'barrilete confites'),
(203, 152, 'supercoco'),
(204, 153, 'mentas trident'),
(205, 153, 'trident mentas'),
(206, 154, 'chicle trident'),
(207, 154, 'trident chicle'),
(208, 155, 'adams chicle'),
(209, 155, 'chicle adams'),
(210, 156, 'bubbaloo'),
(211, 157, 'choco break'),
(212, 158, 'antioqueño aguardiente tapa roja'),
(213, 158, 'aguardiente tapa roja antioqueño'),
(214, 159, 'antioqueño aguardiente tapa azul'),
(215, 159, 'aguardiente tapa azul antioqueño'),
(216, 160, 'antioqueño aguardiente mini'),
(217, 160, 'aguardiente mini antioqueño'),
(218, 161, 'viejo caldas ron tradicional'),
(219, 161, 'ron tradicional viejo caldas'),
(220, 162, 'smirnoff vodka'),
(221, 162, 'vodka smirnoff'),
(222, 163, 'cerveza aguila original'),
(223, 164, 'cerveza aguila original lata'),
(224, 165, 'cerveza aguila light'),
(225, 166, 'cerveza aguila light lata'),
(226, 167, 'poker cerveza'),
(227, 167, 'cerveza poker'),
(228, 168, 'poker cerveza lata'),
(229, 168, 'cerveza lata poker'),
(230, 169, 'club colombia cerveza'),
(231, 169, 'cerveza club colombia'),
(232, 170, 'club colombia cerveza lata'),
(233, 170, 'cerveza lata club colombia'),
(234, 171, 'corona cerveza'),
(235, 171, 'cerveza corona'),
(236, 172, 'cerveza lata corona'),
(237, 172, 'corona cerveza lata'),
(238, 175, 'banano criollo'),
(239, 176, 'banano bocadillo'),
(240, 177, 'manzana roja'),
(241, 178, 'manzana verde'),
(242, 179, 'pera'),
(243, 180, 'naranja'),
(244, 181, 'mandarina'),
(245, 182, 'limon tahiti hit'),
(246, 182, 'hit limon tahiti'),
(247, 183, 'limon mandarino'),
(248, 184, 'lulo'),
(249, 185, 'maracuya'),
(250, 186, 'guayaba'),
(251, 187, 'papaya'),
(252, 188, 'piña'),
(253, 189, 'mango'),
(254, 190, 'aguacate'),
(255, 191, 'granadilla'),
(256, 192, 'fresa'),
(257, 193, 'mora'),
(258, 194, 'uva'),
(259, 195, 'sandia'),
(260, 196, 'melon'),
(261, 197, 'tomate arbol'),
(262, 198, 'papa criolla'),
(263, 199, 'papa pastusa'),
(264, 200, 'yuca'),
(265, 201, 'arracacha'),
(266, 202, 'platano verde'),
(267, 203, 'platano maduro'),
(268, 204, 'cebolla cabezona blanca'),
(269, 205, 'cebolla cabezona roja'),
(270, 206, 'cebolla larga'),
(271, 207, 'ajo'),
(272, 208, 'tomate chonto'),
(273, 209, 'tomate cherry'),
(274, 210, 'zanahoria'),
(275, 211, 'remolacha'),
(276, 212, 'pepino'),
(277, 213, 'lechuga romana'),
(278, 214, 'cilantro'),
(279, 215, 'apio'),
(280, 216, 'repollo blanco'),
(281, 216, 'blanco repollo'),
(282, 217, 'repollo morado'),
(283, 218, 'habichuela'),
(284, 219, 'arveja verde'),
(285, 220, 'mazorca'),
(286, 221, 'ahuyama'),
(287, 222, 'calabacin verde'),
(288, 223, 'pimenton rojo'),
(289, 224, 'pimenton verde'),
(290, 225, 'champiñon'),
(291, 226, 'alqueria leche entera'),
(292, 226, 'leche entera alqueria'),
(293, 229, 'alqueria leche deslactosada'),
(294, 229, 'leche deslactosada alqueria'),
(295, 232, 'alqueria leche semidescremada'),
(296, 232, 'leche semidescremada alqueria'),
(297, 235, 'colanta leche entera'),
(298, 235, 'leche entera colanta'),
(299, 238, 'leche deslactosada colanta'),
(300, 238, 'colanta leche deslactosada'),
(301, 241, 'colanta leche semidescremada'),
(302, 241, 'leche semidescremada colanta'),
(303, 244, 'leche entera alpina'),
(304, 244, 'alpina leche entera'),
(305, 247, 'alpina leche deslactosada'),
(306, 247, 'leche deslactosada alpina'),
(307, 250, 'leche semidescremada alpina'),
(308, 250, 'alpina leche semidescremada'),
(309, 253, 'san fernando leche entera'),
(310, 253, 'leche entera san fernando'),
(311, 256, 'kumis alpina'),
(312, 256, 'alpina kumis'),
(313, 258, 'colanta kumis'),
(314, 258, 'kumis colanta'),
(315, 260, 'yogurt natural alpina'),
(316, 260, 'alpina yogurt natural'),
(317, 261, 'yogurt fresa alpina'),
(318, 261, 'alpina yogurt fresa'),
(319, 262, 'alpina yogurt durazno'),
(320, 262, 'yogurt durazno alpina'),
(321, 263, 'yogurt mora alpina'),
(322, 263, 'alpina yogurt mora'),
(323, 264, 'colanta yogurt natural'),
(324, 264, 'yogurt natural colanta'),
(325, 265, 'colanta yogurt fresa'),
(326, 265, 'yogurt fresa colanta'),
(327, 266, 'colanta yogurt mora'),
(328, 266, 'yogurt mora colanta'),
(329, 267, 'alpina avena'),
(330, 267, 'avena alpina'),
(331, 269, 'colanta avena'),
(332, 269, 'avena colanta'),
(333, 271, 'alqueria chocolate'),
(334, 271, 'chocolate alqueria'),
(335, 273, 'chocolate alpina'),
(336, 273, 'alpina chocolate'),
(337, 275, 'colanta chocolate'),
(338, 275, 'chocolate colanta'),
(339, 277, 'alpina bebida lactea bon yurt'),
(340, 277, 'bebida lactea bon yurt alpina'),
(341, 278, 'alpina bebida lactea yogo yogo'),
(342, 278, 'bebida lactea yogo yogo alpina'),
(343, 280, 'alpina crema leche'),
(344, 280, 'crema leche alpina'),
(345, 282, 'colanta crema leche'),
(346, 282, 'crema leche colanta'),
(347, 284, 'leche condensada alpina'),
(348, 284, 'alpina leche condensada'),
(349, 285, 'colanta leche condensada'),
(350, 285, 'leche condensada colanta'),
(351, 286, 'sedal shampoo'),
(352, 286, 'shampoo sedal'),
(353, 287, 'shampoo pantene'),
(354, 288, 'shampoo savital'),
(355, 289, 'head & shoulders clasico shampoo'),
(356, 289, 'shampoo head & shoulders clasico'),
(357, 290, 'shampoo dove'),
(358, 290, 'dove shampoo'),
(359, 291, 'acondicionador sedal'),
(360, 291, 'sedal acondicionador'),
(361, 292, 'acondicionador pantene'),
(362, 293, 'acondicionador savital'),
(363, 294, 'dove acondicionador'),
(364, 294, 'acondicionador dove'),
(365, 295, 'rexona desodorante mujer'),
(366, 295, 'desodorante mujer rexona'),
(367, 296, 'desodorante hombre rexona'),
(368, 296, 'rexona desodorante hombre'),
(369, 297, 'desodorante mujer dove'),
(370, 297, 'dove desodorante mujer'),
(371, 298, 'desodorante hombre dove'),
(372, 298, 'dove desodorante hombre'),
(373, 299, 'nivea desodorante mujer'),
(374, 299, 'desodorante mujer nivea'),
(375, 300, 'nivea desodorante hombre'),
(376, 300, 'desodorante hombre nivea'),
(377, 301, 'maquina afeitar prestobarba azul gillette'),
(378, 301, 'gillette maquina afeitar prestobarba azul'),
(379, 302, 'gillette maquina afeitar prestobarba 3'),
(380, 302, 'maquina afeitar prestobarba 3 gillette'),
(381, 303, 'gillette maquina afeitar prestobarba ultragrip'),
(382, 303, 'maquina afeitar prestobarba ultragrip gillette'),
(383, 304, 'ego gel'),
(384, 304, 'gel ego'),
(385, 305, 'crema peinar ego'),
(386, 305, 'ego crema peinar'),
(387, 306, 'jabon liquido dove'),
(388, 306, 'dove jabon liquido'),
(389, 307, 'nivea crema azul'),
(390, 307, 'crema azul nivea'),
(391, 308, 'ponds crema'),
(392, 308, 'crema ponds'),
(393, 309, 'listerine enjuague bucal'),
(394, 309, 'enjuague bucal listerine'),
(395, 310, 'enjuague bucal colgate plax'),
(396, 310, 'colgate plax enjuague bucal'),
(397, 311, 'dove jabon humectante'),
(398, 311, 'jabon humectante dove'),
(399, 312, 'jabon pepino dove'),
(400, 312, 'dove jabon pepino'),
(401, 313, 'jabon fresh protex'),
(402, 313, 'protex jabon fresh'),
(403, 314, 'jabon nivea'),
(404, 314, 'nivea jabon'),
(405, 316, 'jabon liquido antibacterial protex'),
(406, 316, 'protex jabon liquido antibacterial'),
(407, 318, 'crema dental colgate'),
(408, 318, 'colgate crema dental'),
(409, 319, 'crema dental total 12 colgate'),
(410, 319, 'colgate crema dental total 12'),
(411, 320, 'crema dental oral b'),
(412, 320, 'oral b crema dental'),
(413, 321, 'hilo dental colgate'),
(414, 321, 'colgate hilo dental'),
(415, 322, 'hilo dental oral b'),
(416, 322, 'oral b hilo dental'),
(417, 323, 'protectores diarios nosotras'),
(418, 323, 'nosotras protectores diarios'),
(419, 324, 'nosotras tampones'),
(420, 324, 'tampones nosotras'),
(421, 325, 'shampoo johnson bebe'),
(422, 325, 'johnson bebe shampoo'),
(423, 326, 'crema johnson bebe'),
(424, 326, 'johnson bebe crema'),
(425, 327, 'colgate cepillo dental'),
(426, 327, 'cepillo dental colgate'),
(427, 328, 'oral b cepillo dental'),
(428, 328, 'cepillo dental oral b'),
(429, 329, 'familia papel higienico'),
(430, 329, 'papel higienico familia'),
(431, 330, 'scott papel higienico'),
(432, 330, 'papel higienico scott'),
(433, 331, 'colonia arrurru'),
(434, 331, 'arrurru colonia'),
(435, 332, 'corta uñas'),
(436, 333, 'algodon'),
(437, 334, 'isopos algodon'),
(438, 335, 'cepillo para cabello'),
(439, 336, 'ligas para cabello'),
(440, 337, 'ariel detergente'),
(441, 337, 'detergente ariel'),
(442, 339, 'detergente fab'),
(443, 339, 'fab detergente'),
(444, 341, 'as detergente'),
(445, 341, 'detergente as'),
(446, 343, 'jabon rey'),
(447, 343, 'rey jabon'),
(448, 344, 'jabon coco'),
(449, 344, 'coco jabon'),
(450, 345, 'blanco jabon'),
(451, 345, 'jabon blanco'),
(452, 346, 'suavizante suavitel'),
(453, 346, 'suavitel suavizante'),
(454, 347, 'cloro blancox'),
(455, 347, 'blancox cloro'),
(456, 348, 'blancox blanqueador ropa color'),
(457, 348, 'blanqueador ropa color blancox'),
(458, 349, 'blanqueador patojito'),
(459, 349, 'patojito blanqueador'),
(460, 350, 'fabuloso desinfectante'),
(461, 350, 'desinfectante fabuloso'),
(462, 351, 'lavaloza limon axion'),
(463, 351, 'axion lavaloza limon'),
(464, 352, 'esponja lavaplatos'),
(465, 353, 'fibra verde'),
(466, 354, 'fibra metalica'),
(467, 355, 'raid insecticida'),
(468, 355, 'insecticida raid'),
(469, 356, 'insecticida baygon'),
(470, 356, 'baygon insecticida'),
(471, 357, 'bolsa basura negra'),
(472, 358, 'papel aluminio'),
(473, 359, 'escoba'),
(474, 360, 'trapeador'),
(475, 361, 'recogedor'),
(476, 362, 'guantes caucho'),
(477, 363, 'carne res molida'),
(478, 364, 'carne res pulpa'),
(479, 365, 'carne res sobrebarriga'),
(480, 366, 'carne res pecho'),
(481, 367, 'carne res costilla'),
(482, 368, 'carne cerdo lomo'),
(483, 369, 'carne cerdo pierna'),
(484, 370, 'carne cerdo costilla'),
(485, 371, 'carne cerdo chuleta'),
(486, 372, 'carne cerdo tocino'),
(487, 373, 'pollo entero'),
(488, 374, 'pollo pechuga'),
(489, 375, 'pollo alas'),
(490, 376, 'pollo muslos'),
(491, 377, 'salchicha ranchera'),
(492, 377, 'ranchera salchicha'),
(493, 379, 'zenu salchicha tradicional'),
(494, 379, 'salchicha tradicional zenu'),
(495, 381, 'mortadela tradicional zenu'),
(496, 381, 'zenu mortadela tradicional'),
(497, 382, 'zenu jamon tradicional'),
(498, 382, 'jamon tradicional zenu'),
(499, 383, 'chorizo artesanal'),
(500, 384, 'norma cuaderno cuadriculado'),
(501, 384, 'cuaderno cuadriculado norma'),
(502, 386, 'norma cuaderno rayado'),
(503, 386, 'cuaderno rayado norma'),
(504, 388, 'cuaderno argollado cuadriculado'),
(505, 389, 'cuaderno argollado rayado'),
(506, 390, 'block cuadriculado'),
(507, 391, 'block rayado'),
(508, 392, 'block blanco'),
(509, 392, 'blanco block'),
(510, 393, 'cartulina'),
(511, 395, 'fomi'),
(512, 396, 'carton paja'),
(513, 397, 'bolsa regalo'),
(514, 398, 'sobres cartas'),
(515, 399, 'lapicero'),
(516, 400, 'lapiz'),
(517, 401, 'portaminas'),
(518, 402, 'mina portaminas'),
(519, 403, 'sharpie marcador'),
(520, 403, 'marcador sharpie'),
(521, 404, 'resaltador'),
(522, 405, 'colores'),
(523, 407, 'crayones'),
(524, 408, 'plastilina'),
(525, 409, 'temperas'),
(526, 410, 'pincel escolar'),
(527, 411, 'colbon pegante'),
(528, 411, 'pegante colbon'),
(529, 412, 'pegante en barra'),
(530, 413, 'silicona liquida'),
(531, 414, 'silicona en barra'),
(532, 415, 'corrector liquido'),
(533, 416, 'tijeras escolar'),
(534, 417, 'regla'),
(535, 418, 'borrador nata'),
(536, 419, 'sacapuntas'),
(537, 420, 'carpeta plastica'),
(538, 421, 'gancho legajador'),
(539, 422, 'cinta transparente'),
(540, 423, 'cinta enmascarar'),
(541, 424, 'grapadora'),
(542, 425, 'acetaminofen'),
(543, 426, 'ibuprofeno'),
(544, 427, 'aspirina'),
(545, 428, 'naproxeno'),
(546, 429, 'dolex gripa'),
(547, 429, 'gripa dolex'),
(548, 430, 'noxpirin'),
(549, 431, 'loratadina'),
(550, 432, 'sal frutas'),
(551, 433, 'omeprazol'),
(552, 434, 'enterogermina'),
(553, 435, 'alcohol antiséptico'),
(554, 436, 'agua oxigenada'),
(555, 437, 'isodine'),
(556, 438, 'curas adhesivas'),
(557, 439, 'gasa esteril'),
(558, 440, 'micropore'),
(559, 441, 'vick vaporub'),
(560, 441, 'vaporub vick'),
(561, 442, 'concentrado adulto dog chow'),
(562, 442, 'dog chow concentrado adulto'),
(563, 443, 'concentrado cachorro dog chow'),
(564, 443, 'dog chow concentrado cachorro'),
(565, 444, 'concentrado adulto pedigree'),
(566, 444, 'pedigree concentrado adulto'),
(567, 445, 'concentrado cachorro pedigree'),
(568, 445, 'pedigree concentrado cachorro'),
(569, 446, 'whiskas concentrado adulto'),
(570, 446, 'concentrado adulto whiskas'),
(571, 447, 'pedigree alimento humedo'),
(572, 447, 'alimento humedo pedigree'),
(573, 448, 'alimento humedo dog chow'),
(574, 448, 'dog chow alimento humedo'),
(575, 449, 'alimento humedo felix'),
(576, 449, 'felix alimento humedo'),
(577, 450, 'huevos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

CREATE TABLE `gastos` (
  `idGastos` int NOT NULL,
  `idTendero` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `mensaje` text COLLATE utf8mb4_general_ci NOT NULL,
  `valor` int NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `idInventario` int NOT NULL,
  `idTendero` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `cantidad` int NOT NULL,
  `valorVenta` int NOT NULL,
  `valorCompra` int NOT NULL,
  `nombreProducto` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `presentacion` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `idCategoria` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProductos` int NOT NULL,
  `idCategorias` int NOT NULL,
  `nombre` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `presentacion` varchar(30) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProductos`, `idCategorias`, `nombre`, `presentacion`) VALUES
(1, 1, 'arroz diana', '1 libra'),
(2, 1, 'arroz roa', '1 libra'),
(3, 1, 'arroz florhuila', '1 libra'),
(4, 1, 'arroz a granel', '1 libra'),
(5, 1, 'azucar a granel', '1 libra'),
(6, 1, 'azucar manuelita', '1 libra'),
(7, 1, 'azucar providencia', '1 libra'),
(8, 1, 'azucar la cabaña', '1 libra'),
(9, 1, 'azucar carmelita', '1 libra'),
(10, 1, 'frijol diana', '1 libra'),
(11, 1, 'frijol la constancia', '1 libra'),
(12, 1, 'frijol cargamanto', '1 libra'),
(13, 1, 'frijol bola roja', '1 libra'),
(14, 1, 'frijol calima', '1 libra'),
(15, 1, 'lentejas sabroson', '1 libra'),
(16, 1, 'lentejas aburra', '1 libra'),
(17, 1, 'lentejas diana', '1 libra'),
(18, 1, 'lentejas la castellana', '1 libra'),
(19, 1, 'sal refisal', '1 libra'),
(20, 1, 'sal natusal', '1 libra'),
(21, 1, 'sal cristal', '1 libra'),
(22, 1, 'harina donarepa amarilla', '1 libra'),
(23, 1, 'harina donarepa blanca', '1 libra'),
(24, 1, 'harina haz de oros', '1 libra'),
(25, 1, 'pasta doria espagueti', 'paquete 500 gramos'),
(26, 1, 'pasta doria tornillo', 'paquete 500 gramos'),
(27, 1, 'pasta la muñeca espagueti', 'paquete 500 gramos'),
(28, 1, 'pasta la muñeca tornillo', 'paquete 500 gramos'),
(29, 1, 'garbanzo diana', '1 libra'),
(30, 1, 'maiz pira diana', '500 gramos'),
(31, 1, 'avena quaker', '500 gramos'),
(32, 1, 'cafe sello rojo tradicional', '250 gramos'),
(33, 1, 'cafe aguila roja tradicional', '250 gramos'),
(34, 1, 'cafe lukafe', '250 gramos'),
(35, 1, 'chocolate corona tradicional', '500 gramos'),
(36, 1, 'leche en polvo klim', '800 gramos'),
(37, 1, 'leche en polvo colanta', '400 gramos'),
(38, 1, 'leche en polvo alqueria', '380 gramos'),
(39, 1, 'aceite premier', '900 ml'),
(40, 1, 'aceite ricaceite', '1 litro'),
(41, 1, 'aceite fino', '1 litro'),
(42, 1, 'aceite diana', '1 litro'),
(43, 1, 'aceite manuelita', '1 litro'),
(44, 1, 'vinagre blanco la constancia', '1 litro'),
(45, 1, 'salsa de tomate fruco', '400 gramos'),
(46, 1, 'mayonesa fruco', '380 gramos'),
(47, 1, 'mostaza fruco', '200 gramos'),
(48, 1, 'maggi', 'cubo'),
(49, 1, 'ricostilla', 'cubo'),
(50, 1, 'atún van camps', '160 gramos'),
(51, 1, 'sardinas van camps', '125 gramos'),
(52, 1, 'arveja la constancia', '300 gramos'),
(53, 1, 'gelatina royal', '85 gramos'),
(54, 1, 'natilla maizena', '300 gramos'),
(55, 1, 'colada maizena', '200 gramos'),
(56, 1, 'milo nestle', '400 gramos'),
(57, 1, 'mermelada fruco mora', '250 gramos'),
(58, 1, 'galletas saltin noel', 'taco'),
(59, 1, 'galletas ducales noel', 'taco'),
(60, 1, 'bicarbonato haz de oros', '100 gramos'),
(61, 2, 'coca cola', '250 ml'),
(62, 2, 'coca cola', '400 ml'),
(63, 2, 'coca cola', '1.5 litros'),
(64, 2, 'coca cola', '3 litros'),
(65, 2, 'coca cola sin azucar', '400 ml'),
(66, 2, 'coca cola sin azucar', '1.5 litros'),
(67, 2, 'coca cola sin azucar', '3 litros'),
(68, 2, 'postobon manzana', '250 ml'),
(69, 2, 'postobon manzana', '400 ml'),
(70, 2, 'postobon manzana', '1.5 litros'),
(71, 2, 'postobon manzana', '2.5 litros'),
(72, 2, 'postobon colombiana', '250 ml'),
(73, 2, 'postobon colombiana', '400 ml'),
(74, 2, 'postobon colombiana', '1.5 litros'),
(75, 2, 'postobon colombiana', '2.5 litros'),
(76, 2, 'postobon uva', '250 ml'),
(77, 2, 'postobon uva', '400 ml'),
(78, 2, 'postobon uva', '1.5 litros'),
(79, 2, 'postobon uva', '2.5 litros'),
(80, 2, 'pepsi', '400 ml'),
(81, 2, 'pepsi', '1.5 litros'),
(82, 2, 'pepsi', '3 litros'),
(83, 2, 'pepsi cero', '400 ml'),
(84, 2, 'pepsi cero', '1.5 litros'),
(85, 2, 'premio', '400 ml'),
(86, 2, 'premio', '1.5 litros'),
(87, 2, 'premio', '3 litros'),
(88, 2, 'hit mango', '500 ml'),
(89, 2, 'hit mango', '1 litro'),
(90, 2, 'hit mora', '500 ml'),
(91, 2, 'hit mora', '1 litro'),
(92, 2, 'hit tropical', '500 ml'),
(93, 2, 'hit tropical', '1 litro'),
(94, 2, 'jugo del valle naranja', '500 ml'),
(95, 2, 'jugo del valle naranja', '1.5 litro'),
(96, 2, 'agua cristal', '300 ml'),
(97, 2, 'agua cristal', '600 ml'),
(98, 2, 'agua cristal', '1.5 litro'),
(99, 2, 'agua brisa', '300 ml'),
(100, 2, 'agua brisa', '600 ml'),
(101, 2, 'agua brisa', '1.5 litro'),
(102, 2, 'agua cristal con gas', '600 ml'),
(103, 2, 'agua brisa con gas', '600 ml'),
(104, 2, 'pony malta', '200 ml'),
(105, 2, 'pony malta', '330 ml'),
(106, 2, 'pony malta', '1.5 litro'),
(107, 2, 'pony malta', '2 litro'),
(108, 2, 'malta leona', '200 ml'),
(109, 2, 'malta leona', '330 ml'),
(110, 2, 'malta leona', '1.5 litro'),
(111, 2, 'malta leona', '2 litros'),
(112, 2, 'vive 100', '300 ml'),
(113, 2, 'vive 100', '500 ml'),
(114, 2, 'speed max', '250 ml'),
(115, 2, 'speed max', '473 ml'),
(116, 2, 'gatorade naranja', '500 ml'),
(117, 2, 'power azul', '500 ml'),
(118, 2, 'power mora', '500 ml'),
(119, 2, 'avena alpina original', '250 ml'),
(120, 2, 'avena alpina original', '1 litro'),
(121, 2, 'alpin chocolate', '200 ml'),
(122, 2, 'leche achocolatada colanta', '200 ml'),
(123, 2, 'leche achocolatada alpina', '200 ml'),
(124, 1, 'panela trebol', 'atado'),
(125, 1, 'panela triangulo', 'atado'),
(126, 3, 'chocolatina jet', 'pequeña'),
(127, 3, 'chocolatina jet', 'mediana'),
(128, 3, 'chocolatina jet ', 'jumbo'),
(129, 3, 'chocolatina jet mani', 'jumbo'),
(130, 3, 'trululu gusanos acidos', 'paquete'),
(131, 3, 'trululu aros acidos', 'paquete'),
(132, 3, 'trululu ositos', 'paquete'),
(133, 3, 'bon bon bum', 'unidad'),
(134, 3, 'galletas festival fresa', 'unidad'),
(135, 3, 'galletas festival chocolate', 'unidad'),
(136, 3, 'galletas oreo', 'unidad'),
(137, 3, 'galletas oreo mini', 'unidad'),
(138, 3, 'galletas tosh miel', 'unidad'),
(139, 3, 'chocoramo ramo', 'unidad'),
(140, 3, 'gansito ramo', 'unidad'),
(141, 3, 'mani moto', 'paquete'),
(142, 3, 'mani salado la especial', 'paquete'),
(143, 3, 'bocadillo veleño', 'unidad'),
(144, 3, 'cocadas artesanales', 'unidad'),
(145, 3, 'papas margarita bbq', 'paquete 105 gramos'),
(146, 3, 'papas margarita natural', 'paquete 105 gramos'),
(147, 3, 'papas margarita limon', 'paquete 105 gramos'),
(148, 3, 'cheetos yupi', 'paquete 90 gramos'),
(149, 3, 'chitos yupi', 'paquete 40 gramos'),
(150, 3, 'nucita', 'unidad 30 gramos'),
(151, 3, 'barrilete confites', 'unidad'),
(152, 3, 'supercoco', 'unidad'),
(153, 3, 'mentas trident', 'unidad'),
(154, 3, 'chicle trident', 'unidad'),
(155, 3, 'chicle adams', 'unidad'),
(156, 3, 'bubbaloo', 'unidad'),
(157, 3, 'choco break', 'unidad'),
(158, 4, 'aguardiente antioqueño tapa roja', '750 ml'),
(159, 4, 'aguardiente antioqueño tapa azul', '750 ml'),
(160, 4, 'aguardiente antioqueño mini', '375 ml'),
(161, 4, 'ron viejo de caldas tradicional', '750 ml'),
(162, 4, 'vodka smirnoff', '750 ml'),
(163, 4, 'cerveza aguila original', '330 ml'),
(164, 4, 'cerveza aguila original lata', '330 ml'),
(165, 4, 'cerveza aguila light', '330 ml'),
(166, 4, 'cerveza aguila light lata', '330 ml'),
(167, 4, 'cerveza poker', '330 ml'),
(168, 4, 'cerveza poker lata', '330 ml'),
(169, 4, 'cerveza club colombia', '330 ml'),
(170, 4, 'cerveza club colombia lata', '330 ml'),
(171, 4, 'cerveza corona', '355 ml'),
(172, 4, 'cerveza corona lata', '355 ml'),
(173, 4, 'cerveza aguila original', '1 litro'),
(174, 4, 'cerveza poker', '1 litro'),
(175, 5, 'banano criollo', 'libra'),
(176, 5, 'banano bocadillo', 'libra'),
(177, 5, 'manzana roja', 'libra'),
(178, 5, 'manzana verde', 'libra'),
(179, 5, 'pera', 'libra'),
(180, 5, 'naranja', 'libra'),
(181, 5, 'mandarina', 'libra'),
(182, 5, 'limon tahiti', 'libra'),
(183, 5, 'limon mandarino', 'libra'),
(184, 5, 'lulo', 'libra'),
(185, 5, 'maracuya', 'libra'),
(186, 5, 'guayaba', 'libra'),
(187, 5, 'papaya', 'libra'),
(188, 5, 'piña', 'libra'),
(189, 5, 'mango', 'libra'),
(190, 5, 'aguacate', 'libra'),
(191, 5, 'granadilla', 'libra'),
(192, 5, 'fresa', 'bandeja'),
(193, 5, 'mora', 'libra'),
(194, 5, 'uva', 'bandeja'),
(195, 5, 'sandia', 'libra'),
(196, 5, 'melon', 'libra'),
(197, 5, 'tomate de arbol', 'libra'),
(198, 5, 'papa criolla', 'libra'),
(199, 5, 'papa pastusa', 'libra'),
(200, 5, 'yuca', 'libra'),
(201, 5, 'arracacha', 'libra'),
(202, 5, 'platano verde', 'libra'),
(203, 5, 'platano maduro', 'libra'),
(204, 5, 'cebolla cabezona blanca', 'libra'),
(205, 5, 'cebolla cabezona roja', 'libra'),
(206, 5, 'cebolla larga', 'libra'),
(207, 5, 'ajo', 'libra'),
(208, 5, 'tomate chonto', 'libra'),
(209, 5, 'tomate cherry', 'bandeja'),
(210, 5, 'zanahoria', 'libra'),
(211, 5, 'remolacha', 'libra'),
(212, 5, 'pepino', 'libra'),
(213, 5, 'lechuga romana', 'libra'),
(214, 5, 'cilantro', 'atado'),
(215, 5, 'apio', 'unidad'),
(216, 5, 'repollo blanco', 'libra'),
(217, 5, 'repollo morado', 'libra'),
(218, 5, 'habichuela', 'libra'),
(219, 5, 'arveja verde', 'libra'),
(220, 5, 'mazorca', 'unidad'),
(221, 5, 'ahuyama', 'libra'),
(222, 5, 'calabacin verde', 'libra'),
(223, 5, 'pimenton rojo', 'libra'),
(224, 5, 'pimenton verde', 'libra'),
(225, 5, 'champiñon', 'bandeja'),
(226, 6, 'leche alqueria entera', 'bolsa 200 ml'),
(227, 6, 'leche alqueria entera', 'bolsa 500 ml'),
(228, 6, 'leche alqueria entera', 'bolsa 900 ml'),
(229, 6, 'leche alqueria deslactosada', 'bolsa 200 ml'),
(230, 6, 'leche alqueria deslactosada', 'bolsa 500 ml'),
(231, 6, 'leche alqueria deslactosada', 'bolsa 900 ml'),
(232, 6, 'leche alqueria semidescremada', 'bolsa 200 ml'),
(233, 6, 'leche alqueria semidescremada', 'bolsa 500 ml'),
(234, 6, 'leche alqueria semidescremada', 'bolsa 900 ml'),
(235, 6, 'leche colanta entera', 'bolsa 200 ml'),
(236, 6, 'leche colanta entera', 'bolsa 500 ml'),
(237, 6, 'leche colanta entera', 'bolsa 900 ml'),
(238, 6, 'leche colanta deslactosada', 'bolsa 200 ml'),
(239, 6, 'leche colanta deslactosada', 'bolsa 500 ml'),
(240, 6, 'leche colanta deslactosada', 'bolsa 900 ml'),
(241, 6, 'leche colanta semidescremada', 'bolsa 200 ml'),
(242, 6, 'leche colanta semidescremada', 'bolsa 500 ml'),
(243, 6, 'leche colanta semidescremada', 'bolsa 900 ml'),
(244, 6, 'leche alpina entera', 'bolsa 200 ml'),
(245, 6, 'leche alpina entera', 'bolsa 500 ml'),
(246, 6, 'leche alpina entera', 'bolsa 900 ml'),
(247, 6, 'leche alpina deslactosada', 'bolsa 200 ml'),
(248, 6, 'leche alpina deslactosada', 'bolsa 500 ml'),
(249, 6, 'leche alpina deslactosada', 'bolsa 900 ml'),
(250, 6, 'leche alpina semidescremada', 'bolsa 200 ml'),
(251, 6, 'leche alpina semidescremada', 'bolsa 500 ml'),
(252, 6, 'leche alpina semidescremada', 'bolsa 900 ml'),
(253, 6, 'leche san fernando entera', 'bolsa 200 ml'),
(254, 6, 'leche san fernando entera', 'bolsa 500 ml'),
(255, 6, 'leche san fernando entera', 'bolsa 900 ml'),
(256, 6, 'kumis alpina', 'vaso 200 ml'),
(257, 6, 'kumis alpina', 'bolsa 1 litro'),
(258, 6, 'kumis colanta', 'vaso 200 ml'),
(259, 6, 'kumis colanta', 'bolsa 1 litro'),
(260, 6, 'yogurt alpina natural', 'vaso 200 ml'),
(261, 6, 'yogurt alpina fresa', 'vaso 200 ml'),
(262, 6, 'yogurt alpina durazno', 'vaso 200 ml'),
(263, 6, 'yogurt alpina mora', 'vaso 200 ml'),
(264, 6, 'yogurt colanta natural', 'vaso 200 ml'),
(265, 6, 'yogurt colanta fresa', 'vaso 200 ml'),
(266, 6, 'yogurt colanta mora', 'vaso 200 ml'),
(267, 6, 'avena alpina', 'bolsa 200 ml'),
(268, 6, 'avena alpina', 'bolsa 900 ml'),
(269, 6, 'avena colanta', 'bolsa 200 ml'),
(270, 6, 'avena colanta', 'bolsa 900 ml'),
(271, 6, 'chocolate alqueria', 'bolsa 200 ml'),
(272, 6, 'chocolate alqueria', 'bolsa 900 ml'),
(273, 6, 'chocolate alpina', 'bolsa 200 ml'),
(274, 6, 'chocolate alpina', 'bolsa 900 ml'),
(275, 6, 'chocolate colanta', 'bolsa 200 ml'),
(276, 6, 'chocolate colanta', 'bolsa 900 ml'),
(277, 6, 'bebida lactea bon yurt alpina', 'vaso 200 ml'),
(278, 6, 'bebida lactea yogo yogo alpina', 'vaso 200 ml'),
(279, 6, 'bebida lactea yogo yogo alpina', 'bolsa 900 ml'),
(280, 6, 'crema de leche alpina', 'bolsa 200 ml'),
(281, 6, 'crema de leche alpina', 'bolsa 900 ml'),
(282, 6, 'crema de leche colanta', 'bolsa 200 ml'),
(283, 6, 'crema de leche colanta', 'bolsa 900 ml'),
(284, 6, 'leche condensada alpina', 'lata 395 g'),
(285, 6, 'leche condensada colanta', 'lata 395 g'),
(286, 7, 'shampoo sedal', 'sobre 12 ml'),
(287, 7, 'shampoo pantene', 'sobre 12 ml'),
(288, 7, 'shampoo savital', 'sobre 12 ml'),
(289, 7, 'shampoo head & shoulders clasico', 'sobre 12 ml'),
(290, 7, 'shampoo dove', 'sobre 12 ml'),
(291, 7, 'acondicionador sedal', 'sobre 12 ml'),
(292, 7, 'acondicionador pantene', 'sobre 12 ml'),
(293, 7, 'acondicionador savital', 'sobre 12 ml'),
(294, 7, 'acondicionador dove', 'sobre 12 ml'),
(295, 7, 'desodorante rexona mujer', 'sobre 10 g'),
(296, 7, 'desodorante rexona hombre', 'sobre 10 g'),
(297, 7, 'desodorante dove mujer', 'sobre 10 g'),
(298, 7, 'desodorante dove hombre', 'sobre 10 g'),
(299, 7, 'desodorante nivea mujer', 'sobre 10 g'),
(300, 7, 'desodorante nivea hombre', 'sobre 10 g'),
(301, 7, 'maquina afeitar gillette prestobarba azul', 'unidad'),
(302, 7, 'maquina afeitar gillette prestobarba 3', 'unidad'),
(303, 7, 'maquina afeitar gillette prestobarba ultragrip', 'unidad'),
(304, 7, 'gel ego', 'sobre 25 ml'),
(305, 7, 'crema peinar ego', 'sobre 18 ml'),
(306, 7, 'jabon liquido dove', 'frasco 400 ml'),
(307, 7, 'crema nivea azul', 'frasco 200 ml'),
(308, 7, 'crema ponds', 'frasco 50 g'),
(309, 7, 'enjuague bucal listerine', 'frasco 180 ml'),
(310, 7, 'enjuague bucal colgate plax', 'frasco 180 ml'),
(311, 7, 'jabon dove humectante', 'barra 90 g'),
(312, 7, 'jabon dove pepino', 'barra 90 g'),
(313, 7, 'jabon protex fresh', 'barra 110 g'),
(314, 7, 'jabon nivea', 'barra 90 g'),
(315, 7, 'jabon liquido dove', 'frasco 400 ml'),
(316, 7, 'jabon liquido protex antibacterial', 'frasco 400 ml'),
(317, 7, 'gel ego', 'frasco 250 ml'),
(318, 7, 'crema dental colgate', 'tubo 75 ml'),
(319, 7, 'crema dental colgate total 12', 'tubo 75 ml'),
(320, 7, 'crema dental oral b', 'tubo 75 ml'),
(321, 7, 'hilo dental colgate', 'caja unidad'),
(322, 7, 'hilo dental oral b', 'caja unidad'),
(323, 7, 'protectores diarios nosotras', 'paquete 15 unidades'),
(324, 7, 'tampones nosotras', 'caja 10 unidades'),
(325, 7, 'shampoo johnson bebe', 'frasco 200 ml'),
(326, 7, 'crema johnson bebe', 'frasco 200 ml'),
(327, 7, 'cepillo dental colgate', 'unidad'),
(328, 7, 'cepillo dental oral b', 'unidad'),
(329, 7, 'papel higienico familia', 'rollo'),
(330, 7, 'papel higienico scott', 'rollo'),
(331, 7, 'colonia arrurru', 'frasco 120 ml'),
(332, 7, 'corta uñas', 'unidad'),
(333, 7, 'algodon', 'bolsa 50 g'),
(334, 7, 'isopos de algodon', 'caja 100 unidades'),
(335, 7, 'cepillo para cabello', 'unidad'),
(336, 7, 'ligas para cabello', 'paquete 12 unidades'),
(337, 8, 'detergente ariel', 'bolsa 500 g'),
(338, 8, 'detergente ariel', 'bolsa 1000 g'),
(339, 8, 'detergente fab', 'bolsa 500 g'),
(340, 8, 'detergente fab', 'bolsa 1000 g'),
(341, 8, 'detergente as', 'bolsa 500 g'),
(342, 8, 'detergente as', 'bolsa 1000 g'),
(343, 8, 'jabon rey', 'barra 300 g'),
(344, 8, 'jabon coco', 'barra 200 g'),
(345, 8, 'jabon blanco', 'barra 200 g'),
(346, 8, 'suavizante suavitel', 'botella 850 ml'),
(347, 8, 'cloro blancox', 'botella 1000 ml'),
(348, 8, 'blanqueador blancox ropa color', 'botella 1000 ml'),
(349, 8, 'blanqueador patojito', 'botella 1000 ml'),
(350, 8, 'desinfectante fabuloso', 'botella 1000 ml'),
(351, 8, 'lavaloza axion limon', 'botella 750 ml'),
(352, 8, 'esponja lavaplatos', 'unidad'),
(353, 8, 'fibra verde', 'unidad'),
(354, 8, 'fibra metalica', 'unidad'),
(355, 8, 'insecticida raid', 'spray 400 ml'),
(356, 8, 'insecticida baygon', 'spray 400 ml'),
(357, 8, 'bolsa basura negra', 'unidad'),
(358, 8, 'papel aluminio', 'rollo 5 m'),
(359, 8, 'escoba', 'unidad'),
(360, 8, 'trapeador', 'unidad'),
(361, 8, 'recogedor', 'unidad'),
(362, 8, 'guantes de caucho', 'par'),
(363, 9, 'carne de res molida', 'kilo'),
(364, 9, 'carne de res pulpa', 'kilo'),
(365, 9, 'carne de res sobrebarriga', 'kilo'),
(366, 9, 'carne de res pecho', 'kilo'),
(367, 9, 'carne de res costilla', 'kilo'),
(368, 9, 'carne de cerdo lomo', 'kilo'),
(369, 9, 'carne de cerdo pierna', 'kilo'),
(370, 9, 'carne de cerdo costilla', 'kilo'),
(371, 9, 'carne de cerdo chuleta', 'kilo'),
(372, 9, 'carne de cerdo tocino', 'kilo'),
(373, 9, 'pollo entero', 'kilo'),
(374, 9, 'pollo pechuga', 'kilo'),
(375, 9, 'pollo alas', 'kilo'),
(376, 9, 'pollo muslos', 'kilo'),
(377, 9, 'salchicha ranchera', 'paquete 3 unidades'),
(378, 9, 'salchicha ranchera', 'paquete 5 unidades'),
(379, 9, 'salchicha zenu tradicional', 'paquete 3 unidades'),
(380, 9, 'salchicha zenu tradicional', 'paquete 5 unidades'),
(381, 9, 'mortadela zenu tradicional', 'paquete 500 g'),
(382, 9, 'jamon zenu tradicional', 'paquete 500 g'),
(383, 9, 'chorizo artesanal', 'unidad'),
(384, 10, 'cuaderno norma cuadriculado', '100 hojas'),
(385, 10, 'cuaderno norma cuadriculado', '50 hojas'),
(386, 10, 'cuaderno norma rayado', '100 hojas'),
(387, 10, 'cuaderno norma rayado', '50 hojas'),
(388, 10, 'cuaderno argollado cuadriculado', '80 hojas'),
(389, 10, 'cuaderno argollado rayado', '80 hojas'),
(390, 10, 'block cuadriculado', 'carta 70 hojas'),
(391, 10, 'block rayado', 'carta 70 hojas'),
(392, 10, 'block blanco', 'carta 70 hojas'),
(393, 10, 'cartulina', ' octavo unidad'),
(394, 10, 'cartulina', 'pliego unidad'),
(395, 10, 'fomi', 'octavo unidad'),
(396, 10, 'carton paja', 'octavo unidad'),
(397, 10, 'bolsa regalo', 'unidad'),
(398, 10, 'sobres cartas', 'unidad'),
(399, 10, 'lapicero', 'unidad'),
(400, 10, 'lapiz', 'unidad'),
(401, 10, 'portaminas', 'unidad'),
(402, 10, 'mina portaminas', 'tubo 12 unidades'),
(403, 10, 'marcador sharpie', 'unidad'),
(404, 10, 'resaltador', 'unidad'),
(405, 10, 'colores', 'caja 12 unidades'),
(406, 10, 'colores', 'caja 24 unidades'),
(407, 10, 'crayones', 'caja 12 unidades'),
(408, 10, 'plastilina', 'caja 12 barras'),
(409, 10, 'temperas', 'caja 6 unidades'),
(410, 10, 'pincel escolar', 'unidad'),
(411, 10, 'pegante colbon', 'frasco'),
(412, 10, 'pegante en barra', 'unidad'),
(413, 10, 'silicona liquida', 'frasco'),
(414, 10, 'silicona en barra', 'unidad'),
(415, 10, 'corrector liquido', 'frasco'),
(416, 10, 'tijeras escolar', 'unidad'),
(417, 10, 'regla', 'unidad'),
(418, 10, 'borrador nata', 'unidad'),
(419, 10, 'sacapuntas', 'unidad'),
(420, 10, 'carpeta plastica', 'unidad'),
(421, 10, 'gancho legajador', 'unidad'),
(422, 10, 'cinta transparente', 'rollo'),
(423, 10, 'cinta enmascarar', 'rollo'),
(424, 10, 'grapadora', 'unidad'),
(425, 11, 'acetaminofen', 'unidad'),
(426, 11, 'ibuprofeno', 'unidad'),
(427, 11, 'aspirina', 'unidad'),
(428, 11, 'naproxeno', 'unidad'),
(429, 11, 'dolex gripa', 'unidad'),
(430, 11, 'noxpirin', 'unidad'),
(431, 11, 'loratadina', 'unidad'),
(432, 11, 'sal de frutas', 'sobre 5 g'),
(433, 11, 'omeprazol', 'unidad'),
(434, 11, 'enterogermina', 'unidad'),
(435, 11, 'alcohol antiséptico', 'frasco 350 ml'),
(436, 11, 'agua oxigenada', 'frasco 120 ml'),
(437, 11, 'isodine', 'frasco 60 ml'),
(438, 11, 'curas adhesivas', 'unidad'),
(439, 11, 'gasa esteril', 'unidad'),
(440, 11, 'micropore', 'rollo unidad'),
(441, 11, 'vick vaporub', 'frasco 50 g'),
(442, 12, 'concentrado dog chow adulto', 'bolsa 1 kg'),
(443, 12, 'concentrado dog chow cachorro', 'bolsa 1 kg'),
(444, 12, 'concentrado pedigree adulto', 'bolsa 1 kg'),
(445, 12, 'concentrado pedigree cachorro', 'bolsa 1 kg'),
(446, 12, 'concentrado whiskas adulto', 'bolsa 1 kg'),
(447, 12, 'alimento humedo pedigree', 'sobre'),
(448, 12, 'alimento humedo dog chow', 'sobre'),
(449, 12, 'alimento humedo felix', 'sobre'),
(450, 1, 'huevos', 'unidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tendero`
--

CREATE TABLE `tendero` (
  `cedula` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `nombre` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `llave` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idVentas` int NOT NULL,
  `idTendero` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `mensaje` text COLLATE utf8mb4_general_ci NOT NULL,
  `tipoPago` varchar(9) COLLATE utf8mb4_general_ci NOT NULL,
  `valor` int NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abonos`
--
ALTER TABLE `abonos`
  ADD PRIMARY KEY (`idAbonos`),
  ADD KEY `fk_Abonos_Tendero` (`idTendero`),
  ADD KEY `fk_Abonos_Cliente` (`idCliente`);

--
-- Indices de la tabla `apertura`
--
ALTER TABLE `apertura`
  ADD PRIMARY KEY (`idApertura`),
  ADD KEY `fk_Apertura_Tendero` (`idTendero`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idCategorias`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `fk_Cliente_Tendero` (`idTendero`);

--
-- Indices de la tabla `costos`
--
ALTER TABLE `costos`
  ADD PRIMARY KEY (`idCostos`),
  ADD KEY `fk_Costos_Tendero` (`idTendero`);

--
-- Indices de la tabla `creditos`
--
ALTER TABLE `creditos`
  ADD PRIMARY KEY (`idCreditos`),
  ADD KEY `fk_Creditos_Cliente` (`idCliente`),
  ADD KEY `fk_Creditos_Ventas` (`idVentas`);

--
-- Indices de la tabla `diccionarioproductos`
--
ALTER TABLE `diccionarioproductos`
  ADD PRIMARY KEY (`idDiccionario`),
  ADD KEY `fk_Diccionario_Productos` (`idProductos`);

--
-- Indices de la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`idGastos`),
  ADD KEY `fk_Gastos_Tendero` (`idTendero`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`idInventario`),
  ADD KEY `fk_Inventario_Tendero` (`idTendero`),
  ADD KEY `fk_Categoria_Inventario` (`idCategoria`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProductos`),
  ADD KEY `fk_Productos_Categorias` (`idCategorias`);

--
-- Indices de la tabla `tendero`
--
ALTER TABLE `tendero`
  ADD PRIMARY KEY (`cedula`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idVentas`),
  ADD KEY `fk_Ventas_Tendero` (`idTendero`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abonos`
--
ALTER TABLE `abonos`
  MODIFY `idAbonos` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `apertura`
--
ALTER TABLE `apertura`
  MODIFY `idApertura` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idCategorias` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `costos`
--
ALTER TABLE `costos`
  MODIFY `idCostos` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `creditos`
--
ALTER TABLE `creditos`
  MODIFY `idCreditos` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `diccionarioproductos`
--
ALTER TABLE `diccionarioproductos`
  MODIFY `idDiccionario` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gastos`
--
ALTER TABLE `gastos`
  MODIFY `idGastos` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `idInventario` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProductos` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idVentas` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `abonos`
--
ALTER TABLE `abonos`
  ADD CONSTRAINT `fk_Abonos_Cliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `fk_Abonos_Tendero` FOREIGN KEY (`idTendero`) REFERENCES `tendero` (`cedula`);

--
-- Filtros para la tabla `apertura`
--
ALTER TABLE `apertura`
  ADD CONSTRAINT `fk_Apertura_Tendero` FOREIGN KEY (`idTendero`) REFERENCES `tendero` (`cedula`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_Cliente_Tendero` FOREIGN KEY (`idTendero`) REFERENCES `tendero` (`cedula`);

--
-- Filtros para la tabla `costos`
--
ALTER TABLE `costos`
  ADD CONSTRAINT `fk_Costos_Tendero` FOREIGN KEY (`idTendero`) REFERENCES `tendero` (`cedula`);

--
-- Filtros para la tabla `creditos`
--
ALTER TABLE `creditos`
  ADD CONSTRAINT `fk_Creditos_Cliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `fk_Creditos_Ventas` FOREIGN KEY (`idVentas`) REFERENCES `ventas` (`idVentas`);

--
-- Filtros para la tabla `diccionarioproductos`
--
ALTER TABLE `diccionarioproductos`
  ADD CONSTRAINT `fk_Diccionario_Productos` FOREIGN KEY (`idProductos`) REFERENCES `productos` (`idProductos`);

--
-- Filtros para la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD CONSTRAINT `fk_Gastos_Tendero` FOREIGN KEY (`idTendero`) REFERENCES `tendero` (`cedula`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `fk_Categoria_Inventario` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategorias`),
  ADD CONSTRAINT `fk_Inventario_Tendero` FOREIGN KEY (`idTendero`) REFERENCES `tendero` (`cedula`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_Productos_Categorias` FOREIGN KEY (`idCategorias`) REFERENCES `categorias` (`idCategorias`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_Ventas_Tendero` FOREIGN KEY (`idTendero`) REFERENCES `tendero` (`cedula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
