-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: restaurant
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `tbl_food`
--

DROP TABLE IF EXISTS `tbl_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_food` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `image` varchar(300) DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_food`
--

LOCK TABLES `tbl_food` WRITE;
/*!40000 ALTER TABLE `tbl_food` DISABLE KEYS */;
INSERT INTO `tbl_food` VALUES (1,'Canh chua cá bông lau','Food/Image/canh-chua-ca-bong-lau.jpg',128000.00,1,'Tô canh chua mang đậm hương vị miền Nam','2024-08-27 00:00:00',NULL),(2,'Ba chỉ kho cái dừa','Food/Image/thit-ba-chi-kho-dua.jpg',128000.00,1,'Thịt ba chỉ kho dừa là món ăn quen thuộc và hấp dẫn có vị thơm đậm đà, beo béo.','2024-08-27 00:00:00',NULL),(3,'Lưỡi bò xào khóm','Food/Image/luoi-bo-xao-khom.jpg',158000.00,1,'Món lưỡi bò xào dứa dậy mùi thơm đặc trưng, vị chua ngọt nhẹ.','2024-08-27 00:00:00','2024-08-27 00:00:00'),(4,'Canh chua cá lóc','Food/Image/canh-chua-ca-loc.jpg',128000.00,1,'Hương vị thanh mát, chua ngọt hấp dẫn khó cưỡng.','2024-08-27 00:00:00',NULL),(5,'Sườn ram mặn','Food/Image/suon-ram-man.jpg',150000.00,1,'Thịt sườn mềm nhưng vẫn bám vào xương, nước sốt sánh màu hổ phách đẹp mắt, vị mặn ngọt hài hòa.','2024-08-27 00:00:00',NULL),(6,'Bê xào sả ớt','Food/Image/be-xao-xa-ot.jpg',200000.00,1,'Món này kết hợp hương vị thơm ngon của thịt bê tươi ngon và cay nồng của sả ớt.','2024-08-27 00:00:00','2024-08-27 00:00:00'),(7,'Ếch đồng rang muối','Food/Image/ech-rang-muoi.jpg',150000.00,1,'Thịt ếch từ lâu đã được biết đến với nhiều tác dụng chữa bệnh, rất tốt cho sức khỏe.','2024-08-27 00:00:00',NULL),(8,'Măng trúc xào bò','Food/Image/mang-truc-xao-bo.jfif',188000.00,1,'Măng trúc xào bò là một món hội tụ đủ chất xơ của măng và đạm của thịt bò.','2024-08-27 00:00:00','2024-08-27 00:00:00'),(9,'Bánh xèo tép','Food/Image/banh-xeo.jfif',80000.00,1,'Vỏ bánh xèo giòn béo thơm mùi cốt dừa và trứng gà mang đến nét đặc trưng của miền Tây Nam Bộ.','2024-08-27 00:00:00',NULL),(10,'Chim bồ câu quay','Food/Image/Chim-cau-quay.jpg',250000.00,1,'Chim bồ câu quay là món ăn phổ biến trên các bàn tiệc.','2024-08-27 00:00:00',NULL),(11,'Canh khổ qua nhồi thịt','Food/Image/canh-kho-qua.jpg',100000.00,1,'Món ăn thơm ngon, thanh mát và có nhiều tác dụng tốt cho sức khỏe','2024-08-27 00:00:00',NULL),(12,'Nộm bắp Bò hoa chuối','Food/Image/bap-bo-hoa-chuoi.jfif',125000.00,1,'Hoa chuối sần sật, thịt bò mềm, lạc bùi bùi hòa quyện với nước sốt chua chua ngọt ngọt','2024-08-27 00:00:00',NULL),(13,'Rau củ quả luộc kho quẹt','Food/Image/rau-cu-kho-quet.jpg',85000.00,1,'Đĩa rau củ luộc vừa chín đều tới nóng hổi, nồi mắm kho quẹt thì vẫn còn độ sôi nhẹ, thơm lừng.','2024-08-27 00:00:00',NULL);
/*!40000 ALTER TABLE `tbl_food` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-30 22:20:17
