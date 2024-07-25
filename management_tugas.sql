-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table management_tugas.comment
CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `task_id` int DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table management_tugas.comment: ~5 rows (approximately)
INSERT INTO `comment` (`comment_id`, `user_id`, `task_id`, `content`) VALUES
	(1, 1, 1, 'Comment 1 for Task 1'),
	(2, 2, 2, 'Comment 2 for Task 2'),
	(3, 3, 3, 'Comment 3 for Task 3'),
	(4, 4, 4, 'Comment 4 for Task 4'),
	(5, 5, 5, 'Comment 5 for Task 5');

-- Dumping structure for table management_tugas.project
CREATE TABLE IF NOT EXISTS `project` (
  `project_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table management_tugas.project: ~5 rows (approximately)
INSERT INTO `project` (`project_id`, `name`) VALUES
	(1, 'Project Alpha'),
	(2, 'Project Beta'),
	(3, 'Project Gamma'),
	(4, 'Project Delta'),
	(5, 'Project Epsilon');

-- Dumping structure for table management_tugas.role
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table management_tugas.role: ~5 rows (approximately)
INSERT INTO `role` (`role_id`, `name`) VALUES
	(1, 'admin'),
	(2, 'member'),
	(3, 'guest'),
	(4, 'editor'),
	(5, 'viewer');

-- Dumping structure for table management_tugas.task
CREATE TABLE IF NOT EXISTS `task` (
  `task_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `desc` text,
  `deadline` date DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  KEY `project_id` (`project_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table management_tugas.task: ~5 rows (approximately)
INSERT INTO `task` (`task_id`, `name`, `desc`, `deadline`, `project_id`, `user_id`) VALUES
	(1, 'Task 1', 'Description of Task 1', '2024-08-01', 1, 1),
	(2, 'Task 2', 'Description of Task 2', '2024-08-02', 2, 2),
	(3, 'Task 3', 'Description of Task 3', '2024-08-03', 3, 3),
	(4, 'Task 4', 'Description of Task 4', '2024-08-04', 4, 4),
	(5, 'Task 5', 'Description of Task 5', '2024-08-05', 5, 5);

-- Dumping structure for table management_tugas.user
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table management_tugas.user: ~5 rows (approximately)
INSERT INTO `user` (`user_id`, `name`, `email`) VALUES
	(1, 'Budi Santoso', 'budi.santoso@example.com'),
	(2, 'Ayu Lestari', 'ayu.lestari@example.com'),
	(3, 'Rina Wijaya', 'rina.wijaya@example.com'),
	(4, 'Wawan Kusuma', 'wawan.kusuma@example.com'),
	(5, 'Dewi Pratama', 'dewi.pratama@example.com');

-- Dumping structure for table management_tugas.userrole
CREATE TABLE IF NOT EXISTS `userrole` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `userrole_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `userrole_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table management_tugas.userrole: ~5 rows (approximately)
INSERT INTO `userrole` (`user_id`, `role_id`) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
