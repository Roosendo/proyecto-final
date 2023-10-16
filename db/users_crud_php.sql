-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2023 at 03:13 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `users_crud_php`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_admin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `user_id`, `is_admin`) VALUES
(1, 6, 1),
(2, 8, 0),
(3, 9, 0),
(4, 10, 0),
(5, 11, 0),
(6, 12, 0),
(7, 13, 0),
(8, 16, 0),
(9, 17, 0),
(16, 24, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `password` varchar(14) NOT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `lastname`, `password`, `email`) VALUES
(6, 'Lionel Andrés', 'Messi Cuccittini', 'goat', 'messi10@goat.com'),
(8, 'Fatima', 'Caballero', 'manchita', 'fcaballero03@gmail.com'),
(9, 'Johana', 'Landaverde', 'pepito12', 'johalanda73@hotmail.com'),
(10, 'Paola', 'Guevara', 'pepito', 'pao182930@hotmail.com'),
(11, 'Jacob', 'Herrera', 'aaaaa', 'jacob112@clases.edu.sv'),
(12, 'Pancho', 'Wenceslao', 'panchito123', 'panchito123@hotmail.com'),
(13, 'Pedri \"Potter\"', 'Gonzales', 'nosequeponer', 'pedri16@fcb.com'),
(16, 'Mami', 'Mamá', 'mamita', 'mamassv@mom.com'),
(17, 'Jhon', 'Smith', '1234', 'john.smith@example.com'),
(24, 'Ingrid', 'Herrera', 'nose123', 'nosejaja@hotmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `admins_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
