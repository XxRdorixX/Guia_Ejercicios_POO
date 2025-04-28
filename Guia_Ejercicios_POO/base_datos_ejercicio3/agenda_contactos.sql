-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 28-04-2025 a las 03:11:50
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
-- Base de datos: `agenda_contactos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

DROP TABLE IF EXISTS `contactos`;
CREATE TABLE IF NOT EXISTS `contactos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `contactos`
--

INSERT INTO `contactos` (`id`, `nombre`, `telefono`, `email`, `fecha_creacion`) VALUES
(1, 'Juan Pérez', '123456789', 'juan@example.com', '2025-04-26 02:00:44'),
(2, 'María López', '987654321', 'maria@example.com', '2025-04-26 02:00:44'),
(3, 'Carlos Gómez', '555123456', 'carlos@example.com', '2025-04-26 02:00:44'),
(4, 'Rodrigo Ernesto Escobar Rivas', '7722-6677', 'rodriescobar2004@gmail.com', '2025-04-26 02:05:38'),
(5, 'Alfredo Luis', '3743-3947', 'Luis@gmail.com', '2025-04-26 17:44:42'),
(6, 'Luis Adame', '9378-2747', 'Adam@gmail.com', '2025-04-26 17:45:35'),
(7, 'Nery Rivas', '3746-3846', 'Gilm@gmail.com', '2025-04-26 18:01:14'),
(8, 'Ruben Diaz', '2994-3141', 'Rubi@gmail.com', '2025-04-27 22:51:02');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
