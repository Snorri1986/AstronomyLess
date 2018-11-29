-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 29 2018 г., 21:24
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUser` (IN `req_name` VARCHAR(30), IN `reg_surname` VARCHAR(30), IN `reg_email` VARCHAR(30), IN `reg_password` VARCHAR(30), OUT `our_name` VARCHAR(30), OUT `our_surname` VARCHAR(30))  BEGIN

select name, surname
    into our_name, our_surname
from users
where name = req_name 
and surname = reg_surname
and email = reg_email
and user_pass = reg_password;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `earth`
--

CREATE TABLE `earth` (
  `Text` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1250;

--
-- Дамп данных таблицы `earth`
--

INSERT INTO `earth` (`Text`) VALUES
('﻿Земля:) - єдина планета нашої Соняної система, яка здатна підтримувати життя у різних формах.\r\nНа Землі ми можеми зустріти різні форми життя, як людина, тварина або різноманітні мікроорганізми.\r\nЗа данними дослідників, Землю було сформовано 4,5 млрд років тому. Земля має природній супутник - Місяць.\r\nПеріод обертання Місяця навколо Землі співдає з періодом обертання Землі навколо своєї осі, тому ми завжди бачимо\r\nлише один бік Місяця.Місяць був сформований трохи згодом, приблизно 4,5 млрд +- 0,01 млрд років тому. \r\n80% поверхні Землі вкрито водою. Земля розташована у так званій зоні осідлості, \r\nщо є причиною виникнення та підтримки життя. Земля має різноманітний геологічний рельєф. Земля вкрита великим\r\nрозломами земної кори, що сформували ріки, гірськими массивами, які сформувалися в результаті руху\r\nтектонічних плит, западинами, найбільша з яких Маріанська(10 994 м в глибину). Найбільша гірська \r\nвершина - гора Еверест(8848 м). Земля має многошарову атмосферу, висота якої приблизно 122 км.\r\nАтмосфера Землі складається з тропосфери, стратосфери, мезосфери, термосфери, екзосфери. Основними хімічними елементами\r\nз якої складається атмосфера є кисень та азот. Унікальною особливістю нашої планети є наявність \r\nОзонового шару, який захищає планету від надмірної Сонячної радіації. Окрім великої кількості \r\nводних ресурсів, наша планета має значну кількість запасів прісної води, яка зосереджена в льодовиках на \r\nпівночі та півдні. Місяць вважається природнім супутником Землі, але на орбіті нашої планети з 1957 року\r\nобертається величезна кількість штучних супутників, які значно полегшують нашу працю в різних сферах економічної\r\nдіяльності. Але навколо нашої планети обертаються не лише штучні супутники, але й ціла низка орбітальних телескопів,\r\nа також Міжнародна Космічна станція (з 1998 року) на якій постійно проживають і проводять наукові дослідження від 3х до\r\n6 астронавтів. Серед орбітальних телескопів варто зазначити наступні: Хаббл (з 1990 року), Чандра (з 1999 року), \r\nСпітцер(з 2003 року), Гершель(з 2009 року). Наступні орбітальні станції працювали на орбіті: серії Салют(1971-1986 рр),\r\nSkyLab(1973 - 1979 рр), Тяньгун(2011-2018 рр),Мір(1986 - 2001), МКС(з 1998 року).');

-- --------------------------------------------------------

--
-- Структура таблицы `employee_num`
--

CREATE TABLE `employee_num` (
  `e_num` int(11) NOT NULL COMMENT 'native tabnum'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Native table numbers of employees';

-- --------------------------------------------------------

--
-- Структура таблицы `jupiter`
--

CREATE TABLE `jupiter` (
  `Text` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1250;

--
-- Дамп данных таблицы `jupiter`
--

INSERT INTO `jupiter` (`Text`) VALUES
('﻿Юпітер - відкриває ряд планет, так званих газових гігантів.\r\nПланета, за сучасними данними, не містить твердої поверхні і складається з\r\nвеликої кількості пилу, який притягується один до одного за допомогою\r\nмагнітного поля. NASA вивчала планету за допомогою орбітальної станції\r\nЮнона, якій знадобилося 10 років, щоб дістатится її орбіти. Саме стільки\r\nроків потрібно провести в відкритому космосі щоб досягти планети.\r\nЮпітер - найбільша планета нашої Сончної системи.\r\nОсобливий інтерес для дослідників викликає потжні урагани,які \r\nвирують в атмосфері планети мільйони років. Юпітер робить один \r\nповний оберт навколо своєї осі за 10 годин. Юпітер - рекордсмен по \r\nатмосферному тиску в нашій Сонячній системі.\r\nЮпітер - має ще один рекорд, надпотужне магнітне поле, яке досягає\r\nнайближчого сусіда - Сатурна.\r\nВ свій час планета була досліджена такими орбітальними станціями як:\r\nPioner-10 та voyager'),
('\r\n\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `mars`
--

CREATE TABLE `mars` (
  `Text` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1250;

--
-- Дамп данных таблицы `mars`
--

INSERT INTO `mars` (`Text`) VALUES
('﻿Марс - наш червоний сусід і другий близнюк Землі.Планета названа червоную, \r\nтому що на її поверхні містится значна кількість оксиду заліза.\r\nМарс дуже схожий на Землю. Пустеля Махара в Каліфорнії дуже схожа на поверхню Марса.\r\nМарс - містить найвищий схил в нашій Сонячній системі.Це гора Олімпус висотою 24 кілометри.\r\nМарс містить на своїй поверхні цілі вулканічні райони,найбільші з них: Тарсида, Фарсида, Елізіум.\r\nМарс має специфічний клімат зі значними коливаннями температур. Вночі температура поверхні досягає 100 С\r\nза Цельсієм.В атмосфері планети відсутній кисень, але містится в значній кількості вуглекислий газ.\r\nМарс в двічі меньший від Землі і містить значні запаси криги під своєю поверхнею.На сьогоднішній день, \r\nповерхня Марса вивчається автоматичними дослідницьким  станціями такими\r\nяк Спіріт,Фенікс,Вікінг-1,Вікінг-2,Скіапареллі,Соджонер, Оппортуніті,Марс-3 та Куріосіті.\r\nАтмосфера Марса також не залишалася невивченною. В свій час її вивчали такі орбітальні станції, як Mariner-4,\r\nMariner-9'),
(' \r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `mercury`
--

CREATE TABLE `mercury` (
  `Text` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1250;

--
-- Дамп данных таблицы `mercury`
--

INSERT INTO `mercury` (`Text`) VALUES
('﻿Меркурій - найменша планета Сонячної системи, але з найбільш високим \r\nперепадом температур. Температура на поверхні вночі падає з +430 градусів за\r\nЦельсієм до -185 градусів за Цельсіем(за даними орбітальної станції Messenger)\r\nМеркурій, на відміну від інших планет, найбільше споживає\r\nультрафіолетового випромінювання від Солнця. Ультрафіолетові випромінювання на\r\nМеркурії в 10 разів більші ніж на Землі. Меркурій містить кратери. \r\nНайбільшому з них дали ім\'я - Колорис. В 1970-х роках орбітальним\r\nапаратором Mariner 10 кратер Колорис був сфотографований. За допомогою \r\nдосить непоганих фотографій, вдалося вирахувати його діаметр - 1300 км.\r\nОкрім кратерів поверхня Меркурія вкрита великами пагорбами. Найбільшим з них, \r\nє пагорб Дискавері, який має висоту 800 метрів та довжину - 650 км.\r\nТак само як на Землі, полюси Меркурія вкриті кригою. Сила тяжіння на Меркурії \r\nв 3 рази менша, ніж на Землі. На поверхні дуже велика радіація. Меркурій дуже \r\nповільно обертається навколо своєї осі. Один день на Меркурії дорівнює \r\n176и дням на Землі. Проте Меркурій найшвидше обертається навколо\r\nСонця - лише за 8днів. Меркурій має тверде ядро, яка складається \r\nз заліза. Маса ядра планети становить 83% маси всієї планети.\r\nМеркурій не має супутників. \r\nПланета вивчалася наступними орбітальними станціями: Messenger,Mariner 10'),
('\r\n\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `neptune`
--

CREATE TABLE `neptune` (
  `Text` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1250;

--
-- Дамп данных таблицы `neptune`
--

INSERT INTO `neptune` (`Text`) VALUES
('﻿Нептун - восьма планета нашої Сонячної система, яка відноситься до планет гігантів.\r\nПід час свого обертання навколо Сонця, орбіта планети перетинає орбіту Плутону.\r\nНептун - перша планета, яка були відкрита математичним способом, під час розрахунків.\r\nАтмосфера Нептуну складається, восновному, з водню та гелію. Певна частина метану \r\nв атмосфері планети надає їй блакитного забарвлення.Нептун має 14 супутників.\r\nВ атмосфері Нептуна вируют досить сильні вітри швдкість яких досягає 2100 км/год.\r\nТемпература у верхніх шарах атмосфери становить -220 С за Цельсієм.\r\nНептун відомий однією зі своїх таємниць - це Велика Темна пляма, яка схожа на Велику\r\nЧервону пляму на Юпітері.Нептун також має систему кілець: 2 вузьких та 2 широких.\r\nКыльця були выдкриті, коли Нептун затмарив одну із зірок.Кільця складаються подібно \r\nдо кілець Сатурну - з льоду.Супутники названі в честь Давньогрецьких богів.\r\nЄдина міжпланетна станція, яка мала змогу вивчити планету під час прольоту над нею\r\nбув Вояджер-2'),
('\r\n');

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
-- Структура таблицы `pluto`
--

CREATE TABLE `pluto` (
  `Text` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1250;

--
-- Дамп данных таблицы `pluto`
--

INSERT INTO `pluto` (`Text`) VALUES
('﻿Плутон - найбільш відома карликова планета, яка зафіксовано в поясі Койпера.\r\nДіаметр планети лише 2374 кілометри.Плутон має найбільший супутник - Харон,\r\nякий утворює з планетою єдиний цент тяжіння. Окрім Харону, Плутон має ще \r\nчотири супутники: Нікта, Гідра, Кербер та Стікс. Плутон, з причин свого \r\nдалекого розташування, найменш вивчена система. Також, планета має досить \r\nвелику еліпсоподібну орбіту, яка виводить планету за межі Сончної системи.\r\nПоверхня Плутону складається з лёду та каменю.Завдяки міжпланетній станції\r\n\"Нові Горизонти\", вдалося отримати чудові знімки планети поверхні, та зробити\r\nвиксновки, щодо геолгічного стану. Результати дослідження поверхні покзали, що\r\nПлутон має досить різноманітну геологічну активність, що стало причиною частих\r\nастероїдних бомбардувань, а такод діяльністю кріо вулканів.\r\nНещодавні дослідження показали, що планета має атмосферу, яка складається з\r\nметану, азоту, чадного газу. \r\nПланету досліджував лише міжпланетний комплекс New Horizons,який було \r\nзапущено в 2006 році'),
('\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `saturn`
--

CREATE TABLE `saturn` (
  `Text` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1250;

--
-- Дамп данных таблицы `saturn`
--

INSERT INTO `saturn` (`Text`) VALUES
('﻿Сатурн - важко назвати просто планетой, це планетарна система\r\nз 48-ми супутників.Планета Сатурн - другий представник газаподібних\r\nпланет нашої Сонячної системи. Сатурн - це холодний шар газу, на якому \r\nбесперестану вируют урагами на полюсах. Сатурн містить власну атмосферу,\r\nяка складається з водню та гелію.За розмірами, Сатурн в 750 разів більший\r\nза Землю. Сатурн обертається навколо своєї осі за 10,6 годин, майже так\r\nсамо як і Юпітер.Сатурн - містить кільця навколо своєї орбіти, які складаються\r\nзі шматків льоду.Діаметр кілець - 300000 кілометрів. На Сатурні буревії\r\nможут тривати досить довго. Найбільша швидкість вітру була зафіксована\r\nна позначці - 1600 км/год.Найбільший діаметр буревію становим 8000 кілометрів.\r\nСеред найбільш вивчених супутників Сатруна можна назвати Титан та Енцелад.\r\nСеред дослідницьких станцій, які вивчали Сатурн можна відзначити лише Вояджер'),
('   ');

-- --------------------------------------------------------

--
-- Структура таблицы `uranus`
--

CREATE TABLE `uranus` (
  `Text` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1250;

--
-- Дамп данных таблицы `uranus`
--

INSERT INTO `uranus` (`Text`) VALUES
('﻿Уран - перша планета,яка була відкрита в далекому 1787 році Вільямом\r\nГершелем за допомогою телескопу.Уран - відкриває ряд планет, так званих\r\nльодових гігантів. Атмосфера Урана так само складається з водню та гелію.\r\nНещодавно, в атмофері Урану було знайдено метан. Уран - вважається\r\nнайхолоднішою планетою Сонячної системи. Мінімальна теспература становить\r\n-224 С за Цельсієм. Так само як і Сатруна, Уран містить систему кілець, які\r\nобертаються по орбіті планети. Проти, їх менше за кількістю і розміром.\r\nУран, також як і Сатурн, містить супутники. Їх 27.Уран відрізняється від інших\r\nпланет Сонячної системи ще й тим, що вісь обертаня планети нахилена в бік.\r\nУран має досить активну атмосферу.Швидкіть вітру досягає 250 м/с.\r\nНайбільшими супутниками Урану є: Міранда, Аріель, Умбріель,Титанія, Оберон.\r\nПланета вивчала за допомою міжпланетної станції Вояджер-2, а також \r\nорбітального телескому Хаббл'),
('\r\n');

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
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='site users and their attributes';

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `type`, `email`, `interactid`, `is_activ`, `table_num`, `is_root`, `user_pass`, `add_date`) VALUES
(15, 'Denys', 'Shabelnyk', 'P', 'dionisiy1986@gmail.com', NULL, 'Y', 0, 'N', '1234567890', '2018-11-21 20:33:34'),
(16, 'Vasya', 'Pupkin', 'P', 'vasya@gmail.com', NULL, 'Y', 0, 'N', '0987654321', '2018-11-29 19:57:00'),
(17, 'Kisa', 'Lisa', 'P', 'lisa@gmail.com', NULL, 'Y', 0, 'N', '654321', '2018-11-29 20:10:40'),
(18, 'Zop', 'Pop', 'P', 'zop@gmail.com', NULL, 'Y', 0, 'N', '000000', '2018-11-29 20:17:21');

-- --------------------------------------------------------

--
-- Структура таблицы `venus`
--

CREATE TABLE `venus` (
  `Text` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1250;

--
-- Дамп данных таблицы `venus`
--

INSERT INTO `venus` (`Text`) VALUES
('﻿Венера - близнюк Землі.Так вчені називают другу планету нашої Сонячної системи, тому що\r\nВенера та Землю мають приблизно однаковий розмір. Температура на поверхні дорівнює +482 С.\r\nНа відміну від скелястого Меркурія, 85 % поверхні Венери - це вулкани та лава.Венера має\r\nвласну атмосферу, яка складається з сірчаної кислоти та вугликислого газу\r\nбіля поверхні. Венера також повільно обертається навколо Сонця, що заважає планеті мати власне \r\nмагнітне поле. Один день на Венері дорівнює 2/3 року на Землі, або 243 земні дні.\r\nЗавдяки тому, що Венера має власну атмосферу планета вважається найбільш спекотною в\r\nнашій Сонячній системі. Завдяки наявности хмар з сірчаної кислоти та скупчення вуглекислого газу\r\nбіля поверхні, на планеті постійно вируют урагани та завірюхи. Розрахункова швидкість вітру на\r\nпланеті сягає - 800000 км. Особливий інтерес вчених викликає дивний напрям руху\r\nураганів на планеті - від екватора до полюсів планети, а також загадкові блискавки в хмарах\r\nз сірчаної кислоти. Окрім апаратуру Европейського космічного агенства(ESA) Venus Express,\r\nпланету вивчала ціла серія рядянських автоматичних міжпланетних станцій(АМС) Венера.\r\nНайбільш успішними з них були Венера-9 та Венера-10, які змогли здійснити\r\nуспішну посадку на поверхню, взяти проби грунту і відправити дані на Землю. Із-за високої температури на\r\nповерхні планети та виского атмосферного тиску, апарати пропрацювали лише 53 хвилини.\r\nВ майбутньому для вивчення планети планується відправити АМС \"Венера-Д\" та \"Венера-Глоб\".');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `employee_num`
--
ALTER TABLE `employee_num`
  ADD PRIMARY KEY (`e_num`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'counter', AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
