-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Окт 23 2019 г., 22:19
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `getImagePath` (IN `id` VARCHAR(10), IN `ft` VARCHAR(1), IN `lesson_num` VARCHAR(10), OUT `fpath` VARCHAR(100))  begin
select filepath
       into fpath
from images
where objname = id
and lessonnum = lesson_num
and filetype = ft;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRecipientMail` (OUT `answer` VARCHAR(30))  select mailbox into answer from mails
where type = 'mail_recipient'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSenderMail` (OUT `answer` VARCHAR(30))  select mailbox into answer 
from mails 
where type = 'mail_sender'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSenderPass` (OUT `answer` VARCHAR(30))  select password into answer from mails
where type = 'mail_sender'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getTextAnswerHtml` (IN `qid` INT, IN `ln` INT, IN `num` INT, OUT `txt` TEXT CHARSET utf8)  NO SQL
BEGIN
select html_tag 
         into txt
from answers 
where question_id = qid
and lesson_num = ln
and id = num;
END$$

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
-- Структура таблицы `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL COMMENT 'answer id',
  `question_id` int(11) NOT NULL COMMENT 'question id',
  `description` text NOT NULL COMMENT 'text of answer',
  `flag` int(11) NOT NULL COMMENT 'mark of correction',
  `lesson_num` int(11) NOT NULL COMMENT 'lesson num',
  `html_tag` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `answers`
--

INSERT INTO `answers` (`id`, `question_id`, `description`, `flag`, `lesson_num`, `html_tag`) VALUES
(1, 1, 'Колорис', 1, 0, '<button type=\"button\" title=\"1\" class=\"btn btn-info btn-sm btn-block\" id=\"q1a1\" value=\"Колорис\" onclick=\"chkAnswers(\'Колорис\',10,\'q1a1\')\">'),
(2, 1, 'Дискавері', 0, 0, '<button type=\"button\" title=\"2\" class=\"btn btn-info btn-sm btn-block\" id=\"q1a2\" value=\"Дискавері\" onclick=\"chkAnswers(\'Дискавері\')\">'),
(3, 1, 'Опортуніті', 0, 0, '<button type=\"button\" title=\"3\" class=\"btn btn-info btn-sm btn-block\" id=\"q1a3\" value=\"Опортуніті\" onclick=\"chkAnswers(\'Опортуніті\')\">'),
(4, 2, '280', 0, 0, '<button type=\"button\" title=\"4\" class=\"btn btn-info btn-sm btn-block\" id=\"q2a1\" value=\"280\" onclick=\"chkAnswers(\'280\')\">'),
(5, 2, '243', 1, 0, '<button type=\"button\" title=\"5\" class=\"btn btn-info btn-sm btn-block\" id=\"q2a2\" value=243\" onclick=\"chkAnswers(\'243\',10,\'q2a2\')\">'),
(6, 2, '10', 0, 0, '<button type=\"button\" title=\"6\" class=\"btn btn-info btn-sm btn-block\" id=\"q2a3\" value=\"10\" onclick=\"chkAnswers(\'10\')\">'),
(7, 3, 'Байкал', 0, 0, '<button type=\"button\" title=\"7\" class=\"btn btn-info btn-sm btn-block\" id=\"q3a1\" value=\"Байкал\" onclick=\"chkAnswers(\'Байкал\')\">'),
(8, 3, 'МонБлан', 0, 0, '<button type=\"button\" title=\"8\" class=\"btn btn-info btn-sm btn-block\" id=\"q3a2\" value=\"МонБлан\" onclick=\"chkAnswers(\'МонБлан\')\">'),
(9, 3, 'Маріанська', 1, 0, '<button type=\"button\" title=\"9\" class=\"btn btn-info btn-sm btn-block\" id=\"q3a3\" value=\"Маріанська\" onclick=\"chkAnswers(\'Маріанська\',10,\'q3a3\')\">'),
(10, 4, 'Магній', 0, 0, '<button type=\"button\" title=\"10\" class=\"btn btn-info btn-sm btn-block\" id=\"q4a1\" value=\"Магній\" onclick=\"chkAnswers(\'Магній\')\">'),
(11, 4, 'Спирт', 0, 0, '<button type=\"button\" title=\"11\" class=\"btn btn-info btn-sm btn-block\" id=\"q4a2\" value=\"Спирт\" onclick=\"chkAnswers(\'Спирт\')\">'),
(12, 4, 'Оксид Заліза', 1, 0, '<button type=\"button\" title=\"12\" class=\"btn btn-info btn-sm btn-block\" id=\"q4a3\" value=\"Оксид заліза\" onclick=\"chkAnswers(\'Оксид заліза\',10,\'q4a3\')\">'),
(13, 5, 'Венера', 0, 0, '<button type=\"button\" title=\"13\" class=\"btn btn-info btn-sm btn-block\" id=\"q5a1\" value=\"Венера\" onclick=\"chkAnswers(\'Венера\')\">'),
(14, 5, 'Юнона', 1, 0, '<button type=\"button\" title=\"14\" class=\"btn btn-info btn-sm btn-block\" id=\"q5a2\" value=\"Юнона\" onclick=\"chkAnswers(\'Юнона\',10,\'q5a2\')\">'),
(15, 5, 'Зевс', 0, 0, '<button type=\"button\" title=\"15\" class=\"btn btn-info btn-sm btn-block\" id=\"q5a3\" value=\"Зевс\" onclick=\"chkAnswers(\'Зевс\')\">'),
(16, 6, 'Водневу', 0, 0, '<button type=\"button\" title=\"16\" class=\"btn btn-info btn-sm btn-block\" id=\"q6a1\" value=\"Водневу\" onclick=\"chkAnswers(\'Водневу\')\">'),
(17, 6, 'Тверду', 0, 0, '<button type=\"button\" title=\"17\" class=\"btn btn-info btn-sm btn-block\" id=\"q6a2\" value=\"Тверду\" onclick=\"chkAnswers(\'Тверду\')\">'),
(18, 6, 'Газоподібну', 1, 0, '<button type=\"button\" title=\"18\" class=\"btn btn-info btn-sm btn-block\" id=\"q6a3\" value=\"Газоподібну\" onclick=\"chkAnswers(\'Газоподібну\',10,\'q6a3\')\">'),
(19, 7, 'Вісь обертання', 1, 0, '<button type=\"button\" title=\"19\" class=\"btn btn-info btn-sm btn-block\" id=\"q7a1\" value=\"Вісь обертнання\" onclick=\"chkAnswers(\'Вісь обертнання\',10,\'q7a1\')\">'),
(20, 7, 'Кільця', 0, 0, '<button type=\"button\" title=\"20\" class=\"btn btn-info btn-sm btn-block\" id=\"q7a2\" value=\"Кільця\" onclick=\"chkAnswers(\'Кільця\')\">'),
(21, 7, 'Супутники', 0, 0, '<button type=\"button\" title=\"21\" class=\"btn btn-info btn-sm btn-block\" id=\"q7a3\" value=\"Супутники\" onclick=\"chkAnswers(\'Супутники\')\">'),
(22, 8, 'Математичних', 1, 0, '<button type=\"button\" title=\"22\" class=\"btn btn-info btn-sm btn-block\" id=\"q8a1\" value=\"Математичних\" onclick=\"chkAnswers(\'Математичних\',10,\'q8a1\')\">'),
(23, 8, 'Емпіричних', 0, 0, '<button type=\"button\" title=\"23\"  class=\"btn btn-info btn-sm btn-block\" id=\"q8a2\" value=\"Емпіричних\" onclick=\"chkAnswers(\'Емпіричних\')\">'),
(24, 8, 'Спостережень', 0, 0, '<button type=\"button\" title=\"24\" class=\"btn btn-info btn-sm btn-block\" id=\"q8a3\" value=\"Спостережень\" onclick=\"chkAnswers(\'Спостережень\')\">'),
(25, 9, 'Енцелад', 0, 0, '<button type=\"button\" title=\"25\" class=\"btn btn-info btn-sm btn-block\" id=\"q9a1\" value=\"Енцелад\" onclick=\"chkAnswers(\'Енцелад\')\">'),
(26, 9, 'Харон', 1, 0, '<button type=\"button\" title=\"26\" class=\"btn btn-info btn-sm btn-block\" id=\"q9a2\" value=\"Харон\" onclick=\"chkAnswers(\'Харон\',10,\'q9a2\')\">'),
(27, 9, 'Аріель', 0, 0, '<button type=\"button\" title=\"27\" class=\"btn btn-info btn-sm btn-block\" id=\"q9a3\" value=\"Аріель\" onclick=\"chkAnswers(\'Аріель\')\">'),
(28, 10, 'Дискавері', 1, 0, '<button type=\"button\" title=\"28\" class=\"btn btn-info btn-sm btn-block\" id=\"q1a1\" value=\"Дискавері\" onclick=\"chkAnswers(\'Дискавері\',10,\'q1a1\')\">'),
(29, 10, 'Марінер', 0, 0, '<button type=\"button\" title=\"29\" class=\"btn btn-info btn-sm btn-block\" id=\"q1a2\" value=\"Марінер\" onclick=\"chkAnswers(\'Марінер\')\">'),
(30, 10, 'Олімп', 0, 0, '<button type=\"button\" title=\"30\" class=\"btn btn-info btn-sm btn-block\" id=\"q1a3\" value=\"Олімп\" onclick=\"chkAnswers(\'Олімп\')\">'),
(31, 11, 'Ураганів', 1, 0, '<button type=\"button\" title=\"31\" class=\"btn btn-info btn-sm btn-block\" id=\"q2a2\" value=\"Ураганів\" onclick=\"chkAnswers(\'Ураганів\',10,\'q2a2\')\">'),
(32, 11, 'Кратерів', 0, 0, '<button type=\"button\" title=\"32\" class=\"btn btn-info btn-sm btn-block\" id=\"q2a1\" value=\"Кратерів\" onclick=\"chkAnswers(\'Кратерів\')\">'),
(33, 11, 'Вулканів', 0, 0, '<button type=\"button\" title=\"33\" class=\"btn btn-info btn-sm btn-block\" id=\"q2a3\" value=\"Вулканів\" onclick=\"chkAnswers(\'Вулканів\')\">'),
(34, 12, 'Говерла', 0, 0, '<button type=\"button\" title=\"34\" class=\"btn btn-info btn-sm btn-block\" id=\"q3a1\" value=\"Говерла\" onclick=\"chkAnswers(\'Говерла\')\">'),
(35, 12, 'МонБлан', 0, 0, '<button type=\"button\" title=\"35\" class=\"btn btn-info btn-sm btn-block\" id=\"q3a2\" value=\"МонБлан\" onclick=\"chkAnswers(\'МонБлан\')\">'),
(36, 12, 'Еверест', 1, 0, '<button type=\"button\" title=\"36\" class=\"btn btn-info btn-sm btn-block\" id=\"q3a3\" value=\"Еверест\" onclick=\"chkAnswers(\'Еверест\',10,\'q3a3\')\">'),
(37, 13, 'Махава', 1, 0, '<button type=\"button\" title=\"37\" class=\"btn btn-info btn-sm btn-block\" id=\"q4a3\" value=\"Махава\" onclick=\"chkAnswers(\'Махава\',10,\'q4a3\')\">'),
(38, 13, 'Сахара', 0, 0, '<button type=\"button\" title=\"38\" class=\"btn btn-info btn-sm btn-block\" id=\"q4a2\" value=\"Сахара\" onclick=\"chkAnswers(\'Сахара\')\">'),
(39, 13, 'АсканіяНова', 0, 0, '<button type=\"button\" title=\"39\" class=\"btn btn-info btn-sm btn-block\" id=\"q4a1\" value=\"Асканія Нова\" onclick=\"chkAnswers(\'Асканія Нова\')\">'),
(40, 14, '24', 0, 0, '<button type=\"button\" title=\"40\" class=\"btn btn-info btn-sm btn-block\" id=\"q5a1\" value=\"24\" onclick=\"chkAnswers(24)\">'),
(41, 14, '10', 1, 0, '<button type=\"button\" title=\"41\" class=\"btn btn-info btn-sm btn-block\" id=\"q5a2\" value=\"10\" onclick=\"chkAnswers(10,10,\'q5a2\')\">'),
(42, 14, '48', 0, 0, '<button type=\"button\" title=\"42\" class=\"btn btn-info btn-sm btn-block\" id=\"q5a3\" value=\"48\" onclick=\"chkAnswers(48)\">'),
(43, 15, '50000', 0, 0, '<button type=\"button\" title=\"43\" class=\"btn btn-info btn-sm btn-block\" id=\"q6a1\" value=\"50000\" onclick=\"chkAnswers(50000)\">'),
(44, 15, '300000', 1, 0, '<button type=\"button\" title=\"44\" class=\"btn btn-info btn-sm btn-block\" id=\"q6a3\" value=\"300000\" onclick=\"chkAnswers(300000,10,\'q6a3\')\">'),
(45, 15, '100000', 0, 0, '<button type=\"button\" title=\"45\" class=\"btn btn-info btn-sm btn-block\" id=\"q6a2\" value=\"100000\" onclick=\"chkAnswers(100000)\">'),
(46, 16, 'Галілео Галілей', 0, 0, '<button type=\"button\" title=\"46\" class=\"btn btn-info btn-sm btn-block\" id=\"q7a3\" value=\"Галілео Галілей\" onclick=\"chkAnswers(\'Галілео Галілей\')\">'),
(47, 16, 'Ісак Ньютон', 0, 0, '<button type=\"button\" title=\"47\" class=\"btn btn-info btn-sm btn-block\" id=\"q7a2\" value=\"Ісаак Ньютон\" onclick=\"chkAnswers(\'Ісаак Ньютон\')\">'),
(48, 16, 'Вільям Гершель', 1, 0, '<button type=\"button\" title=\"48\" class=\"btn btn-info btn-sm btn-block\" id=\"q7a1\" value=\"Вільям Гершель\" onclick=\"chkAnswers(\'Вільям Гершель\',10,\'q7a1\')\">'),
(49, 17, 'Меркурій', 0, 0, '<button type=\"button\" title=\"49\" class=\"btn btn-info btn-sm btn-block\" id=\"q8a2\" value=\"Меркурій\" onclick=\"chkAnswers(\'Меркурій\')\">'),
(50, 17, 'Вояджер-2', 1, 0, '<button type=\"button\" title=\"50\" class=\"btn btn-info btn-sm btn-block\" id=\"q8a1\" value=\"Вояджер-2\" onclick=\"chkAnswers(\'Вояджер-2\',10,\'q8a1\')\">'),
(51, 17, 'Венера-12', 0, 0, '<button type=\"button\" title=\"51\" class=\"btn btn-info btn-sm btn-block\" id=\"q8a3\" value=\"Венера-12\" onclick=\"chkAnswers(\'Венера-12\')\">'),
(52, 18, 'Вікінг', 0, 0, '<button type=\"button\" title=\"52\" class=\"btn btn-info btn-sm btn-block\" id=\"q9a1\" value=\"Вікінг\" onclick=\"chkAnswers(\'Вікінг\')\">'),
(53, 18, 'Скіапареллі', 0, 0, '<button type=\"button\" title=\"53\" class=\"btn btn-info btn-sm btn-block\" id=\"q9a3\" value=\"Скіапареллі\" onclick=\"chkAnswers(\'Скіапареллі\')\">'),
(54, 18, 'нові горизонти', 1, 0, '<button type=\"button\" title=\"54\" class=\"btn btn-info btn-sm btn-block\" id=\"q9a2\" value=\"Нові горизонти\" onclick=\"chkAnswers(\'Нові горизонти\',10,\'q9a2\')\">');

-- --------------------------------------------------------

--
-- Структура таблицы `employee_num`
--

CREATE TABLE `employee_num` (
  `e_num` int(11) NOT NULL COMMENT 'native tabnum'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Native table numbers of employees';

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
-- Структура таблицы `images`
--

CREATE TABLE `images` (
  `objname` varchar(10) NOT NULL COMMENT 'number of image',
  `filepath` varchar(255) NOT NULL COMMENT 'file path on local disc',
  `filetype` varchar(1) NOT NULL COMMENT 'object type(I,C,D)',
  `lessonnum` int(2) NOT NULL COMMENT 'number of lesson'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `images`
--

INSERT INTO `images` (`objname`, `filepath`, `filetype`, `lessonnum`) VALUES
('img1', 'images/planets/', 'I', 0),
('img2', 'images/planets/', 'I', 0),
('img3', 'images/planets/', 'I', 0),
('img4', 'images/planets/', 'I', 0),
('img5', 'images/planets/', 'I', 0),
('img6', 'images/planets/', 'I', 0),
('img7', 'images/planets/', 'I', 0),
('img8', 'images/planets/', 'I', 0),
('img9', 'images/planets/', 'I', 0),
('img11', 'images/planets/modal-galery/', 'C', 0),
('img12', 'images/planets/modal-galery/', 'C', 0),
('img13', 'images/planets/modal-galery/', 'C', 0),
('img21', 'images/planets/modal-galery/', 'C', 0),
('img22', 'images/planets/modal-galery/', 'C', 0),
('img23', 'images/planets/modal-galery/', 'C', 0),
('img31', 'images/planets/modal-galery/', 'C', 0),
('img32', 'images/planets/modal-galery/', 'C', 0),
('img33', 'images/planets/modal-galery/', 'C', 0),
('img41', 'images/planets/modal-galery/', 'C', 0),
('img42', 'images/planets/modal-galery/', 'C', 0),
('img43', 'images/planets/modal-galery/', 'C', 0),
('img51', 'images/planets/modal-galery/', 'C', 0),
('img52', 'images/planets/modal-galery/', 'C', 0),
('img53', 'images/planets/modal-galery/', 'C', 0),
('img61', 'images/planets/modal-galery/', 'C', 0),
('img62', 'images/planets/modal-galery/', 'C', 0),
('img63', 'images/planets/modal-galery/', 'C', 0),
('img71', 'images/planets/modal-galery/', 'C', 0),
('img72', 'images/planets/modal-galery/', 'C', 0),
('img73', 'images/planets/modal-galery/', 'C', 0),
('img81', 'images/planets/modal-galery/', 'C', 0),
('img82', 'images/planets/modal-galery/', 'C', 0),
('img91', 'images/planets/modal-galery/', 'C', 0),
('img92', 'images/planets/modal-galery/', 'C', 0),
('img93', 'images/planets/modal-galery/', 'C', 0),
('img1', 'images/newlesson1/', 'I', 1),
('img2', 'images/newlesson1/', 'I', 1),
('img3', 'images/newlesson1/', 'I', 1),
('img4', 'images/newlesson1/', 'I', 1),
('img5', 'images/newlesson1/', 'I', 1),
('img6', 'images/newlesson1/', 'I', 1),
('img7', 'images/newlesson1/', 'I', 1),
('img8', 'images/newlesson1/', 'I', 1),
('img9', 'images/newlesson1/', 'I', 1),
('img11', 'images/newlesson1/modal-galery/', 'C', 1),
('img12', 'images/newlesson1/modal-galery/', 'C', 1),
('img13', 'images/newlesson1/modal-galery/', 'C', 1),
('img21', 'images/newlesson1/modal-galery/', 'C', 1),
('img22', 'images/newlesson1/modal-galery/', 'C', 1),
('img23', 'images/newlesson1/modal-galery/', 'C', 1),
('img31', 'images/newlesson1/modal-galery/', 'C', 1),
('img32', 'images/newlesson1/modal-galery/', 'C', 1),
('img33', 'images/newlesson1/modal-galery/', 'C', 1),
('img41', 'images/newlesson1/modal-galery/', 'C', 1),
('img42', 'images/newlesson1/modal-galery/', 'C', 1),
('img43', 'images/newlesson1/modal-galery/', 'C', 1),
('img51', 'images/newlesson1/modal-galery/', 'C', 1),
('img52', 'images/newlesson1/modal-galery/', 'C', 1),
('img53', 'images/newlesson1/modal-galery/', 'C', 1),
('img61', 'images/newlesson1/modal-galery/', 'C', 1),
('img62', 'images/newlesson1/modal-galery/', 'C', 1),
('img63', 'images/newlesson1/modal-galery/', 'C', 1),
('img71', 'images/newlesson1/modal-galery/', 'C', 1),
('img72', 'images/newlesson1/modal-galery/', 'C', 1),
('img73', 'images/newlesson1/modal-galery/', 'C', 1),
('img81', 'images/newlesson1/modal-galery/', 'C', 1),
('img82', 'images/newlesson1/modal-galery/', 'C', 1),
('img83', 'images/newlesson1/modal-galery/', 'C', 1),
('img91', 'images/newlesson1/modal-galery/', 'C', 1),
('img92', 'images/newlesson1/modal-galery/', 'C', 1),
('img93', 'images/newlesson1/modal-galery/', 'C', 1),
('img1', 'images/newlesson2/', 'I', 2),
('img2', 'images/newlesson2/', 'I', 2),
('img3', 'images/newlesson2/', 'I', 2),
('img4', 'images/newlesson2/', 'I', 2),
('img5', 'images/newlesson2/', 'I', 2),
('img6', 'images/newlesson2/', 'I', 2),
('img7', 'images/newlesson2/', 'I', 2),
('img8', 'images/newlesson2/', 'I', 2),
('img9', 'images/newlesson2/', 'I', 2),
('img11', 'images/newlesson2/modal-galery/', 'C', 2),
('img12', 'images/newlesson2/modal-galery/', 'C', 2),
('img13', 'images/newlesson2/modal-galery/', 'C', 2),
('img21', 'images/newlesson2/modal-galery/', 'C', 2),
('img22', 'images/newlesson2/modal-galery/', 'C', 2),
('img23', 'images/newlesson2/modal-galery/', 'C', 2),
('img31', 'images/newlesson2/modal-galery/', 'C', 2),
('img32', 'images/newlesson2/modal-galery/', 'C', 2),
('img33', 'images/newlesson2/modal-galery/', 'C', 2),
('img41', 'images/newlesson2/modal-galery/', 'C', 2),
('img42', 'images/newlesson2/modal-galery/', 'C', 2),
('img43', 'images/newlesson2/modal-galery/', 'C', 2),
('img51', 'images/newlesson2/modal-galery/', 'C', 2),
('img52', 'images/newlesson2/modal-galery/', 'C', 2),
('img53', 'images/newlesson2/modal-galery/', 'C', 2),
('img61', 'images/newlesson2/modal-galery/', 'C', 2),
('img62', 'images/newlesson2/modal-galery/', 'C', 2),
('img63', 'images/newlesson2/modal-galery/', 'C', 2),
('img71', 'images/newlesson2/modal-galery/', 'C', 2),
('img72', 'images/newlesson2/modal-galery/', 'C', 2),
('img73', 'images/newlesson2/modal-galery/', 'C', 2),
('img81', 'images/newlesson2/modal-galery/', 'C', 2),
('img82', 'images/newlesson2/modal-galery/', 'C', 2),
('img83', 'images/newlesson2/modal-galery/', 'C', 2),
('img91', 'images/newlesson2/modal-galery/', 'C', 2),
('img92', 'images/newlesson2/modal-galery/', 'C', 2),
('img93', 'images/newlesson2/modal-galery/', 'C', 2),
('img1', 'images/newlesson3/', 'I', 3),
('img2', 'images/newlesson3/', 'I', 3),
('img3', 'images/newlesson3/', 'I', 3),
('img4', 'images/newlesson3/', 'I', 3),
('img5', 'images/newlesson3/', 'I', 3),
('img6', 'images/newlesson3/', 'I', 3),
('img7', 'images/newlesson3/', 'I', 3),
('img8', 'images/newlesson3/', 'I', 3),
('img9', 'images/newlesson3/', 'I', 3),
('img11', 'images/newlesson3/modal-galery/', 'C', 3),
('img12', 'images/newlesson3/modal-galery/', 'C', 3),
('img13', 'images/newlesson3/modal-galery/', 'C', 3),
('img21', 'images/newlesson3/modal-galery/', 'C', 3),
('img22', 'images/newlesson3/modal-galery/', 'C', 3),
('img23', 'images/newlesson3/modal-galery/', 'C', 3),
('img31', 'images/newlesson3/modal-galery/', 'C', 3),
('img32', 'images/newlesson3/modal-galery/', 'C', 3),
('img33', 'images/newlesson3/modal-galery/', 'C', 3),
('img41', 'images/newlesson3/modal-galery/', 'C', 3),
('img42', 'images/newlesson3/modal-galery/', 'C', 3),
('img43', 'images/newlesson3/modal-galery/', 'C', 3),
('img51', 'images/newlesson3/modal-galery/', 'C', 3),
('img52', 'images/newlesson3/modal-galery/', 'C', 3),
('img53', 'images/newlesson3/modal-galery/', 'C', 3),
('img61', 'images/newlesson3/modal-galery/', 'C', 3),
('img62', 'images/newlesson3/modal-galery/', 'C', 3),
('img63', 'images/newlesson3/modal-galery/', 'C', 3),
('img71', 'images/newlesson3/modal-galery/', 'C', 3),
('img72', 'images/newlesson3/modal-galery/', 'C', 3),
('img73', 'images/newlesson3/modal-galery/', 'C', 3),
('img81', 'images/newlesson3/modal-galery/', 'C', 3),
('img82', 'images/newlesson3/modal-galery/', 'C', 3),
('img83', 'images/newlesson3/modal-galery/', 'C', 3),
('img91', 'images/newlesson3/modal-galery/', 'C', 3),
('img92', 'images/newlesson3/modal-galery/', 'C', 3),
('img93', 'images/newlesson3/modal-galery/', 'C', 3),
('img1', 'images/newlesson4/', 'I', 4),
('img2', 'images/newlesson4/', 'I', 4),
('img3', 'images/newlesson4/', 'I', 4),
('img4', 'images/newlesson4/', 'I', 4),
('img5', 'images/newlesson4/', 'I', 4),
('img6', 'images/newlesson4/', 'I', 4),
('img7', 'images/newlesson4/', 'I', 4),
('img8', 'images/newlesson4/', 'I', 4),
('img9', 'images/newlesson4/', 'I', 4),
('img11', 'images/newlesson4/modal-galery/', 'C', 4),
('img12', 'images/newlesson4/modal-galery/', 'C', 4),
('img13', 'images/newlesson4/modal-galery/', 'C', 4),
('img21', 'images/newlesson4/modal-galery/', 'C', 4),
('img22', 'images/newlesson4/modal-galery/', 'C', 4),
('img23', 'images/newlesson4/modal-galery/', 'C', 4),
('img31', 'images/newlesson4/modal-galery/', 'C', 4),
('img32', 'images/newlesson4/modal-galery/', 'C', 4),
('img33', 'images/newlesson4/modal-galery/', 'C', 4),
('img41', 'images/newlesson4/modal-galery/', 'C', 4),
('img42', 'images/newlesson4/modal-galery/', 'C', 4),
('img43', 'images/newlesson4/modal-galery/', 'C', 4),
('img51', 'images/newlesson4/modal-galery/', 'C', 4),
('img52', 'images/newlesson4/modal-galery/', 'C', 4),
('img53', 'images/newlesson4/modal-galery/', 'C', 4),
('img61', 'images/newlesson4/modal-galery/', 'C', 4),
('img62', 'images/newlesson4/modal-galery/', 'C', 4),
('img63', 'images/newlesson4/modal-galery/', 'C', 4),
('img71', 'images/newlesson4/modal-galery/', 'C', 4),
('img72', 'images/newlesson4/modal-galery/', 'C', 4),
('img73', 'images/newlesson4/modal-galery/', 'C', 4),
('img81', 'images/newlesson4/modal-galery/', 'C', 4),
('img82', 'images/newlesson4/modal-galery/', 'C', 4),
('img83', 'images/newlesson4/modal-galery/', 'C', 4),
('img91', 'images/newlesson4/modal-galery/', 'C', 4),
('img92', 'images/newlesson4/modal-galery/', 'C', 4),
('img93', 'images/newlesson4/modal-galery/', 'C', 4),
('img1', 'images/newlesson5/', 'I', 5),
('img2', 'images/newlesson5/', 'I', 5),
('img3', 'images/newlesson5/', 'I', 5),
('img4', 'images/newlesson5/', 'I', 5),
('img5', 'images/newlesson5/', 'I', 5),
('img6', 'images/newlesson5/', 'I', 5),
('img7', 'images/newlesson5/', 'I', 5),
('img8', 'images/newlesson5/', 'I', 5),
('img9', 'images/newlesson5/', 'I', 5),
('img11', 'images/newlesson5/modal-galery/', 'C', 5),
('img12', 'images/newlesson5/modal-galery/', 'C', 5),
('img13', 'images/newlesson5/modal-galery/', 'C', 5),
('img21', 'images/newlesson5/modal-galery/', 'C', 5),
('img22', 'images/newlesson5/modal-galery/', 'C', 5),
('img23', 'images/newlesson5/modal-galery/', 'C', 5),
('img31', 'images/newlesson5/modal-galery/', 'C', 5),
('img32', 'images/newlesson5/modal-galery/', 'C', 5),
('img33', 'images/newlesson5/modal-galery/', 'C', 5),
('img41', 'images/newlesson5/modal-galery/', 'C', 5),
('img42', 'images/newlesson5/modal-galery/', 'C', 5),
('img43', 'images/newlesson5/modal-galery/', 'C', 5),
('img51', 'images/newlesson5/modal-galery/', 'C', 5),
('img52', 'images/newlesson5/modal-galery/', 'C', 5),
('img53', 'images/newlesson5/modal-galery/', 'C', 5),
('img61', 'images/newlesson5/modal-galery/', 'C', 5),
('img62', 'images/newlesson5/modal-galery/', 'C', 5),
('img63', 'images/newlesson5/modal-galery/', 'C', 5),
('img71', 'images/newlesson5/modal-galery/', 'C', 5),
('img72', 'images/newlesson5/modal-galery/', 'C', 5),
('img73', 'images/newlesson5/modal-galery/', 'C', 5),
('img81', 'images/newlesson5/modal-galery/', 'C', 5),
('img82', 'images/newlesson5/modal-galery/', 'C', 5),
('img83', 'images/newlesson5/modal-galery/', 'C', 5),
('img91', 'images/newlesson5/modal-galery/', 'C', 5),
('img92', 'images/newlesson5/modal-galery/', 'C', 5),
('img93', 'images/newlesson5/modal-galery/', 'C', 5),
('img1', 'images/newlesson6/', 'I', 6),
('img2', 'images/newlesson6/', 'I', 6),
('img3', 'images/newlesson6/', 'I', 6),
('img4', 'images/newlesson6/', 'I', 6),
('img5', 'images/newlesson6/', 'I', 6),
('img6', 'images/newlesson6/', 'I', 6),
('img7', 'images/newlesson6/', 'I', 6),
('img8', 'images/newlesson6/', 'I', 6),
('img9', 'images/newlesson6/', 'I', 6),
('img11', 'images/newlesson6/modal-galery/', 'C', 6),
('img12', 'images/newlesson6/modal-galery/', 'C', 6),
('img13', 'images/newlesson6/modal-galery/', 'C', 6),
('img21', 'images/newlesson6/modal-galery/', 'C', 6),
('img22', 'images/newlesson6/modal-galery/', 'C', 6),
('img23', 'images/newlesson6/modal-galery/', 'C', 6),
('img31', 'images/newlesson6/modal-galery/', 'C', 6),
('img32', 'images/newlesson6/modal-galery/', 'C', 6),
('img33', 'images/newlesson6/modal-galery/', 'C', 6),
('img41', 'images/newlesson6/modal-galery/', 'C', 6),
('img42', 'images/newlesson6/modal-galery/', 'C', 6),
('img43', 'images/newlesson6/modal-galery/', 'C', 6),
('img51', 'images/newlesson6/modal-galery/', 'C', 6),
('img52', 'images/newlesson6/modal-galery/', 'C', 6),
('img53', 'images/newlesson6/modal-galery/', 'C', 6),
('img61', 'images/newlesson6/modal-galery/', 'C', 6),
('img62', 'images/newlesson6/modal-galery/', 'C', 6),
('img63', 'images/newlesson6/modal-galery/', 'C', 6),
('img71', 'images/newlesson6/modal-galery/', 'C', 6),
('img72', 'images/newlesson6/modal-galery/', 'C', 6),
('img73', 'images/newlesson6/modal-galery/', 'C', 6),
('img81', 'images/newlesson6/modal-galery/', 'C', 6),
('img82', 'images/newlesson6/modal-galery/', 'C', 6),
('img83', 'images/newlesson6/modal-galery/', 'C', 6),
('img91', 'images/newlesson6/modal-galery/', 'C', 6),
('img92', 'images/newlesson6/modal-galery/', 'C', 6),
('img93', 'images/newlesson6/modal-galery/', 'C', 6),
('img1', 'images/newlesson7/', 'I', 7),
('img2', 'images/newlesson7/', 'I', 7),
('img3', 'images/newlesson7/', 'I', 7),
('img4', 'images/newlesson7/', 'I', 7),
('img5', 'images/newlesson7/', 'I', 7),
('img6', 'images/newlesson7/', 'I', 7),
('img7', 'images/newlesson7/', 'I', 7),
('img8', 'images/newlesson7/', 'I', 7),
('img9', 'images/newlesson7/', 'I', 7),
('img11', 'images/newlesson7/modal-galery/', 'C', 7),
('img12', 'images/newlesson7/modal-galery/', 'C', 7),
('img13', 'images/newlesson7/modal-galery/', 'C', 7),
('img21', 'images/newlesson7/modal-galery/', 'C', 7),
('img22', 'images/newlesson7/modal-galery/', 'C', 7),
('img23', 'images/newlesson7/modal-galery/', 'C', 7),
('img31', 'images/newlesson7/modal-galery/', 'C', 7),
('img32', 'images/newlesson7/modal-galery/', 'C', 7),
('img33', 'images/newlesson7/modal-galery/', 'C', 7),
('img41', 'images/newlesson7/modal-galery/', 'C', 7),
('img42', 'images/newlesson7/modal-galery/', 'C', 7),
('img43', 'images/newlesson7/modal-galery/', 'C', 7),
('img51', 'images/newlesson7/modal-galery/', 'C', 7),
('img52', 'images/newlesson7/modal-galery/', 'C', 7),
('img53', 'images/newlesson7/modal-galery/', 'C', 7),
('img61', 'images/newlesson7/modal-galery/', 'C', 7),
('img62', 'images/newlesson7/modal-galery/', 'C', 7),
('img63', 'images/newlesson7/modal-galery/', 'C', 7),
('img71', 'images/newlesson7/modal-galery/', 'C', 7),
('img72', 'images/newlesson7/modal-galery/', 'C', 7),
('img73', 'images/newlesson7/modal-galery/', 'C', 7),
('img81', 'images/newlesson7/modal-galery/', 'C', 7),
('img82', 'images/newlesson7/modal-galery/', 'C', 7),
('img83', 'images/newlesson7/modal-galery/', 'C', 7),
('img91', 'images/newlesson7/modal-galery/', 'C', 7),
('img92', 'images/newlesson7/modal-galery/', 'C', 7),
('img93', 'images/newlesson7/modal-galery/', 'C', 7),
('img1', 'images/newlesson8/', 'I', 8),
('img2', 'images/newlesson8/', 'I', 8),
('img3', 'images/newlesson8/', 'I', 8),
('img4', 'images/newlesson8/', 'I', 8),
('img5', 'images/newlesson8/', 'I', 8),
('img6', 'images/newlesson8/', 'I', 8),
('img7', 'images/newlesson8/', 'I', 8),
('img8', 'images/newlesson8/', 'I', 8),
('img9', 'images/newlesson8/', 'I', 8),
('img11', 'images/newlesson8/modal-galery/', 'C', 8),
('img12', 'images/newlesson8/modal-galery/', 'C', 8),
('img13', 'images/newlesson8/modal-galery/', 'C', 8),
('img21', 'images/newlesson8/modal-galery/', 'C', 8),
('img22', 'images/newlesson8/modal-galery/', 'C', 8),
('img23', 'images/newlesson8/modal-galery/', 'C', 8),
('img31', 'images/newlesson8/modal-galery/', 'C', 8),
('img32', 'images/newlesson8/modal-galery/', 'C', 8),
('img33', 'images/newlesson8/modal-galery/', 'C', 8),
('img41', 'images/newlesson8/modal-galery/', 'C', 8),
('img42', 'images/newlesson8/modal-galery/', 'C', 8),
('img43', 'images/newlesson8/modal-galery/', 'C', 8),
('img51', 'images/newlesson8/modal-galery/', 'C', 8),
('img52', 'images/newlesson8/modal-galery/', 'C', 8),
('img53', 'images/newlesson8/modal-galery/', 'C', 8),
('img61', 'images/newlesson8/modal-galery/', 'C', 8),
('img62', 'images/newlesson8/modal-galery/', 'C', 8),
('img63', 'images/newlesson8/modal-galery/', 'C', 8),
('img71', 'images/newlesson8/modal-galery/', 'C', 8),
('img72', 'images/newlesson8/modal-galery/', 'C', 8),
('img73', 'images/newlesson8/modal-galery/', 'C', 8),
('img81', 'images/newlesson8/modal-galery/', 'C', 8),
('img82', 'images/newlesson8/modal-galery/', 'C', 8),
('img83', 'images/newlesson8/modal-galery/', 'C', 8),
('img91', 'images/newlesson8/modal-galery/', 'C', 8),
('img92', 'images/newlesson8/modal-galery/', 'C', 8),
('img93', 'images/newlesson8/modal-galery/', 'C', 8),
('img1', 'images/newlesson9/', 'I', 9),
('img2', 'images/newlesson9/', 'I', 9),
('img3', 'images/newlesson9/', 'I', 9),
('img4', 'images/newlesson9/', 'I', 9),
('img5', 'images/newlesson9/', 'I', 9),
('img6', 'images/newlesson9/', 'I', 9),
('img7', 'images/newlesson9/', 'I', 9),
('img8', 'images/newlesson9/', 'I', 9),
('img9', 'images/newlesson9/', 'I', 9),
('img11', 'images/newlesson9/modal-galery/', 'C', 9),
('img12', 'images/newlesson9/modal-galery/', 'C', 9),
('img13', 'images/newlesson9/modal-galery/', 'C', 9),
('img21', 'images/newlesson9/modal-galery/', 'C', 9),
('img22', 'images/newlesson9/modal-galery/', 'C', 9),
('img23', 'images/newlesson9/modal-galery/', 'C', 9),
('img31', 'images/newlesson9/modal-galery/', 'C', 9),
('img32', 'images/newlesson9/modal-galery/', 'C', 9),
('img33', 'images/newlesson9/modal-galery/', 'C', 9),
('img41', 'images/newlesson9/modal-galery/', 'C', 9),
('img42', 'images/newlesson9/modal-galery/', 'C', 9),
('img43', 'images/newlesson9/modal-galery/', 'C', 9),
('img51', 'images/newlesson9/modal-galery/', 'C', 9),
('img52', 'images/newlesson9/modal-galery/', 'C', 9),
('img53', 'images/newlesson9/modal-galery/', 'C', 9),
('img61', 'images/newlesson9/modal-galery/', 'C', 9),
('img62', 'images/newlesson9/modal-galery/', 'C', 9),
('img63', 'images/newlesson9/modal-galery/', 'C', 9),
('img71', 'images/newlesson9/modal-galery/', 'C', 9),
('img72', 'images/newlesson9/modal-galery/', 'C', 9),
('img73', 'images/newlesson9/modal-galery/', 'C', 9),
('img81', 'images/newlesson9/modal-galery/', 'C', 9),
('img82', 'images/newlesson9/modal-galery/', 'C', 9),
('img83', 'images/newlesson9/modal-galery/', 'C', 9),
('img91', 'images/newlesson9/modal-galery/', 'C', 9),
('img92', 'images/newlesson9/modal-galery/', 'C', 9),
('img93', 'images/newlesson9/modal-galery/', 'C', 9);

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
(1, 'Mercury-Redstone-3 #1', 1),
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
  `type` varchar(1) NOT NULL COMMENT 'user type',
  `email` varchar(30) NOT NULL COMMENT 'user email',
  `interactid` int(11) DEFAULT NULL COMMENT 'communication id',
  `is_activ` varchar(1) NOT NULL DEFAULT 'Y' COMMENT 'user status',
  `table_num` int(11) DEFAULT NULL COMMENT 'table num(teachers)',
  `is_root` varchar(1) NOT NULL DEFAULT 'N' COMMENT 'superuser',
  `user_pass` varchar(10) NOT NULL COMMENT 'user''s passphrase',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `scores` int(11) DEFAULT NULL,
  `lastlogin` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='site users and their attributes';

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `type`, `email`, `interactid`, `is_activ`, `table_num`, `is_root`, `user_pass`, `add_date`, `scores`, `lastlogin`) VALUES
(15, 'Denys', 'Shabelnyk', 'P', 'dionisiy1986@gmail.com', NULL, 'Y', 0, 'N', '1234567890', '2018-11-21 20:33:34', 100, '2019-10-23 20:02:15'),
(19, 'Teacher', 'Shabelnykov', 'T', 't@gmail.com', NULL, 'Y', 10, 'N', '0987654321', '2018-12-05 21:18:41', NULL, '2019-07-30 19:12:44'),
(28, 'pak', 'Buki', 'P', 'pak@gmail.com', NULL, 'Y', 701, 'N', '944400--2', '2019-06-06 19:31:19', NULL, NULL),
(29, 'Popi', 'Kisa', 'P', 'pk@gmail.com', NULL, 'Y', 456, 'N', '0987654321', '2019-06-24 20:37:15', NULL, NULL),
(30, 'puk', 'pukin', 'P', 'pik@ukr.net', NULL, 'Y', 12, 'N', '1905378902', '2019-06-25 19:32:27', NULL, NULL);

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
-- Индексы таблицы `employee_num`
--
ALTER TABLE `employee_num`
  ADD PRIMARY KEY (`e_num`);

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
  ADD UNIQUE KEY `uniq_users` (`name`,`surname`,`email`,`user_pass`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'counter', AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
