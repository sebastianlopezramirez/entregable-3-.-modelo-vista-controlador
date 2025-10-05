-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-04-2025 a las 03:19:32
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_comercial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alertas`
--

CREATE TABLE `alertas` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `mensaje` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL,
  `nivel` enum('Baja','Media','Alta','Crítica') DEFAULT 'Media',
  `vista` tinyint(1) DEFAULT 0,
  `fecha_vista` datetime DEFAULT NULL,
  `usuario_vista` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alertas`
--

INSERT INTO `alertas` (`id`, `producto_id`, `mensaje`, `fecha`, `nivel`, `vista`, `fecha_vista`, `usuario_vista`) VALUES
(1, 3, 'STOCK BAJO', '2023-02-15 10:00:00', 'Media', 0, NULL, NULL),
(2, 11, 'STOCK BAJO', '2023-02-20 11:30:00', 'Alta', 0, NULL, NULL),
(3, 14, 'STOCK BAJO', '2023-03-01 09:45:00', 'Media', 0, NULL, NULL),
(4, 2, 'STOCK BAJO', '2023-03-05 14:20:00', 'Baja', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `activa` tinyint(1) DEFAULT 1,
  `creado` datetime DEFAULT current_timestamp(),
  `actualizado` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `imagen`, `activa`, `creado`, `actualizado`) VALUES
