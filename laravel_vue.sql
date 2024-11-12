-- --------------------------------------------------------
-- Host:                         localhost
-- Versi server:                 8.0.31 - MySQL Community Server - GPL
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk laravel_vue
CREATE DATABASE IF NOT EXISTS `laravel_vue` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `laravel_vue`;

-- membuang struktur untuk table laravel_vue.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel laravel_vue.failed_jobs: 0 rows
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- membuang struktur untuk table laravel_vue.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel laravel_vue.migrations: 5 rows
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2024_06_23_213000_add_column_photo_to_users_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- membuang struktur untuk table laravel_vue.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel laravel_vue.password_resets: 0 rows
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- membuang struktur untuk table laravel_vue.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel laravel_vue.personal_access_tokens: 0 rows
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- membuang struktur untuk table laravel_vue.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel laravel_vue.users: 16 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `photo`) VALUES
	(2, '6a4pJHzOs9', 'ja0F42imQz@gmail.com', NULL, '$2y$10$j1VvjCBzxD9F0ZGnZuCDMu4.pD8WvKd/Y7Zi8.TzEV.UiOw90I.Q2', NULL, NULL, NULL, NULL),
	(3, '02Undu8zP5', 'QvAgrr1Nu7@gmail.com', NULL, '$2y$10$A0HrId.5yzGee7F3L2NhWeaxV5CHr8M9gF7bUtMO.7vap0dw5cgpi', NULL, NULL, NULL, NULL),
	(4, 'cRx5O0247H', '6LBbzGTfwe@gmail.com', NULL, '$2y$10$MlFsZ1CTgIm9j3.UqLospOLAWjCaGTg2AbKzhkhaV4199KL1r66ca', NULL, NULL, NULL, NULL),
	(5, 'shPuhjeO9N', '5rZIgZx5Tn@gmail.com', NULL, '$2y$10$yfTt.wXD.aNVC9jMMNr2m.KBLNW4yh5p3sVmlnJurzMveqKcTsTke', NULL, NULL, NULL, NULL),
	(6, '2u08f1pPsO', 'Cq4MaDzJht@gmail.com', NULL, '$2y$10$BTARHKz/QlB5z1znaKNYJOgW.TuCw7LAArffylWNKQhrejRIHviKy', NULL, NULL, NULL, NULL),
	(7, '2yi9vT16nl', 'ExBDYhT2X7@gmail.com', NULL, '$2y$10$9F3g29Bp4oqcsSUxVE429ewa/YbO.ZV41IuyugdCyvA8E6A7X9Ko2', NULL, NULL, NULL, NULL),
	(8, '4wJ1Dw4PxR', 'IZtRALGB28@gmail.com', NULL, '$2y$10$KGHEln9b.BPXE4Kpa.y/8.jX0fHzF5NY8nMz.ynfqVVgoFqbaqRdy', NULL, NULL, NULL, NULL),
	(9, 'l7ocmN1CyK', 'qHSF9NPiyt@gmail.com', NULL, '$2y$10$rcjlDjd4Pu6iekq9IFUNX./DIzdVZd3rrsU0IqHio1gG2GkjI77Ci', NULL, NULL, NULL, NULL),
	(10, 'N2E9oEetX3', 'Y04qPgJLOX@gmail.com', NULL, '$2y$10$D9SvRxyGQF9K.qr4ML5swOuH6Bly/ga08cE6CKSXcM2MCOXRzJw6O', NULL, NULL, NULL, NULL),
	(11, 'uuKDvCmtDM', 'F5oURIJtxO@gmail.com', NULL, '$2y$10$J9wHFZCNXOYUoh8xmxL8.eJ8xCHGMyEINn8oGpfbz5D1IJAyI62WK', NULL, NULL, NULL, NULL),
	(12, 'Ubaed', 'sEJuR3X4de@gmail.com', NULL, '$2y$10$u.Dn.a7.0GKEV.8YjeaK0ueVYm.ly5v/QkUb05dCcOxshK9t2/Lj2', NULL, NULL, '2024-06-23 14:44:41', '1719179081.jpg'),
	(13, 'FID1dIinh3', 'QZrEQm2nEr@gmail.com', NULL, '$2y$10$JNjQkDdeu1GjukddEbTzyOQ.6wY7kVZAW0.ZuJqmXWADlBscDGoeq', NULL, NULL, NULL, NULL),
	(14, 'Numquam sit nulla of', 'Quibusdam quo debiti', NULL, 'Corrupti pariatur ', NULL, '2024-06-23 00:48:28', '2024-06-23 00:48:28', NULL),
	(16, 'Omnis incidunt vel', 'Optio voluptatibus', NULL, '$2y$10$XVWQUSgQ3T.t6fm4ZrMqHupwAB3Vc7RdBm.1.VhnYaM.R1yn0qxna', NULL, '2024-06-23 00:51:46', '2024-06-23 00:51:46', NULL),
	(18, 'Aute eos autem reic', 'Magni qui commodo fa', NULL, '$2y$10$sy.nnOSHbGAJKqCqWrlmluxXsYyJQIePKJQjUabof/w0Wj6c1iAO.', NULL, '2024-06-23 00:57:54', '2024-06-23 00:57:54', NULL),
	(19, 'Adipisicing magnam e', 'Fuga Laborum Imped', NULL, '$2y$10$2UG5zCpoxIS.Q9Gaq.olU.V5tcylM0uApMBdwyGkoEp6eK7WKPOyy', NULL, '2024-06-23 01:00:14', '2024-06-23 01:00:14', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
