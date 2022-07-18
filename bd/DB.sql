-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 16-11-2019 a las 12:26:28
-- Versión del servidor: 5.7.27-0ubuntu0.18.04.1
-- Versión de PHP: 7.0.22-0ubuntu0.17.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `digincap`
--
CREATE DATABASE IF NOT EXISTS `digincap` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `digincap`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `di_categorias`
--

CREATE TABLE `di_categorias` (
  `dica_id` int(11) NOT NULL,
  `dica_nombre` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dica_descripcion` varchar(2000) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dica_fecha` date NOT NULL,
  `dica_obs` varchar(1000) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dica_imagen` varchar(2500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dica_activo` tinyint(1) NOT NULL,
  `dica_existe` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `di_categorias`
--

INSERT INTO `di_categorias` (`dica_id`, `dica_nombre`, `dica_descripcion`, `dica_fecha`, `dica_obs`, `dica_imagen`, `dica_activo`, `dica_existe`) VALUES
(1, 'Estudiante Activo', '', '2019-09-17', '', '', 1, 1),
(2, 'Egresados', '', '2019-09-17', '', '', 1, 1),
(3, 'Aspirante', '', '2019-09-17', '', '', 1, 0),
(4, 'Discapacitado', '', '2019-09-17', '', '', 1, 0),
(5, 'Funcionario', '', '2019-09-17', '', '', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `di_clientes`
--

CREATE TABLE `di_clientes` (
  `dicl_id` int(11) NOT NULL,
  `dicl_identificacion` varchar(15) NOT NULL,
  `dicl_nombre` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dicl_direccion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dicl_telefono` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dicl_email` varchar(2000) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dicl_fecha` date NOT NULL,
  `dicl_hora` time NOT NULL,
  `dicl_obs` varchar(1000) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dica_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `di_clientes`
--

INSERT INTO `di_clientes` (`dicl_id`, `dicl_identificacion`, `dicl_nombre`, `dicl_direccion`, `dicl_telefono`, `dicl_email`, `dicl_fecha`, `dicl_hora`, `dicl_obs`, `dica_id`) VALUES
(1, '85460721', 'Anonimo', '', '', '', '2019-09-26', '21:34:14', '', 3),
(2, '85460722', 'Angel Camacho', '', '', '', '2019-09-28', '11:28:38', '', 1),
(3, '85460723', 'Argenil Casa Grande', '', '', '', '2019-10-02', '10:30:34', '', 5),
(4, '85460724', 'Heladio Mosambique', '', '', '', '2019-10-02', '10:33:00', '', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `di_csf`
--

CREATE TABLE `di_csf` (
  `dicsf_id` int(11) NOT NULL,
  `dise_id` int(11) NOT NULL,
  `difu_id` int(11) NOT NULL,
  `dicu_id` int(11) NOT NULL,
  `dicsf_fecha` date NOT NULL,
  `dicsf_activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `di_csf`
--

INSERT INTO `di_csf` (`dicsf_id`, `dise_id`, `difu_id`, `dicu_id`, `dicsf_fecha`, `dicsf_activo`) VALUES
(5, 1, 3, 1, '2019-09-24', 1),
(6, 2, 1, 2, '2019-09-24', 0),
(7, 2, 2, 2, '2019-09-24', 1),
(8, 2, 4, 3, '2019-09-24', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `di_cubiculos`
--

CREATE TABLE `di_cubiculos` (
  `dicu_id` int(11) NOT NULL,
  `dicu_nombre` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dicu_area` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dicu_obs` varchar(1000) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dicu_fecha` date NOT NULL,
  `dicu_hora` time NOT NULL,
  `dicu_imagen` varchar(2500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `di_cubiculos`
--

INSERT INTO `di_cubiculos` (`dicu_id`, `dicu_nombre`, `dicu_area`, `dicu_obs`, `dicu_fecha`, `dicu_hora`, `dicu_imagen`) VALUES
(1, '1', '', '', '2019-09-21', '08:00:00', ''),
(2, '2', '', '', '2019-09-21', '05:00:00', ''),
(3, '3', '', '', '2019-09-21', '03:00:00', ''),
(4, '4', '', '', '2019-09-21', '04:00:00', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `di_encolamiento`
--

CREATE TABLE `di_encolamiento` (
  `dien_id` int(12) NOT NULL,
  `dien_fecha` date NOT NULL,
  `dien_hora` time NOT NULL,
  `dien_detalle` varchar(1500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dien_obs` varchar(1500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dien_codserv` varchar(6) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dien_activo` tinyint(1) NOT NULL,
  `dicl_id` int(11) NOT NULL,
  `dicsf_id` int(11) NOT NULL,
  `dise_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `di_encolamiento`
--

INSERT INTO `di_encolamiento` (`dien_id`, `dien_fecha`, `dien_hora`, `dien_detalle`, `dien_obs`, `dien_codserv`, `dien_activo`, `dicl_id`, `dicsf_id`, `dise_id`) VALUES
(1, '2019-10-04', '16:24:53', '', '', 'INF01', 0, 1, 5, 1),
(23, '2019-10-04', '09:22:53', '', '', 'INF-03', 0, 1, 5, 1),
(24, '2019-10-04', '09:23:24', '', '', 'INF-04', 0, 1, 5, 1),
(25, '2019-10-04', '11:27:19', '', '', 'INF-05', 0, 1, 5, 1),
(26, '2019-10-04', '11:28:42', '', '', 'INF-06', 0, 2, 5, 1),
(27, '2019-10-04', '14:15:45', '', '', 'INF-07', 0, 1, 5, 1),
(28, '2019-10-04', '14:23:30', '', '', 'INF-08', 0, 1, 5, 1),
(29, '2019-10-04', '14:23:36', '', '', 'CER-01', 0, 1, 5, 3),
(30, '2019-10-04', '10:29:41', '', '', 'MAT-01', 0, 1, 7, 2),
(31, '2019-10-04', '10:30:40', '', '', 'CER-02', 0, 3, 5, 3),
(32, '2019-10-04', '10:33:05', '', '', 'REC-01', 0, 4, 7, 4),
(33, '2019-10-04', '14:44:15', '', '', 'REC-02', 0, 3, 7, 4),
(34, '2019-10-04', '14:56:56', '', '', 'CAR-01', 0, 4, 8, 5),
(35, '2019-10-04', '11:10:26', '', '', 'REC-03', 0, 3, 7, 4),
(36, '2019-10-04', '05:47:02', '', '', 'REC-04', 0, 1, 7, 4),
(42, '2019-10-05', '11:25:20', '', '', 'INF-01', 0, 1, 5, 1),
(43, '2019-10-05', '11:25:53', '', '', 'MAT-01', 0, 3, 7, 2),
(44, '2019-10-05', '11:26:26', '', '', 'MAT-02', 0, 1, 7, 2),
(45, '2019-10-05', '11:26:57', '', '', 'INF-02', 0, 4, 5, 1),
(46, '2019-10-05', '11:30:25', '', '', 'REC-01', 0, 3, 7, 4),
(47, '2019-10-05', '11:30:38', '', '', 'INF-03', 0, 1, 5, 1),
(48, '2019-10-17', '11:30:44', '', '', 'MAT-03', 1, 1, 7, 2),
(49, '2019-10-05', '12:04:41', '', '', 'INF-04', 0, 1, 5, 1),
(50, '2019-10-05', '13:21:16', '', '', 'CAR-01', 0, 2, 8, 5),
(51, '2019-10-17', '08:35:44', '', '', 'INF-01', 1, 1, 5, 1),
(52, '2019-10-08', '08:36:10', '', '', 'INF-02', 0, 1, 5, 1),
(53, '2019-10-08', '08:36:29', '', '', 'MAT-01', 0, 3, 7, 2),
(54, '2019-10-08', '08:37:39', '', '', 'CAR-01', 0, 4, 8, 5),
(55, '2019-10-08', '08:39:30', '', '', 'CER-01', 0, 3, 5, 3),
(56, '2019-10-08', '11:41:42', '', '', 'INF-03', 0, 1, 5, 1),
(57, '2019-10-08', '11:41:53', '', '', 'CAR-02', 0, 3, 8, 5),
(58, '2019-10-08', '11:41:56', '', '', 'REC-01', 0, 4, 7, 4),
(59, '2019-10-08', '11:42:01', '', '', 'INF-04', 0, 4, 5, 1),
(60, '2019-10-09', '15:18:30', '', '', 'REC-01', 0, 1, 7, 4),
(61, '2019-10-09', '15:18:36', '', '', 'MAT-01', 0, 3, 7, 2),
(62, '2019-10-09', '15:18:43', '', '', 'INF-01', 0, 1, 5, 1),
(63, '2019-10-09', '15:19:14', '', '', 'INF-02', 0, 1, 5, 1),
(64, '2019-10-16', '16:04:42', '', '', 'MAT-01', 1, 1, 7, 2),
(65, '2019-10-16', '16:04:58', '', '', 'MAT-02', 1, 1, 7, 2),
(66, '2019-10-16', '16:29:22', '', '', 'MAT-03', 1, 1, 7, 2),
(67, '2019-10-16', '16:29:41', '', '', 'MAT-04', 1, 1, 7, 2),
(68, '2019-10-16', '17:02:45', '', '', 'INF-01', 1, 3, 5, 1),
(69, '2019-10-16', '17:03:11', '', '', 'INF-02', 1, 2, 5, 1),
(70, '2019-10-16', '10:11:05', '', '', 'INF-01', 1, 2, 5, 1),
(71, '2019-10-16', '11:29:34', '', '', 'INF-02', 1, 1, 5, 1),
(72, '2019-10-16', '16:23:27', '', '', 'CER-01', 0, 1, 5, 3),
(73, '2019-10-16', '16:23:37', '', '', 'INF-03', 0, 1, 5, 1),
(74, '2019-10-23', '08:59:05', '', '', 'REC-01', 0, 1, 7, 4),
(75, '2019-10-23', '09:02:32', '', '', 'INF-01', 0, 1, 5, 1),
(76, '2019-10-23', '09:21:41', '', '', 'INF-02', 0, 1, 5, 1),
(77, '2019-10-24', '08:36:55', '', '', 'INF-01', 0, 2, 5, 1),
(78, '2019-10-26', '14:36:32', '', '', 'INF-01', 0, 2, 5, 1),
(79, '2019-10-26', '16:16:48', '', '', 'INF-02', 0, 2, 5, 1),
(80, '2019-10-29', '10:03:41', '', '', 'INF-01', 0, 3, 5, 1),
(81, '2019-10-29', '10:03:58', '', '', 'INF-02', 0, 2, 5, 1),
(82, '2019-10-29', '10:04:07', '', '', 'MAT-01', 0, 1, 7, 2),
(83, '2019-10-29', '10:05:54', '', '', 'MAT-02', 0, 2, 7, 2),
(84, '2019-10-29', '10:06:13', '', '', 'MAT-03', 0, 1, 7, 2),
(85, '2019-10-29', '10:06:36', '', '', 'INF-03', 0, 2, 5, 1),
(86, '2019-10-30', '11:18:30', '', '', 'INF-01', 0, 2, 5, 1),
(87, '2019-10-30', '11:18:37', '', '', 'INF-02', 0, 1, 5, 1),
(88, '2019-10-30', '11:18:46', '', '', 'MAT-01', 0, 1, 7, 2),
(89, '2019-10-30', '11:19:17', '', '', 'REC-01', 0, 2, 7, 4),
(90, '2019-11-02', '13:14:39', '', '', 'INF-01', 0, 1, 5, 1),
(91, '2019-11-02', '13:14:43', '', '', 'INF-02', 0, 1, 5, 1),
(92, '2019-11-02', '13:16:36', '', '', 'INF-03', 0, 1, 5, 1),
(93, '2019-11-08', '15:17:26', '', '', 'INF-01', 0, 1, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `di_funcionarios`
--

CREATE TABLE `di_funcionarios` (
  `difu_id` int(11) NOT NULL,
  `difu_nombre` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `difu_identificacion` varchar(20) NOT NULL,
  `difu_password` varchar(32) NOT NULL,
  `difu_email` varchar(2500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `difu_celuar` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `difu_fecha` date NOT NULL,
  `difu_hora` time NOT NULL,
  `difu_obs` varchar(1000) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `di_funcionarios`
--

INSERT INTO `di_funcionarios` (`difu_id`, `difu_nombre`, `difu_identificacion`, `difu_password`, `difu_email`, `difu_celuar`, `difu_fecha`, `difu_hora`, `difu_obs`) VALUES
(1, 'Laura María Ballesteros Mora', '56897211', '123', 'lauritama@yahoo.com', '31256699', '2019-09-21', '06:00:00', ''),
(2, 'Luis Ignacio Dasilva Melo', '85647521', '123', 'luisito269@hotmail.com', '3102556699', '2019-09-21', '04:00:00', ''),
(3, 'Gustavo Adolfo Saavedra', '80460721', '123', 'gustavoa200@hotmail.com', '3123456788', '2019-09-21', '06:00:00', ''),
(4, 'Edgar Enrique Grey Williams', '75640123', '123', 'edguitar69@outlook.com', '3136666666', '2019-09-21', '04:00:00', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `di_sedes`
--

CREATE TABLE `di_sedes` (
  `dised_id` int(11) NOT NULL,
  `dised_cod` varchar(4) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dised_nombre` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dised_direccion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dised_telefono` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dised_paginaweb` varchar(2500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dised_obs` varchar(1000) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dised_email` varchar(2500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `di_sedes`
--

INSERT INTO `di_sedes` (`dised_id`, `dised_cod`, `dised_nombre`, `dised_direccion`, `dised_telefono`, `dised_paginaweb`, `dised_obs`, `dised_email`) VALUES
(1, 'CH01', 'Regional Industrial T1', 'Calle 64 No 14-61', '2117028', '', '', ''),
(2, 'CH02', 'Regional Comercio T5', 'Cra 64 No 14-35', '2117029', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `di_servicios`
--

CREATE TABLE `di_servicios` (
  `dise_id` int(11) NOT NULL,
  `dise_nombre` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dise_codigo` varchar(8) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dise_descripcion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dise_imagen` varchar(2500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dise_obs` varchar(1000) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dise_fecha` date NOT NULL,
  `dise_hora` time NOT NULL,
  `dise_activo` tinyint(1) NOT NULL,
  `dise_cubiculo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `di_servicios`
--

INSERT INTO `di_servicios` (`dise_id`, `dise_nombre`, `dise_codigo`, `dise_descripcion`, `dise_imagen`, `dise_obs`, `dise_fecha`, `dise_hora`, `dise_activo`, `dise_cubiculo`) VALUES
(1, 'Información', 'INF', '', '', '', '2019-09-18', '09:00:00', 1, 1),
(2, 'Matrículas', 'MAT', '', '', '', '2019-09-18', '06:00:00', 1, 2),
(3, 'Certificados', 'CER', '', '', '', '2019-09-18', '03:00:00', 1, 1),
(4, 'Reclamos', 'REC', '', '', '', '2019-09-18', '04:00:00', 1, 2),
(5, 'Cartera', 'CAR', '', '', '', '2019-09-19', '03:00:00', 1, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `di_categorias`
--
ALTER TABLE `di_categorias`
  ADD PRIMARY KEY (`dica_id`);
ALTER TABLE `di_categorias` ADD FULLTEXT KEY `dica_nombre` (`dica_nombre`);

--
-- Indices de la tabla `di_clientes`
--
ALTER TABLE `di_clientes`
  ADD PRIMARY KEY (`dicl_id`),
  ADD KEY `dica_id` (`dica_id`);

--
-- Indices de la tabla `di_csf`
--
ALTER TABLE `di_csf`
  ADD PRIMARY KEY (`dicsf_id`),
  ADD KEY `dicl_id` (`dise_id`),
  ADD KEY `difu_id` (`difu_id`),
  ADD KEY `dicu_id` (`dicu_id`);

--
-- Indices de la tabla `di_cubiculos`
--
ALTER TABLE `di_cubiculos`
  ADD PRIMARY KEY (`dicu_id`);

--
-- Indices de la tabla `di_encolamiento`
--
ALTER TABLE `di_encolamiento`
  ADD PRIMARY KEY (`dien_id`),
  ADD KEY `dicl_id` (`dicl_id`),
  ADD KEY `dicsf_id` (`dicsf_id`),
  ADD KEY `dise_id` (`dise_id`);

--
-- Indices de la tabla `di_funcionarios`
--
ALTER TABLE `di_funcionarios`
  ADD PRIMARY KEY (`difu_id`);

--
-- Indices de la tabla `di_sedes`
--
ALTER TABLE `di_sedes`
  ADD PRIMARY KEY (`dised_id`);

--
-- Indices de la tabla `di_servicios`
--
ALTER TABLE `di_servicios`
  ADD PRIMARY KEY (`dise_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `di_categorias`
--
ALTER TABLE `di_categorias`
  MODIFY `dica_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `di_clientes`
--
ALTER TABLE `di_clientes`
  MODIFY `dicl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `di_csf`
--
ALTER TABLE `di_csf`
  MODIFY `dicsf_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `di_cubiculos`
--
ALTER TABLE `di_cubiculos`
  MODIFY `dicu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `di_encolamiento`
--
ALTER TABLE `di_encolamiento`
  MODIFY `dien_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT de la tabla `di_funcionarios`
--
ALTER TABLE `di_funcionarios`
  MODIFY `difu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `di_sedes`
--
ALTER TABLE `di_sedes`
  MODIFY `dised_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `di_servicios`
--
ALTER TABLE `di_servicios`
  MODIFY `dise_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `di_clientes`
--
ALTER TABLE `di_clientes`
  ADD CONSTRAINT `di_clientes_ibfk_1` FOREIGN KEY (`dica_id`) REFERENCES `di_categorias` (`dica_id`);

--
-- Filtros para la tabla `di_csf`
--
ALTER TABLE `di_csf`
  ADD CONSTRAINT `di_csf_ibfk_2` FOREIGN KEY (`difu_id`) REFERENCES `di_funcionarios` (`difu_id`),
  ADD CONSTRAINT `di_csf_ibfk_3` FOREIGN KEY (`dicu_id`) REFERENCES `di_cubiculos` (`dicu_id`),
  ADD CONSTRAINT `di_csf_ibfk_4` FOREIGN KEY (`dise_id`) REFERENCES `di_sedes` (`dised_id`);

--
-- Filtros para la tabla `di_encolamiento`
--
ALTER TABLE `di_encolamiento`
  ADD CONSTRAINT `di_encolamiento_ibfk_1` FOREIGN KEY (`dicl_id`) REFERENCES `di_clientes` (`dicl_id`),
  ADD CONSTRAINT `di_encolamiento_ibfk_2` FOREIGN KEY (`dicsf_id`) REFERENCES `di_csf` (`dicsf_id`),
  ADD CONSTRAINT `di_encolamiento_ibfk_3` FOREIGN KEY (`dise_id`) REFERENCES `di_servicios` (`dise_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
