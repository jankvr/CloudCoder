-- phpMyAdmin SQL Dump
-- version 3.4.5deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 17, 2012 at 04:58 PM
-- Server version: 5.1.58
-- PHP Version: 5.3.6-13ubuntu3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cloudcoder`
--

-- --------------------------------------------------------

--
-- Table structure for table `affect_events`
--

CREATE TABLE IF NOT EXISTS `affect_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `emotion` tinyint(4) NOT NULL,
  `other_emotion` varchar(40) DEFAULT NULL,
  `emotion_level` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `changes`
--

CREATE TABLE IF NOT EXISTS `changes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `start_row` mediumint(9) NOT NULL,
  `end_row` mediumint(9) NOT NULL,
  `start_col` mediumint(9) NOT NULL,
  `end_col` mediumint(9) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=423 ;

--
-- Dumping data for table `changes`
--

INSERT INTO `changes` (`id`, `event_id`, `type`, `start_row`, `end_row`, `start_col`, `end_col`, `text`) VALUES
(1, 39, 0, 0, 0, 0, 1, 'p'),
(2, 40, 0, 0, 0, 1, 2, 'u'),
(3, 41, 0, 0, 0, 2, 3, 'b'),
(4, 42, 0, 0, 0, 3, 4, 'l'),
(5, 43, 0, 0, 0, 4, 5, 'i'),
(6, 44, 0, 0, 0, 5, 6, 'c'),
(7, 45, 0, 0, 0, 6, 7, ' '),
(8, 46, 0, 0, 0, 7, 8, 'c'),
(9, 47, 0, 0, 0, 8, 9, 'l'),
(10, 48, 0, 0, 0, 9, 10, 'a'),
(11, 49, 0, 0, 0, 10, 11, 's'),
(12, 50, 0, 0, 0, 11, 12, 's'),
(13, 51, 0, 0, 0, 12, 13, ' '),
(14, 52, 0, 0, 0, 13, 14, 'H'),
(15, 53, 0, 0, 0, 14, 15, 'e'),
(16, 54, 0, 0, 0, 15, 16, 'l'),
(17, 55, 0, 0, 0, 16, 17, 'l'),
(18, 56, 0, 0, 0, 17, 18, 'o'),
(19, 57, 0, 0, 0, 18, 19, ' '),
(20, 58, 0, 0, 0, 19, 20, '{'),
(21, 59, 0, 0, 1, 20, 0, '\n'),
(22, 60, 0, 1, 1, 0, 4, '    '),
(23, 61, 0, 1, 1, 4, 5, 'p'),
(24, 62, 0, 1, 1, 5, 6, 'u'),
(25, 63, 0, 1, 1, 6, 7, 'b'),
(26, 64, 0, 1, 1, 7, 8, 'l'),
(27, 65, 0, 1, 1, 8, 9, 'i'),
(28, 66, 0, 1, 1, 9, 10, 'c'),
(29, 67, 0, 1, 1, 10, 11, ' '),
(30, 68, 0, 1, 1, 11, 12, 's'),
(31, 69, 0, 1, 1, 12, 13, 't'),
(32, 70, 0, 1, 1, 13, 14, 'a'),
(33, 71, 0, 1, 1, 14, 15, 't'),
(34, 72, 0, 1, 1, 15, 16, 'i'),
(35, 73, 0, 1, 1, 16, 17, 'c'),
(36, 74, 0, 1, 1, 17, 18, ' '),
(37, 75, 0, 1, 1, 18, 19, 'v'),
(38, 76, 0, 1, 1, 19, 20, 'o'),
(39, 77, 0, 1, 1, 20, 21, 'i'),
(40, 78, 0, 1, 1, 21, 22, 'd'),
(41, 79, 0, 1, 1, 22, 23, ' '),
(42, 80, 0, 1, 1, 23, 24, 'm'),
(43, 81, 0, 1, 1, 24, 25, 'a'),
(44, 82, 0, 1, 1, 25, 26, 'i'),
(45, 83, 0, 1, 1, 26, 27, 'n'),
(46, 84, 0, 1, 1, 27, 28, '('),
(47, 85, 0, 1, 1, 28, 29, 'S'),
(48, 86, 0, 1, 1, 29, 30, 't'),
(49, 87, 0, 1, 1, 30, 31, 'r'),
(50, 88, 0, 1, 1, 31, 32, 'i'),
(51, 89, 0, 1, 1, 32, 33, 'n'),
(52, 90, 0, 1, 1, 33, 34, 'g'),
(53, 91, 0, 1, 1, 34, 35, '['),
(54, 92, 0, 1, 1, 35, 36, ']'),
(55, 93, 0, 1, 1, 36, 37, ' '),
(56, 94, 0, 1, 1, 37, 38, 'a'),
(57, 95, 0, 1, 1, 38, 39, 'r'),
(58, 96, 0, 1, 1, 39, 40, 'g'),
(59, 97, 0, 1, 1, 40, 41, 's'),
(60, 98, 0, 1, 1, 41, 42, ')'),
(61, 99, 0, 1, 1, 42, 43, ' '),
(62, 100, 0, 1, 1, 43, 44, '{'),
(63, 101, 0, 1, 2, 44, 0, '\n'),
(64, 102, 0, 2, 2, 0, 8, '        '),
(65, 103, 0, 2, 2, 8, 9, '}'),
(66, 104, 1, 2, 2, 0, 8, '        '),
(67, 105, 0, 2, 2, 0, 4, '    '),
(68, 106, 0, 2, 3, 5, 0, '\n'),
(69, 107, 0, 3, 3, 0, 4, '    '),
(70, 108, 0, 3, 3, 4, 5, '}'),
(71, 109, 1, 3, 3, 0, 4, '    '),
(72, 110, 0, 0, 0, 0, 20, 'public class Hello {'),
(73, 111, 0, 0, 1, 20, 0, '\n'),
(74, 112, 2, 1, 3, 0, 0, '    public static void main(String[] args) {\n    }'),
(75, 113, 0, 3, 3, 0, 1, '}'),
(76, 114, 3, 3, 6, 0, 0, '}public class Hello {\n    public static void main(String[] args) {\n    }'),
(77, 115, 0, 1, 2, 44, 0, '\n'),
(78, 116, 0, 2, 2, 0, 8, '        '),
(79, 117, 0, 2, 2, 8, 9, 'S'),
(80, 118, 0, 2, 2, 9, 10, 'y'),
(81, 119, 0, 2, 2, 10, 11, 's'),
(82, 120, 0, 2, 2, 11, 12, 't'),
(83, 121, 0, 2, 2, 12, 13, 'e'),
(84, 122, 0, 2, 2, 13, 14, 'm'),
(85, 123, 0, 2, 2, 14, 15, '.'),
(86, 124, 0, 2, 2, 15, 16, 'o'),
(87, 125, 0, 2, 2, 16, 17, 'u'),
(88, 126, 0, 2, 2, 17, 18, 't'),
(89, 127, 0, 2, 2, 18, 19, '.'),
(90, 128, 0, 2, 2, 19, 20, 'p'),
(91, 129, 0, 2, 2, 20, 21, 'r'),
(92, 130, 0, 2, 2, 21, 22, 'i'),
(93, 131, 0, 2, 2, 22, 23, 'n'),
(94, 132, 0, 2, 2, 23, 24, 't'),
(95, 133, 0, 2, 2, 24, 25, 'l'),
(96, 134, 0, 2, 2, 25, 26, 'n'),
(97, 135, 0, 2, 2, 26, 27, '('),
(98, 136, 0, 2, 2, 27, 28, '"'),
(99, 137, 0, 2, 2, 28, 29, 'H'),
(100, 138, 0, 2, 2, 29, 30, 'e'),
(101, 139, 0, 2, 2, 30, 31, 'l'),
(102, 140, 0, 2, 2, 31, 32, 'l'),
(103, 141, 0, 2, 2, 32, 33, 'o'),
(104, 142, 0, 2, 2, 33, 34, ','),
(105, 143, 0, 2, 2, 34, 35, ' '),
(106, 144, 0, 2, 2, 35, 36, 'w'),
(107, 145, 0, 2, 2, 36, 37, 'o'),
(108, 146, 0, 2, 2, 37, 38, 'r'),
(109, 147, 0, 2, 2, 38, 39, 'l'),
(110, 148, 0, 2, 2, 39, 40, 'd'),
(111, 149, 0, 2, 2, 40, 41, '"'),
(112, 150, 0, 2, 2, 41, 42, ')'),
(113, 151, 0, 2, 2, 42, 43, ';'),
(114, 152, 0, 2, 3, 43, 0, '\n'),
(115, 153, 0, 3, 3, 0, 8, '        '),
(116, 154, 0, 3, 3, 8, 9, 'S'),
(117, 155, 0, 3, 3, 9, 10, 'y'),
(118, 156, 0, 3, 3, 10, 11, 's'),
(119, 157, 0, 3, 3, 11, 12, 't'),
(120, 158, 0, 3, 3, 12, 13, 'e'),
(121, 159, 0, 3, 3, 13, 14, 'm'),
(122, 160, 0, 3, 3, 14, 15, '.'),
(123, 161, 0, 3, 3, 15, 16, 'o'),
(124, 162, 0, 3, 3, 16, 17, 'u'),
(125, 163, 0, 3, 3, 17, 18, 't'),
(126, 164, 0, 3, 3, 18, 19, '.'),
(127, 165, 0, 3, 3, 19, 20, 'p'),
(128, 166, 0, 3, 3, 20, 21, 'r'),
(129, 167, 0, 3, 3, 21, 22, 'i'),
(130, 168, 0, 3, 3, 22, 23, 'n'),
(131, 169, 0, 3, 3, 23, 24, 't'),
(132, 170, 0, 3, 3, 24, 25, 'l'),
(133, 171, 0, 3, 3, 25, 26, 'n'),
(134, 172, 0, 3, 3, 26, 27, '('),
(135, 173, 0, 3, 3, 27, 28, '"'),
(136, 174, 0, 3, 3, 28, 29, 'H'),
(137, 175, 0, 3, 3, 29, 30, 'o'),
(138, 176, 0, 3, 3, 30, 31, 'o'),
(139, 177, 0, 3, 3, 31, 32, 'w'),
(140, 178, 0, 3, 3, 32, 33, 'y'),
(141, 179, 1, 3, 3, 32, 33, 'y'),
(142, 180, 1, 3, 3, 31, 32, 'w'),
(143, 181, 0, 3, 3, 31, 32, 'e'),
(144, 182, 0, 3, 3, 32, 33, 'y'),
(145, 183, 0, 3, 3, 33, 34, '"'),
(146, 184, 0, 3, 3, 34, 35, ')'),
(147, 185, 0, 3, 3, 35, 36, ';'),
(148, 186, 3, 2, 4, 0, 0, '        System.out.println("Hello, world");\n        System.out.println("Hooey");'),
(149, 187, 0, 1, 2, 44, 0, '\n'),
(150, 188, 0, 2, 2, 0, 8, '        '),
(151, 189, 0, 2, 2, 8, 9, 'S'),
(152, 190, 0, 2, 2, 9, 10, 'y'),
(153, 191, 0, 2, 2, 10, 11, 's'),
(154, 192, 0, 2, 2, 11, 12, 't'),
(155, 193, 0, 2, 2, 12, 13, 'e'),
(156, 194, 0, 2, 2, 13, 14, 'm'),
(157, 195, 0, 2, 2, 14, 15, '.'),
(158, 196, 0, 2, 2, 15, 16, 'o'),
(159, 197, 0, 2, 2, 16, 17, 'u'),
(160, 198, 0, 2, 2, 17, 18, 't'),
(161, 199, 0, 2, 2, 18, 19, '.'),
(162, 200, 0, 2, 2, 19, 20, 'p'),
(163, 201, 0, 2, 2, 20, 21, 'r'),
(164, 202, 0, 2, 2, 21, 22, 'i'),
(165, 203, 0, 2, 2, 22, 23, 'n'),
(166, 204, 0, 2, 2, 23, 24, 't'),
(167, 205, 0, 2, 2, 24, 25, 'l'),
(168, 206, 0, 2, 2, 25, 26, 'n'),
(169, 207, 0, 2, 2, 26, 27, '('),
(170, 208, 0, 2, 2, 27, 28, '"'),
(171, 209, 1, 4, 4, 0, 1, '}'),
(172, 210, 3, 0, 4, 0, 0, 'public class Hello {\n    public static void main(String[] args) {\n        System.out.println("\n    }'),
(173, 211, 0, 0, 0, 0, 1, 'p'),
(174, 212, 0, 0, 0, 1, 2, 'u'),
(175, 213, 0, 0, 0, 2, 3, 'b'),
(176, 214, 0, 0, 0, 3, 4, 'l'),
(177, 215, 0, 0, 0, 4, 5, 'i'),
(178, 216, 0, 0, 0, 5, 6, 'c'),
(179, 217, 0, 0, 0, 6, 7, ' '),
(180, 218, 0, 0, 0, 7, 8, 'i'),
(181, 219, 0, 0, 0, 8, 9, 'n'),
(182, 220, 0, 0, 0, 9, 10, 't'),
(183, 221, 0, 0, 0, 10, 11, ' '),
(184, 222, 0, 0, 0, 11, 12, 's'),
(185, 223, 0, 0, 0, 12, 13, 'q'),
(186, 224, 0, 0, 0, 13, 14, ')'),
(187, 225, 0, 0, 0, 14, 15, 'i'),
(188, 226, 1, 0, 0, 14, 15, 'i'),
(189, 227, 1, 0, 0, 13, 14, ')'),
(190, 228, 0, 0, 0, 13, 14, '('),
(191, 229, 0, 0, 0, 14, 15, 'i'),
(192, 230, 0, 0, 0, 15, 16, 'n'),
(193, 231, 0, 0, 0, 16, 17, 't'),
(194, 232, 0, 0, 0, 17, 18, ' '),
(195, 233, 0, 0, 0, 18, 19, 'x'),
(196, 234, 0, 0, 0, 19, 20, ')'),
(197, 235, 0, 0, 0, 20, 21, ' '),
(198, 236, 0, 0, 0, 21, 23, '{}'),
(199, 237, 0, 0, 1, 22, 0, '\n'),
(200, 238, 2, 1, 2, 0, 0, '    '),
(201, 239, 0, 1, 1, 4, 5, 'r'),
(202, 240, 0, 1, 1, 5, 6, 'e'),
(203, 241, 0, 1, 1, 6, 7, 't'),
(204, 242, 0, 1, 1, 7, 8, 'u'),
(205, 243, 0, 1, 1, 8, 9, 'r'),
(206, 244, 0, 1, 1, 9, 10, 'n'),
(207, 245, 0, 1, 1, 10, 11, ' '),
(208, 246, 0, 1, 1, 11, 12, 'x'),
(209, 247, 0, 1, 1, 12, 13, ' '),
(210, 248, 0, 1, 1, 13, 14, '*'),
(211, 249, 0, 1, 1, 14, 15, ' '),
(212, 250, 0, 1, 1, 15, 16, 'x'),
(213, 251, 0, 1, 1, 16, 17, ';'),
(214, 252, 0, 2, 2, 0, 1, '}'),
(215, 253, 0, 2, 3, 1, 0, '\n'),
(216, 254, 0, 0, 1, 22, 0, '\n'),
(217, 255, 0, 1, 1, 0, 4, '    '),
(218, 256, 0, 1, 1, 4, 5, 'S'),
(219, 257, 0, 1, 1, 5, 6, 'y'),
(220, 258, 0, 1, 1, 6, 7, 's'),
(221, 259, 0, 1, 1, 7, 8, 't'),
(222, 260, 0, 1, 1, 8, 9, 'e'),
(223, 261, 0, 1, 1, 9, 10, 'm'),
(224, 262, 0, 1, 1, 10, 11, '.'),
(225, 263, 0, 1, 1, 11, 12, 'o'),
(226, 264, 0, 1, 1, 12, 13, 'u'),
(227, 265, 0, 1, 1, 13, 14, 't'),
(228, 266, 0, 1, 1, 14, 15, '.'),
(229, 267, 0, 1, 1, 15, 16, 'p'),
(230, 268, 0, 1, 1, 16, 17, 'r'),
(231, 269, 0, 1, 1, 17, 18, 'i'),
(232, 270, 0, 1, 1, 18, 19, 'n'),
(233, 271, 0, 1, 1, 19, 20, 't'),
(234, 272, 0, 1, 1, 20, 21, 'l'),
(235, 273, 0, 1, 1, 21, 22, 'n'),
(236, 274, 0, 1, 1, 22, 23, '('),
(237, 275, 0, 1, 1, 23, 24, '"'),
(238, 276, 0, 1, 1, 24, 25, 'M'),
(239, 277, 0, 1, 1, 25, 26, 'e'),
(240, 278, 0, 1, 1, 26, 27, 'e'),
(241, 279, 0, 1, 1, 27, 28, 'p'),
(242, 280, 0, 1, 1, 28, 29, '!'),
(243, 281, 0, 1, 1, 29, 30, ' '),
(244, 282, 0, 1, 1, 30, 31, '"'),
(245, 283, 0, 1, 1, 31, 32, ' '),
(246, 284, 0, 1, 1, 32, 33, '+'),
(247, 285, 0, 1, 1, 33, 34, ' '),
(248, 286, 0, 1, 1, 34, 35, 'x'),
(249, 287, 0, 1, 1, 35, 36, ')'),
(250, 288, 0, 1, 1, 36, 37, ';'),
(251, 289, 1, 1, 1, 34, 35, 'x'),
(252, 290, 0, 1, 1, 34, 35, 'y'),
(253, 291, 1, 1, 1, 34, 35, 'y'),
(254, 292, 0, 1, 1, 34, 35, 'x'),
(255, 293, 1, 1, 1, 34, 35, 'x'),
(256, 294, 0, 1, 1, 34, 35, 'y'),
(257, 295, 1, 1, 1, 34, 35, 'y'),
(258, 296, 0, 1, 1, 34, 35, 'x'),
(259, 297, 1, 1, 1, 34, 35, 'x'),
(260, 298, 0, 1, 1, 34, 35, 'y'),
(261, 299, 4, 0, 0, 0, 0, 'public int sq(int x) {\n    System.out.println("Meep! " + y);\n    return x * x;\n}\n'),
(262, 300, 4, 0, 0, 0, 0, 'public int sq(int x) {\n    System.out.println("Meep! " + y);\n    return x * x;\n}\n'),
(263, 301, 1, 1, 1, 34, 35, 'y'),
(264, 302, 0, 1, 1, 34, 35, 'x'),
(265, 303, 4, 0, 0, 0, 0, 'public int sq(int x) {\n    System.out.println("Meep! " + x);\n    return x * x;\n}\n'),
(266, 304, 4, 0, 0, 0, 0, 'public int sq(int x) {\n    System.out.println("Meep! " + x);\n    return x * x;\n}\n'),
(267, 305, 4, 0, 0, 0, 0, 'public int sq(int x) {\n    System.out.println("Meep! " + x);\n    return x * x;\n}\n'),
(268, 306, 4, 0, 0, 0, 0, 'public int sq(int x) {\n    System.out.println("Meep! " + x);\n    return x * x;\n}\n'),
(269, 308, 4, 0, 0, 0, 0, 'public int sq(int x) {\n    System.out.println("Meep! " + x);\n    return x * x;\n}\n'),
(270, 310, 4, 0, 0, 0, 0, 'public int sq(int x) {\n    System.out.println("Meep! " + x);\n    return x * x;\n}\n'),
(271, 312, 4, 0, 0, 0, 0, 'public int sq(int x) {\n    System.out.println("Meep! " + x);\n    return x * x;\n}\n'),
(272, 314, 4, 0, 0, 0, 0, 'public int sq(int x) {\n    System.out.println("Meep! " + x);\n    return x * x;\n}\n'),
(273, 316, 4, 0, 0, 0, 0, 'public int sq(int x) {\n    System.out.println("Meep! " + x);\n    return x * x;\n}\n'),
(274, 318, 4, 0, 0, 0, 0, 'public int sq(int x) {\n    System.out.println("Meep! " + x);\n    return x * x;\n}\n'),
(275, 320, 0, 1, 2, 37, 0, '\n'),
(276, 321, 0, 2, 2, 0, 4, '    '),
(277, 322, 0, 2, 2, 4, 5, 'f'),
(278, 323, 0, 2, 2, 5, 6, 'r'),
(279, 324, 0, 2, 2, 6, 7, 'o'),
(280, 325, 0, 2, 2, 7, 8, 'o'),
(281, 326, 0, 2, 2, 8, 9, 't'),
(282, 327, 1, 2, 2, 8, 9, 't'),
(283, 328, 0, 2, 2, 8, 9, 'p'),
(284, 329, 0, 2, 2, 9, 10, '!'),
(285, 330, 4, 0, 0, 0, 0, 'public int sq(int x) {\n    System.out.println("Meep! " + x);\n    froop!\n    return x * x;\n}\n'),
(286, 333, 0, 0, 0, 0, 1, '#'),
(287, 334, 0, 0, 0, 1, 2, 'i'),
(288, 335, 0, 0, 0, 2, 3, 'n'),
(289, 336, 0, 0, 0, 3, 4, 'c'),
(290, 337, 0, 0, 0, 4, 5, 'l'),
(291, 338, 0, 0, 0, 5, 6, 'u'),
(292, 339, 0, 0, 0, 6, 7, 'd'),
(293, 340, 0, 0, 0, 7, 8, 'e'),
(294, 341, 0, 0, 0, 8, 9, ' '),
(295, 342, 0, 0, 0, 9, 10, '<'),
(296, 343, 0, 0, 0, 10, 11, 's'),
(297, 344, 0, 0, 0, 11, 12, 't'),
(298, 345, 0, 0, 0, 12, 13, 'd'),
(299, 346, 0, 0, 0, 13, 14, 'i'),
(300, 347, 0, 0, 0, 14, 15, 'o'),
(301, 348, 0, 0, 0, 15, 16, '.'),
(302, 349, 0, 0, 0, 16, 17, 'h'),
(303, 350, 0, 0, 0, 17, 18, '>'),
(304, 351, 0, 0, 1, 18, 0, '\n'),
(305, 352, 0, 1, 2, 0, 0, '\n'),
(306, 353, 0, 2, 2, 0, 1, 'i'),
(307, 354, 0, 2, 2, 1, 2, 'n'),
(308, 355, 0, 2, 2, 2, 3, 't'),
(309, 356, 0, 2, 2, 3, 4, ' '),
(310, 357, 0, 2, 2, 4, 5, 'm'),
(311, 358, 0, 2, 2, 5, 6, 'a'),
(312, 359, 0, 2, 2, 6, 7, 'i'),
(313, 360, 0, 2, 2, 7, 8, 'n'),
(314, 361, 0, 2, 2, 8, 10, '()'),
(315, 362, 0, 2, 2, 9, 10, 'v'),
(316, 363, 0, 2, 2, 10, 11, 'o'),
(317, 364, 0, 2, 2, 11, 12, 'i'),
(318, 365, 0, 2, 2, 12, 13, 'd'),
(319, 366, 0, 2, 2, 14, 16, ' {'),
(320, 367, 0, 2, 3, 16, 0, '\n'),
(321, 368, 0, 3, 3, 0, 4, '    '),
(322, 369, 0, 3, 3, 4, 5, 'i'),
(323, 370, 0, 3, 3, 5, 6, 'n'),
(324, 371, 0, 3, 3, 6, 7, 't'),
(325, 372, 0, 3, 3, 7, 8, ' '),
(326, 373, 0, 3, 3, 8, 9, 'a'),
(327, 374, 0, 3, 3, 9, 10, ','),
(328, 375, 0, 3, 3, 10, 11, ' '),
(329, 376, 0, 3, 3, 11, 12, 'b'),
(330, 377, 0, 3, 3, 12, 13, ';'),
(331, 378, 0, 3, 4, 13, 0, '\n'),
(332, 379, 0, 4, 4, 0, 4, '    '),
(333, 380, 0, 4, 4, 4, 5, 's'),
(334, 381, 0, 4, 4, 5, 6, 'c'),
(335, 382, 0, 4, 4, 6, 7, 'a'),
(336, 383, 0, 4, 4, 7, 8, 'n'),
(337, 384, 0, 4, 4, 8, 9, 'f'),
(338, 385, 0, 4, 4, 9, 11, '()'),
(339, 386, 0, 4, 4, 10, 12, '""'),
(340, 387, 0, 4, 4, 11, 12, '%'),
(341, 388, 0, 4, 4, 12, 13, 'i'),
(342, 389, 0, 4, 4, 14, 15, ','),
(343, 390, 0, 4, 4, 15, 16, ' '),
(344, 391, 0, 4, 4, 16, 17, '&'),
(345, 392, 0, 4, 4, 17, 18, 'a'),
(346, 393, 0, 4, 4, 19, 20, ';'),
(347, 394, 0, 4, 5, 20, 0, '\n'),
(348, 395, 0, 5, 5, 0, 4, '    '),
(349, 396, 0, 5, 5, 4, 5, 's'),
(350, 397, 0, 5, 5, 5, 6, 'c'),
(351, 398, 0, 5, 5, 6, 7, 'a'),
(352, 399, 0, 5, 5, 7, 8, 'n'),
(353, 400, 0, 5, 5, 8, 9, 'f'),
(354, 401, 0, 5, 5, 9, 11, '()'),
(355, 402, 0, 5, 5, 10, 12, '""'),
(356, 403, 0, 5, 5, 11, 12, '%'),
(357, 404, 0, 5, 5, 12, 13, 'i'),
(358, 405, 0, 5, 5, 14, 15, '.'),
(359, 406, 0, 5, 5, 15, 16, ' '),
(360, 407, 1, 5, 5, 15, 16, ' '),
(361, 408, 1, 5, 5, 14, 15, '.'),
(362, 409, 0, 5, 5, 14, 15, ','),
(363, 410, 0, 5, 5, 15, 16, ' '),
(364, 411, 0, 5, 5, 16, 17, '&'),
(365, 412, 0, 5, 5, 17, 18, 'b'),
(366, 413, 0, 5, 5, 19, 20, ';'),
(367, 414, 0, 5, 6, 20, 0, '\n'),
(368, 415, 0, 6, 6, 0, 4, '    '),
(369, 416, 0, 6, 6, 4, 5, 'p'),
(370, 417, 0, 6, 6, 5, 6, 'r'),
(371, 418, 0, 6, 6, 6, 7, 'i'),
(372, 419, 0, 6, 6, 7, 8, 'n'),
(373, 420, 0, 6, 6, 8, 9, 't'),
(374, 421, 0, 6, 6, 9, 10, 'f'),
(375, 422, 0, 6, 6, 10, 12, '()'),
(376, 423, 0, 6, 6, 11, 13, '""'),
(377, 424, 0, 6, 6, 12, 13, 'a'),
(378, 425, 0, 6, 6, 13, 14, 'n'),
(379, 426, 0, 6, 6, 14, 15, 's'),
(380, 427, 0, 6, 6, 15, 16, 'w'),
(381, 428, 0, 6, 6, 16, 17, 'e'),
(382, 429, 0, 6, 6, 17, 18, 'r'),
(383, 430, 0, 6, 6, 18, 19, ':'),
(384, 431, 0, 6, 6, 19, 20, ' '),
(385, 432, 0, 6, 6, 20, 21, '%'),
(386, 433, 0, 6, 6, 21, 22, 'i'),
(387, 434, 0, 6, 6, 22, 23, '\\'),
(388, 435, 0, 6, 6, 23, 24, 'n'),
(389, 436, 0, 6, 6, 25, 26, ','),
(390, 437, 0, 6, 6, 26, 27, ' '),
(391, 438, 0, 6, 6, 27, 28, 'a'),
(392, 439, 1, 6, 6, 27, 28, 'a'),
(393, 440, 0, 6, 6, 27, 29, '()'),
(394, 441, 0, 6, 6, 28, 29, 'a'),
(395, 442, 0, 6, 6, 29, 30, ' '),
(396, 443, 0, 6, 6, 30, 31, '+'),
(397, 444, 0, 6, 6, 31, 32, ' '),
(398, 445, 0, 6, 6, 32, 33, 'b'),
(399, 446, 0, 6, 6, 35, 36, ';'),
(400, 447, 0, 6, 7, 36, 0, '\n'),
(401, 448, 0, 7, 7, 0, 4, '    '),
(402, 449, 0, 7, 7, 4, 5, 'r'),
(403, 450, 0, 7, 7, 5, 6, 'e'),
(404, 451, 0, 7, 7, 6, 7, 't'),
(405, 452, 0, 7, 7, 7, 8, 'u'),
(406, 453, 0, 7, 7, 8, 9, 'r'),
(407, 454, 0, 7, 7, 9, 10, 'n'),
(408, 455, 0, 7, 7, 10, 11, ' '),
(409, 456, 0, 7, 7, 11, 12, '0'),
(410, 457, 0, 7, 7, 12, 13, ';'),
(411, 458, 0, 7, 8, 13, 0, '\n'),
(412, 459, 0, 8, 8, 0, 4, '    '),
(413, 460, 0, 8, 8, 4, 5, '}'),
(414, 461, 1, 8, 8, 0, 4, '    '),
(415, 462, 4, 0, 0, 0, 0, '#include <stdio.h>\n\nint main(void) {\n    int a, b;\n    scanf("%i", &a);\n    scanf("%i", &b);\n    printf("answer: %i\\n", (a + b));\n    return 0;\n}'),
(416, 464, 4, 0, 0, 0, 0, '#include <stdio.h>\n\nint main(void) {\n    int a, b;\n    scanf("%i", &a);\n    scanf("%i", &b);\n    printf("answer: %i\\n", (a + b));\n    return 0;\n}'),
(417, 465, 4, 0, 0, 0, 0, '#include <stdio.h>\n\nint main(void) {\n    int a, b;\n    scanf("%i", &a);\n    scanf("%i", &b);\n    printf("answer: %i\\n", (a + b));\n    return 0;\n}'),
(418, 467, 4, 0, 0, 0, 0, '#include <stdio.h>\n\nint main(void) {\n    int a, b;\n    scanf("%i", &a);\n    scanf("%i", &b);\n    printf("answer: %i\\n", (a + b));\n    return 0;\n}'),
(419, 468, 4, 0, 0, 0, 0, '#include <stdio.h>\n\nint main(void) {\n    int a, b;\n    scanf("%i", &a);\n    scanf("%i", &b);\n    printf("answer: %i\\n", (a + b));\n    return 0;\n}'),
(420, 470, 4, 0, 0, 0, 0, '#include <stdio.h>\n\nint main(void) {\n    int a, b;\n    scanf("%i", &a);\n    scanf("%i", &b);\n    printf("answer: %i\\n", (a + b));\n    return 0;\n}'),
(421, 473, 0, 0, 0, 0, 1, '#'),
(422, 474, 1, 0, 0, 0, 1, '#');

-- --------------------------------------------------------

--
-- Table structure for table `configuration_settings`
--

CREATE TABLE IF NOT EXISTS `configuration_settings` (
  `name` varchar(60) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `configuration_settings`
--

INSERT INTO `configuration_settings` (`name`, `value`) VALUES
('pub.text.institution', 'York College of Pennsylvania');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url` varchar(120) NOT NULL,
  `term_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `title`, `url`, `term_id`, `year`) VALUES
(1, 'CS 101', 'Introduction to Computer Science I', 'http://cs.unseen.edu/s11/cs101', 1, 2011),
(2, 'CS 201', 'Introduction to Computer Science II', 'http://cs.unseen.edu/f10/cs201', 5, 2010),
(3, 'CS 340', 'Programming Language Design', 'http://cs.unseen.edu/f10/cs340', 5, 2010),
(4, 'CS 350', 'Data Structures', 'http://cs.unseen.edu/s10/cs350', 1, 2010);

-- --------------------------------------------------------

--
-- Table structure for table `course_registrations`
--

CREATE TABLE IF NOT EXISTS `course_registrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `registration_type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `course_registrations`
--

INSERT INTO `course_registrations` (`id`, `course_id`, `user_id`, `registration_type`) VALUES
(1, 1, 1, 0),
(2, 2, 1, 0),
(3, 3, 1, 0),
(4, 4, 1, 0),
(5, 1, 2, 0),
(6, 1, 3, 0),
(7, 1, 4, 0),
(8, 1, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `problem_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `problem_id` (`problem_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=475 ;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `user_id`, `problem_id`, `type`, `timestamp`) VALUES
(39, 1, 1, 0, 1320438572192),
(40, 1, 1, 0, 1320438572452),
(41, 1, 1, 0, 1320438572533),
(42, 1, 1, 0, 1320438572609),
(43, 1, 1, 0, 1320438572699),
(44, 1, 1, 0, 1320438572729),
(45, 1, 1, 0, 1320438572814),
(46, 1, 1, 0, 1320438577602),
(47, 1, 1, 0, 1320438577755),
(48, 1, 1, 0, 1320438577812),
(49, 1, 1, 0, 1320438577870),
(50, 1, 1, 0, 1320438578059),
(51, 1, 1, 0, 1320438578163),
(52, 1, 1, 0, 1320438578300),
(53, 1, 1, 0, 1320438578446),
(54, 1, 1, 0, 1320438578500),
(55, 1, 1, 0, 1320438578690),
(56, 1, 1, 0, 1320438578810),
(57, 1, 1, 0, 1320438579251),
(58, 1, 1, 0, 1320438579436),
(59, 1, 1, 0, 1320438579612),
(60, 1, 1, 0, 1320438579616),
(61, 1, 1, 0, 1320438580491),
(62, 1, 1, 0, 1320438580706),
(63, 1, 1, 0, 1320438580770),
(64, 1, 1, 0, 1320438580886),
(65, 1, 1, 0, 1320438580941),
(66, 1, 1, 0, 1320438581011),
(67, 1, 1, 0, 1320438581091),
(68, 1, 1, 0, 1320438581827),
(69, 1, 1, 0, 1320438581931),
(70, 1, 1, 0, 1320438582035),
(71, 1, 1, 0, 1320438582086),
(72, 1, 1, 0, 1320438582195),
(73, 1, 1, 0, 1320438582278),
(74, 1, 1, 0, 1320438582360),
(75, 1, 1, 0, 1320438582443),
(76, 1, 1, 0, 1320438582498),
(77, 1, 1, 0, 1320438582556),
(78, 1, 1, 0, 1320438582633),
(79, 1, 1, 0, 1320438582712),
(80, 1, 1, 0, 1320438582761),
(81, 1, 1, 0, 1320438582905),
(82, 1, 1, 0, 1320438582964),
(83, 1, 1, 0, 1320438583029),
(84, 1, 1, 0, 1320438583187),
(85, 1, 1, 0, 1320438583284),
(86, 1, 1, 0, 1320438583461),
(87, 1, 1, 0, 1320438583533),
(88, 1, 1, 0, 1320438583587),
(89, 1, 1, 0, 1320438583645),
(90, 1, 1, 0, 1320438583677),
(91, 1, 1, 0, 1320438583875),
(92, 1, 1, 0, 1320438583966),
(93, 1, 1, 0, 1320438584100),
(94, 1, 1, 0, 1320438584156),
(95, 1, 1, 0, 1320438584278),
(96, 1, 1, 0, 1320438584346),
(97, 1, 1, 0, 1320438584547),
(98, 1, 1, 0, 1320438584758),
(99, 1, 1, 0, 1320438584841),
(100, 1, 1, 0, 1320438584915),
(101, 1, 1, 0, 1320438585143),
(102, 1, 1, 0, 1320438585145),
(103, 1, 1, 0, 1320438585594),
(104, 1, 1, 0, 1320438585597),
(105, 1, 1, 0, 1320438585600),
(106, 1, 1, 0, 1320438585971),
(107, 1, 1, 0, 1320438585973),
(108, 1, 1, 0, 1320438586074),
(109, 1, 1, 0, 1320438586080),
(110, 1, 1, 0, 1320438690193),
(111, 1, 1, 0, 1320438690197),
(112, 1, 1, 0, 1320438690201),
(113, 1, 1, 0, 1320438690202),
(114, 1, 1, 0, 1320438994544),
(115, 1, 1, 0, 1320869507825),
(116, 1, 1, 0, 1320869507829),
(117, 1, 1, 0, 1320869508202),
(118, 1, 1, 0, 1320869508314),
(119, 1, 1, 0, 1320869508427),
(120, 1, 1, 0, 1320869508616),
(121, 1, 1, 0, 1320869508698),
(122, 1, 1, 0, 1320869508720),
(123, 1, 1, 0, 1320869508809),
(124, 1, 1, 0, 1320869509026),
(125, 1, 1, 0, 1320869509099),
(126, 1, 1, 0, 1320869509207),
(127, 1, 1, 0, 1320869509292),
(128, 1, 1, 0, 1320869509478),
(129, 1, 1, 0, 1320869509573),
(130, 1, 1, 0, 1320869509666),
(131, 1, 1, 0, 1320869509762),
(132, 1, 1, 0, 1320869509801),
(133, 1, 1, 0, 1320869509876),
(134, 1, 1, 0, 1320869509955),
(135, 1, 1, 0, 1320869510122),
(136, 1, 1, 0, 1320869510323),
(137, 1, 1, 0, 1320869510452),
(138, 1, 1, 0, 1320869510655),
(139, 1, 1, 0, 1320869510741),
(140, 1, 1, 0, 1320869510891),
(141, 1, 1, 0, 1320869511052),
(142, 1, 1, 0, 1320869511226),
(143, 1, 1, 0, 1320869511305),
(144, 1, 1, 0, 1320869511429),
(145, 1, 1, 0, 1320869511522),
(146, 1, 1, 0, 1320869511645),
(147, 1, 1, 0, 1320869511800),
(148, 1, 1, 0, 1320869511870),
(149, 1, 1, 0, 1320869512125),
(150, 1, 1, 0, 1320869512359),
(151, 1, 1, 0, 1320869512497),
(152, 1, 1, 0, 1320873362936),
(153, 1, 1, 0, 1320873362940),
(154, 1, 1, 0, 1320873363892),
(155, 1, 1, 0, 1320873364032),
(156, 1, 1, 0, 1320873364119),
(157, 1, 1, 0, 1320873364260),
(158, 1, 1, 0, 1320873364324),
(159, 1, 1, 0, 1320873364363),
(160, 1, 1, 0, 1320873364461),
(161, 1, 1, 0, 1320873364659),
(162, 1, 1, 0, 1320873364737),
(163, 1, 1, 0, 1320873364825),
(164, 1, 1, 0, 1320873364899),
(165, 1, 1, 0, 1320873365077),
(166, 1, 1, 0, 1320873365163),
(167, 1, 1, 0, 1320873365252),
(168, 1, 1, 0, 1320873365356),
(169, 1, 1, 0, 1320873365405),
(170, 1, 1, 0, 1320873365483),
(171, 1, 1, 0, 1320873365566),
(172, 1, 1, 0, 1320873365745),
(173, 1, 1, 0, 1320873365979),
(174, 1, 1, 0, 1320873366220),
(175, 1, 1, 0, 1320873366459),
(176, 1, 1, 0, 1320873366595),
(177, 1, 1, 0, 1320873367020),
(178, 1, 1, 0, 1320873367078),
(179, 1, 1, 0, 1320873367414),
(180, 1, 1, 0, 1320873367550),
(181, 1, 1, 0, 1320873367656),
(182, 1, 1, 0, 1320873368262),
(183, 1, 1, 0, 1320873368811),
(184, 1, 1, 0, 1320873368970),
(185, 1, 1, 0, 1320873369161),
(186, 1, 1, 0, 1320958177670),
(187, 1, 1, 0, 1320958178068),
(188, 1, 1, 0, 1320958178070),
(189, 1, 1, 0, 1320958178923),
(190, 1, 1, 0, 1320958179059),
(191, 1, 1, 0, 1320958179132),
(192, 1, 1, 0, 1320958179283),
(193, 1, 1, 0, 1320958179355),
(194, 1, 1, 0, 1320958179411),
(195, 1, 1, 0, 1320958179475),
(196, 1, 1, 0, 1320958179705),
(197, 1, 1, 0, 1320958179749),
(198, 1, 1, 0, 1320958179803),
(199, 1, 1, 0, 1320958179894),
(200, 1, 1, 0, 1320958180085),
(201, 1, 1, 0, 1320958180188),
(202, 1, 1, 0, 1320958180272),
(203, 1, 1, 0, 1320958180363),
(204, 1, 1, 0, 1320958180434),
(205, 1, 1, 0, 1320958180509),
(206, 1, 1, 0, 1320958180553),
(207, 1, 1, 0, 1320958181044),
(208, 1, 1, 0, 1320958181862),
(209, 1, 1, 0, 1320958184478),
(210, 1, 1, 0, 1320958184484),
(211, 1, 1, 0, 1320958185876),
(212, 1, 1, 0, 1320958186299),
(213, 1, 1, 0, 1320958186347),
(214, 1, 1, 0, 1320958186486),
(215, 1, 1, 0, 1320958186532),
(216, 1, 1, 0, 1320958186582),
(217, 1, 1, 0, 1320958186677),
(218, 1, 1, 0, 1320958186926),
(219, 1, 1, 0, 1320958186998),
(220, 1, 1, 0, 1320958187037),
(221, 1, 1, 0, 1320958187106),
(222, 1, 1, 0, 1320958187772),
(223, 1, 1, 0, 1320958187980),
(224, 1, 1, 0, 1320958188293),
(225, 1, 1, 0, 1320958188667),
(226, 1, 1, 0, 1320958188878),
(227, 1, 1, 0, 1320958189030),
(228, 1, 1, 0, 1320958189699),
(229, 1, 1, 0, 1320958189915),
(230, 1, 1, 0, 1320958189979),
(231, 1, 1, 0, 1320958190051),
(232, 1, 1, 0, 1320958190159),
(233, 1, 1, 0, 1320958190315),
(234, 1, 1, 0, 1320958190598),
(235, 1, 1, 0, 1320958190780),
(236, 1, 1, 0, 1320958190817),
(237, 1, 1, 0, 1320958191061),
(238, 1, 1, 0, 1320958191067),
(239, 1, 1, 0, 1320958191219),
(240, 1, 1, 0, 1320958191291),
(241, 1, 1, 0, 1320958191468),
(242, 1, 1, 0, 1320958191488),
(243, 1, 1, 0, 1320958191651),
(244, 1, 1, 0, 1320958191772),
(245, 1, 1, 0, 1320958191876),
(246, 1, 1, 0, 1320958191980),
(247, 1, 1, 0, 1320958192075),
(248, 1, 1, 0, 1320958192923),
(249, 1, 1, 0, 1320958192987),
(250, 1, 1, 0, 1320958193074),
(251, 1, 1, 0, 1320958193149),
(252, 1, 1, 0, 1320959194683),
(253, 1, 1, 0, 1320959197618),
(254, 1, 1, 0, 1322604523960),
(255, 1, 1, 0, 1322604523964),
(256, 1, 1, 0, 1322604524953),
(257, 1, 1, 0, 1322604525086),
(258, 1, 1, 0, 1322604525144),
(259, 1, 1, 0, 1322604525340),
(260, 1, 1, 0, 1322604525430),
(261, 1, 1, 0, 1322604525483),
(262, 1, 1, 0, 1322604525535),
(263, 1, 1, 0, 1322604525755),
(264, 1, 1, 0, 1322604525818),
(265, 1, 1, 0, 1322604525901),
(266, 1, 1, 0, 1322604526002),
(267, 1, 1, 0, 1322604526193),
(268, 1, 1, 0, 1322604526284),
(269, 1, 1, 0, 1322604526398),
(270, 1, 1, 0, 1322604526484),
(271, 1, 1, 0, 1322604526539),
(272, 1, 1, 0, 1322604526590),
(273, 1, 1, 0, 1322604526690),
(274, 1, 1, 0, 1322604526842),
(275, 1, 1, 0, 1322604527028),
(276, 1, 1, 0, 1322604527499),
(277, 1, 1, 0, 1322604527684),
(278, 1, 1, 0, 1322604527830),
(279, 1, 1, 0, 1322604527891),
(280, 1, 1, 0, 1322604528770),
(281, 1, 1, 0, 1322604529129),
(282, 1, 1, 0, 1322604529241),
(283, 1, 1, 0, 1322604529366),
(284, 1, 1, 0, 1322604529451),
(285, 1, 1, 0, 1322604529550),
(286, 1, 1, 0, 1322604530171),
(287, 1, 1, 0, 1322604530349),
(288, 1, 1, 0, 1322604530466),
(289, 1, 1, 0, 1324059091623),
(290, 1, 1, 0, 1324059091637),
(291, 1, 1, 0, 1324059280718),
(292, 1, 1, 0, 1324059280817),
(293, 1, 1, 0, 1324059489575),
(294, 1, 1, 0, 1324059490054),
(295, 1, 1, 0, 1324059506596),
(296, 1, 1, 0, 1324059506700),
(297, 1, 1, 0, 1324059746969),
(298, 1, 1, 0, 1324059747458),
(299, 1, 1, 0, 1324065727440),
(300, 1, 1, 0, 1324065741283),
(301, 1, 1, 0, 1324065746762),
(302, 1, 1, 0, 1324065747049),
(303, 1, 1, 0, 1324065750032),
(304, 1, 1, 0, 1324068993808),
(305, 1, 1, 0, 1324070525561),
(306, 1, 1, 0, 1324070619323),
(307, 1, 1, 2, 1324070620120),
(308, 1, 1, 0, 1324070714812),
(309, 1, 1, 2, 1324070715588),
(310, 1, 1, 0, 1324071858141),
(312, 1, 1, 0, 1324072006881),
(313, 1, 1, 2, 1324072007659),
(314, 1, 1, 0, 1324779889710),
(315, 1, 1, 2, 1324779890029),
(316, 1, 1, 0, 1325343467679),
(317, 1, 1, 2, 1325343469527),
(318, 1, 1, 0, 1326476376880),
(319, 1, 1, 2, 1326476379325),
(320, 1, 1, 0, 1326476385427),
(321, 1, 1, 0, 1326476385435),
(322, 1, 1, 0, 1326476386249),
(323, 1, 1, 0, 1326476386434),
(324, 1, 1, 0, 1326476386681),
(325, 1, 1, 0, 1326476386838),
(326, 1, 1, 0, 1326476386978),
(327, 1, 1, 0, 1326476387353),
(328, 1, 1, 0, 1326476387578),
(329, 1, 1, 0, 1326476387699),
(330, 1, 1, 0, 1326476389760),
(331, 1, 1, 2, 1326476389952),
(332, 1, 2, 2, 1326485741276),
(333, 1, 2, 0, 1326485744229),
(334, 1, 2, 0, 1326485744590),
(335, 1, 2, 0, 1326485744669),
(336, 1, 2, 0, 1326485744711),
(337, 1, 2, 0, 1326485744802),
(338, 1, 2, 0, 1326485744926),
(339, 1, 2, 0, 1326485744977),
(340, 1, 2, 0, 1326485745095),
(341, 1, 2, 0, 1326485745200),
(342, 1, 2, 0, 1326485745332),
(343, 1, 2, 0, 1326485745564),
(344, 1, 2, 0, 1326485745755),
(345, 1, 2, 0, 1326485745956),
(346, 1, 2, 0, 1326485746012),
(347, 1, 2, 0, 1326485746077),
(348, 1, 2, 0, 1326485746288),
(349, 1, 2, 0, 1326485746653),
(350, 1, 2, 0, 1326485746868),
(351, 1, 2, 0, 1326485747296),
(352, 1, 2, 0, 1326485747476),
(353, 1, 2, 0, 1326485747935),
(354, 1, 2, 0, 1326485747979),
(355, 1, 2, 0, 1326485748057),
(356, 1, 2, 0, 1326485748119),
(357, 1, 2, 0, 1326485748270),
(358, 1, 2, 0, 1326485748316),
(359, 1, 2, 0, 1326485748421),
(360, 1, 2, 0, 1326485748460),
(361, 1, 2, 0, 1326485748638),
(362, 1, 2, 0, 1326485748796),
(363, 1, 2, 0, 1326485748886),
(364, 1, 2, 0, 1326485748939),
(365, 1, 2, 0, 1326485749003),
(366, 1, 2, 0, 1326485749335),
(367, 1, 2, 0, 1326485749855),
(368, 1, 2, 0, 1326485749861),
(369, 1, 2, 0, 1326485750971),
(370, 1, 2, 0, 1326485751033),
(371, 1, 2, 0, 1326485751089),
(372, 1, 2, 0, 1326485751172),
(373, 1, 2, 0, 1326485751525),
(374, 1, 2, 0, 1326485752028),
(375, 1, 2, 0, 1326485752120),
(376, 1, 2, 0, 1326485752275),
(377, 1, 2, 0, 1326485752419),
(378, 1, 2, 0, 1326485752663),
(379, 1, 2, 0, 1326485752670),
(380, 1, 2, 0, 1326485753203),
(381, 1, 2, 0, 1326485753294),
(382, 1, 2, 0, 1326485753403),
(383, 1, 2, 0, 1326485753454),
(384, 1, 2, 0, 1326485753629),
(385, 1, 2, 0, 1326485753861),
(386, 1, 2, 0, 1326485753987),
(387, 1, 2, 0, 1326485755539),
(388, 1, 2, 0, 1326485756708),
(389, 1, 2, 0, 1326485759686),
(390, 1, 2, 0, 1326485759752),
(391, 1, 2, 0, 1326485760941),
(392, 1, 2, 0, 1326485762447),
(393, 1, 2, 0, 1326485763619),
(394, 1, 2, 0, 1326485763813),
(395, 1, 2, 0, 1326485763819),
(396, 1, 2, 0, 1326485764549),
(397, 1, 2, 0, 1326485764621),
(398, 1, 2, 0, 1326485764756),
(399, 1, 2, 0, 1326485764803),
(400, 1, 2, 0, 1326485764917),
(401, 1, 2, 0, 1326485765366),
(402, 1, 2, 0, 1326485765596),
(403, 1, 2, 0, 1326485766646),
(404, 1, 2, 0, 1326485766903),
(405, 1, 2, 0, 1326485768843),
(406, 1, 2, 0, 1326485768907),
(407, 1, 2, 0, 1326485769475),
(408, 1, 2, 0, 1326485769617),
(409, 1, 2, 0, 1326485769816),
(410, 1, 2, 0, 1326485769903),
(411, 1, 2, 0, 1326485771118),
(412, 1, 2, 0, 1326485771431),
(413, 1, 2, 0, 1326485773131),
(414, 1, 2, 0, 1326485773830),
(415, 1, 2, 0, 1326485773837),
(416, 1, 2, 0, 1326485775415),
(417, 1, 2, 0, 1326485775514),
(418, 1, 2, 0, 1326485775615),
(419, 1, 2, 0, 1326485775685),
(420, 1, 2, 0, 1326485775720),
(421, 1, 2, 0, 1326485775908),
(422, 1, 2, 0, 1326485776277),
(423, 1, 2, 0, 1326485776315),
(424, 1, 2, 0, 1326485777163),
(425, 1, 2, 0, 1326485777324),
(426, 1, 2, 0, 1326485777436),
(427, 1, 2, 0, 1326485777683),
(428, 1, 2, 0, 1326485777965),
(429, 1, 2, 0, 1326485778047),
(430, 1, 2, 0, 1326485778477),
(431, 1, 2, 0, 1326485778682),
(432, 1, 2, 0, 1326485779694),
(433, 1, 2, 0, 1326485780848),
(434, 1, 2, 0, 1326485781601),
(435, 1, 2, 0, 1326485781843),
(436, 1, 2, 0, 1326485782311),
(437, 1, 2, 0, 1326485782644),
(438, 1, 2, 0, 1326485783795),
(439, 1, 2, 0, 1326485784297),
(440, 1, 2, 0, 1326485784506),
(441, 1, 2, 0, 1326485784714),
(442, 1, 2, 0, 1326485784900),
(443, 1, 2, 0, 1326485785085),
(444, 1, 2, 0, 1326485785229),
(445, 1, 2, 0, 1326485786754),
(446, 1, 2, 0, 1326485787643),
(447, 1, 2, 0, 1326485788385),
(448, 1, 2, 0, 1326485788388),
(449, 1, 2, 0, 1326485788519),
(450, 1, 2, 0, 1326485788575),
(451, 1, 2, 0, 1326485788757),
(452, 1, 2, 0, 1326485788810),
(453, 1, 2, 0, 1326485788953),
(454, 1, 2, 0, 1326485788997),
(455, 1, 2, 0, 1326485789102),
(456, 1, 2, 0, 1326485789197),
(457, 1, 2, 0, 1326485789401),
(458, 1, 2, 0, 1326485789652),
(459, 1, 2, 0, 1326485789658),
(460, 1, 2, 0, 1326485789808),
(461, 1, 2, 0, 1326485789816),
(462, 1, 2, 0, 1326485793040),
(463, 1, 2, 2, 1326485794833),
(464, 1, 2, 0, 1326485902394),
(465, 1, 2, 0, 1326486011763),
(466, 1, 2, 2, 1326486012067),
(467, 1, 2, 0, 1326486201637),
(468, 1, 2, 0, 1326486229540),
(469, 1, 2, 2, 1326486230350),
(470, 1, 2, 0, 1326745794823),
(471, 1, 2, 2, 1326745795870),
(472, 4, 2, 2, 1326836974145),
(473, 4, 2, 0, 1326837452909),
(474, 4, 2, 0, 1326837453802);

-- --------------------------------------------------------

--
-- Table structure for table `problems`
--

CREATE TABLE IF NOT EXISTS `problems` (
  `problem_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `problem_type` int(11) NOT NULL,
  `testname` varchar(255) NOT NULL,
  `brief_description` varchar(60) NOT NULL,
  `description` varchar(255) NOT NULL,
  `when_assigned` bigint(20) NOT NULL,
  `when_due` bigint(20) NOT NULL,
  PRIMARY KEY (`problem_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `problems`
--

INSERT INTO `problems` (`problem_id`, `course_id`, `problem_type`, `testname`, `brief_description`, `description`, `when_assigned`, `when_due`) VALUES
(1, 1, 0, 'sq', 'Square a number', 'Write a method called "sq" that returns the square of an integer parameter.', 0, 0),
(2, 1, 3, 'addInts', 'read/add/print sum of integers', 'Read two integer values, and then print "answer: X" where X is the sum of the two integer values.', 1326485534072, 1326571934072);

-- --------------------------------------------------------

--
-- Table structure for table `submission_receipts`
--

CREATE TABLE IF NOT EXISTS `submission_receipts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `last_edit_event_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_id` (`event_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `submission_receipts`
--

INSERT INTO `submission_receipts` (`id`, `event_id`, `last_edit_event_id`, `status`) VALUES
(1, 309, 308, 0),
(3, 313, 312, 0),
(4, 315, 314, 3),
(5, 317, 316, 0),
(6, 319, 318, 0),
(7, 331, 330, 2),
(8, 332, -1, 4),
(9, 463, 462, 3),
(10, 466, 465, 3),
(11, 469, 468, 0),
(12, 471, 470, 0),
(13, 472, -1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE IF NOT EXISTS `terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `seq` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`id`, `name`, `seq`) VALUES
(1, 'Winter', 1),
(2, 'Spring', 2),
(3, 'Summer', 3),
(4, 'Summer I', 4),
(5, 'Summer II', 5),
(6, 'Fall', 6);

-- --------------------------------------------------------

--
-- Table structure for table `test_cases`
--

CREATE TABLE IF NOT EXISTS `test_cases` (
  `test_case_id` int(11) NOT NULL AUTO_INCREMENT,
  `problem_id` int(11) NOT NULL,
  `test_case_name` varchar(40) DEFAULT NULL,
  `input` varchar(255) NOT NULL,
  `output` varchar(255) NOT NULL,
  PRIMARY KEY (`test_case_id`),
  KEY `problem_id` (`problem_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `test_cases`
--

INSERT INTO `test_cases` (`test_case_id`, `problem_id`, `test_case_name`, `input`, `output`) VALUES
(2, 1, 'test1', '5', '25'),
(3, 1, 'test2', '-1', '1'),
(4, 1, 'test3', '9', '81'),
(5, 1, 'test4', '10', '100'),
(6, 2, 'fourPlusFive', '4 5', '^\\s*answer\\s*:\\s*(0*)9\\s*$');

-- --------------------------------------------------------

--
-- Table structure for table `test_results`
--

CREATE TABLE IF NOT EXISTS `test_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submission_receipt_id` int(11) NOT NULL,
  `test_outcome` int(11) NOT NULL,
  `message` varchar(100) NOT NULL,
  `stdout` varchar(200) NOT NULL,
  `stderr` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `submission_receipt_id` (`submission_receipt_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `test_results`
--

INSERT INTO `test_results` (`id`, `submission_receipt_id`, `test_outcome`, `message`, `stdout`, `stderr`) VALUES
(1, 0, 0, 'Passed! input=5, output=25', '', ''),
(2, 0, 0, 'Passed! input=-1, output=1', '', ''),
(3, 0, 0, 'Passed! input=9, output=81', '', ''),
(4, 0, 0, 'Passed! input=10, output=100', '', ''),
(5, 0, 0, 'Passed! input=5, output=25', '', ''),
(6, 0, 0, 'Passed! input=-1, output=1', '', ''),
(7, 0, 0, 'Passed! input=9, output=81', '', ''),
(8, 0, 0, 'Passed! input=10, output=100', '', ''),
(9, 0, 0, 'Passed! input=5, output=25', '', ''),
(10, 0, 0, 'Passed! input=-1, output=1', '', ''),
(11, 0, 0, 'Passed! input=9, output=81', '', ''),
(12, 0, 0, 'Passed! input=10, output=100', '', ''),
(13, 0, 0, 'Process finished', 'answer: 9\n', ''),
(14, 0, 0, 'Process finished', 'answer: 9\n', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `password_md5` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `salt` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_index` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=ucs2 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password_md5`, `salt`) VALUES
(1, 'user', '7be1cb12697d993266db952cde9456c6', '5011ffcedffe0a14'),
(2, 'dbabcock', 'a790a0c6ff0f9f89c482e827eb6a2873', '64c51d57faf2954c'),
(3, 'jmoscola', 'a790a0c6ff0f9f89c482e827eb6a2873', '64c51d57faf2954c'),
(4, 'dhovemey', 'a790a0c6ff0f9f89c482e827eb6a2873', '64c51d57faf2954c'),
(5, 'mmmiller', 'a790a0c6ff0f9f89c482e827eb6a2873', '64c51d57faf2954c');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
