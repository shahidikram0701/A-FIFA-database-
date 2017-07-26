-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2017 at 07:49 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fifadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `club`
--

CREATE TABLE `club` (
  `Id` varchar(40) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Established_year` year(4) NOT NULL,
  `Initials` varchar(5) NOT NULL,
  `No_of_championships` int(11) NOT NULL,
  `Revenue` int(11) NOT NULL,
  `Director` varchar(40) NOT NULL,
  `Manager_id` varchar(40) NOT NULL,
  `Country_id` varchar(40) NOT NULL,
  `Account_id` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `club`
--

INSERT INTO `club` (`Id`, `Name`, `Established_year`, `Initials`, `No_of_championships`, `Revenue`, `Director`, `Manager_id`, `Country_id`, `Account_id`) VALUES
('CL01', 'Real Madrid CF', 1902, 'REA', 81, 575, 'Florentino Perez', 'MN01', 'CY01', 'AC01'),
('CL02', 'FC Bayern Munich', 1909, 'BMU', 66, 474, 'Karl-Heinz Rummenigge', 'MN02', 'CY05', 'AC02'),
('CL03', 'Juventus', 1903, 'JV', 72, 500, 'C03', 'MN03', 'CY10', 'AC03'),
('CL04', 'Inter', 1904, 'IM', 65, 480, 'C04', 'MN04', 'CY07', 'AC04'),
('CL05', 'Barcelona', 1920, 'BAR', 71, 600, 'C05', 'MN05', 'CY08', 'AC05'),
('CL06', 'Borussia Dortmund', 1902, 'BOR', 73, 480, 'C06', 'MN06', 'CY09', 'AC06'),
('CL07', 'Manchester United', 0000, 'MUN', 78, 590, 'C07', 'MN07', 'CY27', 'AC07'),
('CL08', 'Athletico Madrid', 1903, 'ATM', 62, 578, 'C08', 'MN08', 'CY01', 'AC08');

-- --------------------------------------------------------

--
-- Table structure for table `club_captains`
--

CREATE TABLE `club_captains` (
  `Club_id` varchar(40) NOT NULL,
  `Captain_id` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `club_captains`
--

INSERT INTO `club_captains` (`Club_id`, `Captain_id`) VALUES
('CL01', 'PL01'),
('CL02', 'PL21'),
('CL03', 'PL25'),
('CL04', 'PL42'),
('CL05', 'PL57'),
('CL07', 'PL80'),
('CL08', 'PL97');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `Country_id` varchar(40) NOT NULL,
  `Name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`Country_id`, `Name`) VALUES
('CY01', 'Spain'),
('CY02', 'Costa Rica'),
('CY03', 'Portugal'),
('CY04', 'France'),
('CY05', 'Germany'),
('CY06', 'Colombia'),
('CY07', 'Wales'),
('CY08', 'Brazil'),
('CY09', 'Poland'),
('CY10', 'Netherlands'),
('CY11', 'Austria'),
('CY12', 'Italy'),
('CY13', 'Morocco'),
('CY14', 'Bosnia'),
('CY15', 'Colombia'),
('CY16', 'Argentina'),
('CY18', 'Croatia'),
('CY19', 'Slovenia'),
('CY20', 'Chile'),
('CY21', 'Australia'),
('CY22', 'Turkey'),
('CY23', 'Uruguay'),
('CY24', 'Sweden'),
('CY25', 'Gabon'),
('CY26', 'Ivory Coast'),
('CY27', 'England'),
('CY28', 'Belgium');

-- --------------------------------------------------------

--
-- Table structure for table `finance`
--

