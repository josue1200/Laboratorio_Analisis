-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: dbempresa
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idclientes` int NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(60) NOT NULL,
  `Apellidos` varchar(60) NOT NULL,
  `NIT` varchar(12) NOT NULL,
  `Genero` bit(2) NOT NULL,
  `Telefono` varchar(25) NOT NULL,
  `Correo_Electronico` varchar(45) NOT NULL,
  `FechaIngreso` datetime NOT NULL,
  PRIMARY KEY (`idclientes`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'juan','perez','123123',_binary '','123123','asdasda@asd','2000-02-02 00:00:00'),(2,'juanita','Perez','12312312',_binary '','33333','asdasd@sas','2020-10-10 12:59:49'),(4,'Juancina','Perez','33333',_binary '','555555','juan@gmaila','2020-10-10 12:49:49'),(6,'Miguel','Perez','123123',_binary '','123123','juan@hotmaill','2020-10-17 11:51:38');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `idcompra` int NOT NULL AUTO_INCREMENT,
  `no_orden_compra` int NOT NULL,
  `idproveedor` int NOT NULL,
  `fecha_orden` date NOT NULL,
  `fechaingreso` datetime NOT NULL,
  PRIMARY KEY (`idcompra`),
  KEY `proveedor_idx` (`idproveedor`),
  CONSTRAINT `proveedor` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`idProveedores`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,1,1,'2000-02-02','2000-02-02 00:00:00'),(2,2,2,'2000-03-03','2000-03-03 00:00:00'),(3,3,2,'2020-11-05','2020-11-02 00:20:38'),(4,3,1,'2020-11-05','2020-11-02 00:21:13'),(5,3,1,'2020-11-05','2020-11-02 00:21:47'),(6,4,2,'2020-11-12','2020-11-02 00:26:32'),(7,5,2,'2020-11-11','2020-11-02 00:29:59'),(8,6,1,'2020-11-30','2020-11-02 00:32:58');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras_detalle`
--

