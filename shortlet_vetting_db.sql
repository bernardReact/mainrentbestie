-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2025 at 11:06 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shortlet_vetting_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `activity_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action_type` varchar(50) DEFAULT NULL,
  `activity_details` varchar(255) DEFAULT NULL,
  `activity_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`activity_id`, `user_id`, `action_type`, `activity_details`, `activity_time`) VALUES
(1, 1, 'LOGIN', 'User logged into the dashboard', '2025-12-05 13:26:15'),
(2, 1, 'POST_ALERT', 'Reported John Doe for Damages', '2025-12-05 13:26:15'),
(3, 2, 'SEARCH_GUEST', 'Searched for phone number 09011112222', '2025-12-05 13:26:15'),
(4, 3, 'LOGIN', 'User logged in', '2025-12-05 13:26:15'),
(5, 3, 'POST_ALERT', 'Reported Sarah Connor for Payment fraud', '2025-12-05 13:26:15');

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

CREATE TABLE `alerts` (
  `alert_id` int(11) NOT NULL,
  `guest_name` varchar(100) NOT NULL,
  `guest_phone` varchar(15) DEFAULT NULL,
  `offense_type` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `reported_by_user_id` int(11) DEFAULT NULL,
  `report_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alerts`
--

INSERT INTO `alerts` (`alert_id`, `guest_name`, `guest_phone`, `offense_type`, `description`, `reported_by_user_id`, `report_date`) VALUES
(1, 'John Doe', '09011112222', 'Damages', 'Broke the 65 inch TCL TV screen.', 1, '2025-12-05 13:26:15'),
(2, 'Jane Smith', '07033334444', 'Theft', 'Stole the microwave and towels.', 2, '2025-12-05 13:26:15'),
(3, 'Mike Johnson', '08122223333', 'Noise', 'Held a party with 20 people in a 1-bed apartment.', 1, '2025-12-05 13:26:15'),
(4, 'Sarah Connor', '08099998888', 'Payment', 'Used a fake transfer receipt.', 3, '2025-12-05 13:26:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `agency_name` varchar(150) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `password_hash` varchar(235) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `agency_name`, `email`, `phone_number`, `created_at`, `password_hash`) VALUES
(1, 'Emeka Okafor', NULL, 'emeka@ph-rentals.com', '08012345678', '2025-12-05 13:26:15', ''),
(2, 'Chioma Adebayo', NULL, 'chioma@lagos-stays.com', '08087654321', '2025-12-05 13:26:15', ''),
(3, 'Tunde Bakare', NULL, 'tunde@abuja-shortlets.com', '08055555555', '2025-12-05 13:26:15', ''),
(4, 'Omosaiye Nehemiah Bukola', 'Lagos Homes', 'chibest@gmail.com', '09827738282', '2025-12-20 09:46:29', '$2b$10$tZBVNG2rospYmtqP/OlpYODFKB5sOOYRfdgMo/ALBSLiwdzLGEmCS'),
(5, 'Finbarrs Bernard', 'Lagos Homes', 'bighet@gmail.com', '09127738282', '2025-12-20 10:01:25', '$2b$10$3MaLe7V1Khbo5PANb4.JsOsRPCKX9cAsHQKUaN6eopsgBd/WH.vw6'),
(6, 'Isaac Bakare', 'Port Harcourt Homes', 'tasha@gmail.com', '08127738282', '2025-12-20 10:02:01', '$2b$10$Wi2p4DCRmlBGdLmDkjU1wu9C.C8xgewLGqxgrJDSfqap3kqOIq7Qa'),
(7, 'paul newman', 'Port Harcourt Homes', 'byyyet@gmail.com', '08023452188', '2025-12-20 10:02:39', '$2b$10$FIfHBlzIQOfw6LTAFl4o7OPXwGGca2QX3O.kazcKOnv8skSpeqECq'),
(8, 'lebron sawman', 'Ikeja Homes', 'lebrrront@gmail.com', '0813452188', '2025-12-20 10:03:33', '$2b$10$im8gRHykVBTqeTZqBQBLBeq9sGuUw/ETfQxCbHrazEaveZ0AV8AHe');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `alerts`
--
ALTER TABLE `alerts`
  ADD PRIMARY KEY (`alert_id`),
  ADD KEY `reported_by_user_id` (`reported_by_user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `alerts`
--
ALTER TABLE `alerts`
  MODIFY `alert_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `alerts`
--
ALTER TABLE `alerts`
  ADD CONSTRAINT `alerts_ibfk_1` FOREIGN KEY (`reported_by_user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