CREATE TABLE `finance` (
  `Account_id` varchar(40) NOT NULL,
  `Leisure` int(11) NOT NULL,
  `Profit` int(11) NOT NULL,
  `Revenue` int(11) NOT NULL,
  `Player_expenses` int(11) NOT NULL,
  `Travel_expenses` int(11) NOT NULL,
  `Medical_expenses` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `finance`
--

INSERT INTO `finance` (`Account_id`, `Leisure`, `Profit`, `Revenue`, `Player_expenses`, `Travel_expenses`, `Medical_expenses`) VALUES
('AC01', 51, 200, 575, 300, 20, 4),
('AC02', 18, 150, 474, 270, 30, 6),
('AC03', 42, 170, 500, 280, 25, 5),
('AC04', 44, 175, 520, 290, 27, 4),
('AC05', 43, 177, 530, 282, 28, 5),
('AC06', 47, 193, 542, 295, 22, 3),
('AC07', 53, 189, 546, 208, 29, 6),
('AC08', 56, 178, 572, 211, 34, 2);

-- --------------------------------------------------------

--
-- Table structure for table `league`
--

CREATE TABLE `league` (
  `Id` varchar(40) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Total_matches` int(11) NOT NULL,
  `Prize_money` int(11) NOT NULL,
  `Previous_winner_id` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `league`
--

INSERT INTO `league` (`Id`, `Name`, `Total_matches`, `Prize_money`, `Previous_winner_id`) VALUES
('LG01', 'LA LIGA', 55, 100, 'CL02'),
('LG02', 'BUNDESLIGA', 62, 110, 'CL01'),
('LG03', 'CHAMPIONS LEAGUE', 54, 90, 'CL04');

-- --------------------------------------------------------

--
-- Table structure for table `league_participation`
--

CREATE TABLE `league_participation` (
  `Club_id` varchar(40) NOT NULL,
  `League_id` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `league_participation`
--

INSERT INTO `league_participation` (`Club_id`, `League_id`) VALUES
('CL01', 'LG01'),
('CL01', 'LG02'),
('CL02', 'LG01'),
('CL02', 'LG02'),
('CL03', 'LG03'),
('CL06', 'LG02'),
('CL07', 'LG01'),
('CL07', 'LG02'),
('CL08', 'LG01');

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `Id` varchar(40) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Age` int(11) NOT NULL,
  `Country` varchar(40) NOT NULL,
  `Availability_status` tinyint(1) NOT NULL,
  `Contact` int(11) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Income` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`Id`, `Name`, `Age`, `Country`, `Availability_status`, `Contact`, `Email`, `Income`) VALUES
('MN01', 'Zinedine Zidane', 44, 'France', 0, 123456789, 'ab.in', 50),
('MN02', 'Carlo Ancelotti', 57, 'Italy', 0, 987654321, 'bc.in', 46),
('MN03', 'Massimiliano Allegri', 49, 'Italy', 0, 560000000, 'cd.i', 74),
('MN04', 'Stefano Pioli', 52, 'Italy', 0, 560000000, 'ef.h', 65),
('MN05', 'Luis Enrique', 47, 'Spain', 0, 570000000, 'gh.k', 86),
('MN06', 'Thomas Tuchel', 53, 'Germany', 0, 580000000, 'kh.o', 56),
('MN07', 'Jose Mourinho', 55, 'Portugal', 0, 620000000, 'jh.o', 56),
('MN08', 'Diego Simeone', 46, 'Argentina', 0, 550000000, 'kg.p', 48);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `Id` varchar(40) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Club_id` varchar(40) NOT NULL,
  `Position` varchar(4) NOT NULL,
  `Country` varchar(40) NOT NULL,
  `Worth` int(11) NOT NULL,
  `Age` int(11) NOT NULL,
  `Rating` int(11) NOT NULL,
  `Career_goals` int(11) NOT NULL,
  `Jersey_no` int(11) NOT NULL,
  `Availability` tinyint(1) NOT NULL,
  `Injury` tinyint(1) NOT NULL,
  `Retired_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`Id`, `Name`, `Club_id`, `Position`, `Country`, `Worth`, `Age`, `Rating`, `Career_goals`, `Jersey_no`, `Availability`, `Injury`, `Retired_status`) VALUES
('PL01', 'Sergio Ramos', 'CL01', 'DF', 'CY01', 44, 30, 89, 63, 4, 0, 0, 0),
('PL02', 'Keylor Navas', 'CL01', 'GK', 'CY02', 29, 29, 85, 0, 1, 0, 0, 0),
('PL03', 'Dani Carvajal', 'CL01', 'DF', 'CY01', 31, 24, 84, 7, 2, 0, 0, 0),
('PL04', 'Pepe', 'CL01', 'DF', 'CY03', 24, 33, 88, 26, 3, 0, 0, 0),
('PL05', 'Raphael Varane', 'CL01', 'DF', 'CY04', 35, 23, 84, 10, 5, 0, 0, 0),
('PL06', 'Nacho', 'CL01', 'DF', 'CY01', 14, 26, 80, 8, 6, 0, 0, 0),
('PL07', 'Cristiano Ronaldo', 'CL01', 'FW', 'CY03', 87, 31, 94, 452, 7, 0, 0, 0),
('PL08', 'Toni Kroos', 'CL01', 'MF', 'CY05', 60, 26, 88, 65, 8, 0, 0, 0),
('PL09', 'Karim Benzema', 'CL01', 'FW', 'CY04', 40, 28, 86, 224, 9, 0, 0, 0),
('PL10', 'James Rodriguez', 'CL01', 'MF', 'CY06', 61, 24, 87, 95, 10, 0, 0, 0),
('PL11', 'Gareth Bale', 'CL01', 'FW', 'CY07', 72, 26, 90, 131, 11, 0, 0, 0),
('PL12', 'Marcelo', 'CL01', 'DF', 'CY08', 30, 28, 86, 32, 12, 0, 0, 0),
('PL13', 'Manuel Neuer', 'CL02', 'GK', 'CY05', 70, 30, 92, 0, 1, 0, 0, 0),
('PL14', 'Mats Hummels', 'CL02', 'DF', 'CY05', 43, 27, 88, 35, 5, 0, 0, 0),
('PL15', 'Thiago Alacantara', 'CL02', 'MF', 'CY01', 46, 25, 86, 33, 6, 0, 0, 0),
('PL16', 'Franck Ribery', 'CL02', 'MF', 'CY04', 24, 33, 86, 113, 7, 0, 0, 0),
('PL17', 'Javi Martinez', 'CL02', 'MF', 'CY01', 31, 27, 85, 32, 8, 0, 0, 0),
('PL18', 'Robert Lewandowski', 'CL02', 'FW', 'CY09', 71, 27, 90, 251, 9, 0, 0, 0),
('PL19', 'Arjen Robben', 'CL02', 'MF', 'CY10', 34, 32, 87, 176, 10, 0, 0, 0),
('PL20', 'Douglas Costa', 'CL02', 'MF', 'CY08', 33, 25, 84, 46, 11, 0, 0, 0),
('PL21', 'Philipp Lahm', 'CL02', 'DF', 'CY05', 30, 32, 88, 23, 21, 0, 0, 0),
('PL22', 'Xabi Alonso', 'CL02', 'MF', 'CY01', 6, 34, 82, 51, 14, 0, 0, 0),
('PL23', 'David Alaba', 'CL02', 'DF', 'CY11', 42, 24, 86, 32, 27, 0, 0, 0),
('PL24', 'Thomas Muller', 'CL02', 'FW', 'CY05', 46, 26, 86, 147, 25, 0, 0, 0),
('PL25', 'Gianluigi Buffon', 'CL03', 'GK', 'CY12', 9, 38, 88, 47, 1, 0, 0, 0),
('PL26', 'Giorgio Chiellini', 'CL03', 'DF', 'CY12', 34, 31, 88, 53, 3, 0, 0, 0),
('PL27', 'Medhi Benatia', 'CL03', 'DF', 'CY13', 22, 29, 84, 37, 4, 0, 0, 0),
('PL28', 'Miralem Pjanic', 'CL03', 'MF', 'CY14', 39, 26, 85, 34, 5, 0, 0, 0),
('PL29', 'Sami Khedira', 'CL03', 'MF', 'CY05', 27, 29, 84, 29, 6, 0, 0, 0),
('PL30', 'Juan Cuadrado', 'CL03', 'MF', 'CY15', 23, 28, 83, 88, 7, 0, 0, 0),
('PL31', 'Claudio Marchisio', 'CL03', 'MF', 'CY12', 35, 30, 86, 65, 8, 0, 0, 0),
('PL32', 'Gonzalo Higuaín', 'CL03', 'FW', 'CY16', 62, 28, 89, 69, 9, 0, 0, 0),
('PL33', 'Alex Sandro', 'CL03', 'DF', 'CY08', 30, 25, 84, 23, 12, 0, 0, 0),
('PL34', 'Federico Mattiello', 'CL03', 'MF', 'CY12', 2, 20, 70, 21, 14, 0, 0, 0),
('PL35', 'Andrea Barzagli', 'CL03', 'DF', 'CY12', 7, 35, 86, 77, 15, 0, 0, 0),
('PL36', 'Mario Mandzukic', 'CL03', 'FW', 'CY18', 22, 30, 83, 63, 17, 0, 0, 0),
('PL39', 'Samir Handanovic', 'CL04', 'GK', 'CY19', 36, 31, 87, 62, 1, 0, 0, 0),
('PL40', 'Marco Andreolli', 'CL04', 'DF', 'CY12', 5, 30, 77, 55, 2, 0, 0, 0),
('PL41', 'Roberto Gagliardini?', 'CL04', 'MF', 'CY12', 10, 22, 77, 59, 5, 0, 0, 0),
('PL42', 'Joao Mario', 'CL04', 'MF', 'CY03', 31, 23, 83, 60, 6, 0, 0, 0),
('PL43', 'Geoffrey Kondogbia', 'CL04', 'MF', 'CY04', 6, 23, 76, 50, 7, 0, 0, 0),
('PL44', 'Rodrigo Palacio', 'CL04', 'FW', 'CY16', 5, 34, 78, 52, 8, 0, 0, 0),
('PL45', 'Mauro Icardi', 'CL04', 'FW', 'CY16', 40, 23, 84, 53, 9, 0, 0, 0),
('PL46', 'Jonathan Biabiany', 'CL04', 'FW', 'CY04', 5, 28, 76, 99, 11, 0, 0, 0),
('PL47', 'Cristian Ansaldi', 'CL04', 'DF', 'CY16', 11, 29, 80, 12, 15, 0, 0, 0),
('PL48', 'Gary Medel', 'CL04', 'DF', 'CY20', 16, 28, 82, 5, 17, 0, 0, 0),
('PL49', 'Ever Banega', 'CL04', 'MF', 'CY16', 29, 28, 84, 77, 19, 0, 0, 0),
('PL50', 'Trent Sainsbury', 'CL04', 'DF', 'CY21', 4, 24, 74, 79, 20, 0, 0, 0),
('PL51', 'Stegen', 'CL05', 'GK', 'CY05', 27, 24, 83, 81, 1, 0, 0, 0),
('PL52', 'Gerard Pique', 'CL05', 'DF', 'CY01', 34, 29, 87, 85, 3, 0, 0, 0),
('PL53', 'Ivan Rakitic', 'CL05', 'MF', 'CY18', 44, 28, 87, 33, 4, 0, 0, 0),
('PL54', 'Sergio Busquets', 'CL05', 'MF', 'CY01', 36, 27, 86, 35, 5, 0, 0, 0),
('PL55', 'Denis Suarez', 'CL05', 'MF', 'CY01', 20, 22, 80, 65, 6, 0, 0, 0),
('PL56', 'Arda Turan', 'CL05', 'MF', 'CY22', 27, 29, 84, 45, 7, 0, 0, 0),
('PL57', 'Andres Iniesta', 'CL05', 'MF', 'CY01', 40, 32, 88, 47, 8, 0, 0, 0),
('PL58', 'Luis Suarez', 'CL05', 'FW', 'CY23', 83, 29, 92, 49, 9, 0, 0, 0),
('PL59', 'Lionel Messi', 'CL05', 'FW', 'CY16', 89, 29, 93, 44, 10, 0, 0, 0),
('PL60', 'Neymar', 'CL05', 'FW', 'CY08', 106, 24, 92, 39, 11, 0, 0, 0),
('PL61', 'Rafinha', 'CL05', 'MF', 'CY08', 19, 23, 80, 52, 12, 0, 0, 0),
('PL62', 'Roman Weidenfeller', 'CL06', 'GK', 'CY05', 4, 35, 77, 57, 1, 0, 0, 0),
('PL63', 'Marc Bartra', 'CL06', 'DF', 'CY01', 17, 25, 81, 59, 5, 0, 0, 0),
('PL64', 'Sven Bender', 'CL06', 'MF', 'CY05', 16, 27, 81, 62, 6, 0, 0, 0),
('PL65', 'Ousmane Dembele', 'CL06', 'MF', 'CY04', 24, 19, 81, 63, 7, 0, 0, 0),
('PL66', 'Nuri Nahin', 'CL06', 'MF', 'CY22', 7, 27, 78, 71, 8, 0, 0, 0),
('PL67', 'Emre Mor', 'CL06', 'MF', 'CY22', 3, 18, 70, 77, 9, 0, 0, 0),
('PL68', 'Mario Gotze', 'CL06', 'MF', 'CY05', 27, 24, 82, 81, 10, 0, 0, 0),
('PL69', 'Marco Reus', 'CL06', 'FW', 'CY05', 52, 27, 88, 72, 11, 0, 0, 0),
('PL70', 'Alexander Isak', 'CL06', 'FW', 'CY24', 1, 16, 67, 82, 14, 0, 0, 0),
('PL71', 'Pierre', 'CL06', 'FW', 'CY25', 52, 27, 88, 99, 17, 0, 0, 0),
('PL72', 'Marcel Schmelzer', 'CL06', 'DF', 'CY05', 11, 28, 80, 20, 29, 0, 0, 0),
('PL73', 'David de Gea', 'CL07', 'GK', 'CY01', 69, 25, 90, 15, 1, 0, 0, 0),
('PL74', 'Eric Bailly', 'CL07', 'DF', 'CY26', 29, 22, 83, 27, 3, 0, 0, 0),
('PL75', 'Phil Jones', 'CL07', 'DF', 'CY27', 16, 24, 80, 43, 4, 0, 0, 0),
('PL76', 'Marcos Rojo', 'CL07', 'DF', 'CY16', 23, 26, 83, 36, 5, 0, 0, 0),
('PL77', 'Paul Pogba', 'CL07', 'MF', 'CY04', 72, 23, 88, 63, 6, 0, 0, 0),
('PL78', 'Juan Mata', 'CL07', 'MF', 'CY01', 33, 28, 85, 96, 8, 0, 0, 0),
('PL79', 'Zlatan Ibrahimovic', 'CL07', 'FW', 'CY24', 37, 34, 90, 26, 9, 0, 0, 0),
('PL80', 'Wayne Rooney', 'CL07', 'FW', 'CY27', 22, 30, 83, 37, 10, 0, 0, 0),
('PL81', 'Anthony Martial', 'CL07', 'FW', 'CY04', 29, 20, 82, 35, 11, 0, 0, 0),
('PL82', 'Chris Smalling', 'CL07', 'DF', 'CY27', 23, 26, 83, 19, 12, 0, 0, 0),
('PL83', 'Jesse Lingard', 'CL07', 'MF', 'CY27', 11, 23, 78, 33, 14, 0, 0, 0),
('PL84', 'Michael Carrick', 'CL07', 'MF', 'CY27', 6, 34, 82, 26, 16, 0, 0, 0),
('PL85', 'Daley Blind', 'CL07', 'DF', 'CY10', 17, 26, 81, 25, 17, 0, 0, 0),
('PL86', 'Miguel Angel Moya', 'CL08', 'GK', 'CY01', 13, 32, 81, 29, 1, 0, 0, 0),
('PL87', 'Diego Godin', 'CL08', 'DF', 'CY23', 38, 30, 88, 30, 2, 0, 0, 0),
('PL88', 'Filipe Luis', 'CL08', 'DF', 'CY08', 24, 30, 85, 26, 3, 0, 0, 0),
('PL89', 'Tiago', 'CL08', 'MF', 'CY03', 6, 35, 81, 16, 5, 0, 0, 0),
('PL90', 'Koke', 'CL08', 'MF', 'CY01', 37, 24, 84, 15, 6, 0, 0, 0),
('PL91', 'Antoine Griezmann', 'CL08', 'FW', 'CY04', 67, 25, 88, 17, 7, 0, 0, 0),
('PL92', 'Saul Niguez', 'CL08', 'MF', 'CY01', 21, 21, 80, 15, 8, 0, 0, 0),
('PL93', 'Fernando Torres', 'CL08', 'FW', 'CY01', 14, 32, 81, 78, 9, 0, 0, 0),
('PL94', 'Yannick Carrasco', 'CL08', 'MF', 'CY28', 37, 22, 84, 96, 10, 0, 0, 0),
('PL95', 'Angel Correa', 'CL08', 'FW', 'CY16', 16, 21, 79, 85, 11, 0, 0, 0),
('PL96', 'Augusto Fernandez', 'CL08', 'MF', 'CY16', 15, 30, 81, 45, 12, 0, 0, 0),
('PL97', 'Gabi', 'CL08', 'MF', 'CY01', 15, 32, 82, 78, 14, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `Result_id` varchar(40) NOT NULL,
  `Man_of_the_match_id` varchar(40) NOT NULL,
  `Goals_team1` int(11) NOT NULL,
  `Goals_team2` int(11) NOT NULL,
  `Corners_team1` int(11) NOT NULL,
  `Corners_team2` int(11) NOT NULL,
  `Possession_team1` int(11) NOT NULL,
  `Possession_team2` int(11) NOT NULL,
  `Freekicks_team1` int(11) NOT NULL,
  `Freekicks_team2` int(11) NOT NULL,
  `YellowCards_team1` int(11) NOT NULL,
  `YellowCards_team2` int(11) NOT NULL,
  `RedCards_team1` int(11) NOT NULL,
  `RedCards_team2` int(11) NOT NULL,
  `Shots_on_target_team1` int(11) NOT NULL,
  `Shots_on_target_team2` int(11) NOT NULL,
  `Saves_team1` int(11) NOT NULL,
  `Saves_team2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`Result_id`, `Man_of_the_match_id`, `Goals_team1`, `Goals_team2`, `Corners_team1`, `Corners_team2`, `Possession_team1`, `Possession_team2`, `Freekicks_team1`, `Freekicks_team2`, `YellowCards_team1`, `YellowCards_team2`, `RedCards_team1`, `RedCards_team2`, `Shots_on_target_team1`, `Shots_on_target_team2`, `Saves_team1`, `Saves_team2`) VALUES
('MH01', 'PL11', 4, 3, 6, 9, 64, 36, 9, 7, 4, 6, 1, 0, 5, 8, 1, 5),
('MH02', 'PL24', 6, 8, 5, 9, 34, 66, 11, 12, 2, 7, 4, 2, 6, 4, 0, 3),
('MH03', 'PL45', 8, 2, 2, 3, 24, 56, 12, 11, 3, 8, 5, 3, 8, 3, 2, 2),
('MH04', 'PL56', 3, 1, 9, 5, 38, 52, 8, 10, 1, 4, 3, 5, 6, 2, 1, 4),
('MH05', 'PL70', 5, 7, 7, 7, 32, 54, 4, 11, 2, 3, 6, 1, 9, 5, 0, 3),
('MH06', 'PL06', 4, 6, 6, 8, 28, 57, 6, 5, 4, 5, 7, 7, 4, 7, 1, 1),
('MH07', 'PL75', 3, 4, 3, 6, 78, 32, 4, 6, 2, 3, 1, 0, 7, 9, 5, 6),
('MH08', 'PL92', 5, 1, 2, 6, 67, 43, 8, 2, 2, 5, 7, 9, 6, 8, 2, 7),
('MH09', 'PL55', 2, 6, 3, 8, 45, 55, 4, 7, 3, 0, 4, 7, 2, 4, 9, 8),
('MH10', 'PL27', 3, 1, 5, 3, 56, 43, 3, 9, 2, 8, 0, 4, 7, 11, 14, 12);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `Match_id` varchar(40) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Team1` varchar(40) NOT NULL,
  `Team2` varchar(40) NOT NULL,
  `League_id` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`Match_id`, `Date`, `Time`, `Team1`, `Team2`, `League_id`) VALUES
('MH01', '2017-07-15', '02:00:00', 'CL01', 'CL02', 'LG01'),
('MH02', '2017-07-17', '05:00:00', 'CL02', 'CL01', 'LG02'),
('MH03', '2017-07-15', '08:00:00', 'CL03', 'CL04', 'LG02'),
('MH04', '2017-07-05', '11:00:00', 'CL04', 'CL05', 'LG03'),
('MH05', '2017-07-05', '14:00:00', 'CL02', 'CL06', 'LG01'),
('MH06', '2017-07-05', '17:00:00', 'CL06', 'CL01', 'LG02'),
('MH07', '2016-06-02', '11:25:00', 'CL07', 'CL08', 'LG01'),
('MH08', '2016-06-05', '15:30:00', 'CL06', 'CL07', 'LG02'),
('MH09', '2016-06-11', '06:00:00', 'CL03', 'CL05', 'LG03'),
('MH10', '2016-06-14', '08:00:00', 'CL01', 'CL02', 'LG01');

-- --------------------------------------------------------

--
-- Table structure for table `scouts`
--

CREATE TABLE `scouts` (
  `Id` varchar(40) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Country_id` varchar(40) NOT NULL,
  `Players_recruited` int(11) NOT NULL,
  `Success_rate` int(11) NOT NULL,
  `Shares` int(11) NOT NULL,
  `Club_id` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scouts`
--

INSERT INTO `scouts` (`Id`, `Name`, `Country_id`, `Players_recruited`, `Success_rate`, `Shares`, `Club_id`) VALUES
('SC01', 'Roy', 'CY01', 25, 75, 60, 'CL01'),
('SC02', 'Shahid', 'CY02', 36, 64, 55, 'CL02'),
('SC03', 'Nishant', 'CY03', 43, 86, 54, 'CL02'),
('SC04', 'Sourabh Raja', 'CY04', 23, 56, 45, 'CL03'),
('SC05', 'Srikar ', 'CY15', 56, 72, 56, 'CL04'),
('SC06', 'Sumanth', 'CY10', 24, 45, 77, 'CL05'),
('SC08', 'Srinivas', 'CY09', 47, 78, 71, 'CL04'),
('SC09', 'Shikhar Gupta', 'CY23', 12, 78, 56, 'CL06'),
('SC10', 'Anuj', 'CY21', 36, 56, 78, 'CL08'),
('SC11', 'Sraman', 'CY18', 67, 34, 45, 'CL07');

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `Player_id` varchar(40) NOT NULL,
  `Club_from` varchar(40) NOT NULL,
  `Club_to` varchar(40) NOT NULL,
  `Transfer_fee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `transfers`
--
DELIMITER $$
CREATE TRIGGER `updatePlayer` AFTER INSERT ON `transfers` FOR EACH ROW UPDATE 	players
SET		players.Club_id = NEW.Club_to
WHERE	players.Id = NEW.Player_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Name` varchar(40) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Password` varchar(40) NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `Age` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Name`, `Email`, `Password`, `Gender`, `Age`) VALUES
('XYZ', '2ad43dc1@opayq.com', 'oKX.59YpYR', 'F', 15),
('Nishant', '3975bea5@opayq.com', 'iamthebest', 'M', 19),
('Sri', 'bb49c187@opayq.com', '1234', 'M', 21),
('Batman', 'iambatman@gmail.com', 'iambatman', 'M', 28),
('Superman', 'iamsuperman@gmail.com', 'hope', 'M', 30),
('Shahid Ikram', 'shahidikram0701@gmail.com', 'irock', 'M', 19);

-- --------------------------------------------------------

--
-- Table structure for table `youth_academy`
--

CREATE TABLE `youth_academy` (
  `Id` varchar(40) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Potential` int(11) NOT NULL,
  `Position` varchar(4) NOT NULL,
  `Worth` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `youth_academy`
--

INSERT INTO `youth_academy` (`Id`, `Name`, `Potential`, `Position`, `Worth`) VALUES
('PL501', 'Eddie', 84, 'DF', 13),
('PL502', 'Jon Digg', 78, 'CB', 25),
('PL503', 'Stephen', 88, 'FW', 34),
('PL504', 'Sheldon', 90, 'MF', 44),
('PL505', 'Richard', 82, 'DF', 16),
('PL506', 'Gilfoyl', 79, 'GK', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Manager_id` (`Manager_id`),
  ADD KEY `Country_id` (`Country_id`),
  ADD KEY `Account_id` (`Account_id`);

--
-- Indexes for table `club_captains`
--
ALTER TABLE `club_captains`
  ADD PRIMARY KEY (`Club_id`),
  ADD KEY `Captain_id` (`Captain_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`Country_id`);

--
-- Indexes for table `finance`
--
ALTER TABLE `finance`
  ADD PRIMARY KEY (`Account_id`);

--
-- Indexes for table `league`
--
ALTER TABLE `league`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Previous_winner_id` (`Previous_winner_id`);

--
-- Indexes for table `league_participation`
--
ALTER TABLE `league_participation`
  ADD PRIMARY KEY (`Club_id`,`League_id`),
  ADD KEY `League_id` (`League_id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Club_id` (`Club_id`),
  ADD KEY `Country` (`Country`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`Result_id`),
  ADD KEY `Man_of_the_match_id` (`Man_of_the_match_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`Match_id`),
  ADD KEY `Team1` (`Team1`),
  ADD KEY `Team2` (`Team2`),
  ADD KEY `League_id` (`League_id`);

