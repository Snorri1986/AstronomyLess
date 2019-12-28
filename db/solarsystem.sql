-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 28 2019 г., 23:11
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `SetNewLectionText` (IN `lection_num` VARCHAR(2) CHARSET utf8, IN `lec_txt` TEXT CHARSET utf8)  UPDATE `lections` SET `buttonnum`= lection_num,
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
CREATE DEFINER=`root`@`localhost` FUNCTION `getCurrentDate` () RETURNS TEXT CHARSET utf8 BEGIN
DECLARE DAT TEXT;
   SELECT SUBSTRING(CURRENT_DATE(),6,6) INTO DAT;
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
('1921-07-18', 'John Herschel Glen Jr was born'),
('1923-03-12', 'Walter Marty Shirra Jr was born'),
('1924-03-01', 'Donald Kent Slayton was born'),
('1925-05-01', 'Malcolm Scott Carpenter was born'),
('1926-04-03', 'Virgil \'Gas\' Grissom was born'),
('1927-03-06', 'Leroy Gordon \'Gordo\' Cooper was born'),
('1932-11-18', 'Alan Shepard was born'),
('1960-12-09', 'Mercury-Redstone 3 with capsule Freedom 7 had rolled out to the lauch pad on Cape Canaveral.'),
('1961-01-31', 'Mercury-Redstone 2 with monkey Ham on the board was lifted off to Earth orbit'),
('1961-05-05', 'Mercury-Redstone 3 with Alan Shepard on board made first flight with USA human.'),
('1961-07-21', 'Mercury-Redstone 4 was litfed off'),
('1961-11-29', 'Mercury-Atlas 5 with monkey Enos was lifted off'),
('1962-02-20', 'Mercury-Atlas 6 was lifted off with John Glenn'),
('1962-05-24', 'Mercury-Atlas 7 was lifted off by astronaut Scott Carpenter'),
('1962-10-03', 'Mercury-Atlas 8 with Sigma 7 was lifted off by astronaut Walter Shirra'),
('1963-05-15', 'Mercury-Atlas 9 was lifted off by Gordon Cooper who piloted Faith 7 capsule'),
('1965-03-23', 'Gemini III was lifted off'),
('1965-06-01', 'Gemini IV was lifted off'),
('1965-08-26', 'Gemini V mission was liffted off.'),
('1965-12-04', 'Gemini VII with Jim Lowell and Frank Borman was lifted on space vehicle to the Earth orbit.'),
('1965-12-15', 'Gemini 6A was lifted off with Walter Schirra and Thomas Stafford on the board.'),
('1965-12-16', 'Gemini 6A was splashed down to the Earth surface successfully.'),
('1965-12-18', 'Gemini VII was successfully landed. All mission objectives was done.'),
('1966-03-16', 'Gemini VIII was lifted off with Nil Armstrong and David Scott on the board.'),
('1966-06-03', 'Gemini IXA has flowen after launch ATDA. Crew: Thomas Stafford and Eugene Cernan'),
('1966-09-12', 'Gemini XI was lifted on for make history with Pete Conrad and Richard Gordon on the board'),
('1966-09-15', 'Gemini XI was successfully landed using board computer'),
('1967-01-27', 'Apollo 1 Memorial Day: Command Pilot Virgil I. \"Gus\" Grissom, Senior Pilot Ed White,Pilot Roger B. Chaffee'),
('1968-01-22', 'Apollo 5 liftedoff'),
('1968-10-11', 'Apollo 7 was lifted of to the Earth orbit'),
('1968-12-21', 'Apollo 8 was lifted off to the Moon orbit'),
('1969-03-03', 'Start Apollo 9'),
('1969-05-18', 'Start Apollo 10'),
('1969-07-16', 'Apollo 11 was lifted off and got heading to the Moon'),
('1969-07-20', 'Apollo 11 was landed on the Moon'),
('1969-11-14', 'Apollo 12 was achieved Moon orbit'),
('1969-11-19', 'Apollo 12 was landed to the Moon'),
('1969-11-20', 'Surveyor3 was discovered by Apollo 12 crew'),
('1971-01-31', 'Apollo 14 was lifted off with Alan Shepard as commander on the board'),
('1971-02-09', 'Apollo 14 was successfully splashed down and executed all mission objectives on Pacific Ocean'),
('1971-07-26', 'Apollo 15 was started with David Scott on the board as commander'),
('1972-04-16', 'Apollo 16 was started from Kennedy Space Center in Florida '),
('1972-12-07', 'Apollo 17 was started with Eugene Cernan as commander on the board');

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
(9, 'About Pluto'),
(10, 'Mercury-Redstone 3, or Freedom 7, was the first United States human spaceflight, on May 5, 1961, piloted by astronaut AlanShepard. It was the first crewed flightof Project Mercury, the objective of which was to put an astronaut into orbit around the Earth and return him safely. Shepard\'s mission was a 15-minute suborbital \\flight with the primary objective of demonstrating his ability to withstand the high g-forces of launch and atmospheric re-entry. During the flight, Shepard observed the Earth and tested the capsule\'s attitude control system, turning the capsule around to face its blunt heat shield forward for atmospheric re-entry. He also tested the retrorockets which would return later missions from orbit, though the capsule did not have enough energy to remain in orbit. After re-entry, the capsule landed by parachute on the North Atlantic Ocean off the Bahamas. Shepard and the capsule were picked up by helicopter and brought to U.S. Navy aircraft carrier USS Lake Champlain. The Freedom 7 spacecraft, Mercury capsule #7, was delivered to Cape Canaveral on December 9, 1960. It had originally been expected that a mission could be launched soon after the spacecraft was available, but Capsule #7 turned out to require extensive development and testing work before it was deemed safe for flight. However, as it had been earmarked since the summer as the first crewed spacecraft, the decision was taken to delay the mission until this particular capsule was ready, with a tentative launch date of March 6, rather than use an alternative capsule. The booster originally intended for the flight, Redstone #3, had been delivered to the Cape in early December; however, it was then used on the MR-1A test flight on December 19.The replacement, Redstone #7, did not arrive at the Cape until late March; by this time, however, the mission had already been postponed to await the results of another test flight. The countdown began at 8:30 p.m. the previous night, with Shepard waking up and eating a breakfast of steak and eggs with toast, coffee, and orange juice (the steak and eggs breakfast would soon become a tradition for astronauts the morning of a launch). He entered the spacecraft at 5:15 am. ET, just over two hours before the planned 7:20 launch time. At 7:05 am, the launch was held for an hour to let cloud cover clear Ã¢?? good visibility would be essential for photographs of the Earth Ã¢?? and fix a power supply unit; shortly after the count restarted, another hold was called in order to reboot a computer at Goddard Space Flight Center. The count was eventually resumed, after slightly over two and a half hours of unplanned holds, and continued with no further faults. All of the delays resulted in Shepard lying on his back in the capsule for almost three hours, by which point he complained to the blockhouse crew that he had a severe need to urinate (because the mission would last under 20 minutes, nobody had thought to equip the Mercury with a urine collection device). The crew told him that this was impossible as they\'d have to set the White Room back up and waste considerable amounts of time removing the Mercury\'s heavily bolted hatch. An irate Shepard then announced that if he couldn\'t get out for a bathroom trip, he\'d simply urinate in his suit. When the blockhouse protested that that would short out the medical electrodes on his body, he told them to simply turn the power off. They complied, and Shepard emptied his bladder. Because of the position he was sitting in, the urine pooled somewhat underneath his back and with oxygen flowing through the spacesuit, he was soon dried out, and the countdown resumed. Mercury-Redstone 3 finally lifted off at 9:34 am. ET, watched by an estimated 45 million television viewers in the United States.[19] Shepard was subjected to a maximum acceleration of 6.3g just before the Redstone engine shut down, two minutes and 22 seconds after launch. Freedom 7\'s space-fixed velocity was 5,134 miles per hour (8,262 km/h), close to the planned value. Ten seconds later, the escape tower was jettisoned. At the three-minute mark, the automated attitude control system rotated Freedom 7 so the heat shield faced forward ready for re-entry Shepard was now able to take manual control of the spacecraft, and began testing whether he was able to adjust its orientation. The first thing he did was position the spacecraft to its retrofire attitude of 34 degrees pitch (nose of spacecraft pitched down 34 degrees). He then tested manual control of yaw, motion from left to right, and roll. When he took control of all three axes, he found that the spacecraft response was about the same as that of the Mercury simulator; however, he could not hear the jets firing, as he could on the ground, due to the levels of background noise The secondary objective was to make observations of the ground from the spacecraft; returning the spacecraft to automatic control, Shepard found that he was able to distinguish major land masses from clouds easily, and could make out coastlines, islands and major lakes, but had difficulty identifying cities. He had problems working with the spacecraft periscope Ã¢?? early Mercury capsules had a small periscope rather than a viewing window Ã¢?? and had to abandon an attempt to change optical filters on it after noticing that a pressure gauge on his wrist kept bumping the lever that would have activated the Launch Escape System. Although the escape tower was long gone and pressing on the lever probably wouldn\'t do anything, Shepard still didn\'t want to risk it in case something unexpected happened The flight lasted 15 minutes, 22 seconds and the spacecraft traveled 302 miles (486 km) from its launch point, ascending to 116.5 miles (187.5 km). Freedom 7 landed at these coordinates: 27.23Ã?Â°N 75.88Ã?Â°W. It reached a speed of 5,180 mph (8,340 km/h).[citation needed] Following the flight the spacecraft was examined by engineers and found to be in excellent shape, so much so that they decided it could have been safely used again in another launch. Given to the Smithsonian Institution by NASA, Freedom 7 was previously displayed at the U.S. Naval Academy in Annapolis, Maryland until 2012. Since 2012, it has been on display at the John F. Kennedy Library in Boston, Massachusetts.\r\n==================================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Mercury-Redstone_3\r\n=================================================================================='),
(11, 'Mercury-Redstone 4 was the second United States human spaceflight, on July 21, 1961. The suborbital Project Mercury flight was launched with a Mercury-Redstone Launch Vehicle, MRLV-8. The spacecraft, Mercury capsule #11, was nicknamed the Liberty Bell 7, and it was piloted by the astronaut Virgil \"Gus\" Grissom. The spaceflight lasted 15 minutes 30 seconds, it reached an altitude of more than 102.8 nautical miles (190.4 km), and it flew 262.5 nautical miles (486.2 km) downrange, landing in the Atlantic Ocean. The flight went as expected until just after splashdown, when the hatch cover, designed to release explosively in the event of an emergency, accidentally blew. Grissom was at risk of drowning, but he was recovered safely via a U.S. Navy helicopter. The spacecraft sank into the Atlantic, and it was not recovered until 1999. Liberty Bell 7 also had a new explosive hatch release. This would allow an astronaut to exit the spacecraft quickly in the event of an emergency. Emergency personnel could also trigger the explosive hatch from outside the spacecraft by pulling on an external lanyard. Both the pop-off hatch and the lanyard are standard features of ejection seats used in military aircraft, but in the Mercury design, the pilot still had to exit the craft himself, or be removed by emergency personnel. The original exit procedure was to climb out through the antenna compartment, after removing a small pressure bulkhead. This was a difficult and slow procedure. Removal of an injured or unconscious astronaut through the top hatch would be nearly impossible. The original side hatch was bolted shut with 70 bolts and covered with several spacecraft shingles, making it a slow process to open the original hatch. In January 1961, NASA\'s Director of the Space Task Group, Robert Gilruth, told Gus Grissom that he would be the primary pilot for Mercury 4. John Glenn was the backup pilot for the mission. Redstone launch vehicle MRLV-8 arrived at Cape Canaveral on June 8, 1961. A mission review on July 15, 1961, pronounced Redstone MRLV-8 and Mercury spacecraft #11 ready to go for the Mercury 4 mission. Also, on July 15, 1961, Gus Grissom announced he would name Mercury 4, Liberty Bell 7. Grissom said the name was an appropriate call-sign for the bell-shaped spacecraft. He also said the name was synonymous with \"freedom\". As a tribute to the original Liberty Bell, a \"crack\" was painted on the side of the spacecraft. The Mercury 4 mission was planned as a repeat of MR-3. It was to reach an apogee of 116 mi (187 km). The planned range was 299 mi (481 km). Grissom would experience a maximum acceleration of 6.33 g (62 m/s2) and deceleration of 10.96 g (107 m/s2). The launch of Liberty Bell 7 was first planned for July 16. The cloud cover was too thick and the launch was postponed until July 18. On July 18, it was again postponed due to weather. Both times, the pilot had not yet boarded the spacecraft. On July 19, 1961, Grissom was on board when the flight was delayed again due to weather. At that point, it had just 10 minutes 30 seconds to go before launch. On the morning of July 21, 1961, Gus Grissom entered the Liberty Bell 7 at 8:58 UTC and the 70 hatch bolts were put in place. At 45 minutes prior to the scheduled launch, a pad technician discovered that one of the hatch bolts was misaligned. During a 30-minute hold that was called, McDonnell and NASA Space Task Group engineers decided that the 69 remaining bolts should be sufficient to hold the hatch in place and blow it at the appropriate time. The misaligned bolt was not replaced. Liberty Bell 7 was launched at 12:20:36 UTC, July 21, 1961. After several unsuccessful attempts in 1992 and 1993, Oceaneering International, Inc. lifted the Liberty Bell 7 off the floor of the Atlantic Ocean and onto the deck of a recovery ship on July 20, 1999, the 30th anniversary of the Apollo 11 lunar landing. The team was led by Curt Newport and financed by the Discovery Channel. The spacecraft was found after a 14-year effort by Newport at a depth of nearly 16,000 ft (4,900 m),300 nmi (350 mi; 560 km) east-southeast of Cape Canaveral. Among the items found within were part of the flight gear and several Mercury head dimes which were taken to space to be souvenirs of the flight. After Liberty Bell 7 was secured on the deck of the recovery ship, the \"Ocean Project\", experts removed and disposed of an explosive device (SOFAR bomb) that was supposed to detonate in the event of the spacecraft\'s sinking, but which failed to explode.The spacecraft was then placed in a container filled with seawater to prevent further corrosion. The Cosmosphere, in Hutchinson, Kansas, disassembled and cleaned the spacecraft, and it was released for a national tour through September 15, 2006. The spacecraft was then returned to the Cosmosphere where it is on permanent display. In 2016, it was temporarily lent to The Children\'s Museum of Indianapolis\r\n==================================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Mercury-Redstone_4\r\n=================================================================================='),
(12, 'Mercury-Atlas 6 (MA-6) was the first American orbital spaceflight, which took place on February 20, 1962. Piloted by astronaut John Glenn and operated by NASA as part of Project Mercury, it was the fifth human spaceflight, preceded by Soviet orbital flights Vostok 1 and 2 and American sub-orbital flights Mercury-Redstone 3 and 4. The Mercury spacecraft, named Friendship 7, was carried to orbit by an Atlas LV-3B launch vehicle lifting off from Launch Complex 14 at Cape Canaveral, Florida. After three orbits, the spacecraft re-entered the Earth\'s atmosphere, splashed down in the North Atlantic Ocean, and was safely taken aboard USS Noa. Total mission flight time was four hours 55 minutes and 23 seconds. The launch date was first announced as January 16, 1962, then postponed to January 20 because of problems with the Atlas rocket fuel tanks. The launch then slipped day by day to January 27 due to unfavorable winter weather. On that day, Glenn was on board Mercury 6 and ready to launch, when, at T-29 minutes, the flight director called off the launch because of thick clouds that would have made it impossible to photograph or film the launch vehicle after the first 20 seconds of the mission (the inability of launch crews to film the failed Mercury-Atlas 1 launch 16 months earlier had proven the importance of flying only in clear skies). A large crowd of reporters gathered at Cape Canaveral for the launch went home disappointed. Mission Director Walter Williams felt a sense of relief at the bad weather, as there was still a general sense that the spacecraft and booster were not ready to fly yet. NASA informed the anxious public that the mission would take time to get ready since crewed launches required a high degree of preparation and safety standards. The launch was postponed until February 1, 1962. When technicians began to fuel the Atlas on January 30, they discovered a fuel leak had soaked an internal insulation blanket between the RP-1 and LOX tanks. This caused a two-week delay while necessary repairs were made. On February 14, the launch was again postponed due to weather. Finally on February 18, the weather started to break. It appeared that February 20, 1962 would be a favorable day to attempt a launch. After the tower was jettisoned, the Atlas and spacecraft pitched over still further, giving Glenn his first view of the horizon. He described the view as \"a beautiful sight, looking eastward across the Atlantic\". Vibration increased as the last of the fuel supply was used up. Booster performance had been nearly flawless through the entire powered flight. At sustainer engine cut-off it was found that the Atlas had accelerated the capsule to a speed only 7 ft/s (2 m/s) below nominal. At 14:52 UTC, Friendship 7 was in orbit. Glenn received word that the Atlas had boosted the MA-6 into a trajectory that would stay up for at least seven orbits. Meanwhile, computers at the Goddard Space Flight Center in Maryland indicated that the MA-6 orbital parameters appeared good enough for almost 100 orbits Philip Kaufman\'s 1983 film The Right Stuff includes a dramatization of the Friendship 7 mission in which Ed Harris plays Glenn. The sequence depicts the spacecraft\'s three orbits and Glenn\'s responses to what he saw, sometimes quoted verbatim, as well as the concerns over the heat shield during reentry. The mysterious \"fireflies\" are also shown, but their true explanation is not revealed; instead they are depicted as magical protection summoned by Australian Aborigines at the Muchea Tracking Station.\r\n==================================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Mercury-Atlas_6\r\n=================================================================================='),
(13, 'Mercury-Atlas 7, launched May 24, 1962, was the fourth crewed flight of Project Mercury. The spacecraft, named Aurora 7, was piloted by astronaut Scott Carpenter. He was the sixth human to fly in space. The mission used Mercury spacecraft No. 18 and Atlas launch vehicle No. 107-D. The flight was for three Earth orbits, essentially a repeat of John Glenn\'s Mercury-Atlas 6. However, a targeting error during reentry took the spacecraft 250 miles (400 km) off-course, delaying recovery of Carpenter and the spacecraft for an hour. Carpenter was held responsible, at least in part, for the landing error. The focus of Carpenter\'s five-hour mission was scientific. The full flight plan included the first study of liquids in weightlessness, Earth photography, and an unsuccessful attempt to observe a flare fired from the ground. One of the experiments would include releasing a multi-colored balloon that would remain tethered to the capsule, observing the behavior of liquid in a weightless state inside a closed glass bottle, using a special light meter to determine the visibility of a ground flare, making weather photographs with hand-held cameras, and studying the airglow layer - for which Carpenter would receive special training. The tethered balloon was a 30-inch mylar inflatable sphere, which was folded, packaged, and housed with its gas expansion bottle in the antenna canister. The whole balloon package weighed two pounds. Divided into five sections of different colors - uncolored aluminum, yellow, orange, white, and a phosphorescent coating that appeared white by day and blue by night - the balloon was to be cast off near perigee after the first orbital pass to float freely at the end of a 100-foot nylon line. The purposes of the balloon experiment were to study the effects of space on the reflection properties of colored surfaces through visual observation and photographic studies and to obtain aerodynamic drag measurements by use of a strain gauge. Passing over Hawaii during the final orbit, flight director Kraft told Carpenter to begin his retrofire countdown and to shift from manual control to the automatic attitude control. Partly because he had been distracted watching the fireflies Carpenter noted that he had begun his landing preparations late. As he started to align the spacecraft he found that the automatic stabilization system would not hold the required 34-degree pitch and zero-degree yaw attitude. While trying to determine the source of the trouble, he fell behind in his check of other items. When he hurriedly switched to the fly-by-wire control mode, he forgot to switch off the manual system. As a result, both systems were used redundantly together for 10 minutes, and fuel was wasted. In addition to the attitude error, Carpenter also activated the retrorockets three seconds late, adding another 15 miles or so to the trajectory error. Due to lack of fuel Carpenter overshot his planned reentry mark and splashed down 250 miles (400 km) from the target. After nearly an hour of frantic searching, Carpenter was located in an area northeast of Puerto Rico. The USS Farragut was the first ship to arrive at the spacecraft nearly forty minutes after splashdown had occurred. Two helicopters dispatched from the aircraft carrier USS Intrepid reached the scene and transported Astronaut Carpenter back to the Intrepid and over the next several hours the Farragut remained on the scene watching the spacecraft until the USS John R. Pierce arrived, which was equipped with special equipment enabling it to tow Aurora 7 to Roosevelt Roads Puerto Rico where it was then flown back to Cape Canaveral.Other than slight exhaustion, Carpenter was in good health and spirits and post-flight medical exams did not find any significant physical changes or anomalies. Kraft, however, was unhappy with the astronaut\'s performance due to his needlessly high expenditure of attitude control fuel, which resulted in reentry and landing taking place well off-course. As a result, Carpenter was sidelined for future missions. He left the space program in 1964 to participate in the Navy\'s SEALAB program. Aurora 7 is displayed at the Museum of Science and Industry in Chicago, Illinois\r\n==================================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Mercury-Atlas_7\r\n=================================================================================='),
(14, 'Mercury-Atlas 8 (MA-8) was the fifth United States crewed space mission, part of NASA\'s Mercury program. Astronaut Walter M. Schirra Jr., orbited the Earth six times in the Sigma 7 spacecraft on October 3, 1962, in a nine-hour flight focused mainly on technical evaluation rather than on scientific experimentation. This was the longest U.S. crewed orbital flight yet achieved in the Space Race, though well behind the several-day record set by the Soviet Vostok 3 earlier in the year. It confirmed the Mercury spacecraft\'s durability ahead of the one-day Mercury-Atlas 9 mission that followed in 1963. Schirra was awakened at 1:40 am ET on the morning of October 3, and after a hearty breakfastÃ¢??including a bluefish he had speared the day beforeÃ¢??and a brief physical he left for the launchpad at around 4 am. He entered the spacecraft at 4:41 am ET, where he found a steak sandwich left for him in the \'glove compartment\', and began the pre-launch checks. The launch countdown proceeded as planned until 6:15, when there was a 15-minute hold to allow the Canary Islands tracking station to repair a radar set.The countdown resumed at 6:30 and proceeded to booster ignition with no further delays. Liftoff proceeded smoothly, but there was a momentary clockwise roll transient at liftoff, which reached 7.83Ã?Â° per second and approached 80% of the required threshold to trigger the ASIS abort system.This was later identified as being due to a slight misalignment of the main engines and was kept under control by the booster\'s vernier thrusters. Sustainer engine thrust during the launch was slightly below normal and fuel consumption higher than normal due to a suspected leak in the sustainer fuel system. Around three and a half minutes into the flight, Deke Slayton, the capsule communicator, cut in to ask Schirra \"Are you a turtle today?\" Schirra, unfazed, announced that he was switching to the on-board voice recorder (rather than the broadcast radio circuit) to leave his answer; the mission communications transcript noted this as \"[correct answer recorded]\". The \"turtle club\" was a recurrent joke among the astronaut corps; on being challenged with this question, the correct response was \"you bet your sweet ass I am\", with a failure to give the password being punishable by buying a round of drinks. Schirra noted later that he \"wasn\'t ready for all the world to hear it\", and chose to use the on-board recorder to avoid saying the answer over the air. Because the Atlas was flying on a slightly lofted trajectory, the booster engines cut off 2 seconds earlier than planned, but the sustainer engine burned for about 10 seconds longer than intended, giving an extra 15 feet per second (4.6 m/s) of velocity and putting the spacecraft in a slightly higher orbit than planned.Initial analysis of the trajectory confirmed that the capsule could remain in a stable orbit for at least seven orbits, ensuring there would be no need for an early de-orbit. After separating from the Atlas booster, Schirra stabilized the spacecraft and slowly cartwheeled into the correct attitude; he deliberately kept the motion slow to conserve fuel, and was able to position the capsule using half a percent of his fuel reserves.He briefly tracked the spent booster, which was rotating slowly past, but made no attempt to move towards it. As the spacecraft moved across the Atlantic, he turned his attention to testing manual control of the spacecraft, which he found sloppy compared to the fly-by-wire system. Over Australia, Schirra watched for a flare launched from the ground, but it was occluded by clouds; he was, however, able to see lightning and the lit outline of Brisbane. Through the night pass over the Pacific, he tested the capsule\'s on-board periscope, though he found it difficult to use and quickly covered it up as soon as the sun rose. Crossing over Mexico, he reported that he was in \"chimp configuration\", with the capsule running entirely on automatic without any input from the pilot, and as he began his second orbit began testing a yaw maneuver using the Earth through the main window as a reference, rather than via the much-maligned periscope. On the second orbit, he confirmed the existence of Glenn\'s \"fireflies\", the shower of small bright particles first reported on MA-6, and during the night section practiced yaw manoeuvres using first the Moon and then known stars as reference points. The second proved difficult to work with, as the small windows of the Mercury capsule gave a very limited field of view, making it hard to identify constellations. Travelling across the Pacific, he again fell back into automatic flight, chatting with Gus Grissom at the Hawaiian tracking station about the qualities of the manual control system. As he began the third orbit, Schirra disconnected the spacecraft\'s gyroscopes, turned off part of the electrical power system, and let the capsule drift. He took advantage of this quiet period to test his spatial awareness and motor control, which he found was broadly unaffected by weightlessness, and to eat a light meal. He powered the spacecraft back up over the Indian Ocean, and continued over the Pacific. At Hawaii, he was given clearance for a full six-orbit mission, and as he crossed over towards California shut down the electrical power for a second period of drifting flight, during which he occupied himself taking photographs with the onboard camera. The local recovery group in the prime target area, in the central Pacific, consisted of an aircraft carrier, USS Kearsarge, in the center of the landing area, with three destroyers strung out along the orbital path. Four search aircraft were also assigned to the area, and three recovery helicopters were based aboard Kearsarge. Kearsarge picked up the capsule on radar while still 200 miles (320 km) from landing; 90 miles (140 km) further up the landing path, the destroyer USS Renshaw reported a sonic boom as it passed overhead. At 40,000 feet (12,000 m), Schirra deployed the drogue parachute, and then the main parachute at 15,000 feet (4,600 m). The landing was surprisingly precise, 4.5 miles (7.2 km) from the target point and 0.5 miles (0.80 km) from Kearsarge, and Schirra joked that he was on course for the recovery carrier\'s \"number three elevator\". The capsule hit the water, submerged, and bobbed to the surface again, righting itself after about 30 seconds. Three pararescue swimmers were dropped by one of the helicopters to help him climb out, but Schirra radioed that he would prefer to be towed to the carrier, and a whaleboat from Kearsarge was sent with a line.\r\n==================================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Mercury-Atlas_8\r\n=================================================================================='),
(15, 'Mercury-Atlas 9 was the final crewed space mission of the U.S. Mercury program, launched on May 15, 1963 from Launch Complex 14 at Cape Canaveral, Florida. The spacecraft, named Faith 7, completed 22 Earth orbits before splashing down in the Pacific Ocean, piloted by astronaut Gordon Cooper, then a United States Air Force major. The Atlas rocket was No. 130-D, and the Mercury spacecraft was No. 20. This mission marks the last time an American was launched alone to conduct an entirely solo orbital mission. In November 1962, Gordon Cooper was chosen to pilot the MA-9 mission and Alan Shepard was picked as backup. On April 22, 1963, Atlas booster 130-D and Mercury spacecraft #20 were stacked on the launch pad at Launch Complex 14. Because MA-9 would orbit over nearly every part of the world from 32.5 degrees north to 32.5 degrees south, a total of 28 ships, 171 aircraft, and 18,000 servicemen were assigned to support the mission On the 19th orbit, the first sign of trouble appeared when the spacecraft 0.05 g (0.5 m/sÃ?Â²) light came on. However, this turned out to be a faulty indicator, and the spacecraft was not reentering. On the 20th orbit, Cooper lost all attitude readings. The 21st orbit saw a short-circuit occur in the bus bar serving the 250 volt main inverter. This left the automatic stabilization and control system without electric power. On the 21st orbit, John Glenn on board the tracking ship Coastal Sentry Quebec near KyÃ?Â«shÃ?Â«, Japan, helped Cooper prepare a revised checklist for retrofire. Due to the system malfunctions, many of the steps would have to be done manually. Only Hawaii and Zanzibar were in radio range on this last orbit, but communications were good. Cooper noted that the carbon dioxide level was rising in the cabin and in his spacesuit. He told Carpenter as he passed over Zanzibar, \"Things are beginning to stack up a little.\" Throughout the problems, Cooper remained cool, calm and collected. Cooper did not experience much of an appetite during the flight and ate only because it was scheduled. The food containers and water dispenser system proved unwieldy and he was not able to properly prepare freeze-dried food packages, so he limited his consumption to cubed food and bite-sized sandwiches. Cooper found the cubed food largely unpalatable, which contributed to his lack of eating. He had no difficulty urinating during the flight and the urine collection system worked well, although transferring urine to storage bags in the cramped capsule proved difficult. Cooper took several naps during the flight, lasting about an hour each. He experienced some discomfort from the pressure suit compressing his knees, which he alleviated by moving his feet slightly upward. An hour and 20 minutes before retrofire, Cooper took a dextroamphetamine tablet to ensure his alertness; he reported not feeling any sleepiness for the remainder of the flight. At the end of the 21st orbit, Cooper again contacted Glenn on the Coastal Sentry Quebec. He reported the spacecraft was in retro attitude and holding manually. The checklist was complete. Glenn gave a ten-second countdown to retrofire. Cooper kept the spacecraft aligned at a 34Ã?Â° pitchdown angle and manually fired the retrorockets on \"Mark!\". Cooper had drawn lines on the window to stay aligned with constellations as he flew the craft. He later said he used his wristwatch to time the burn and his eyes to maintain attitude. The crew of USS Kearsarge spells out \"MERCURY 9\" on the flight deck while underway to the recovery area Fifteen minutes later Faith 7 landed just four miles (6 km) from the prime recovery ship, the carrier USS Kearsarge. This was the most accurate landing to date, despite the lack of automatic controls. Faith 7 landed 70 nautical miles (130 km) southeast of Midway Island, in the Pacific Ocean.This would be near 27Ã?Â°30Ã¢?Â²N 176Ã?Â°15Ã¢?Â²W. Splashdown was at 34 hours 19 minutes 49 seconds after liftoff. The spacecraft tipped over in the water momentarily, then righted itself. Helicopters dropped rescue swimmers and relayed Cooper\'s request of an Air Force officer for permission to be hoisted aboard the Navy\'s carrier. Permission was granted. Forty minutes later the explosive hatch blew open on the deck of the Kearsarge. Cooper stepped out of Faith 7 to a warm greeting. Postflight medical examination of Cooper found that he was slightly dehydrated and experienced a degree of orthostatic hypotension from being seated in the capsule an entire day, but other than that no significant effects from the flight were noted. After the MA-9 mission, there was another debate about whether to fly one more Mercury flight, Mercury-Atlas 10 (MA-10). It was proposed as a three-day, 48-orbit mission to be flown by Alan Shepard in October 1963. In the end, NASA officials decided it was time to move on to Project Gemini and MA-10 never flew. The Mercury program had fulfilled all of its goals.\r\n==================================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Mercury-Atlas_9\r\n=================================================================================='),
(16, 'Mercury-Redstone 2 (MR-2) was the penultimate test flight of the Mercury-Redstone Launch Vehicle prior to the first manned American space mission in Project Mercury. It was launched at 16:55 UTC on January 31, 1961 from LC-5 at Cape Canaveral, Florida. Mercury spacecraft No. 5 carried a chimpanzee named Ham on a suborbital flight, landing in the Atlantic Ocean 16 minutes and 39 seconds after launch. At 16:55 UTC the MR-2 lifted off. Computers reported one minute after launch, the flight path angle was at least one degree too high and rising. At two minutes, the computers predicted a 17 g (167 m/sÃ?Â²) acceleration. At 2 minutes 17 seconds into the flight, the Redstone\'s liquid oxygen (LOX) fuel was depleted. The closed-loop abort system sensed a change in engine chamber pressure when the LOX supply was depleted and fired the launch escape system. The abort signaled a Mayday message to the recovery forces. The high flight angle, and the early abort, caused the maximum velocity of the spacecraft to be 7,540 ft/s (2,298 m/s) instead of the planned 6,465 ft/s (1,970 m/s). The retrorockets had been jettisoned during the abort and therefore could not be used to slow down the spacecraft. All of this added up to an overshoot of the planned landing area by 130 miles (209 km) and an apogee of 157 miles (253 km) instead of 115 miles (185 km). Another problem occurred at 2 minutes and 18 seconds into the flight, when cabin pressure dropped from 5.5 to 1 lb/inÃ?Â² (38 to 7 kPa). This malfunction was traced later to the air inlet snorkel valve. Vibrations had loosened a pin in the snorkel valve and allowed the valve to open. Ham was safe in his own couch spacesuit and did not suffer any ill effects from the loss of cabin pressure. His couch spacesuit pressure remained normal, and suit temperature stayed well within the 60 to 80 degrees Fahrenheit (16 to 26 Ã?Â°C) optimum range. Because of over-acceleration of the launch vehicle and the boost from the escape rocket, a speed of 5,857 mph (9,426 km/h) was reached instead of the 4,400 mph (7,081 km/h) planned. At apogee Ham\'s spacecraft was 48 miles (77 km) farther downrange than planned. Ham was weightless for 6.6 minutes instead of the 4.9 minutes that were planned. The spacecraft landed 422 miles (679 km) downrange after a 16.5-minute flight. He received 14.7 g (144 m/sÃ?Â²) during reentry, almost 3 g (29 m/sÃ?Â²) greater than planned. Ham performed his tasks well, pushing levers about 50 times during the flight. Onboard cameras filming Ham\'s reaction to weightlessness showed a surprising amount of dust and debris floating around inside the capsule during apogee. The spacecraft splashed down about 12:12 pm. EST, out of sight from recovery forces. About 12 minutes later, the first recovery signal was received from the spacecraft. Tracking showed it was about 60 miles (96 km) from the nearest recovery ship. Twenty-seven minutes after landing, a search plane sighted the capsule floating upright in the Atlantic. The search plane requested that the Navy send its rescue helicopters from the closest ship carrying them.\r\n==================================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Mercury-Redstone_2\r\n=================================================================================='),
(17, 'Mercury-Atlas 5 was an American unmanned spaceflight of the Mercury program. It was launched on November 29, 1961, with Enos, a chimpanzee, aboard. The craft orbited the Earth twice and splashed down about 200 miles (320 km) south of Bermuda. The flight used Mercury capsule #9 and Atlas #93-D. On February 24, 1961, spacecraft # 9 arrived at Cape Canaveral. It took 40 weeks of preflight preparation. This was the longest preparation time in the Mercury program. The mission of spacecraft #9 kept changing. It was first configured for a suborbital instrumented flight, then for a suborbital chimpanzee flight, then a three-orbit instrumented mission, and finally for the orbital flight that Enos flew. MA-4\'s successful flight in September had renewed confidence in the Atlas\'s reliability, and although an Atlas E test carrying a monkey was lost in a launch failure that November, NASA officials assured the public that it was a different model of booster than the Atlas D used for the Mercury program and that that accident had no relevance here. Although MA-4 had performed well, there was still some concern about high vibration levels during the first 20 seconds of liftoff, so the autopilot on MA-5\'s booster was modified slightly to correct this problem. The spacecraft and Enos were both found to have survived the mission in good condition, although the chimp had removed all of the medical electrodes and the urine collection device from his body. On November 4, 1962, Enos died of dysentery caused by shigellosis, which was resistant to antibiotics of the time. He had been under constant observation for two months before his death. Pathologists at Holloman reported that they found no symptom that could be attributed or related to his space flight a year before. The Mercury spacecraft and Atlas booster had now been qualified to carry a human into orbit.\r\n================================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Mercury-Atlas_5\r\n================================================================================'),
(18, '1. Alan Shepard - Rear Admiral Alan Bartlett Shepard Jr. (November 18, 1923 â?? July 21, 1998) was an American astronaut, naval aviator, test pilot, and businessman. In 1961 he became the first American to travel into space, and in 1971 he walked on the Moon.\r\nShepard was diagnosed with leukemia in 1996 and died from complications of the disease in Pebble Beach, California, on July 21, 1998.He was the second astronaut who had walked on the Moon to die, Jim Irwin being the first, in 1991. Shepard\'s widow Louise resolved to cremate his remains and scatter the ashes, but she died from a heart attack on August 25, 1998, at 17:00, the time at which he had always called her. They had been married for 53 years. The family decided to cremate them both, and their ashes were scattered together by a Navy helicopter over Stillwater Cove, in front of their Pebble Beach home.\r\nSpace porgramm participation: Project Mercury, Apollo 14\r\n2. Virgil Ivan \"Gus\" Grissom  --  (April 3, 1926 â?? January 27, 1967) was one of the seven original National Aeronautics and Space Administration\'s Project Mercury astronauts, and the first of the Mercury Seven to die. He was also a Project Gemini and an Apollo program astronaut. Grissom was the second American to fly in space, and the first member of the NASA Astronaut Corps to fly in space twice. In addition, Grissom was a World War II and Korean War veteran, U.S. Air Force test pilot, and a mechanical engineer. He was a recipient of the Distinguished Flying Cross, and the Air Medal with an oak leaf cluster, a two-time recipient of the NASA Distinguished Service Medal, and, posthumously, the Congressional Space Medal of Honor.\r\nSpace porgramm participation: Project Mercury, Apollo 14 \r\nSpace porgramm participation: Project Mercury(Mecrury-Redstone 4), Gemini 3, Apollo 1\r\n3. Leroy Gordon \"Gordo\" Cooper Jr. (March 6, 1927 â?? October 4, 2004) was an American aerospace engineer, test pilot, United States Air Force pilot, and the youngest of the seven original astronauts in Project Mercury, the first human space program of the United States. Cooper learned to fly as a child, and after service in the United States Marine Corps during World War II, he was commissioned into the United States Air Force in 1949. After service as a fighter pilot, he qualified as a test pilot in 1956, and was selected as an astronaut in 1959.\r\nSpace porgramm participation: Mercurt-Atlas 5 and Gemini 5\r\n4. Walter Marty Schirra Jr. (/Ê?É?Ë?rË?É?Ë?/, March 12, 1923 â?? May 3, 2007) (Captain, USN, Ret.) was an American naval aviator and NASA astronaut. In 1959, he became one of the original seven astronauts chosen for Project Mercury, which was the United States\' first effort to put human beings into space. On October 3, 1962, he flew the six-orbit, nine-hour, Mercury-Atlas 8 mission, in a spacecraft he nicknamed Sigma 7. At the time of his mission in Sigma 7, Schirra became the fifth American and ninth human to travel into space. In the two-man Gemini program, he achieved the first space rendezvous, station-keeping his Gemini 6A spacecraft within 1 foot (30 cm) of the sister Gemini 7 spacecraft in December 1965. In October 1968, he commanded Apollo 7, an 11-day low Earth orbit shakedown test of the three-man Apollo Command/Service Module and the first crewed launch for the Apollo program.\r\nHe was the first astronaut to go into space three times, and the only astronaut to have flown in the Mercury, Gemini, and Apollo programs. In total, Schirra logged 295 hours and 15 minutes in space. After Apollo 7, he retired as a captain from the U.S. Navy as well as from NASA, subsequently becoming a consultant to CBS News in the network\'s coverage of following Apollo flights. Schirra joined Walter Cronkite as co-anchor for all seven of NASA\'s Moon landing missions.\r\nSpace porgramm participation: Apollo 7, Gemini 6A, Mercury - Atlas 6\r\n5. Donald Kent \"Deke\" Slayton (March 1, 1924 â?? June 13, 1993) was an American World War II pilot, aeronautical engineer, and test pilot who was selected as one of the original NASA Mercury Seven astronauts, and became NASA\'s first Chief of the Astronaut Office and Director of Flight Crew Operations, and was responsible for NASA crew assignments.\r\nSlayton joined the U.S. Army Air Corps during World War II, and flew in Europe and the Pacific. He left the Army after World War II, and later joined the Minnesota Air National Guard after working for Boeing as an aeronautical engineer. He joined the United States Air Force, and attended the Air Force Test Pilot School in 1955. In 1959, he applied to, and was selected as one of the Mercury Seven. He was scheduled to pilot the second U.S. crewed orbital spaceflight, but was grounded in 1962 by atrial fibrillation, an irregular heart rhythm. In March 1972, he was medically cleared to fly and was the docking module pilot of the 1975 Apolloâ??Soyuz Test Project (ASTP). He continued to work at NASA until 1982, and helped develop the Space Shuttle.\r\nSpace porgramm participation: Apollo - Soyuz\r\n6. John Herschel Glenn Jr. (July 18, 1921 â?? December 8, 2016) was a United States Marine Corps aviator, engineer, astronaut, businessman, and politician. He was the first American to orbit the Earth, circling it three times in 1962. Following his retirement from NASA, he served from 1974 to 1999 as a Democratic United States senator from Ohio, and in 1998 flew into space again at age 77.\r\nHe was one of the Mercury Seven, military test pilots selected in 1959 by NASA as the nation\'s first astronauts. On February 20, 1962, Glenn flew the Friendship 7 mission, becoming the first American to orbit the Earth, and the fifth person and third American in space. He received the NASA Distinguished Service Medal in 1962, the Congressional Space Medal of Honor in 1978, was inducted into the U.S. Astronaut Hall of Fame in 1990, and received the Presidential Medal of Freedom in 2012.\r\nSpace porgramm participation: Mercury-Atlas 6, STS-95\r\n7.Malcolm Scott Carpenter (May 1, 1925 â?? October 10, 2013) was an American naval officer and aviator, test pilot, aeronautical engineer, astronaut, and aquanaut. He was one of the Mercury Seven astronauts selected for NASA\'s Project Mercury in April 1959. Carpenter was the second American (after John Glenn) to orbit the Earth and the fourth American in space, after Alan Shepard, Gus Grissom, and Glenn.\r\nCarpenter was selected as one of the Mercury Seven astronauts. He was backup to Glenn during the latter\'s Mercury Atlas 6 orbital mission. Carpenter flew the next mission, Mercury-Atlas 7, in the spacecraft he named Aurora 7. Due to a series of malfunctions, the spacecraft landed 250 miles (400 km) downrange from its intended splashdown point, but both pilot and spacecraft were retrieved\r\nSpace porgramm participation: Mercury-Atlas 7\r\n'),
(19, 'Gemini 3 was the first crewed mission in NASA\'s Gemini program. On March 23, 1965, astronauts Gus Grissom and John Young flew three low Earth orbits in their spacecraft, which they nicknamed Molly Brown. This was the ninth crewed US spaceflight (including two X-15 flights over 100 kilometers), and the 17th world human spaceflight including eight Soviet flights. It was also the final crewed flight controlled from Cape Kennedy Air Force Station in Florida, before mission control functions were shifted to a new control center located at the newly opened Manned Spacecraft Center in Houston, Texas. The mission\'s primary goal was to test the new, maneuverable Gemini spacecraft. In space, the crew fired thrusters to change the shape of their orbit, shift their orbital plane slightly, and drop to a lower altitude. Other firsts were achieved on Gemini 3: two people flew aboard an American spacecraft (the Soviet Union launched a three-person crew on Voskhod 1 in 1964 and a two-person crew just a few days earlier on Voskhod 2, upstaging the two-person Gemini and three-person Apollo programs), and the first crewed reentry where the spacecraft was able to produce lift to change its touchdown point.\r\n==================================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Gemini_3\r\n================================================================================== \r\nGemini 4 (officially Gemini IV) was the second crewed spaceflight in NASA\'s Project Gemini, occurring in June 1965. It was the tenth crewed American spaceflight (including two X-15 flights at altitudes exceeding 100 kilometers (54 nmi)). Astronauts James McDivitt and Ed White circled the Earth 66 times in four days, making it the first US flight to approach the five-day flight of the Soviet Vostok 5. The highlight of the mission was the first space walk by an American, during which White floated free outside the spacecraft, tethered to it, for approximately 20 minutes. Both of these accomplishments helped the United States overcome the Soviet Union\'s early lead in the Space Race. The flight also included the first attempt to make a space rendezvous as McDivitt attempted to maneuver his craft close to the Titan II upper stage which launched it into orbit, but this was not successful. The flight was the first American flight to perform many scientific experiments in space, including use of a sextant to investigate the use of celestial navigation for lunar flight in the Apollo program. Gemini 4 would be the first multi-day space flight by the United States, designed to show that it was possible for humans to remain in space for extended lengths of time. The four-day, 66-orbit flight would approach but not break the five-day record set by the Soviet Vostok 5 in June 1963. Subsequent Gemini flights would be longer, to prove endurance exceeding the time required to fly to the Moon and back. A second objective was the first American extra-vehicular activity (EVA), known popularly as a \"space walk\".\r\n==================================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Gemini_4\r\n================================================================================== '),
(20, 'Gemini 5 (officially Gemini V) was a 1965 crewed spaceflight in NASA\'s Project Gemini. It was the third crewed Gemini flight, the eleventh crewed American spaceflight (including two X-15 flights above 100 kilometers (54 nmi)), and the nineteenth human spaceflight of all time. It was also the first time an American crewed space mission held the world record for duration, set on August 26, 1965, by breaking the Soviet Union\'s previous record set by Vostok 5 in 1963. This was the first NASA mission to have an insignia patch. After Gemini 3, NASA banned astronauts from naming their spacecraft. Cooper, having realized he had never been in a military organization without one, suggested a mission patch to symbolize the flight. NASA agreed, and the patches got the generic name of \"Cooper patch.\" Cooper chose the image of a covered wagon due to the pioneering nature of the flight. The slogan \"8 Days or Bust\" was emblazoned across the wagon, but NASA managers objected to this, feeling it placed too much emphasis on the mission length and not the experiments, and fearing the public might see the mission as a failure if it did not last the full duration. A piece of nylon cloth was sewn over the official slogan.\r\n==================================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Gemini_5\r\n==================================================================================');
INSERT INTO `lections` (`buttonnum`, `lection_txt`) VALUES
(21, 'Gemini 7 (officially Gemini VII) was a 1965 crewed spaceflight in NASA\'s Gemini program. It was the fourth crewed Gemini flight, the twelfth crewed American flight and the twentieth crewed spaceflight including Soviet flights and X-15 flights above the KÃ?Â¡rmÃ?Â¡n line. The crew of Frank Borman and Jim Lovell spent nearly 14 days in space, making a total of 206 orbits. Their spacecraft was the passive target for the first crewed space rendezvous performed by the crew of Gemini 6A. Lift off was on 04 December 1965. Gemini 7 was originally intended to fly after Gemini 6, but the original Gemini 6 mission was cancelled after the failure during launch of the Agena Target Vehicle with which it was meant to rendezvous and dock. The objective of rendezvous was so important, that it was decided to fly the alternate Gemini 6A mission concurrently with Gemini 7, using the latter as the rendezvous target. The original mission of Gemini 7 changed little with these new plans. It was always planned to be a long duration flight, investigating the effects of fourteen days in space on the human body. This doubled the length of time that anyone had been in space and stood as the longest spaceflight duration record for five years. This 14-day mission required NASA to solve some of the problems of long-duration space flight, such as stowage of waste (the crew had practiced stuffing waste paper behind their seats before the flight). Timing their workday to match that of the prime shift ground crews, both men worked and slept at the same time. Gemini 7 conducted twenty experiments, the most of any Gemini mission, including studies of nutrition in space. The astronauts also evaluated a lightweight spacesuit, the G5C, which proved uncomfortable when worn for a long time in the Gemini spacecraft\'s hot, cramped quarters. The high point of the mission came on the eleventh day with the rendezvous with Gemini 6A. Both astronauts, heeding the advice of Pete Conrad who had flown for eight days on Gemini 5, took books along to read. Gemini 7 held the record for the longest space flight until Soyuz 9 in June 1970, and was the longest crewed space flight in U.S. history until the Skylab 2 mission of May and June 1973.\r\n==================================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Gemini_7\r\n=================================================================================='),
(22, 'Gemini 6A (officially Gemini VI-A)[2] was a 1965 crewed United States spaceflight in NASA\'s Gemini program. The mission achieved the first crewed rendezvous with another spacecraft, its sister Gemini 7. Although the Soviet Union had twice previously launched simultaneous pairs of Vostok spacecraft, these established radio contact with each other, but they had no ability to adjust their orbits in order to rendezvous and came no closer than several kilometers of each other, while the Gemini 6 and 7 spacecraft came as close as one foot (30 cm) and could have docked had they been so equipped. The original Gemini 6 mission, scheduled for launch on October 25, 1965 at 12:41 pm EDT, had a planned mission duration of 46 hours 47 minutes, completing a total of 29 orbits. It was to land in the western Atlantic Ocean south of Bermuda. The mission was to include four dockings with the Agena Target Vehicle. The first docking was scheduled for five hours and forty minutes into the mission. The second was scheduled for seven hours and forty-five minutes, the third at nine hours and forty minutes, and the fourth and final docking at ten hours and five minutes into the mission. The final undocking would take place at 18 hours and 20 minutes into the mission. At 23 hours and 55 minutes into the mission, while the spacecraft passed over White Sands, New Mexico, the crew was to attempt to observe a laser beam originating from the ground. The retrorockets were scheduled to be fired at 46 hours and 10 minutes into the mission over the Pacific Ocean on the 29th orbit. Original mission plans also included the first live television coverage of the recovery of a US spacecraft at sea from the recovery ship, the US aircraft carrier Wasp. The Wasp was fitted with ground station equipment by ITT to relay live television, via the Intelsat I (nicknamed the \"Early Bird\") satellite. On October 25, 1965, Schirra and Stafford boarded their Gemini 6 craft to prepare for launch. Fifteen minutes later, the uncrewed Atlas-Agena target vehicle was launched. After a successful burn of the Atlas booster, the Agena\'s secondary engines fired to separate it from the Atlas. But immediately after the Agena\'s primary engine fired at the six-minute mark in its flight, telemetry was lost. A catastrophic failure apparently caused the vehicle to explode, as Range Safety was tracking multiple pieces of debris falling into the Atlantic Ocean. After 50 minutes, the Gemini launch was canceled. After reviewing the situation, NASA decided to launch an alternate Gemini 6A mission, eight days after the launch of Gemini 7, which was scheduled as a 14-day long-duration mission in December. Gemini 6A would perform the first rendezvous of two spacecraft in orbit, using Gemini 7 as the target, though they would not dock. The crews also discussed the possibility of Stafford performing an EVA from 6A to 7, swapping places with Gemini 7 pilot Jim Lovell, but the commander of Gemini 7, Frank Borman, objected, pointing out that it would require Lovell to wear an uncomfortable EVA suit on a long-duration mission. The first attempt to launch the 6A mission (second attempt for Gemini spacecraft No. 6) was on December 12, 1965 at 9:54 a.m. EST.\r\n=========================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Gemini_6A\r\n========================================================================='),
(23, 'Gemini 8 (officially Gemini VIII) was the sixth crewed spaceflight in NASA\'s Gemini program, launched March 16, 1966. It was the twelfth crewed American flight and the twenty-second crewed spaceflight of all time [including two X-15 flights higher than the KÃ?Â¡rmÃ?Â¡n Line at 100 kilometers (54 nautical miles; 62 miles; 328,084 feet)]. The mission conducted the first docking of two spacecraft in orbit, but suffered the first critical in-space system failure of a U.S. spacecraft which threatened the lives of the astronauts and required an immediate abort of the mission. The crew was returned to Earth safely. Gemini VIII was planned to be a three-day mission. After being launched into an 87-by-146-nautical-mile (161 by 270 km) orbit, on the fourth revolution it was to rendezvous and dock with an Agena target vehicle, which had been earlier launched into a 161-nautical-mile (298 km) circular orbit. This was to be the first space docking in history. Four separate dockings were planned. During the first docking, Pilot David Scott planned to perform an ambitious, two-hour-and-10-minute extra-vehicular activity (EVA), which would have been the first since Ed White\'s June 1965 spacewalk on Gemini IV. On a 25-foot (7.6 m) tether for one and a half revolutions around the Earth, Scott would have retrieved a nuclear emulsion radiation experiment from the front of the Gemini\'s spacecraft adapter, then activate a micrometeoroid experiment on the Agena. Then he was to move back to the Gemini and test a minimum-reaction power tool by loosening and tightening bolts on a work panel. During the EVA, after Armstrong undocked from the Agena, Scott was to don and test an Extravehicular Support Pack (ESP) stored at the back of the spacecraft adapter. This was a backpack with a self-contained oxygen supply, extra Freon propellant for his Hand Held Maneuvering Unit, and a 75-foot (23 m) extension to his tether. He would practice several maneuvers in formation with the Gemini and Agena vehicles (separated at distances up to 60 feet (18 m), in concert with Armstrong in the Gemini.[7] Scott never got to perform this EVA, due to the abort of the flight because of an emergency which occurred shortly after docking. The flight also carried an additional three scientific, four technological, and one medical experiment.\r\n========================================================================= \r\nMore information folowed by link:  https://en.wikipedia.org/wiki/Gemini_8\r\n========================================================================='),
(24, 'Gemini 9A (officially Gemini IX-A) was a 1966 crewed spaceflight in NASA\'s Gemini program. It was the seventh crewed Gemini flight, the 13th crewed American flight and the 23rd spaceflight of all time (includes X-15 flights over 100 kilometers (62 mi)). The original crew for Gemini 9, command pilot Elliot See and pilot Charles Bassett, were killed in a crash on February 28, 1966 while flying a T-38 jet trainer to the McDonnell Aircraft plant in St. Louis, Missouri to inspect their spacecraft. Their deaths promoted the backup crew, Thomas P. Stafford and Eugene Cernan, to the prime crew. The mission was renamed Gemini 9A after the original May 17 launch was scrubbed when the mission\'s Agena Target Vehicle was destroyed after a launch failure. The mission was flown June 3Ã¢??6, 1966, after launch of the backup Augmented Target Docking Adaptor (ATDA). Stafford and Cernan rendezvoused with the ATDA, but were unable to dock with it because the nose fairing failed to eject from the docking target due to a launch preparation error. Cernan performed a two-hour extravehicular activity, during which it was planned for him to demonstrate free flight in a self-contained rocket pack, the USAF Astronaut Maneuvering Unit. He was unable to accomplish this due to stress, fatigue, and overheating. The first mission objective was to dock with an Agena Target Vehicle, as had first been achieved on the Gemini 8 mission. Accomplishment was not possible because of a launch preparation error on the target vehicle. A second objective was a planned extravehicular activity (EVA), or \"space walk\", by the right-hand seat Pilot. The plan was for him to move to the rear of the spacecraft and strap himself into the Air Force\'s Astronaut Maneuvering Unit (AMU), a \'rocket pack\' which would allow the pilot controlled flight, independent of the capsule\'s life support system. Use of the AMU was not achieved due to Cernan experiencing high cardiac stress, overheating, and fatigue during EVA. A third objective was to carry out seven scientific experiments, including a medical experiment which measured the astronauts\' reactions to stress by measuring the intake and output of fluids before, during and after the flight\r\n==================================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Gemini_9A\r\n=================================================================================='),
(25, 'Gemini 10 (officially Gemini X) was a 1966 crewed spaceflight in NASA\'s Gemini program. It was the 8th crewed Gemini flight, the 16th crewed American flight, and the 24th spaceflight of all time (includes X-15 flights over 100 kilometers (54 nautical miles)). Gemini 10 was designed to achieve rendezvous and docking with an Agena Target Vehicle (ATV), and EVA. It was also planned to dock with the ATV from the Gemini 8 mission. This Agena\'s battery power had failed months earlier, and an approach and docking would demonstrate the ability to rendezvous with a passive object. It would be also the first mission to fire the Agena\'s own rocket, allowing them to reach higher orbits. Gemini 10 established that radiation at high altitude was not a problem. After docking with their Agena booster in low orbit, Young and Collins used it to climb temporarily to 412.4 nautical miles (763.8 km). After leaving the first Agena, they then rendezvoused with the derelict Agena left over from the aborted Gemini 8 flightÃ¢??thus executing the program\'s first double rendezvous. With no electricity on board the second Agena, the rendezvous was accomplished with eyes onlyÃ¢??no radar. After the rendezvous, Collins spacewalked over to the dormant Agena at the end of a 50-foot (15 m) tether, making him the first person to meet another spacecraft in orbit. Collins then retrieved a cosmic dust-collecting panel from the side of the Agena. As he was concentrating on keeping his tether clear of the Gemini and Agena, Collins\' Hasselblad camera worked itself free and drifted away, so he was unable to take photographs during the spacewalk. The last day of the mission was short and retrofire came at 70 hours and 10 minutes into the mission. They landed only 3.0 nautical miles (5.6 km) away from the intended landing site and were recovered by USS Guadalcanal. The Gemini 10 mission was supported by the following U.S. Department of Defense resources: 9,067 personnel, 78 aircraft and 13 ships.\r\n==================================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Gemini_10\r\n=================================================================================='),
(26, 'Gemini 11 (officially Gemini XI) was the ninth crewed spaceflight mission of NASA\'s Project Gemini, which flew from September 12 to 15, 1966. It was the 17th crewed American flight and the 25th spaceflight to that time (includes X-15 flights over 100 kilometers (54 nmi)). Astronauts Charles \"Pete\" Conrad Jr. and Richard F. Gordon Jr. performed the first-ever direct-ascent (first orbit) rendezvous with an Agena Target Vehicle, docking with it 1 hour 34 minutes after launch; used the Agena rocket engine to achieve a world-record high-apogee Earth orbit; and created a small amount of artificial gravity by spinning the two spacecraft connected by a tether. Gordon also performed two extra-vehicular activities for a total of 2 hours 41 minutes. Mission objectives: Perform a direct-ascent rendezvous with the Agena Target Vehicle on the first orbit in support of Project Apollo. This would simulate a Lunar Module rendezvous with the Command/Service Module after a lunar landing. Use the Agena rocket engine to put the combined craft in a high-apogee elliptical orbit. Perform two extra-vehicular activities. Demonstrate passive attitude stabilization of the two spacecraft connected by a tether and create artificial gravity by spinning the combined craft. Perform miscellaneous scientific experiments. Perform a computer-controlled atmospheric reentry to a precision splashdown point.\r\n==================================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Gemini_11\r\n=================================================================================='),
(27, 'Gemini 12 (officially Gemini XII) was a 1966 crewed spaceflight in NASA\'s Project Gemini. It was the 10th and final crewed Gemini flight, the 18th crewed American spaceflight, and the 26th spaceflight of all time, including X-15 flights over 100 kilometers (54 nmi). Commanded by Gemini VII veteran James A. Lovell, the flight featured three periods of extravehicular activity (EVA) by rookie Edwin \"Buzz\" Aldrin, lasting a total of 5 hours and 30 minutes. It also achieved the fifth rendezvous and fourth docking with an Agena target vehicle. Gemini XII marked a successful conclusion of the Gemini program, achieving the last of its goals by successfully demonstrating that astronauts can effectively work outside of spacecraft. This was instrumental in paving the way for the Apollo program to achieve its goal of landing a man on the Moon by the end of the 1960 At the completion of the previous Gemini flight, the program still had not demonstrated that an astronaut could work easily and efficiently outside the spacecraft. In preparation for Gemini XII new, improved restraints were added to the outside of the capsule, and a new techniqueÃ¢??underwater trainingÃ¢??was introduced, which would become a staple of future space-walk simulation. Aldrin\'s two-hour, 20-minute tethered space-walk, during which he photographed star fields, retrieved a micrometeorite collector and did other chores, at last demonstrated the feasibility of extravehicular activity. Two more stand-up EVAs also went smoothly, as did the by-now routine rendezvous and docking with an Agena which was done \"manually\" using the onboard computer and charts when a rendezvous radar failed. The climb to a higher orbit, however, was canceled because of a problem with the Agena booster. During orbital injection, the GATV engine experienced a drop in turbopump speed lasting about 2.5 seconds. After this, pump performance returned to normal. Telemetry data indicated erratic pump speeds, but engine performance did not reflect this. Ground controllers decided not to risk the planned orbital boost maneuver since the exact reason for the pump slowdown was unclear. Following Gemini 12\'s reentry and during the GATV\'s 63rd orbit, they attempted to fire the propulsion system, but a stuck fuel valve prevented engine start from occurring. It was suspected that a turbopump bearing failure caused the anomalous conditions during orbital injection, followed by heating and melting of pump components. The inability of ground controllers to start the engine during the 63rd orbit was possibly due to melted or loose debris blocking the fuel valve and preventing its operation. The telemetry data falsely reporting erratic pump speed was concluded to be debris being knocked around and affecting the data probes. Many documentaries[example needed] afterward largely credit the spacewalk innovations, including the underwater training, to Aldrin himself. Gemini 12 was designed to perform rendezvous and docking with the Agena target vehicle, to conduct three extra-vehicular activity (EVA) operations, to conduct a tethered stationkeeping exercise, to perform docked maneuvers using the Agena propulsion system to change orbit, and demonstrate an automatic reentry.\r\n==========================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Gemini_12\r\n=========================================================================='),
(28, 'The Apollo program, also known as Project Apollo, was the third United States human spaceflight program carried out by the National Aeronautics and Space Administration (NASA), which succeeded in landing the first humans on the Moon from 1969 to 1972. First conceived during Dwight D. Eisenhower\'s administration as a three-person spacecraft to follow the one-person Project Mercury which put the first Americans in space, Apollo was later dedicated to the national goal set by President John F. Kennedy of \"landing a man on the Moon by the end of this decade and returning him safely to the Earth\" in an address to Congress on May 25, 1961. It was the third US human spaceflight program to fly, preceded by the two-person Project Gemini conceived in 1961 to extend spaceflight capability in support of Apollo.\r\nKennedy\'s goal was accomplished on the Apollo 11 mission when astronauts Neil Armstrong and Buzz Aldrin landed their Apollo Lunar Module (LM) on July 20, 1969, and walked on the lunar surface, while Michael Collins remained in lunar orbit in the command and service module (CSM), and all three landed safely on Earth on July 24. Five subsequent Apollo missions also landed astronauts on the Moon, the last in December 1972. In these six spaceflights, twelve men walked on the Moon.\r\nThe Apollo program was conceived during the Eisenhower administration in early 1960, as a follow-up to Project Mercury. While the Mercury capsule could support only one astronaut on a limited Earth orbital mission, Apollo would carry three. Possible missions included ferrying crews to a space station, circumlunar flights, and eventual crewed lunar landings.\r\nThe program was named after Apollo, the Greek god of light, music, and the Sun, by NASA manager Abe Silverstein, who later said, \"I was naming the spacecraft like I\'d name my baby.\" Silverstein chose the name at home one evening, early in 1960, because he felt \"Apollo riding his chariot across the Sun was appropriate to the grand scale of the proposed program.\"\r\nIn July 1960, NASA Deputy Administrator Hugh L. Dryden announced the Apollo program to industry representatives at a series of Space Task Group conferences. Preliminary specifications were laid out for a spacecraft with a mission module cabin separate from the command module (piloting and reentry cabin), and a propulsion and equipment module. On August 30, a feasibility study competition was announced, and on October 25, three study contracts were awarded to General Dynamics/Convair, General Electric, and the Glenn L. Martin Company. Meanwhile, NASA performed its own in-house spacecraft design studies led by Maxime Faget, to serve as a gauge to judge and monitor the three industry designs.\r\nMore information set out by link:  https://en.wikipedia.org/wiki/Apollo_program'),
(29, 'Apollo 1, initially designated AS-204, was the first crewed mission of the United States Apollo program,[1] the undertaking to land the first men on the Moon. Planned as the first low Earth orbital test of the Apollo command and service module, to launch on February 21, 1967, the mission never flew; a cabin fire during a launch rehearsal test at Cape Kennedy Air Force Station Launch Complex 34 on January 27 killed all three crew membersâ??Command Pilot Virgil I. \"Gus\" Grissom, Senior Pilot Ed White, and Pilot Roger B. Chaffeeâ??and destroyed the command module (CM). The name Apollo 1, chosen by the crew, was made official by NASA in their honor after the fire.\r\nImmediately after the fire, NASA convened the Apollo 204 Accident Review Board to determine the cause of the fire, and both houses of the United States Congress conducted their own committee inquiries to oversee NASA\'s investigation. The ignition source of the fire was determined to be electrical, and the fire spread rapidly due to combustible nylon material, and the high pressure, pure oxygen cabin atmosphere. Rescue was prevented by the plug door hatch, which could not be opened against the internal pressure of the cabin. Because the rocket was unfueled, the test had not been considered hazardous, and emergency preparedness for it was poor.\r\nManned Apollo flights were suspended for 20 months while the command module\'s hazards were addressed. However, the development and uncrewed testing of the lunar module (LM) and Saturn V rocket continued. The Saturn IB launch vehicle for Apollo 1, SA-204, was used for the first LM test flight, Apollo 5. The first successful crewed Apollo mission was flown by Apollo 1\'s backup crew on Apollo 7 in October 1968.'),
(30, 'Apollo 4 (also known as AS-501) was the first uncrewed test flight of the Saturn V launch vehicle, the type used by the U.S. Apollo program to send the first astronauts to the Moon. The space vehicle was assembled in the Vertical Assembly Building, and was the first to be launched from Launch Complex 39 at the John F. Kennedy Space Center on Merritt Island, Florida, facilities built specially for the Saturn V.\r\nApollo 4 was an \"all-up\" test, meaning all rocket stages and spacecraft were fully functional on the initial flight, a first for NASA. It was the first time the S-IC first stage and S-II second stage flew. It also demonstrated the S-IVB third stage\'s first in-flight restart. The mission used a Block I command and service module (CSM) modified to test several key Block II revisions, including its heat shield at simulated lunar-return velocity and angle.\r\nOriginally planned for late 1966, the flight was delayed to November 9, 1967, largely due to development problems of the S-II stage encountered by North American Aviation, the manufacturer of the stage. Delay was also caused, to a lesser extent, by numerous wiring defects found by NASA in the Apollo spacecraft, also built by North American.\r\nThe mission was the first Apollo flight after the stand-down imposed after the Apollo 1 fire which killed the first Apollo crew. It was the first to use NASA\'s official Apollo numbering scheme established in April 1967, designated Apollo 4 because there had been three previous uncrewed Apollo/Saturn flights in 1966, using the Saturn IB launch vehicle.\r\nThe mission lasted almost nine hours, splashing down in the Pacific Ocean, achieving all mission goals. NASA deemed the mission a complete success, because it proved the Saturn V worked, an important step towards achieving the Apollo program\'s objective of landing astronauts on the Moon and bringing them back safely, before the end of the decade.\r\nApollo 5 (also known as AS-204), was the first uncrewed flight of the Apollo Lunar Module (LM), which would later carry astronauts to the lunar surface. It lifted off on January 22, 1968, with a Saturn IB rocket on an Earth-orbital flight.\r\nApollo 6 (also known as AS-502), launched on April 4, 1968, was the second A-type mission of the United States Apollo program, an uncrewed test of the Saturn V launch vehicle. It was also the final uncrewed Apollo test mission.\r\nThe objectives of the flight test were to demonstrate trans-lunar injection capability of the Saturn V with a simulated payload equal to about 80% of a full Apollo spacecraft, and to repeat demonstration of the command module\'s (CM) heat shield capability to withstand a lunar re-entry. The flight plan called for following trans-lunar injection with a direct return abort using the command and service module\'s (CSM) main engine, with a total flight time of about 10 hours.\r\nA phenomenon known as pogo oscillation damaged some of the Rocketdyne J-2 engines in the second and third stages by rupturing internal fuel lines, causing two second-stage engines to shut down early. The vehicle\'s onboard guidance system was able to compensate by burning the second and third stages longer, though the resulting parking orbit was more elliptical than planned. The damaged third-stage engine also failed to restart for trans-lunar injection. Flight controllers elected to repeat the flight profile of the previous Apollo 4 test, achieving a high orbit and high-speed return using the service module (SM) engine. Despite the engine failures, the flight provided NASA with enough confidence to use the Saturn V for crewed launches. Since Apollo 4 had already demonstrated S-IVB restart and tested the heat shield at full lunar re-entry velocity, a potential third uncrewed flight was cancelled.'),
(31, 'Apollo 7 was an October 1968 human spaceflight mission carried out by the United States. It was the first mission in the United States\' Apollo program to carry a crew into space. It was also the first U.S. spaceflight to carry astronauts since the flight of Gemini XII in November 1966. The AS-204 mission, also known as \"Apollo 1\", was intended to be the first crewed flight of the Apollo program. It was scheduled to launch in February 1967, but a fire in the cabin during a January 1967 test killed the crew. Crewed flights were then suspended for 21 months, while the cause of the accident was investigated and improvements made to the spacecraft and safety procedures, and uncrewed test flights of the Saturn V rocket and Apollo Lunar Module were made. Apollo 7 fulfilled Apollo 1\'s mission of testing the Apollo command and service module (CSM) in low Earth orbit.The Apollo 7 crew was commanded by Walter M. Schirra, with senior pilot / navigator Donn F. Eisele, and pilot / systems engineer R. Walter Cunningham. Official crew titles were made consistent with those that would be used for the crewed lunar landing missions: Eisele was Command Module Pilot and Cunningham was Lunar Module Pilot. Their mission was Apollo\'s \'C\' mission, an 11-day Earth-orbital test flight to check out the redesigned Block II CSM with a crew on board. It was the first time a Saturn IB vehicle put a crew into space; Apollo 7 was the first three-person American space mission, and the first to include a live TV broadcast from an American spacecraft. It was launched on October 11, 1968, from what was then known as Cape Kennedy Air Force Station, Florida. Despite tension between the crew and ground controllers, the mission was a complete technical success, giving NASA the confidence to send Apollo 8 into orbit around the Moon two months later. The flight would prove to be the final space flight for all of its three crew membersâ??and the only one for both Cunningham and Eiseleâ??when it splashed down in the Atlantic Ocean on October 22, 1968. It was also the only crewed launch from Launch Complex 34, as well as the last launch from the complex.\r\n===================================================\r\nRead more on https://en.wikipedia.org/wiki/Apollo_7\r\n===================================================\r\nApollo 8 was the first crewed spacecraft to leave low Earth orbit and the first to reach the Moon, orbit it, and return. Its three-astronaut crewâ??Frank Borman, James Lovell, and William Andersâ??were the first humans to fly to the Moon, to witness and photograph an Earthrise, and to escape the gravity of a celestial body.\r\nApollo 8 launched on December 21, 1968, and was the second crewed spaceflight mission flown in the United States Apollo space program after Apollo 7, which stayed in Earth orbit. Apollo 8 was the third flight and the first crewed launch of the Saturn V rocket, and was the first human spaceflight from the Kennedy Space Center, located adjacent to Cape Canaveral Air Force Station in Florida.\r\nOriginally planned as the second crewed Apollo Lunar Module and command module test, to be flown in an elliptical medium Earth orbit in early 1969, the mission profile was changed in August 1968 to a more ambitious command-module-only lunar orbital flight to be flown in December, as the lunar module was not yet ready to make its first flight. Astronaut Jim McDivitt\'s crew, who were training to fly the first lunar module flight in low Earth orbit, became the crew for the Apollo 9 mission, and Borman\'s crew were moved to the Apollo 8 mission. This left Borman\'s crew with two to three months\' less training and preparation time than originally planned, and replaced the planned lunar module training with translunar navigation training.\r\nApollo 8 took 68 hours (almost three days) to travel the distance to the Moon. The crew orbited the Moon ten times over the course of twenty hours, during which they made a Christmas Eve television broadcast in which they read the first ten verses from the Book of Genesis. At the time, the broadcast was the most watched TV program ever. Apollo 8\'s successful mission paved the way for Apollo 11 to fulfill U.S. president John F. Kennedy\'s goal of landing a man on the Moon before the end of the 1960s. The Apollo 8 astronauts returned to Earth on December 27, 1968, when their spacecraft splashed down in the northern Pacific Ocean. The crew members were named Time magazine\'s \"Men of the Year\" for 1968 upon their return.\r\n===================================================\r\nRead more on https://en.wikipedia.org/wiki/Apollo_8\r\n==================================================='),
(32, 'Apollo 9 was a March 1969 human spaceflight, the third in NASA\'s Apollo program. Flown in low Earth orbit, it was the second crewed Apollo mission that the United States launched via a Saturn V rocket, and was the first flight of the full Apollo spacecraft: the command and service module (CSM) with the Lunar Module (LM). The mission was flown to qualify the LM for lunar orbit operations in preparation for the first Moon landing by demonstrating its descent and ascent propulsion systems, showing that its crew could fly it independently, then rendezvous and dock with the CSM again, as would be required for the first crewed lunar landing. Other objectives of the flight included firing the LM descent engine to propel the spacecraft stack as a backup mode and use of the Portable Life Support System backpack outside of the LM cabin.\r\nThe three-person crew consisted of Commander James McDivitt, Command Module Pilot David Scott, and Lunar Module Pilot Rusty Schweickart. During the ten-day mission, they tested systems and procedures critical to landing on the Moon, including the LM engines, backpack life support systems, navigation systems and docking maneuvers.\r\nAfter launching on March 3, 1969, the crew performed the first crewed flight of a lunar module, the first docking and extraction of the same, one two-person spacewalk (EVA), and the second docking of two crewed spacecraftâ??two months after the Soviets performed a spacewalk crew transfer between Soyuz 4 and Soyuz 5. The mission concluded on March 13 and was a complete success. It proved the LM worthy of crewed spaceflight, setting the stage for the dress rehearsal for the lunar landing, Apollo 10, before the ultimate goal, landing on the Moon.\r\n========================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Apollo_9\r\n========================================================================\r\nApollo 10 was a May 1969 human spaceflight, the fourth crewed mission in the United States Apollo program, and the second (after Apollo 8) to orbit the Moon. It was the F mission: a \"dress rehearsal\" for the first Moon landing, testing all the components and procedures just short of actually landing. The Apollo Lunar Module (LM) was flown to a descent orbit within 8.4 nautical miles (15.6 km) of the lunar surface, at the point where powered descent for landing would normally begin. After orbiting the Moon 31 times Apollo 10 returned safely to Earth, and its success enabled the first actual landing (Apollo 11) just two months later.\r\nApollo 10 set the record for the highest speed attained by a crewed vehicle: 39,897 km/h (11.08 km/s or 24,791 mph) on May 26, 1969, during the return from the Moon.Apollo 10 and Apollo 11 were the only Apollo missions whose crew were all veterans of spaceflight. Thomas P. Stafford had flown on Gemini 6 and Gemini 9; John W. Young had flown on Gemini 3 and Gemini 10, and Eugene A. Cernan had flown with Stafford on Gemini 9.\r\n========================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Apollo_10\r\n========================================================================'),
(33, 'Apollo 11 was the spaceflight that first landed humans on the Moon. Commander Neil Armstrong and lunar module pilot Buzz Aldrin formed the American crew that landed the Apollo Lunar Module Eagle on July 20, 1969, at 20:17 UTC. Armstrong became the first person to step onto the lunar surface six hours and 39 minutes later on July 21 at 02:56 UTC; Aldrin joined him 19 minutes later. They spent about two and a quarter hours together outside the spacecraft, and they collected 47.5 pounds (21.5 kg) of lunar material to bring back to Earth. Command module pilot Michael Collins flew the Command Module Columbia alone in lunar orbit while they were on the Moon\'s surface. Armstrong and Aldrin spent 21 hours, 36 minutes on the lunar surface at a site they named Tranquility Base before lifting off to rejoin Columbia in lunar orbit.\r\nApollo 11 was launched by a Saturn V rocket from Kennedy Space Center on Merritt Island, Florida, on July 16 at 13:32 UTC, and it was the fifth crewed mission of NASA\'s Apollo program. The Apollo spacecraft had three parts: a command module (CM) with a cabin for the three astronauts, the only part that returned to Earth; a service module (SM), which supported the command module with propulsion, electrical power, oxygen, and water; and a lunar module (LM) that had two stagesâ??a descent stage for landing on the Moon and an ascent stage to place the astronauts back into lunar orbit.\r\nAfter being sent to the Moon by the Saturn V\'s third stage, the astronauts separated the spacecraft from it and traveled for three days until they entered lunar orbit. Armstrong and Aldrin then moved into Eagle and landed in the Sea of Tranquility on July 20. The astronauts used Eagle\'s ascent stage to lift off from the lunar surface and rejoin Collins in the command module. They jettisoned Eagle before they performed the maneuvers that propelled Columbia out of the last of its 30 lunar orbits onto a trajectory back to Earth. They returned to Earth and splashed down in the Pacific Ocean on July 24 after more than eight days in space.\r\nArmstrong\'s first step onto the lunar surface was broadcast on live TV to a worldwide audience. He described the event as \"one small step for [a] man, one giant leap for mankind.\"[a] Apollo 11 effectively ended the Space Race and fulfilled a national goal proposed in 1961 by President John F. Kennedy: \"before this decade is out, of landing a man on the Moon and returning him safely to the Earth.\"\r\n==========================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Apollo_11\r\n=========================================================================='),
(34, 'Apollo 12 was the sixth crewed flight in the United States Apollo program and the second to land on the Moon. It was launched on November 14, 1969, from the Kennedy Space Center, Florida, four months after Apollo 11. Commander Charles \"Pete\" Conrad and Apollo Lunar Module Pilot Alan L. Bean performed just over one day and seven hours of lunar surface activity while Command Module Pilot Richard F. Gordon remained in lunar orbit. The landing site for the mission was located in the southeastern portion of the Ocean of Storms.\r\nOn November 19 Conrad and Bean achieved a precise landing at their expected location within walking distance of the site of the Surveyor 3 robotic probe, which had landed on April 20, 1967. They carried the first color television camera to the lunar surface on an Apollo flight, but transmission was lost after Bean accidentally pointed the camera at the Sun and the camera\'s sensor was destroyed. On one of two moonwalks they visited Surveyor 3 and removed some parts for return to Earth.\r\nLunar Module Intrepid lifted off from the Moon on November 20 and docked with the command module, which then, after completing its 45th lunar orbit,traveled back to Earth. The Apollo 12 mission ended on November 24 with a successful splashdown.\r\n==========================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Apollo_12\r\n==========================================================================\r\nApollo 13 was the seventh crewed mission in the Apollo space program and the third meant to land on the Moon. The craft was launched from Kennedy Space Center on April 11, 1970, but the lunar landing was aborted after an oxygen tank in the service module (SM) failed two days into the mission. The crew instead looped around the Moon, and returned safely to Earth on April 17. The mission was commanded by Jim Lovell with Jack Swigert as command module pilot and Fred Haise as Lunar Module pilot. Swigert was a late replacement for Ken Mattingly, who was grounded after exposure to rubella.\r\nAccidental ignition of damaged wire insulation inside the oxygen tank as it was being routinely stirred caused it to fail, venting its contents to space. The SM soon lost all its oxygen, needed for breathing and for generating electrical power. Command module (CM) power had to be shut down to conserve its remaining resources for reentry, forcing the crew to transfer to the lunar module (LM) as a lifeboat. With the lunar landing canceled, mission controllers worked to bring the crew home alive.\r\nAlthough the LM was designed to support two men on the lunar surface for two days, Mission Control in Houston improvised new procedures so it could support three men for four days. The crew experienced great hardship caused by limited power, a chilly and wet cabin and a shortage of potable water. There was a critical need to adapt the CM\'s cartridges for the carbon dioxide removal system to work in the LM; the crew and mission controllers were successful in improvising a solution. The astronauts\' peril briefly renewed interest in the Apollo program, with tens of millions watching the splashdown in the South Pacific Ocean by television.\r\nAn investigative review board found fault with preflight testing of the oxygen tank and the fact that Teflon was placed inside it. The board recommended changes, including minimizing the use of potentially combustible items inside the tank; this was done for Apollo 14. The story of Apollo 13 has been dramatized several times, most notably in the 1995 film Apollo 13.\r\n==========================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Apollo_13\r\n=========================================================================='),
(35, 'Apollo 14 was the eighth crewed mission in the United States Apollo program, the third to land on the Moon, and the first to land in the lunar highlands. It was the last of the \"H missions,\" targeted landings with two-day stays on the Moon with two lunar EVAs, or moonwalks.\r\nCommander Alan Shepard, Command Module Pilot Stuart Roosa, and Lunar Module Pilot Edgar Mitchell launched on their nine-day mission on Sunday, January 31, 1971, at 4:03:02 p.m. EST. Liftoff was delayed forty minutes and two seconds, due to launch site weather restrictions, the first such delay in the Apollo program.\r\nShepard and Mitchell made their lunar landing on February 5 in the Fra Mauro highlands â?? originally the target of the aborted Apollo 13 mission. During the two lunar EVAs, 94.35 pounds (42.80 kg) of Moon rocks were collected, and several scientific experiments were performed. Shepard hit two golf balls on the lunar surface with a makeshift club he had brought with him. Shepard and Mitchell spent 33â??1â??2 hours on the Moon, with almost 9â??1â??2 hours of EVA.\r\nIn the aftermath of Apollo 13, several modifications had been made to the service module electrical power system to prevent a repeat of that accident, including a redesign of the oxygen tanks and the addition of a third tank. The launch had been scheduled for October 1, 1970, and was delayed about four months.\r\nWhile Shepard and Mitchell were on the surface, Roosa remained in lunar orbit aboard the command and service module Kittyhawk,performing scientific experiments and photographing the Moon, including the landing site of the future Apollo 16 mission. He took several hundred seeds on the mission, many of which were germinated on return, resulting in the so-called Moon trees.\r\nShepard and Mitchell successfully lifted Antares off the Moon to dock with the command module and, after a total of 34 lunar orbits, the ship was flown back to Earth where the three astronauts landed in the Pacific Ocean on February 9.\r\n==========================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Apollo_14\r\n==========================================================================\r\nApollo 15 was the ninth crewed mission in the United States\' Apollo program, and the fourth to land on the Moon. It was the first J mission, with a longer stay on the Moon and a greater focus on science than earlier landings. Apollo 15 saw the first use of the Lunar Roving Vehicle.\r\nThe mission began on July 26, 1971, and ended on August 7, the lunar surface exploration taking place between July 30 and August 2. Commander David Scott and Lunar Module Pilot James Irwin landed near Hadley Rille and explored the local area using the rover, allowing them to travel further from the lunar module than had been possible on previous missions. They spent 18â??1â??2 hours on the Moon\'s surface on extravehicular activity (EVA), and collected 170 pounds (77 kg) of surface material.\r\nAt the same time, Command Module Pilot Alfred Worden orbited the Moon, operating the sensors in the SIM bay of the service module. This suite of instruments collected data on the Moon and its environment using a panoramic camera, a gamma-ray spectrometer, a mapping camera, a laser altimeter, a mass spectrometer, and a lunar subsatellite deployed at the end of the moonwalks. The lunar module returned safely to the command module and, at the end of Apollo 15\'s 74th lunar orbit[18] the engine was fired for the journey home. During the return trip Worden performed the first spacewalk in deep space. The Apollo 15 mission splashed down safely on August 7 despite the loss of one of its three parachutes.\r\nThe mission accomplished its goals but was marred by negative publicity the following year when it emerged that the crew had carried unauthorized postal covers to the lunar surface, some of which were sold by a West German stamp dealer. The members of the crew were reprimanded for poor judgment, and did not fly in space again. Apollo 15 is also remembered for having found the Genesis Rock, and for Scott\'s use of a hammer and a feather to validate Galileo\'s theory that absent air resistance, objects drop at the same rate due to gravity.\r\n==========================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Apollo_15\r\n=========================================================================='),
(36, 'Apollo 16 was the tenth crewed mission in the United States Apollo space program, the fifth and second-to-last to land on the Moon, and the second to land in the lunar highlands.The second of Apollo\'s \"J missions,\" it was crewed by Commander John Young, Lunar Module Pilot Charles Duke and Command Module Pilot Ken Mattingly. Launched from the Kennedy Space Center in Florida at 12:54 PM EST on April 16, 1972, the mission lasted 11 days, 1 hour, and 51 minutes, and concluded at 2:45 p.m. EST on April 27.\r\nYoung and Duke spent 71 hoursâ??just under three daysâ??on the lunar surface, during which they conducted three extra-vehicular activities or moonwalks, totaling 20 hours and 14 minutes. The pair drove the Lunar Roving Vehicle (LRV), the second produced and used on the Moon, for 26.7 kilometers (16.6 mi). On the surface, Young and Duke collected 95.8 kilograms (211 lb) of lunar samples for return to Earth, while Command Module Pilot Ken Mattingly orbited in the command and service module (CSM) above to perform observations. Mattingly, staying with the command module, spent 126 hours and 64 revolutions in lunar orbit.[6] After Young and Duke rejoined Mattingly in lunar orbit, the crew released a subsatellite from the service module (SM). During the return trip to Earth, Mattingly performed a one-hour spacewalk to retrieve several film cassettes from the exterior of the service module.\r\nApollo 16\'s landing spot in the highlands was chosen to allow the astronauts to gather geologically older lunar material than the samples obtained in three of the first four Moon landings, which were in or near lunar maria (Apollo 14 landed in the Fra Mauro Highlands). Samples from the Descartes Formation and the Cayley Formation disproved a hypothesis that the formations were volcanic in origin.\r\n==========================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Apollo_16\r\n==========================================================================\r\nApollo 17 (December 7â??19, 1972) was the final mission of NASA\'s Apollo program; it remains the most recent time humans have travelled beyond low Earth orbit.Its crew consisted of Commander Eugene Cernan, Lunar Module Pilot Harrison Schmitt, and Command Module Pilot Ronald Evans, and it carried a biological experiment containing five mice.\r\nLaunched at 12:33 a.m. Eastern Standard Time (EST) on December 7, 1972, Apollo 17 was a \"J-type mission\" that included three days on the lunar surface, extended scientific capability, and the use of the third Lunar Roving Vehicle (LRV).\r\nCernan and Schmitt landed in the Taurusâ??Littrow valley and completed three moonwalks, taking lunar samples and deploying scientific instruments. The landing site had been chosen to further the mission\'s main goals: to sample lunar highland material older than Mare Imbrium, and to investigate the possibility of relatively recent volcanic activity.Evans remained in lunar orbit in the command and service module (CSM), taking scientific measurements and photographs.\r\nCernan, Evans, Schmitt, and the mice returned to Earth on December 19.\r\nApollo 17 was the first mission to have no one on board who had been a test pilot; X-15 test pilot Joe Engle lost the lunar module pilot assignment to Schmitt, a geologist.The mission included the first night launch of a U.S. human spaceflight and the final crewed launch of a Saturn V rocket. It was also the final use of Apollo hardware for its original purpose (extra Apollo spacecraft were later used in the Skylab and Apolloâ??Soyuz programs).\r\nThe mission broke several crewed spaceflight records: the longest Moon landing, longest total extravehicular activities (moonwalks),largest lunar sample, longest time in lunar orbit, and, at 75, most lunar orbits.\r\n==========================================================================\r\nMore information folowed by link: https://en.wikipedia.org/wiki/Apollo_17\r\n==========================================================================\r\n');
INSERT INTO `lections` (`buttonnum`, `lection_txt`) VALUES
(37, 'XXXXX'),
(38, 'XXXXX'),
(39, 'XXXXX'),
(40, 'XXXXX'),
(41, 'XXXXX'),
(42, 'XXXXX'),
(43, 'XXXXX'),
(44, 'XXXXX'),
(45, 'XXXXX'),
(46, 'XXXXX'),
(47, 'XXXXX'),
(48, 'XXXXX'),
(49, 'XXXXX'),
(50, 'XXXXX'),
(51, 'XXXXX'),
(52, 'XXXXX'),
(53, 'XXXXX'),
(54, 'XXXXX'),
(55, 'XXXXX');

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
(1, 'Who was the pilot of Freedom 7 ?', 1),
(2, 'How long Shepard\'s flight was delayed?', 1),
(3, 'Who was the pilot of Mercury-Redstone 4 spececraft ?', 1),
(4, 'When  the Liberty Bell capsule now ?', 1),
(5, 'Who was the mission Mercure-Atlas 6 flight director ?', 1),
(6, 'Which name had a ship saved John Glen\'s life after splahed down ?', 1),
(7, 'What name has vehicle rided by John Carpenter ?', 1),
(8, 'What name has country where John Carpenter has landed?', 1),
(9, 'How many times Walter M Schirra Jr was flowen arround Earth ?', 1),
(10, 'Who was the backup pilot of Gordon Cooper in mission ?', 1),
(11, 'How many orbits made Gordon Cooper during the flight?', 1),
(12, 'What was an animal took part on the flight?', 1),
(13, 'What was the name of launch pad in mission MR2 ?', 1),
(14, 'How called an animal on the mission ?', 1),
(15, 'How many days an animal spent on flight preparations ?', 1),
(16, 'How was old John Glenn when he made his last flight ?', 1),
(17, 'Who had been on the Moon from Mercury Seven ?', 1),
(18, 'Who was continue his career in Gemini project ?', 1),
(1, 'How was spacecraft and mission named by astronauts ?', 2),
(2, 'What was main target of the Gemini 4 mession ?', 2),
(3, 'What was the record Gemini V mission established ?', 2),
(4, 'How long was mission Gemini V processed ?', 2),
(5, 'Who was consulting crew of Gemini VII before flight ?', 2),
(6, 'How many times Gemini VII vehicle was flown arround Earth ?', 2),
(7, 'What was the Gemini 6A main achieved  ?', 2),
(8, 'What happend with Agena on Gemini 6A mission ?', 2),
(9, 'What was the main goals of the Gemini 8 mission ?', 2),
(10, 'How many days Gemini 8 mission was continued ?', 2),
(11, 'What was a reason to change prime crew to backup crew on Gemini 9A mission ?', 2),
(12, 'What was a reason why Eugene Cernan didn\'t test AMU(Astronaut Maneuvering Unit) ?', 2),
(13, 'Who was Gemini X mission supported as goverment member ?', 2),
(14, 'What name had object for Gemini X rendervouse ?', 2),
(15, 'Who was performed EVA on Gemini XI mission ?', 2),
(16, 'What was the main feature of the Gemini XI mission ?', 2),
(17, 'How long was Buzz Aldrin performed EVA on Gemini XII mission ?', 2),
(18, 'How much Gemini XII docked with Agena ?', 2),
(1, 'Who was USA president during Apollo program ?', 3),
(2, 'Who was developed spacecrafts for Apollo, Mercury and Gemini missions ?', 3),
(3, 'What was a reason  of Apollo 1 crew death ?', 3),
(4, 'How many month the Apollo programm was suspended after first mission failure ?', 3),
(5, 'What was main reason of Apollo 4 mission ?', 3),
(6, 'What was under test during Apollo 5 mission ?', 3),
(7, 'What was main goal of Apollo 6 mission ?', 3),
(8, 'What was the main feature of Apollo 7 mission ?', 3),
(9, 'What was the main feature of Apollo 8 mission ?', 3),
(10, 'What was the main reason of Apollo 9 mission ? ', 3),
(11, 'How long LM in Apollo 10 mission was spinning on Moon orbit?', 3),
(12, 'How was called place were LM of Apollo 11 landed ?', 3),
(13, 'How was called LM of Apollo 11 ?', 3),
(14, 'What was called device wich crew of Apollo 12 found? ', 3),
(15, 'Who was replacemented by Jack Swigert ?', 3),
(16, 'What game was Alan Shepard playing on the Moon surface during Apollo 14 mission ?', 3),
(17, 'What was the main feature of the Apollo 15 mission ?', 3),
(18, 'What was the name of astronaut who missed Apollo 13 mission and joined to the Apollo 16 mission ?\r\nWho was this lucky man ?', 3),
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
(15, 'Denys', 'Shabelnyk', 'dionisiy1986@gmail.com', 'Y', '1234567890', '2018-11-21 20:33:34', 100, '2019-12-28 21:59:57');

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
