-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 28-04-2025 a las 03:13:23
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `car_cleanbd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `automotores`
--

DROP TABLE IF EXISTS `automotores`;
CREATE TABLE IF NOT EXISTS `automotores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `automotores`
--

INSERT INTO `automotores` (`id`, `cliente_id`, `marca`, `modelo`, `year`) VALUES
(1, 1, 'Suzuki', 'Gixxer', 2025),
(2, 2, 'Nissan', 'Versa', 2025),
(3, 3, 'Hero', 'i3', 2025),
(4, 4, 'Suzuki', 'Gixxer', 2025),
(5, 5, 'Suzuki', 'Gixxer', 2025),
(6, 6, 'Nissan', 'Versa', 2026),
(7, 7, 'Nissan', 'Versa', 2025),
(8, 8, 'Yamaha', 'FZ2.0', 2024),
(9, 9, 'Suzuki', 'Gixxer', 2026),
(10, 10, 'Suzuki', 'FZ2.0', 2025),
(11, 11, 'Suzuki', 'Gixxer', 2025),
(12, 12, 'Suzuki', 'Gixxer', 2027),
(13, 13, 'Toyota', 'Centra', 2016),
(14, 14, 'Toyota', 'Centra', 2016);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `vip` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombres`, `apellidos`, `vip`) VALUES
(1, 'Edgar', 'Mejia', 0),
(2, 'Jennifer', 'Mejia', 1),
(3, 'Jose', 'Mejia', 1),
(4, 'Edgar', 'Mejia', 1),
(5, 'Edgar', 'Mejia', 1),
(6, 'Edgar', 'Mejía Hernández', 0),
(7, 'Edgar', 'Mejia', 0),
(8, 'Denys', 'Mejia', 1),
(9, 'Carlos', 'Mejía Hernández', 0),
(10, 'Jose', 'Mejia', 1),
(11, 'Marta', 'Hernandez', 1),
(12, 'Juan', 'Hernandez', 1),
(13, 'Rodrigo.Escobar', 'RIvas', 1),
(14, 'Mauricio Herrera', 'Lopez ', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_servicios`
--

DROP TABLE IF EXISTS `clientes_servicios`;
CREATE TABLE IF NOT EXISTS `clientes_servicios` (
  `cliente_id` int NOT NULL,
  `servicio_id` int NOT NULL,
  `fecha_servicio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cliente_id`,`servicio_id`,`fecha_servicio`),
  KEY `servicio_id` (`servicio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `clientes_servicios`
--

INSERT INTO `clientes_servicios` (`cliente_id`, `servicio_id`, `fecha_servicio`) VALUES
(1, 1, '2025-04-27 01:05:38'),
(3, 1, '2025-04-27 01:08:39'),
(4, 1, '2025-04-27 01:22:00'),
(5, 1, '2025-04-27 01:28:37'),
(8, 1, '2025-04-27 01:49:39'),
(9, 1, '2025-04-27 03:09:07'),
(10, 1, '2025-04-27 03:11:45'),
(11, 1, '2025-04-27 08:19:20'),
(12, 1, '2025-04-28 06:46:54'),
(2, 2, '2025-04-27 01:07:43'),
(6, 2, '2025-04-27 01:33:35'),
(7, 2, '2025-04-27 01:34:07'),
(13, 2, '2025-04-28 03:07:21'),
(14, 2, '2025-04-28 03:10:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

DROP TABLE IF EXISTS `servicios`;
CREATE TABLE IF NOT EXISTS `servicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  `precio` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tipo` (`tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `tipo`, `precio`) VALUES
(1, 'Motocicleta', 2.75),
(2, 'Sedan', 3.50),
(3, 'Camioneta', 4.00),
(4, 'Microbús', 5.00),
(5, 'Autobús', 7.00);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `automotores`
--
ALTER TABLE `automotores`
  ADD CONSTRAINT `automotores_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `clientes_servicios`
--
ALTER TABLE `clientes_servicios`
  ADD CONSTRAINT `clientes_servicios_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `clientes_servicios_ibfk_2` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