DROP TABLE IF EXISTS `compras_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras_detalle` (
  `idcompra_detalle` int NOT NULL AUTO_INCREMENT,
  `idcompra` int NOT NULL,
  `idproducto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_costo_unitario` decimal(8,2) NOT NULL,
  PRIMARY KEY (`idcompra_detalle`),
  KEY `prod_idx` (`idproducto`),
  KEY `compras_idx` (`idcompra`),
  CONSTRAINT `compras` FOREIGN KEY (`idcompra`) REFERENCES `compras` (`idcompra`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `prod` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idProductos`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras_detalle`
--

LOCK TABLES `compras_detalle` WRITE;
/*!40000 ALTER TABLE `compras_detalle` DISABLE KEYS */;
INSERT INTO `compras_detalle` VALUES (1,1,6,1000,12.00),(2,2,7,100,122.00),(3,5,6,2,2.00),(4,6,6,12,2.00),(5,6,6,12,2.00),(6,7,6,2,100.00),(7,7,6,2,100.00),(8,7,6,2,100.00),(11,8,6,4,200.00),(12,8,7,6,100.00);
/*!40000 ALTER TABLE `compras_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `idempleados` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(60) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `direccion` varchar(80) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `DPI` varchar(15) NOT NULL,
  `genero` bit(2) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `idPuesto` smallint NOT NULL,
  `fecha_inicio_laborales` date NOT NULL,
  `fechaingreso` datetime NOT NULL,
  PRIMARY KEY (`idempleados`),
  KEY `Puesto_idx` (`idPuesto`),
  CONSTRAINT `Puesto` FOREIGN KEY (`idPuesto`) REFERENCES `puestos` (`idPuestos`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'juan','perez','antigua','12312312','231',_binary '','2000-04-04',2,'2010-05-12','2010-05-13 00:00:00'),(4,'Juancina','Perez','antigua','1232323','123123',_binary '','2020-10-29',3,'2000-02-02','2020-10-20 00:00:00'),(5,'Miguel','Rivera','Antigua Guatemala','12345678','1234567',_binary '','2019-10-01',3,'2000-02-02','2020-10-25 22:19:12'),(6,'Antonio','Rivera','antigua','1232323','123123',_binary '','2019-11-06',2,'2000-02-02','2020-10-25 22:21:38');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `idMarcas` smallint NOT NULL AUTO_INCREMENT,
  `Marca` varchar(50) NOT NULL,
  PRIMARY KEY (`idMarcas`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Hp'),(2,'DELL'),(3,'Lenovo'),(6,'Bimbo'),(7,'Voodo'),(11,'Lenovo');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_dinamico`
--

DROP TABLE IF EXISTS `menu_dinamico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_dinamico` (
  `idmenu_dinamico` int NOT NULL AUTO_INCREMENT,
  `Menujsp` varchar(45) NOT NULL,
  `Menu` varchar(45) NOT NULL,
  `Tipo` varchar(45) NOT NULL,
  `imagen` varchar(45) NOT NULL,
  PRIMARY KEY (`idmenu_dinamico`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_dinamico`
--

LOCK TABLES `menu_dinamico` WRITE;
/*!40000 ALTER TABLE `menu_dinamico` DISABLE KEYS */;
INSERT INTO `menu_dinamico` VALUES (1,'Marcas.jsp','Marcas','administrador','marcas.png'),(2,'Clientes.jsp','Clientes','usuario','clientes.png'),(3,'Empleados.jsp','Empleados','administrador','empleadosa.png'),(4,'Productos.jsp','Productos','usuario','productos_1.png'),(5,'Proveedores.jsp','Proveedor','administrador','proveedores.png'),(6,'Puestos.jsp','Puestos','administrador','puestos.png'),(7,'Nuevousad.jsp','Nuevo Admin/User','administrador','puestos.png'),(8,'Maestro_VentasDetalle.jsp','Maestro Detalle Ventas','usuario','clientes.png'),(9,'Maestro_ComprasDetalle.jsp','Maestro Detalle Compras','usuario','clientes.png');
/*!40000 ALTER TABLE `menu_dinamico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `idProductos` int NOT NULL AUTO_INCREMENT,
  `Productos` varchar(50) NOT NULL,
  `idMarca` smallint NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `Imagen` varchar(120) NOT NULL,
  `Precio_Costo` decimal(8,2) NOT NULL,
  `Precio_Venta` decimal(8,2) NOT NULL,
  `existencias` int NOT NULL,
  `Fecha_Ingreso` date NOT NULL,
  PRIMARY KEY (`idProductos`),
  KEY `marcas_idx` (`idMarca`),
  CONSTRAINT `marcas` FOREIGN KEY (`idMarca`) REFERENCES `marcas` (`idMarcas`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (6,'Formularios',2,'Antecedentes','Antecendentes.jpg',200.00,250.00,28,'2020-10-16'),(7,'zapatos',2,'Blancos','zapatosjpg.jpg',100.00,125.00,40,'2020-10-19');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `idProveedores` int NOT NULL AUTO_INCREMENT,
  `Proveedor` varchar(60) DEFAULT NULL,
  `NIT` varchar(12) DEFAULT NULL,
  `Direccion` varchar(80) DEFAULT NULL,
  `Telefono` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idProveedores`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'juan','11212','antigua','123123'),(2,'maria','12132','guatemala','123123'),(3,'pedro','123123','zacapa','123123'),(6,'Luis','1234','Guatemala','2242353465');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puestos`
--

DROP TABLE IF EXISTS `puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puestos` (
  `idPuestos` smallint NOT NULL AUTO_INCREMENT,
  `Puesto` varchar(50) NOT NULL,
  PRIMARY KEY (`idPuestos`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
INSERT INTO `puestos` VALUES (1,'Admin'),(2,'Programer'),(3,'Gerent');
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsers` int NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(45) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Correo` varchar(45) NOT NULL,
  `Pass` varchar(45) NOT NULL,
  `Tipe` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsers`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Pedro','Miguel','asturias','miguel@123','123','administrador'),(2,'Andre','Andrea','perez','andrea@qwe','1234','administrador'),(3,'Maria','Maria','Perez','Maria@12332','maria1','usuario');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventadetalle`
--

DROP TABLE IF EXISTS `ventadetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventadetalle` (
  `idVentaDetalle` int NOT NULL AUTO_INCREMENT,
  `idventa` int DEFAULT NULL,
  `idproductos` int DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `precio_unitario` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`idVentaDetalle`),
  KEY `ventas_idx` (`idventa`),
  KEY `productos_idx` (`idproductos`),
  CONSTRAINT `productos` FOREIGN KEY (`idproductos`) REFERENCES `productos` (`idProductos`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ventas` FOREIGN KEY (`idventa`) REFERENCES `ventas` (`idventas`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventadetalle`
--

LOCK TABLES `ventadetalle` WRITE;
/*!40000 ALTER TABLE `ventadetalle` DISABLE KEYS */;
INSERT INTO `ventadetalle` VALUES (18,12,6,'1',1.00),(20,12,6,'1',2.00),(21,15,6,'1',1.00),(22,15,7,'2',2.00),(23,16,6,'3',3.00),(24,16,6,'3',3.00),(25,17,6,'2',2.00),(26,19,6,'1',1.00),(27,20,6,'1',1.00),(28,20,6,'1',12.00),(29,20,6,'2',1.00),(30,20,6,'1',1.00),(31,21,6,'2',2.00);
/*!40000 ALTER TABLE `ventadetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `idventas` int NOT NULL AUTO_INCREMENT,
  `nofactura` int DEFAULT NULL,
  `serie` char(1) DEFAULT NULL,
  `fechafactura` date DEFAULT NULL,
  `idcliente` int DEFAULT NULL,
  `idempleado` int DEFAULT NULL,
  `fechaingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`idventas`),
  KEY `cliente_idx` (`idcliente`),
  KEY `empleado_idx` (`idempleado`),
  CONSTRAINT `cliente` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idclientes`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `empleado` FOREIGN KEY (`idempleado`) REFERENCES `empleados` (`idempleados`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (12,23,'3','2020-10-25',6,1,'2020-10-25 22:25:54'),(15,1,'1','2020-11-10',4,5,'2020-11-01 17:50:46'),(16,2,'2','2020-11-22',2,4,'2020-11-01 17:59:06'),(17,3,'3','2020-12-03',6,1,'2020-11-01 18:07:19'),(19,4,'4','2020-11-24',6,1,'2020-11-01 18:18:45'),(20,5,'5','2020-11-25',2,1,'2020-11-01 18:20:35'),(21,5,'5','2020-11-11',4,4,'2020-11-01 18:32:35');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbempresa'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-02 14:46:39