(1, 'Electrónica', 'Productos electrónicos y gadgets', NULL, 1, '2025-04-10 20:18:45', '2025-04-10 20:18:45'),
(2, 'Hogar', 'Artículos para el hogar', NULL, 1, '2025-04-10 20:18:45', '2025-04-10 20:18:45'),
(3, 'Ropa', 'Ropa y accesorios', NULL, 1, '2025-04-10 20:18:45', '2025-04-10 20:18:45'),
(4, 'Deportes', 'Equipamiento deportivo', NULL, 1, '2025-04-10 20:18:45', '2025-04-10 20:18:45'),
(5, 'Jardín', 'Productos para jardín y exterior', NULL, 1, '2025-04-10 20:18:45', '2025-04-10 20:18:45'),
(6, 'Alimentación', 'Productos alimenticios', NULL, 1, '2025-04-10 20:18:45', '2025-04-10 20:18:45'),
(7, 'Juguetes', 'Juguetes y juegos', NULL, 1, '2025-04-10 20:18:45', '2025-04-10 20:18:45'),
(8, 'Libros', 'Libros y material educativo', NULL, 1, '2025-04-10 20:18:45', '2025-04-10 20:18:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `codigo_postal` varchar(10) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `actualizado` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('Activo','Inactivo','Pendiente') DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `apellido`, `email`, `telefono`, `direccion`, `ciudad`, `codigo_postal`, `pais`, `fecha_registro`, `actualizado`, `estado`) VALUES
(1, 'Ana', 'Martínez', 'ana.martinez@ejemplo.com', '612345678', 'Calle Principal 123', 'Madrid', '28001', 'España', '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(2, 'Luis', 'Rodríguez', 'luis.rodriguez@ejemplo.com', '623456789', 'Avenida Central 456', 'Barcelona', '08001', 'España', '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(3, 'Carmen', 'López', 'carmen.lopez@ejemplo.com', '634567890', 'Plaza Mayor 789', 'Valencia', '46001', 'España', '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(4, 'Miguel', 'Fernández', 'miguel.fernandez@ejemplo.com', '645678901', 'Ronda Norte 101', 'Sevilla', '41001', 'España', '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(5, 'Elena', 'García', 'elena.garcia@ejemplo.com', '656789012', 'Paseo del Prado 202', 'Bilbao', '48001', 'España', '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(6, 'Roberto', 'Díaz', 'roberto.diaz@ejemplo.com', '667890123', 'Gran Vía 303', 'Zaragoza', '50001', 'España', '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(7, 'Laura', 'Sánchez', 'laura.sanchez@ejemplo.com', '678901234', 'Calle Ancha 404', 'Málaga', '29001', 'España', '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(8, 'Jorge', 'Moreno', 'jorge.moreno@ejemplo.com', '689012345', 'Calle Estrecha 505', 'Murcia', '30001', 'España', '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(9, 'Patricia', 'Torres', 'patricia.torres@ejemplo.com', '690123456', 'Avenida del Mar 606', 'Palma', '07001', 'España', '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(10, 'Javier', 'Ruiz', 'javier.ruiz@ejemplo.com', '601234567', 'Calle del Sol 707', 'Las Palmas', '35001', 'España', '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_direcciones`
--

CREATE TABLE `clientes_direcciones` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `tipo` enum('Facturación','Envío','Ambos') NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  `provincia` varchar(100) DEFAULT NULL,
  `pais` varchar(50) NOT NULL,
  `es_principal` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes_direcciones`
--

INSERT INTO `clientes_direcciones` (`id`, `cliente_id`, `tipo`, `direccion`, `ciudad`, `codigo_postal`, `provincia`, `pais`, `es_principal`) VALUES
(1, 1, 'Facturación', 'Calle Principal 123', 'Madrid', '28001', 'Madrid', 'España', 1),
(2, 1, 'Envío', 'Calle Secundaria 456', 'Madrid', '28002', 'Madrid', 'España', 0),
(3, 2, 'Ambos', 'Avenida Central 456', 'Barcelona', '08001', 'Barcelona', 'España', 1),
(4, 3, 'Facturación', 'Plaza Mayor 789', 'Valencia', '46001', 'Valencia', 'España', 1),
(5, 3, 'Envío', 'Avenida del Puerto 123', 'Valencia', '46002', 'Valencia', 'España', 0),
(6, 4, 'Ambos', 'Ronda Norte 101', 'Sevilla', '41001', 'Sevilla', 'España', 1),
(7, 5, 'Ambos', 'Paseo del Prado 202', 'Bilbao', '48001', 'Vizcaya', 'España', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_devolucion`
--

CREATE TABLE `detalles_devolucion` (
  `id` int(11) NOT NULL,
  `devolucion_id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `estado_producto` enum('Buen estado','Dañado','Incompleto') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalles_devolucion`
--

INSERT INTO `detalles_devolucion` (`id`, `devolucion_id`, `producto_id`, `cantidad`, `precio_unitario`, `subtotal`, `estado_producto`) VALUES
(1, 1, 7, 1, 89.99, 89.99, 'Dañado'),
(2, 2, 3, 1, 799.99, 799.99, 'Buen estado'),
(3, 3, 12, 1, 149.99, 149.99, 'Buen estado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedido`
--

CREATE TABLE `detalles_pedido` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `descuento` decimal(10,2) DEFAULT 0.00,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalles_pedido`
--

INSERT INTO `detalles_pedido` (`id`, `pedido_id`, `producto_id`, `cantidad`, `precio_unitario`, `descuento`, `subtotal`) VALUES
(1, 1, 3, 1, 799.99, 0.00, 799.99),
(2, 2, 5, 1, 199.99, 0.00, 199.99),
(3, 2, 7, 1, 89.99, 0.00, 89.99),
(4, 2, 13, 2, 49.99, 0.00, 99.98),
(5, 3, 1, 1, 699.99, 0.00, 699.99),
(6, 4, 8, 1, 129.99, 0.00, 129.99),
(7, 5, 3, 1, 799.99, 0.00, 799.99),
(8, 6, 12, 1, 149.99, 0.00, 149.99),
(9, 7, 6, 1, 299.99, 0.00, 299.99),
(10, 8, 9, 1, 79.99, 0.00, 79.99),
(11, 8, 13, 2, 49.99, 0.00, 99.98),
(12, 9, 4, 1, 499.99, 0.00, 499.99),
(13, 10, 2, 1, 1299.99, 0.00, 649.98);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devoluciones`
--

CREATE TABLE `devoluciones` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `fecha_solicitud` datetime DEFAULT current_timestamp(),
  `fecha_procesado` datetime DEFAULT NULL,
  `motivo` enum('Producto dañado','Producto erróneo','Insatisfacción','Otro') NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` enum('Pendiente','Aprobada','Rechazada','Procesada') DEFAULT 'Pendiente',
  `monto_devolucion` decimal(10,2) DEFAULT NULL,
  `empleado_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `devoluciones`
--

INSERT INTO `devoluciones` (`id`, `pedido_id`, `cliente_id`, `fecha_solicitud`, `fecha_procesado`, `motivo`, `descripcion`, `estado`, `monto_devolucion`, `empleado_id`) VALUES
(1, 2, 2, '2023-01-20 10:15:00', '2023-01-22 14:30:00', 'Producto dañado', NULL, 'Procesada', 89.99, 8),
(2, 5, 5, '2023-02-08 09:00:00', '2023-02-10 11:45:00', 'Insatisfacción', NULL, 'Procesada', 799.99, 8),
(3, 6, 1, '2023-02-15 16:30:00', '2023-02-17 10:00:00', 'Producto erróneo', NULL, 'Procesada', 149.99, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `supervisor_id` int(11) DEFAULT NULL,
  `estado` enum('Activo','Inactivo','Vacaciones','Baja') DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `nombre`, `apellido`, `email`, `telefono`, `cargo`, `departamento`, `fecha_contratacion`, `salario`, `supervisor_id`, `estado`) VALUES
(1, 'Carlos', 'Hernández', 'carlos.hernandez@empresa.com', '912345678', 'Director Comercial', 'Comercial', '2020-01-15', 65000.00, NULL, 'Activo'),
(2, 'Marta', 'Jiménez', 'marta.jimenez@empresa.com', '912345679', 'Jefe de Ventas', 'Ventas', '2020-02-01', 55000.00, 1, 'Activo'),
(3, 'Diego', 'Alonso', 'diego.alonso@empresa.com', '912345680', 'Vendedor', 'Ventas', '2020-03-15', 35000.00, 2, 'Activo'),
(4, 'Isabel', 'Pérez', 'isabel.perez@empresa.com', '912345681', 'Vendedor', 'Ventas', '2020-04-01', 35000.00, 2, 'Activo'),
(5, 'Pablo', 'Medina', 'pablo.medina@empresa.com', '912345682', 'Responsable Almacén', 'Logística', '2020-02-15', 40000.00, 1, 'Activo'),
(6, 'Sofía', 'Navarro', 'sofia.navarro@empresa.com', '912345683', 'Auxiliar Almacén', 'Logística', '2020-05-01', 28000.00, 5, 'Activo'),
(7, 'Lucas', 'Gil', 'lucas.gil@empresa.com', '912345684', 'Contable', 'Finanzas', '2020-01-20', 45000.00, 1, 'Activo'),
(8, 'Nuria', 'Vega', 'nuria.vega@empresa.com', '912345685', 'Atención al Cliente', 'Atención al Cliente', '2020-03-01', 32000.00, NULL, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_precios`
--

CREATE TABLE `historial_precios` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `precio_anterior` decimal(10,2) NOT NULL,
  `precio_nuevo` decimal(10,2) NOT NULL,
  `fecha` datetime NOT NULL,
  `usuario` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs_clientes`
--

CREATE TABLE `logs_clientes` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `accion` varchar(100) NOT NULL,
  `fecha` datetime NOT NULL,
  `detalles` text DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `logs_clientes`
--

INSERT INTO `logs_clientes` (`id`, `cliente_id`, `accion`, `fecha`, `detalles`, `ip`, `usuario`) VALUES
(1, 1, 'CLIENTE CREADO', '2023-01-01 10:15:00', 'Registro de nuevo cliente', '192.168.1.100', NULL),
(2, 2, 'CLIENTE CREADO', '2023-01-02 11:30:00', 'Registro de nuevo cliente', '192.168.1.101', NULL),
(3, 3, 'CLIENTE CREADO', '2023-01-03 09:45:00', 'Registro de nuevo cliente', '192.168.1.102', NULL),
(4, 1, 'ACTUALIZACIÓN PERFIL', '2023-01-15 14:20:00', 'Actualización de teléfono', '192.168.1.103', NULL),
(5, 4, 'CLIENTE CREADO', '2023-01-05 16:10:00', 'Registro de nuevo cliente', '192.168.1.104', NULL),
(6, 5, 'CLIENTE CREADO', '2023-01-06 12:30:00', 'Registro de nuevo cliente', '192.168.1.105', NULL),
(7, 2, 'ACTUALIZACIÓN DIRECCIÓN', '2023-01-20 09:15:00', 'Nueva dirección de envío', '192.168.1.106', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `empleado_id` int(11) DEFAULT NULL,
  `fecha_pedido` datetime DEFAULT current_timestamp(),
  `fecha_envio` datetime DEFAULT NULL,
  `fecha_entrega` datetime DEFAULT NULL,
  `direccion_envio_id` int(11) DEFAULT NULL,
  `direccion_facturacion_id` int(11) DEFAULT NULL,
  `estado` enum('Pendiente','Procesando','Enviado','Entregado','Cancelado') DEFAULT 'Pendiente',
  `metodo_pago` enum('Tarjeta','PayPal','Transferencia','Contra reembolso') NOT NULL,
  `referencia_pago` varchar(100) DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `impuestos` decimal(10,2) NOT NULL,
  `gastos_envio` decimal(10,2) NOT NULL,
  `descuento` decimal(10,2) DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL,
  `notas` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `cliente_id`, `empleado_id`, `fecha_pedido`, `fecha_envio`, `fecha_entrega`, `direccion_envio_id`, `direccion_facturacion_id`, `estado`, `metodo_pago`, `referencia_pago`, `subtotal`, `impuestos`, `gastos_envio`, `descuento`, `total`, `notas`) VALUES
(1, 1, 3, '2023-01-10 10:30:00', '2023-01-12 09:15:00', NULL, 2, 1, 'Entregado', 'Tarjeta', NULL, 799.99, 168.00, 10.00, 0.00, 977.99, NULL),
(2, 2, 4, '2023-01-15 11:45:00', '2023-01-17 14:20:00', NULL, 3, 3, 'Entregado', 'PayPal', NULL, 389.98, 81.90, 0.00, 0.00, 471.88, NULL),
(3, 3, 3, '2023-01-20 16:20:00', '2023-01-23 10:00:00', NULL, 5, 4, 'Entregado', 'Transferencia', NULL, 699.99, 147.00, 10.00, 0.00, 856.99, NULL),
(4, 4, 4, '2023-01-25 09:10:00', '2023-01-26 11:30:00', NULL, 6, 6, 'Entregado', 'Tarjeta', NULL, 129.99, 27.30, 5.00, 0.00, 162.29, NULL),
(5, 5, 3, '2023-02-01 14:00:00', '2023-02-03 16:45:00', NULL, 7, 7, 'Entregado', 'PayPal', NULL, 799.99, 168.00, 0.00, 0.00, 967.99, NULL),
(6, 1, 3, '2023-02-10 13:15:00', '2023-02-11 09:30:00', NULL, 2, 1, 'Entregado', 'Tarjeta', NULL, 149.99, 31.50, 5.00, 0.00, 186.49, NULL),
(7, 3, 4, '2023-02-15 10:45:00', '2023-02-17 15:20:00', NULL, 5, 4, 'Entregado', 'Contra reembolso', NULL, 299.99, 63.00, 10.00, 0.00, 372.99, NULL),
(8, 2, 3, '2023-02-20 08:30:00', '2023-02-21 13:10:00', NULL, 3, 3, 'Entregado', 'Tarjeta', NULL, 179.98, 37.80, 0.00, 0.00, 217.78, NULL),
(9, 6, 4, '2023-03-01 16:45:00', '2023-03-03 11:30:00', NULL, NULL, NULL, 'Enviado', 'PayPal', NULL, 499.99, 105.00, 0.00, 0.00, 604.99, NULL),
(10, 7, 3, '2023-03-05 14:20:00', NULL, NULL, NULL, NULL, 'Procesando', 'Tarjeta', NULL, 649.98, 136.50, 10.00, 0.00, 796.48, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preferencias_cliente`
--

CREATE TABLE `preferencias_cliente` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `preferencia_marketing` tinyint(1) DEFAULT 1,
  `notificaciones_email` tinyint(1) DEFAULT 1,
  `notificaciones_sms` tinyint(1) DEFAULT 0,
  `fecha_actualizacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `preferencias_cliente`
--

INSERT INTO `preferencias_cliente` (`id`, `cliente_id`, `categoria_id`, `preferencia_marketing`, `notificaciones_email`, `notificaciones_sms`, `fecha_actualizacion`) VALUES
(1, 1, 1, 1, 1, 0, '2025-04-10 20:18:45'),
(2, 1, 4, 1, 1, 0, '2025-04-10 20:18:45'),
(3, 2, 2, 1, 1, 1, '2025-04-10 20:18:45'),
(4, 3, 1, 1, 1, 0, '2025-04-10 20:18:45'),
(5, 4, 3, 0, 1, 0, '2025-04-10 20:18:45'),
(6, 5, 1, 1, 1, 1, '2025-04-10 20:18:45'),
(7, 6, 5, 1, 0, 0, '2025-04-10 20:18:45'),
(8, 7, 8, 1, 1, 0, '2025-04-10 20:18:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `precio_oferta` decimal(10,2) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `codigo_sku` varchar(50) DEFAULT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `peso` decimal(8,2) DEFAULT NULL,
  `dimensiones` varchar(50) DEFAULT NULL,
  `destacado` tinyint(1) DEFAULT 0,
  `creado` datetime DEFAULT current_timestamp(),
  `actualizado` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('Activo','Inactivo','Agotado') DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `categoria_id`, `nombre`, `descripcion`, `precio`, `precio_oferta`, `stock`, `codigo_sku`, `imagen`, `peso`, `dimensiones`, `destacado`, `creado`, `actualizado`, `estado`) VALUES
(1, 1, 'Smartphone XYZ', 'Smartphone de última generación', 699.99, NULL, 50, 'EL-SP-001', NULL, NULL, NULL, 0, '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(2, 1, 'Portátil UltraBook', 'Portátil ligero y potente', 1299.99, NULL, 25, 'EL-LT-002', NULL, NULL, NULL, 0, '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(3, 1, 'Smart TV 55\"', 'Televisor inteligente 4K', 799.99, NULL, 15, 'EL-TV-003', NULL, NULL, NULL, 0, '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(4, 1, 'Tableta Pro', 'Tableta para profesionales', 499.99, NULL, 30, 'EL-TB-004', NULL, NULL, NULL, 0, '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(5, 2, 'Cafetera Automática', 'Cafetera con molinillo integrado', 199.99, NULL, 40, 'HG-CF-001', NULL, NULL, NULL, 0, '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(6, 2, 'Robot Aspirador', 'Robot aspirador inteligente', 299.99, NULL, 20, 'HG-RA-002', NULL, NULL, NULL, 0, '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(7, 2, 'Juego de Sartenes', 'Set de sartenes antiadherentes', 89.99, NULL, 35, 'HG-ST-003', NULL, NULL, NULL, 0, '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(8, 3, 'Chaqueta Invierno', 'Chaqueta impermeable para invierno', 129.99, NULL, 60, 'RP-CQ-001', NULL, NULL, NULL, 0, '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(9, 3, 'Zapatillas Deportivas', 'Zapatillas para running', 79.99, NULL, 80, 'RP-ZP-002', NULL, NULL, NULL, 0, '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(10, 3, 'Pantalones Vaqueros', 'Vaqueros elásticos de calidad', 59.99, NULL, 100, 'RP-PV-003', NULL, NULL, NULL, 0, '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(11, 4, 'Bicicleta Montaña', 'Bicicleta todo terreno', 599.99, NULL, 10, 'DP-BM-001', NULL, NULL, NULL, 0, '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(12, 4, 'Raqueta Tenis', 'Raqueta profesional de tenis', 149.99, NULL, 25, 'DP-RT-002', NULL, NULL, NULL, 0, '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(13, 4, 'Balón Fútbol', 'Balón oficial de competición', 49.99, NULL, 50, 'DP-BF-003', NULL, NULL, NULL, 0, '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(14, 5, 'Cortacésped Eléctrico', 'Cortacésped con batería recargable', 249.99, NULL, 15, 'JD-CT-001', NULL, NULL, NULL, 0, '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(15, 5, 'Set Herramientas Jardín', 'Conjunto de herramientas para jardinería', 79.99, NULL, 30, 'JD-HT-002', NULL, NULL, NULL, 0, '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_proveedor`
--

CREATE TABLE `producto_proveedor` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `precio_compra` decimal(10,2) NOT NULL,
  `tiempo_entrega` int(11) DEFAULT NULL,
  `cantidad_minima` int(11) DEFAULT 1,
  `es_proveedor_principal` tinyint(1) DEFAULT 0,
  `ultima_compra` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto_proveedor`
--

INSERT INTO `producto_proveedor` (`id`, `producto_id`, `proveedor_id`, `precio_compra`, `tiempo_entrega`, `cantidad_minima`, `es_proveedor_principal`, `ultima_compra`) VALUES
(1, 1, 1, 450.00, 5, 1, 1, NULL),
(2, 2, 1, 800.00, 7, 1, 1, NULL),
(3, 3, 1, 500.00, 10, 1, 1, NULL),
(4, 4, 1, 300.00, 5, 1, 1, NULL),
(5, 5, 2, 100.00, 3, 1, 1, NULL),
(6, 6, 2, 150.00, 5, 1, 1, NULL),
(7, 7, 2, 40.00, 3, 1, 1, NULL),
(8, 8, 3, 70.00, 7, 1, 1, NULL),
(9, 9, 3, 40.00, 5, 1, 1, NULL),
(10, 10, 3, 30.00, 5, 1, 1, NULL),
(11, 11, 4, 350.00, 10, 1, 1, NULL),
(12, 12, 4, 90.00, 7, 1, 1, NULL),
(13, 13, 4, 25.00, 3, 1, 1, NULL),
(14, 14, 5, 150.00, 7, 1, 1, NULL),
(15, 15, 5, 40.00, 5, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `contacto_nombre` varchar(100) DEFAULT NULL,
  `contacto_telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `codigo_postal` varchar(10) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `notas` text DEFAULT NULL,
  `creado` datetime DEFAULT current_timestamp(),
  `actualizado` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('Activo','Inactivo') DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `nombre`, `contacto_nombre`, `contacto_telefono`, `email`, `telefono`, `direccion`, `ciudad`, `codigo_postal`, `pais`, `notas`, `creado`, `actualizado`, `estado`) VALUES
(1, 'TechSupplies Inc.', 'John Smith', NULL, 'john@techsupplies.com', '123-456-7890', NULL, 'Chicago', NULL, 'Estados Unidos', NULL, '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(2, 'HomeGoods Ltd.', 'Maria García', NULL, 'maria@homegoods.com', '234-567-8901', NULL, 'Barcelona', NULL, 'España', NULL, '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(3, 'Fashion Distributors', 'Pierre Dubois', NULL, 'pierre@fashiondist.com', '345-678-9012', NULL, 'París', NULL, 'Francia', NULL, '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(4, 'Sport Warehouse', 'Hans Mueller', NULL, 'hans@sportwarehouse.com', '456-789-0123', NULL, 'Berlín', NULL, 'Alemania', NULL, '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo'),
(5, 'Garden Solutions', 'Emma Wilson', NULL, 'emma@gardensolutions.com', '567-890-1234', NULL, 'Londres', NULL, 'Reino Unido', NULL, '2025-04-10 20:18:45', '2025-04-10 20:18:45', 'Activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alertas`
--
ALTER TABLE `alertas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `clientes_direcciones`
--
ALTER TABLE `clientes_direcciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Indices de la tabla `detalles_devolucion`
--
ALTER TABLE `detalles_devolucion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devolucion_id` (`devolucion_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `empleado_id` (`empleado_id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `supervisor_id` (`supervisor_id`);

--
-- Indices de la tabla `historial_precios`
--
ALTER TABLE `historial_precios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `logs_clientes`
--
ALTER TABLE `logs_clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `empleado_id` (`empleado_id`),
  ADD KEY `direccion_envio_id` (`direccion_envio_id`),
  ADD KEY `direccion_facturacion_id` (`direccion_facturacion_id`);

--
-- Indices de la tabla `preferencias_cliente`
--
ALTER TABLE `preferencias_cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo_sku` (`codigo_sku`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `producto_proveedor`
--
ALTER TABLE `producto_proveedor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `producto_id` (`producto_id`,`proveedor_id`),
  ADD KEY `proveedor_id` (`proveedor_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alertas`
--
ALTER TABLE `alertas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `clientes_direcciones`
--
ALTER TABLE `clientes_direcciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `detalles_devolucion`
--
ALTER TABLE `detalles_devolucion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `historial_precios`
--
ALTER TABLE `historial_precios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `logs_clientes`
--
ALTER TABLE `logs_clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `preferencias_cliente`
--
ALTER TABLE `preferencias_cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `producto_proveedor`
--
ALTER TABLE `producto_proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alertas`
--
ALTER TABLE `alertas`
  ADD CONSTRAINT `alertas_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `clientes_direcciones`
--
ALTER TABLE `clientes_direcciones`
  ADD CONSTRAINT `clientes_direcciones_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `detalles_devolucion`
--
ALTER TABLE `detalles_devolucion`
  ADD CONSTRAINT `detalles_devolucion_ibfk_1` FOREIGN KEY (`devolucion_id`) REFERENCES `devoluciones` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalles_devolucion_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD CONSTRAINT `detalles_pedido_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalles_pedido_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD CONSTRAINT `devoluciones_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `devoluciones_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `devoluciones_ibfk_3` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`supervisor_id`) REFERENCES `empleados` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `historial_precios`
--
ALTER TABLE `historial_precios`
  ADD CONSTRAINT `historial_precios_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `logs_clientes`
--
ALTER TABLE `logs_clientes`
  ADD CONSTRAINT `logs_clientes_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`direccion_envio_id`) REFERENCES `clientes_direcciones` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pedidos_ibfk_4` FOREIGN KEY (`direccion_facturacion_id`) REFERENCES `clientes_direcciones` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `preferencias_cliente`
--
ALTER TABLE `preferencias_cliente`
  ADD CONSTRAINT `preferencias_cliente_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `preferencias_cliente_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `producto_proveedor`
--
ALTER TABLE `producto_proveedor`
  ADD CONSTRAINT `producto_proveedor_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `producto_proveedor_ibfk_2` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

SHOW TABLES ;
DESCRIBE clientes;
