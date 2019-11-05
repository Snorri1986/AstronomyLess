-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 05 2019 г., 22:39
-- Версия сервера: 10.1.29-MariaDB
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `solarsystem`
--

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckEmail` (IN `nu_mail` VARCHAR(30), OUT `res` VARCHAR(30))  BEGIN
select email
    into res
from users
where email = nu_mail;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getFlScores` (IN `lg` VARCHAR(50), OUT `ans` VARCHAR(100))  select 
concat('Welcome on board ',u.name,' ',u.surname,'. Your`s Scores is ',u.scores,'.')
      into ans
from users u
where u.email = lg$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRecipientMail` (OUT `answer` VARCHAR(30))  select mailbox into answer from mails
where type = 'mail_recipient'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSenderMail` (OUT `answer` VARCHAR(30))  select mailbox into answer 
from mails 
where type = 'mail_sender'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSenderPass` (OUT `answer` VARCHAR(30))  select password into answer from mails
where type = 'mail_sender'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUser` (IN `reg_email` VARCHAR(50) CHARSET utf8, IN `reg_password` VARCHAR(50) CHARSET utf8, OUT `flag` INT(1))  BEGIN
select COUNT(IFNULL(email,2))
    into flag
from users
where email = reg_email
and user_pass = reg_password
and is_activ = 'Y';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getYoungestLogin` (OUT `login` TEXT CHARSET utf8)  SELECT `email` into login
from `users`
where `lastlogin` in 
(
    select max(lastlogin) from `users`
)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `saveScores` (IN `urss` INT, IN `login` VARCHAR(50) CHARSET utf8)  update `users` set scores = urss + scores
where email = login$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SetLoginDate` (IN `lg` VARCHAR(50))  update users u set u.lastlogin =  CURRENT_TIMESTAMP()
where u.email = lg$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SetNewEvent` (IN `new_date` VARCHAR(30), IN `new_descr` VARCHAR(1000) CHARSET utf8)  INSERT INTO `events`(`event_date`, `description`) 
VALUES (new_date,new_descr)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SetNewLectionText` (IN `lection_num` VARCHAR(2) CHARSET utf8, IN `lec_txt` VARCHAR(255) CHARSET utf8)  UPDATE `lections` SET `buttonnum`= lection_num,
`lection_txt`= lec_txt WHERE `buttonnum`= lection_num$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SetNewNameButtonLection` (IN `n_name` VARCHAR(30) CHARSET utf8, IN `btn_num` VARCHAR(10) CHARSET utf8, IN `ln_num` VARCHAR(10) CHARSET utf8)  NO SQL
update lections_b set `name` = n_name
where `button_number` = btn_num
and `lesson_number` =  ln_num$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `setNewQuestion` (IN `id` INT, IN `q_text` TEXT CHARSET utf8, IN `l_num` INT)  update questions q set q.text = q_text
where q.id = id
and q.lesson_num = l_num$$

--
-- Функции
--
CREATE DEFINER=`root`@`localhost` FUNCTION `getCurrentDate` () RETURNS DATE BEGIN
DECLARE DAT DATE;
   SELECT CURRENT_DATE() INTO DAT;
RETURN DAT;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `events`
--

CREATE TABLE `events` (
  `event_date` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `events`
--

INSERT INTO `events` (`event_date`, `description`) VALUES
('2019-09-05', 'Apollo 11 was landed on the Moon'),
('2019-09-07', 'TESTOVICH'),
('2019-09-09', 'I love my kitty');

-- --------------------------------------------------------

--
-- Структура таблицы `iss`
--

CREATE TABLE `iss` (
  `weight` varchar(50) NOT NULL COMMENT 'weight of station',
  `length` varchar(50) NOT NULL COMMENT 'length of station',
  `orbital_speed` varchar(50) NOT NULL COMMENT 'orbital speed of station',
  `modulus` varchar(50) NOT NULL COMMENT 'name of station''s modules',
  `team` varchar(50) NOT NULL COMMENT 'name of mission members'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `iss_missions`
--

CREATE TABLE `iss_missions` (
  `mission_code` varchar(20) NOT NULL,
  `team_count` int(11) NOT NULL COMMENT 'count of members',
  `members_name` text NOT NULL COMMENT 'member''s name',
  `start_mission` varchar(100) NOT NULL,
  `end_mission` varchar(100) NOT NULL,
  `vehicle_arrive` text NOT NULL COMMENT 'shuttle/soyuz model',
  `vehicle_departure` text NOT NULL COMMENT 'shuttle/soyuz model'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `iss_missions`
--

INSERT INTO `iss_missions` (`mission_code`, `team_count`, `members_name`, `start_mission`, `end_mission`, `vehicle_arrive`, `vehicle_departure`) VALUES
('ISS-1-6', 3, 'William McMichael Shepherd(USA.ISS-1),Yurii Gydzenko(RUS.ISS-1),Sergey Krykalov(RUS.ISS-1),Yurii Usachov(RUS.ISS-2),Susan Jane Helms(USA.ISS-2),James Shelton Voss(USA.ISS-2),Frank Lee Culbertson Jr.(USA.ISS-3),Vladymyr Dezhurov(RUS.ISS-3),Mikhail Tyurov(RUS.ISS-3),Yurii Onufrienko(RUS.ISS-4),Daniel Wheeler Bursch(USA.ISS-4),Carl Erwin Walz(USA.ISS-4),Valerii Korzun(RUS.ISS-5),Segiy Treschov(RUS.ISS-5),Peggy Annette Whitson(USA.ISS-5),Kenneth Dwane \"Sox\" Bowersox(USA.ISS-6),Nikolay Budarin(RUS.ISS-6),Donald Roy Pettit(USA.ISS-6)', '31.10.2000', '04.05.2003', 'Soyuz TM31(ISS1),Discovery(STS-102.ISS2),Discovery(STS-105.ISS2),Discovery(STS-105.ISS2), Endeavour(STS-108.ISS-4),Endeavour(STS-111.ISS-5),Endeavour(STS-113.ISS-6)', 'Discovery(STS-102.ISS1),Discovery(STS-105.ISS2),Endeavour(STS-108.ISS-3),Endeavour(STS-114.ISS-4),Endeavour(STS-113.ISS-5)'),
('ISS-7-12', 2, 'Yuriy Malenchenko(RUS.ISS7),Edward Tsang «Ed» Lu(USA.ISS7),Colin Michael Foale(USA.ISS8),Aleksander Kareli(RUS.ISS8),Genadiy Padalka(RUS.IIS9),Edward Michael Fincke(USA,ISS9),Leroy Russel Chiao(USA.ISS10),Salizhan Sharipov(RUS.ISS10),Sergiy Krykalov(RUS.ISS11),John Lynch Phillips(USA.ISS11),William Surles McArthur, Jr(USA.ISS12),Valeriy Tokarev(RUS.ISS12)', '28.04.2003', '08.04.2006', 'Soyuz TMA-2(ISS7),Soyuz TMA-3(ISS8),Soyuz TMA-4(ISS9),Soyuz TMA-5(ISS10),Soyuz TMA-6(ISS11),Soyuz TMA-7(ISS12)', 'Soyuz TMA-2(ISS7),Soyuz TMA-3(ISS8),Soyuz TMA-4(ISS9),Soyuz TMA-5(ISS10),Soyuz TMA-6(ISS11),Soyuz TMA-7(ISS12)'),
('ISS-13-19', 3, 'Pavel Vinogradov(RUS.ISS13),Jeffrey Nels Williams(USA.ISS13),Thomas Arthur Reiter(GER,ISS13/14),Michael Eladio López-Alegría(USA.ISS14),Michail Turin(RUS.ISS14),Sunita «Suni» Lyn Williams(USA.ISS14/15),Fedor Yurchihin(RUS.ISS15),Oleh Kotov(RUS.ISS15),Clayton Conrad Anderson(USA.ISS15/16),Peggy Annette Whitson(USA.ISS16),Yuriy Malenchenko(RUS.ISS16),Daniel Michio Tani(USA.ISS16),Léopold Eyharts(FRA.ISS16),Garrett Erin Reisman(USA.ISS16/17),Serhiy Volkov(RUS.ISS17),Oleh Kononenko(RUS.ISS17),Gregory Errol Chamitoff(USA.ISS17/18),Edward Michael Fincke(USA.ISS18),Yuriy Lonchakov(RUS.ISS18),Sandra Hall Magnus(USA.ISS18),Koiti Vakata(JPN.ISS18/19/20),Gennadiy Padalka(RUS.ISS19),Michael Reed Barratt(USA.ISS19)', '30.03.2006', '26.03.2009', 'Soyuz TMA-8(ISS13),STS-121(ISS13),Soyuz TMA-9(ISS14),STS-116(ISS14),STS-117(ISS15),Soyuz TMA-9(ISS15),Soyuz TMA-11(ISS16),STS-120(IIS16),STS-122(ISS16),STS-123(ISS16),Soyuz TMA-12(ISS17),STS-124(ISS17),Soyuz TMA-13(ISS18),STS-126(ISS18),STS-119(ISS18),Soyuz TMA-14(ISS19)', 'Soyuz TMA-8(ISS13),STS-116(ISS13),Soyuz TMA-8(ISS14),STS-117(ISS14),Soyuz TMA-10(ISS15),STS-120(ISS15),Soyuz TMA-11(ISS16),STS-122(ISS16),STS-123(SS16),STS-124(ISS16),Soyuz TMA-12(ISS17),STS-126(ISS17),Soyuz TMA-13(ISS18),STS-119(ISS18),STS-127(ISS18),Soyuz TMA-14(ISS19)'),
('ISS-20-21', 2, 'Gennadiy Padalka(RUS.ISS20), Michael Reed Barratt(USA.ISS20),Timothy Lennart Kopra(USA.ISS20),Nicole Marie Passonno Stott(USA.ISS20),Jeffrey Nels Williams(USA.ISS21),Maksym Suraev(RUS.ISS22),Frank De Winne(BEL,ISS20/21),Roman Romanenko(RUS.ISS20/21),Robert Tersk(CAN,ISS20/21)', '27.05.2009', '30.09.2009', 'Soyuz TMA-15(ISS20),STS-127(ISS20),STS-128(ISS20),Soyuz TMA-15(ISS20)', 'Soyuz TMA-15(ISS20),STS-128(ISS20),STS-129(ISS20),Soyuz TMA-15(ISS21)');

-- --------------------------------------------------------

--
-- Структура таблицы `lections`
--

CREATE TABLE `lections` (
  `buttonnum` int(11) DEFAULT NULL COMMENT 'number of button',
  `lection_txt` text NOT NULL COMMENT 'text of lection'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `lections`
--

INSERT INTO `lections` (`buttonnum`, `lection_txt`) VALUES
(1, 'Dear,Mercury!!!'),
(2, 'Dear,Venus!!!'),
(3, 'Dear,Earth!!!'),
(4, 'About Mars'),
(5, 'About Jupiter'),
(6, 'About Saturn'),
(7, 'About Uranus'),
(8, 'About Neptune'),
(9, 'About Pluto');

-- --------------------------------------------------------

--
-- Структура таблицы `lections_b`
--

CREATE TABLE `lections_b` (
  `name` varchar(30) NOT NULL,
  `button_number` int(11) NOT NULL,
  `lesson_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `lections_b`
