-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2025 at 02:45 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ccit_alumni`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_ID` int(11) NOT NULL,
  `Admin_Email` varchar(255) NOT NULL,
  `Admin_Password` varchar(255) NOT NULL,
  `Admin_Username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alumni`
--

CREATE TABLE `alumni` (
  `Alumni_ID` int(11) NOT NULL,
  `Alumni_email` varchar(255) NOT NULL,
  `Alumni_Password` varchar(255) NOT NULL,
  `Alumni_name` varchar(255) NOT NULL,
  `Program_Course` varchar(255) NOT NULL,
  `GraduationYear` int(11) NOT NULL,
  `Educ_Level` varchar(255) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Contact_Number` varchar(11) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Citizenship` varchar(255) DEFAULT NULL,
  `Current_Company` varchar(255) DEFAULT NULL,
  `Activity_Percentage` varchar(255) DEFAULT NULL,
  `LinkedIn_Account` varchar(255) DEFAULT NULL,
  `Facebook_Account` varchar(255) DEFAULT NULL,
  `Instagram_Account` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `alumni`
--
DELIMITER $$
CREATE TRIGGER `before_alumni_insert` BEFORE INSERT ON `alumni` FOR EACH ROW BEGIN
    IF EXISTS (SELECT * FROM Alumni WHERE Alumni_email = NEW.Alumni_email) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email already exists';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `Chat_ID` int(11) NOT NULL,
  `Sender_ID` int(11) DEFAULT NULL,
  `Receiver_ID` int(11) DEFAULT NULL,
  `Message` text DEFAULT NULL,
  `DateSent` timestamp NOT NULL DEFAULT current_timestamp(),
  `Status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `educanswer`
--

CREATE TABLE `educanswer` (
  `EducationAnswer_ID` int(11) NOT NULL,
  `EducationQ_ID` int(11) DEFAULT NULL,
  `Alumni_ID` int(11) DEFAULT NULL,
  `EducationAnswer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `educquestion`
--

CREATE TABLE `educquestion` (
  `EducationQ_ID` int(11) NOT NULL,
  `EducationQ_Text` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employmentanswer`
--

CREATE TABLE `employmentanswer` (
  `EmploymentAnswer_ID` int(11) NOT NULL,
  `EmploymentQ_ID` int(11) DEFAULT NULL,
  `Alumni_ID` int(11) DEFAULT NULL,
  `EmploymentAnswer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employmentquestion`
--

CREATE TABLE `employmentquestion` (
  `EmploymentQ_ID` int(11) NOT NULL,
  `EmploymentQ_Text` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `Event_ID` int(11) NOT NULL,
  `EventName` varchar(255) NOT NULL,
  `EventDate` date NOT NULL,
  `EventLocation` varchar(255) DEFAULT NULL,
  `EventType` varchar(255) DEFAULT NULL,
  `EventOrganizer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `Feedback_ID` int(11) NOT NULL,
  `Alumni_ID` int(11) DEFAULT NULL,
  `Feedback_content` varchar(255) DEFAULT NULL,
  `Feedback_desc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `feedback`
--
DELIMITER $$
CREATE TRIGGER `after_feedback_insert` AFTER INSERT ON `feedback` FOR EACH ROW BEGIN
    INSERT INTO Notification (Notification_content, TargetGroup)
    VALUES (CONCAT('New Feedback Added by Alumni ID: ', NEW.Alumni_ID), 'Admin');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `Notification_ID` int(11) NOT NULL,
  `Notification_content` varchar(255) DEFAULT NULL,
  `Notification_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `TargetGroup` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nucoreanswer`
--

CREATE TABLE `nucoreanswer` (
  `NUCoreAnswer_ID` int(11) NOT NULL,
  `NUCoreQ_ID` int(11) DEFAULT NULL,
  `Alumni_ID` int(11) DEFAULT NULL,
  `NUCoreAnswer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nucorequestion`
--

CREATE TABLE `nucorequestion` (
  `NUCoreQ_ID` int(11) NOT NULL,
  `NUCoreQ_Text` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `Partner_ID` int(11) NOT NULL,
  `Partner_Name` varchar(255) NOT NULL,
  `Benefit_Discount` varchar(255) DEFAULT NULL,
  `Promo_Period` date DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_ID`);

--
-- Indexes for table `alumni`
--
ALTER TABLE `alumni`
  ADD PRIMARY KEY (`Alumni_ID`),
  ADD UNIQUE KEY `Alumni_email` (`Alumni_email`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`Chat_ID`),
  ADD KEY `Sender_ID` (`Sender_ID`),
  ADD KEY `Receiver_ID` (`Receiver_ID`);

--
-- Indexes for table `educanswer`
--
ALTER TABLE `educanswer`
  ADD PRIMARY KEY (`EducationAnswer_ID`),
  ADD KEY `EducationQ_ID` (`EducationQ_ID`),
  ADD KEY `Alumni_ID` (`Alumni_ID`);

--
-- Indexes for table `educquestion`
--
ALTER TABLE `educquestion`
  ADD PRIMARY KEY (`EducationQ_ID`);

--
-- Indexes for table `employmentanswer`
--
ALTER TABLE `employmentanswer`
  ADD PRIMARY KEY (`EmploymentAnswer_ID`),
  ADD KEY `EmploymentQ_ID` (`EmploymentQ_ID`),
  ADD KEY `Alumni_ID` (`Alumni_ID`);

--
-- Indexes for table `employmentquestion`
--
ALTER TABLE `employmentquestion`
  ADD PRIMARY KEY (`EmploymentQ_ID`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`Event_ID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`Feedback_ID`),
  ADD KEY `Alumni_ID` (`Alumni_ID`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`Notification_ID`);

--
-- Indexes for table `nucoreanswer`
--
ALTER TABLE `nucoreanswer`
  ADD PRIMARY KEY (`NUCoreAnswer_ID`),
  ADD KEY `NUCoreQ_ID` (`NUCoreQ_ID`),
  ADD KEY `Alumni_ID` (`Alumni_ID`);

--
-- Indexes for table `nucorequestion`
--
ALTER TABLE `nucorequestion`
  ADD PRIMARY KEY (`NUCoreQ_ID`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`Partner_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Admin_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alumni`
--
ALTER TABLE `alumni`
  MODIFY `Alumni_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `Chat_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `educanswer`
--
ALTER TABLE `educanswer`
  MODIFY `EducationAnswer_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `educquestion`
--
ALTER TABLE `educquestion`
  MODIFY `EducationQ_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employmentanswer`
--
ALTER TABLE `employmentanswer`
  MODIFY `EmploymentAnswer_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employmentquestion`
--
ALTER TABLE `employmentquestion`
  MODIFY `EmploymentQ_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `Event_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `Feedback_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `Notification_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nucoreanswer`
--
ALTER TABLE `nucoreanswer`
  MODIFY `NUCoreAnswer_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nucorequestion`
--
ALTER TABLE `nucorequestion`
  MODIFY `NUCoreQ_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `Partner_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`Sender_ID`) REFERENCES `alumni` (`Alumni_ID`),
  ADD CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`Receiver_ID`) REFERENCES `alumni` (`Alumni_ID`);

--
-- Constraints for table `educanswer`
--
ALTER TABLE `educanswer`
  ADD CONSTRAINT `educanswer_ibfk_1` FOREIGN KEY (`EducationQ_ID`) REFERENCES `educquestion` (`EducationQ_ID`),
  ADD CONSTRAINT `educanswer_ibfk_2` FOREIGN KEY (`Alumni_ID`) REFERENCES `alumni` (`Alumni_ID`);

--
-- Constraints for table `employmentanswer`
--
ALTER TABLE `employmentanswer`
  ADD CONSTRAINT `employmentanswer_ibfk_1` FOREIGN KEY (`EmploymentQ_ID`) REFERENCES `employmentquestion` (`EmploymentQ_ID`),
  ADD CONSTRAINT `employmentanswer_ibfk_2` FOREIGN KEY (`Alumni_ID`) REFERENCES `alumni` (`Alumni_ID`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`Alumni_ID`) REFERENCES `alumni` (`Alumni_ID`);

--
-- Constraints for table `nucoreanswer`
--
ALTER TABLE `nucoreanswer`
  ADD CONSTRAINT `nucoreanswer_ibfk_1` FOREIGN KEY (`NUCoreQ_ID`) REFERENCES `nucorequestion` (`NUCoreQ_ID`),
  ADD CONSTRAINT `nucoreanswer_ibfk_2` FOREIGN KEY (`Alumni_ID`) REFERENCES `alumni` (`Alumni_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