--
-- Indexes for table `scouts`
--
ALTER TABLE `scouts`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Country_id` (`Country_id`),
  ADD KEY `scouts_ibfk_2` (`Club_id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`Player_id`,`Club_from`,`Club_to`),
  ADD KEY `Club_from` (`Club_from`),
  ADD KEY `Club_to` (`Club_to`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Email`,`Password`);

--
-- Indexes for table `youth_academy`
--
ALTER TABLE `youth_academy`
  ADD PRIMARY KEY (`Id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `club`
--
ALTER TABLE `club`
  ADD CONSTRAINT `club_ibfk_2` FOREIGN KEY (`Manager_id`) REFERENCES `manager` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `club_ibfk_3` FOREIGN KEY (`Country_id`) REFERENCES `country` (`Country_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `club_ibfk_4` FOREIGN KEY (`Account_id`) REFERENCES `finance` (`Account_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `club_captains`
--
ALTER TABLE `club_captains`
  ADD CONSTRAINT `club_captains_ibfk_1` FOREIGN KEY (`Club_id`) REFERENCES `club` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `club_captains_ibfk_2` FOREIGN KEY (`Captain_id`) REFERENCES `players` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `league`
--
ALTER TABLE `league`
  ADD CONSTRAINT `league_ibfk_1` FOREIGN KEY (`Previous_winner_id`) REFERENCES `club` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `league_participation`
--
ALTER TABLE `league_participation`
  ADD CONSTRAINT `league_participation_ibfk_1` FOREIGN KEY (`Club_id`) REFERENCES `club` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `league_participation_ibfk_2` FOREIGN KEY (`League_id`) REFERENCES `league` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`Club_id`) REFERENCES `club` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `players_ibfk_2` FOREIGN KEY (`Country`) REFERENCES `country` (`Country_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`Result_id`) REFERENCES `schedule` (`Match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `result_ibfk_2` FOREIGN KEY (`Man_of_the_match_id`) REFERENCES `players` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`Team1`) REFERENCES `club` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`Team2`) REFERENCES `club` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`League_id`) REFERENCES `league` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `scouts`
--
ALTER TABLE `scouts`
  ADD CONSTRAINT `scouts_ibfk_1` FOREIGN KEY (`Country_id`) REFERENCES `country` (`Country_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `scouts_ibfk_2` FOREIGN KEY (`Club_id`) REFERENCES `club` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `transfers_ibfk_1` FOREIGN KEY (`Player_id`) REFERENCES `players` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transfers_ibfk_2` FOREIGN KEY (`Club_from`) REFERENCES `club` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transfers_ibfk_3` FOREIGN KEY (`Club_to`) REFERENCES `club` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
