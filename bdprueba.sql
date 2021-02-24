-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 24-02-2021 a las 01:44:54
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdprueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tpaquetes`
--

CREATE TABLE `tpaquetes` (
  `cod_paquete` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripción` varchar(300) NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tpaquetes`
--

INSERT INTO `tpaquetes` (`cod_paquete`, `nombre`, `descripción`, `precio`) VALUES
(1, 'Simple o Matrimonial', 'Para una persona\r\n\r\nNuestras habitaciones cuentan con baño privado, TV cable, vista panorámica de los Yungas.\r\nTiene derecho al acceso de todas las instalaciones', 370),
(2, 'Doble', 'Para dos personas\r\n\r\nNuestras habitaciones cuentan con baño privado, TV cable, vista panorámica de los Yungas.', 380),
(3, 'Triple', 'Para tres personas\r\n\r\nNuestras habitaciones cuentan con baño privado, TV cable, vista panorámica de los Yungas.', 450);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tventas`
--

CREATE TABLE `tventas` (
  `id_venta` int(11) NOT NULL,
  `nombre_cliente` varchar(100) NOT NULL,
  `ci_cliente` int(11) NOT NULL,
  `cod_paquete` int(11) NOT NULL,
  `cantidad_días` int(11) NOT NULL,
  `total` double NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `observación` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tventas`
--

INSERT INTO `tventas` (`id_venta`, `nombre_cliente`, `ci_cliente`, `cod_paquete`, `cantidad_días`, `total`, `id_usuario`, `fecha`, `observación`) VALUES
(1, 'Eduardo Contreras', 235689, 2, 2, 760, 64, '2021-02-16', 'tiene mascotas'),
(2, 'Flor Vargas', 784512, 1, 3, 1110, 44, '2021-02-16', 'ninguna'),
(3, 'Juan Topo', 451278, 3, 2, 900, 63, '2021-02-16', 'ninguna');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(4) NOT NULL COMMENT '1000',
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(70) NOT NULL,
  `nrodocumneto` int(10) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `usuario` varchar(15) NOT NULL,
  `pasword` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellidos`, `nrodocumneto`, `correo`, `usuario`, `pasword`) VALUES
(1, 'milton', 'figueredo', 838383, 'milton@algo.com', 'mltn', '123'),
(2, 'asdzzz', 'zxczz', 45612355, 'asd@algo.comz', 'asdzz', '12355'),
(13, 'nueva', 'pruebassss', 3003030, 'np@j.k', 'no', '3900'),
(37, 'prueba', 'json', 789456, 'pr@js.c', 'json', '789'),
(38, 'nueva', 'prueva', 546546546, 'json@d.j', 'jsnp', '4654654'),
(41, 'revision', 'nueva', 987979797, 'rn@kj.l', 'rnrn', '8789798'),
(44, 'uno', 'mas', 930389, 'deajoidj2@KLFLSFJ.KDJSDJ', 'JSFKJ', 'I09809489FE'),
(63, 'carlos', 'prado', 1212, 'carlos@p.com', 'carlosp', '456'),
(64, 'pedro', 'pascal', 565656, 'pedro@pascal.com', 'ppascal', '123456');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tpaquetes`
--
ALTER TABLE `tpaquetes`
  ADD PRIMARY KEY (`cod_paquete`);

--
-- Indices de la tabla `tventas`
--
ALTER TABLE `tventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `cod_paquete` (`cod_paquete`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tpaquetes`
--
ALTER TABLE `tpaquetes`
  MODIFY `cod_paquete` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tventas`
--
ALTER TABLE `tventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '1000', AUTO_INCREMENT=65;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tventas`
--
ALTER TABLE `tventas`
  ADD CONSTRAINT `tventas_ibfk_1` FOREIGN KEY (`cod_paquete`) REFERENCES `tpaquetes` (`cod_paquete`),
  ADD CONSTRAINT `tventas_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