--

INSERT INTO `lections_b` (`name`, `button_number`, `lesson_number`) VALUES
('Mercury', 1, 0),
('Venus', 2, 0),
('Earth', 3, 0),
('Mars', 4, 0),
('Jupiter', 5, 0),
('Saturn', 6, 0),
('Uranus', 7, 0),
('Neptune', 8, 0),
('Pluto', 9, 0),
('Mercury-Redstone-3', 1, 1),
('Mercury-Redstone-4', 2, 1),
('Mercury-Atlas-6', 3, 1),
('Mercury-Atlas-7', 4, 1),
('Mercury-Atlas-8', 5, 1),
('Mercury-Atlas-9', 6, 1),
('Mercury-Redstone-2', 7, 1),
('Mercury-Atlas-5', 8, 1),
('Mercury-7-Team', 9, 1),
('Gemini 3 & 4', 1, 2),
('Gemini 5', 2, 2),
('Gemini 7', 3, 2),
('Gemini 6A', 4, 2),
('Gemini 8', 5, 2),
('Gemini 9A', 6, 2),
('Gemini 10', 7, 2),
('Gemini 11', 8, 2),
('Gemini 12', 9, 2),
('Preparation', 1, 3),
('Apollo 1', 2, 3),
('Apollo 4 5 6', 3, 3),
('Apollo 7 8', 4, 3),
('Apollo 9 10', 5, 3),
('Apollo 11', 6, 3),
('Apollo 12 13', 7, 3),
('Apollo 14 15', 8, 3),
('Apollo 16 17', 9, 3),
('Preparation', 1, 4),
('STS-1', 2, 4),
('STS-60', 3, 4),
('STS-31', 4, 4),
('STS-51-F', 5, 4),
('STS-88', 6, 4),
('STS-51-L', 7, 4),
('STS-107', 8, 4),
('STS-135', 9, 4),
('SL-1', 1, 5),
('SL-2', 2, 5),
('SL-3', 3, 5),
('SL-4', 4, 5),
('Building station', 1, 6),
('ISS-1-6', 2, 6),
('ISS-7-12', 3, 6),
('ISS-13-19', 4, 6),
('ISS-20-21', 5, 6),
('Regular Missions', 6, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `mails`
--

CREATE TABLE `mails` (
  `type` varchar(30) DEFAULT NULL COMMENT 'account type',
  `mailbox` varchar(30) DEFAULT NULL COMMENT 'user login',
  `password` varchar(30) DEFAULT NULL COMMENT 'user pass'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mail sender configuration';

--
-- Дамп данных таблицы `mails`
--

INSERT INTO `mails` (`type`, `mailbox`, `password`) VALUES
('mail_sender', 'astromailer2019@gmail.com', 'astro2019'),
('mail_recipient', 'dionisiy1986@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `planets`
--

CREATE TABLE `planets` (
  `Name` varchar(15) NOT NULL,
  `Weight` double NOT NULL,
  `Capacity` double NOT NULL,
  `Axis_period` int(11) NOT NULL,
  `Orbital_speed` int(11) NOT NULL,
  `Radius` double NOT NULL,
  `Distance` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1250 COMMENT='all planets';

--
-- Дамп данных таблицы `planets`
--

INSERT INTO `planets` (`Name`, `Weight`, `Capacity`, `Axis_period`, `Orbital_speed`, `Radius`, `Distance`) VALUES
('Mercury', 3.33022e23, 60830000000, 59, 47, 2439.7, 91600000),
('Venus', 4.8675e24, 938000000000, 243, 35, 6051.8, 41400000),
('Earth', 5.9726e24, 1083210000000, 1, 30, 6371, 0),
('Mars', 6.4171e23, 163180000000, 1, 24, 3389.5, 78300000),
('Jupiter', 1.8986e27, 1.43128e15, 1, 13, 69911, 628400000),
('Saturn', 5.6846e26, 827130000000000, 0, 10, 5232, 1277400000),
('Uranus', 8.6832e25, 68330000000000, 1, 7, 25362, 2721400000),
('Neptune', 1.0243e26, 62540000000000, 0, 5, 24622, 4347400000),
('Pluto', 1.303e22, 7000000000, -6, 5, 1188, 5700000000);

-- --------------------------------------------------------

--
-- Структура таблицы `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL COMMENT 'question id',
  `text` text NOT NULL COMMENT 'text of question',
  `lesson_num` int(11) NOT NULL COMMENT 'number of lesson'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `questions`
--

INSERT INTO `questions` (`id`, `text`, `lesson_num`) VALUES
(1, 'What the largest crater in Mercury planet?', 0),
(2, 'How many days need to Mercury for Sun rounding ?', 0),
(3, 'What is the name of the largest sea basin on Earth?', 0),
(4, 'What the name of  chemical element which makes Mars red planet ?', 0),
(5, 'How call orbital explorer which explores Jupiter on our days ?', 0),
(6, 'What is the geological structure of Saturn?', 0),
(7, 'What characteristic distinguishes Uranus from other planets in the solar system?', 0),
(8, 'Using what research methods did the planet Neptune be discovered?', 0),
(9, 'What is the largest satellite of Pluto, which forms a single magnetic field with the planet?', 0),
(10, 'What is the name of the largest hill on Mercury?', 0),
(11, 'Studying which climatic phenomena is of greatest interest to scientists in researching Venus?', 0),
(12, 'What is the largest mountain peak on Earth?', 0),
(13, 'What is the name of the desert, which resembles Mars in chemical composition?', 0),
(14, 'How many hours does Jupiter last?', 0),
(15, 'What is the length of Saturn\'s rings in kilometers?', 0),
(16, 'Which scientist first discovered Uranus with an optical telescope?', 0),
(17, 'What is the name of the automatic interplanetary station that flew over the planet Neptune?', 0),
(18, 'Which automatic interplanetary station did Pluto study?', 0),
(1, 'About Mercury-Redstone #1', 1),
(2, 'Mercury-Redstone-4 #1', 1),
(3, 'Mercury-Atlas-6 #1', 1),
(4, 'Mercury-Atlas-7 #1', 1),
(5, 'Mercury-Atlas-8 #1', 1),
(6, 'Mercury-Atlas-9 #1', 1),
(7, 'Mercury-Redstone-2 #1', 1),
(8, 'Mercury-Atlas-5 #1', 1),
(9, 'Mercury-7-Team #1', 1),
(10, 'Mercury-Redstone-3 #2', 1),
(11, 'Mercury-Redstone-4 #2', 1),
(12, 'Mercury-Atlas-6 #2', 1),
(13, 'Mercury-Atlas-7 #2', 1),
(14, 'Mercury-Atlas-8 #2', 1),
(15, 'Mercury-Atlas-9 #2', 1),
(16, 'Mercury-Redstone-2 #2', 1),
(17, 'Mercury-Atlas-5 #2', 1),
(18, 'Mercury-7-Team #2', 1),
(1, 'Gemini 3&4#1', 2),
(2, 'Gemini 5#1', 2),
(3, 'Gemini 7#1', 2),
(4, 'Gemini 6A#1', 2),
(5, 'Gemini 8#1', 2),
(6, 'Gemini 9A#1', 2),
(7, 'Gemini 10#1', 2),
(8, 'Gemini 11#1', 2),
(9, 'Gemini 12#1', 2),
(10, 'Gemini 3&4#2', 2),
(11, 'Gemini 5#2', 2),
(12, 'Gemini 7#2', 2),
(13, 'Gemini 6A#2', 2),
(14, 'Gemini 8#2', 2),
(15, 'Gemini 9A#2', 2),
(16, 'Gemini 10#2', 2),
(17, 'Gemini 11#2', 2),
(18, 'Gemini 12#2', 2),
(1, 'Preparation#1', 3),
(2, 'Apollo1#1', 3),
(3, 'Apollo4&5&6#1', 3),
(4, 'Apollo7&8#1', 3),
(5, 'Apollo9&10#1', 3),
(6, 'Apollo11#1', 3),
(7, 'Apollo12&13#1', 3),
(8, 'Apollo14&15#1', 3),
(9, 'Apollo16&17#1', 3),
(10, 'Preparation#2', 3),
(11, 'Apollo1#2', 3),
(12, 'Apollo4&5&6#2', 3),
(13, 'Apollo7&8#2', 3),
(14, 'Apollo9&10#2', 3),
(15, 'Apollo11#2', 3),
(16, 'Apollo12&13#2', 3),
(17, 'Apollo14&15#2', 3),
(18, 'Apollo16&17#2', 3),
(1, 'Preparation#1', 4),
(2, 'STS1#1', 4),
(3, 'STS60#1', 4),
(4, 'STS31#1', 4),
(5, 'STS51F#1', 4),
(6, 'STS88#1', 4),
(7, 'STS51L#1', 4),
(8, 'STS107#1', 4),
(9, 'STS135#1', 4),
(10, 'Preparation#2', 4),
(11, 'STS1#2', 4),
(12, 'STS60#2', 4),
(13, 'STS31#2', 4),
(14, 'STS51F#2', 4),
(15, 'STS88#2', 4),
(16, 'STS51L#2', 4),
(17, 'STS107#2', 4),
(18, 'STS135#2', 4),
(1, 'SL1#1', 5),
(2, 'SL2#1', 5),
(3, 'SL3#1', 5),
(4, 'SL4#1', 5),
(5, 'SL1#2', 5),
(6, 'SL2#2', 5),
(7, 'SL3#2', 5),
(8, 'SL4#2', 5),
(9, 'SL1#3', 5),
(10, 'SL2#3', 5),
(11, 'SL3#3', 5),
(12, 'SL4#3', 5),
(13, 'SL1#4', 5),
(14, 'SL2#4', 5),
(15, 'SL3#4', 5),
(16, 'SL4#4', 5),
(17, 'SL1#5', 5),
(18, 'SL2#5', 5),
(1, 'Building#1', 6),
(2, 'ISS1-6#1', 6),
(3, 'ISS7-12#1', 6),
(4, 'ISS13-19#1', 6),
(5, 'ISS20-21#1', 6),
(6, 'Regular#1', 6),
(7, 'Building#2', 6),
(8, 'ISS1-6#2', 6),
(9, 'ISS7-12#2', 6),
(10, 'Building#3', 6),
(11, 'ISS1-6#3', 6),
(12, 'ISS7-12#3', 6),
(13, 'ISS13-19#2', 6),
(14, 'ISS20-21#2', 6),
(15, 'Regular#2', 6),
(16, 'Building#4', 6),
(17, 'ISS1-6#4', 6),
(18, 'ISS7-12#4', 6);

-- --------------------------------------------------------

--
-- Структура таблицы `skylab`
--

CREATE TABLE `skylab` (
  `code` varchar(100) NOT NULL COMMENT 'mission code',
  `start_date` varchar(100) NOT NULL COMMENT 'mission start date',
  `end_date` varchar(100) NOT NULL COMMENT 'mission end date',
  `staff` varchar(255) NOT NULL COMMENT 'name of staff members',
  `init_vehicle` varchar(100) NOT NULL COMMENT 'rocket name',
  `time_duration` varchar(100) NOT NULL COMMENT 'time duration',
  `distance` varchar(100) NOT NULL COMMENT 'total distance'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `skylab`
--

INSERT INTO `skylab` (`code`, `start_date`, `end_date`, `staff`, `init_vehicle`, `time_duration`, `distance`) VALUES
('SL-1', '14.05.1973', '11.07.1979', '0', 'Saturn-5', 'N/A', 'N/A'),
('SL-2', '25.05.1973', '22.06.1973', 'Charles «Pete» Conrad, Jr.,Paul Joseph Weitz,Joseph Peter Kerwin', 'Saturn-1B', '28 d 0 h 49 min 49 sec', '18500000'),
('SL-3', '28.07.1973', '25.09.1973', 'Alan LaVern Bean, Jack Robert Lousma,Owen Kay Garriott', 'Saturn-1B', '59 d 1 h 9 min', '39400000'),
('SL-4', '16.11.1973', '08.02.1974', 'Gerald Paul Carr,William Reid Pogue,Edward George Gibson', 'Saturn-1B', '84 d 1 h 16 min', '55500000');

-- --------------------------------------------------------

--
-- Структура таблицы `sts`
--

CREATE TABLE `sts` (
  `mission_code` varchar(20) NOT NULL,
  `vehicle_name` varchar(100) NOT NULL COMMENT 'Orbiter name',
  `flight_number` int(11) NOT NULL COMMENT 'Mission count',
  `Launch_pad` varchar(100) NOT NULL COMMENT 'Launch pad',
  `start_date` varchar(50) NOT NULL COMMENT 'Mission start date',
  `landing_date` varchar(50) NOT NULL COMMENT 'Mission landing date',
  `flight_duration` varchar(100) NOT NULL COMMENT 'Mission duration',
  `turns_count` varchar(50) NOT NULL,
  `distance` varchar(50) NOT NULL,
  `orbit_altitude` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `sts`
--

INSERT INTO `sts` (`mission_code`, `vehicle_name`, `flight_number`, `Launch_pad`, `start_date`, `landing_date`, `flight_duration`, `turns_count`, `distance`, `orbit_altitude`) VALUES
('STS-1', 'Columbia', 1, 'KSC 39A', '12.04.1981', '14.04.1981', '2 d 6 hrs 20 min 53 sec', 'N/A', '1728000', '307'),
('ALT', 'Enterprice', 16, 'Boeing 747', '15.02.1977', '26.10.1977', 'N/A', 'N/A', 'N/A', 'N/A'),
('STS-60', 'Discovery', 60, 'KSC 39A', '03.02.1994', '11.02.1994', '8 d 7 hrs 9 min 2 sec', '131', '5535653', '354'),
('STS-31', 'Discovery', 31, 'KSC SP39-B', '24.04.1990', '29.04.1990', '5 d 1 hrs 16 min 6 sec', '80', '3326466', '611'),
('STS-51-F', 'Challenger', 19, 'KSC 39A', '29.07.1985', '06.08.1985', '7 d 22 hrs 45 min 26 sec', '127', '5284350', '320'),
('STS-88', 'Endeavour', 88, 'KSC 39A', '04.12.1998', '16.12.1998', '11 d 19 hrs 18 min 00 sec', '185', '7400000', 'N/A'),
('STS-51-L', 'Challenger', 25, 'KSC 39B', '28.01.1986', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
('STS-107', 'Columbia', 107, 'KSC 39A', '16.01.2003', '01.02.2003', '15 d 22 hrs 20 min 32 sec', '255', '1600000', '307'),
('STS-135', 'Atlantis', 135, 'KSC 39A', '08.07.2011', '21.07.2011', '12 d 18 hrs 28 min', 'N/A', 'N/A', '225');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL COMMENT 'counter',
  `name` varchar(30) NOT NULL COMMENT 'name',
  `surname` varchar(30) NOT NULL COMMENT 'surname',
  `email` varchar(30) NOT NULL COMMENT 'user email',
  `is_activ` varchar(1) NOT NULL DEFAULT 'Y' COMMENT 'user status',
  `user_pass` varchar(10) NOT NULL COMMENT 'user''s passphrase',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `scores` int(11) DEFAULT NULL,
  `lastlogin` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='site users and their attributes';

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `email`, `is_activ`, `user_pass`, `add_date`, `scores`, `lastlogin`) VALUES
(15, 'Denys', 'Shabelnyk', 'dionisiy1986@gmail.com', 'Y', '1234567890', '2018-11-21 20:33:34', 100, '2019-11-05 21:33:41');

-- --------------------------------------------------------

--
-- Структура таблицы `vehicles`
--

CREATE TABLE `vehicles` (
  `mission` varchar(100) NOT NULL,
  `rocket_name` varchar(100) NOT NULL,
  `height` double NOT NULL,
  `diameter` double NOT NULL,
  `mass` double NOT NULL,
  `stages` int(11) NOT NULL,
  `payload` double NOT NULL,
  `engines` int(11) NOT NULL,
  `thrust` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `vehicles`
--

INSERT INTO `vehicles` (`mission`, `rocket_name`, `height`, `diameter`, `mass`, `stages`, `payload`, `engines`, `thrust`) VALUES
('Mercury-Redstone-3', 'Redstone MRLV MR-7', 25, 2, 30000, 1, 2, 1, 350),
('Mercury-Redstone-4', 'Redstone MRLV MR-8', 25.41, 1.78, 30000, 1, 1.8, 1, 350),
('Mercury-Atlas-6', 'Atlas LV-3B 109-D', 28.7, 3, 120, 2, 1.36, 2, 1517),
('Mercury-Atlas-9', 'Atlas LV-3B 130-D', 28.7, 3, 120000, 2, 1.36, 2, 363.22),
('Mercury-Redstone-2', 'Redstone MRLV MR-2', 25.41, 1.78, 30, 1, 1.8, 1, 350),
('Mercury-Atlas-5', 'Atlas LV-3B 93-D', 28.7, 3, 120000, 1, 1, 2, 1.517),
('Gemini 3&4', 'Titan II GLV', 31.4, 3.05, 154000, 2, 3600, 2, 1900),
('Gemini 5', 'Titan II GLV GT-5', 31.4, 3.05, 154000, 2, 3600, 2, 1900),
('Gemini 7', 'Titan II GLV GT-7', 31.4, 3.05, 154000, 2, 3600, 2, 1900),
('Gemini 6A', 'Titan II GLV GT-6', 31.4, 3.05, 154000, 2, 3600, 2, 1900),
('Gemini 8', 'Titan II GLV GT-8', 31.4, 3.05, 154000, 2, 3600, 2, 1900),
('Gemini 9A', 'Titan II GLV GT-9', 31.4, 3.05, 154000, 2, 3600, 2, 1900),
('Gemini 10', 'Titan II GLV GT-10', 31.4, 3.05, 154000, 2, 3600, 2, 1900),
('Gemini 11', 'Titan II GLV GT-11', 31.4, 3.05, 154000, 2, 3600, 2, 1900),
('Gemini 12', 'Titan II GLV', 31.4, 3.05, 154000, 2, 3600, 2, 1900),
('Preparation', 'N/A', 0, 0, 0, 0, 0, 0, 0),
('Apollo1', 'Saturn 1B A204', 68, 6.6, 590000, 2, 180000, 8, 6700),
('Apollo 4&5&6', 'Saturn 5 SA-501', 110.6, 10.1, 2965000, 3, 140000, 11, 34343),
('Apollo 7&8', 'Saturn 1B AS-205', 68, 6.6, 590000, 2, 18000, 9, 7590),
('Apollo 9&10', 'Saturn-5 AS-504', 110.6, 10.1, 2965000, 3, 140000, 11, 34343),
('Apollo11', 'Saturn 5 SA-506', 110.6, 10.1, 3140000, 3, 140000, 11, 34343),
('Apollo 12&13', 'Saturn 5 SA-507', 110.6, 10.1, 295000, 3, 140000, 11, 34343),
('Apollo 14&15', 'Saturn 5 SA-509', 110.6, 10.1, 2290000, 3, 140000, 11, 1019.2),
('Apollo 16&17', 'Saturn 5 SA-511', 110.6, 10.1, 29655000, 3, 140000, 11, 5096),
('PreparationSTS', 'Enterprise', 0, 0, 0, 1, 0, 0, 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `events`
--
ALTER TABLE `events`
  ADD UNIQUE KEY `INDX_EVENT_DATE` (`event_date`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ind_email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'counter', AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
