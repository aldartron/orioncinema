-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE TABLE "halls" ------------------------------------
-- CREATE TABLE "halls" ----------------------------------------
CREATE TABLE `halls` ( 
	`cols` Int( 255 ) NULL,
	`id` Int( 255 ) NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`rows` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "movies" -----------------------------------
-- CREATE TABLE "movies" ---------------------------------------
CREATE TABLE `movies` ( 
	`age` Int( 255 ) NULL,
	`annotation` Text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`cast` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`country` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`director` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`duration` Int( 255 ) NULL,
	`end` Date NULL,
	`genre` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`is_high` TinyInt( 255 ) NOT NULL DEFAULT '0',
	`kinopoisk_name` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`original_title` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`placard_name` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`start` Date NULL,
	`title` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`trailer_link` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`year` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 12;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "seats" ------------------------------------
-- CREATE TABLE "seats" ----------------------------------------
CREATE TABLE `seats` ( 
	`col_num` Int( 255 ) NULL,
	`hall_id` Int( 255 ) NULL,
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`is_vip` TinyInt( 1 ) NULL DEFAULT '0',
	`row_num` Int( 255 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1043;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "sessions" ---------------------------------
-- CREATE TABLE "sessions" -------------------------------------
CREATE TABLE `sessions` ( 
	`common_cost` Int( 255 ) NULL,
	`datetime` DateTime NULL,
	`hall_id` Int( 11 ) NULL,
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`movie_id` Int( 255 ) NULL,
	`vip_cost` Int( 255 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 140;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "tickets" ----------------------------------
-- CREATE TABLE "tickets" --------------------------------------
CREATE TABLE `tickets` ( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`is_sold` TinyInt( 1 ) NULL DEFAULT '0',
	`seat_id` Int( 255 ) NULL,
	`session_id` Int( 255 ) NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `seat_session` UNIQUE( `seat_id`, `session_id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 209;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "halls" ------------------------------------
INSERT INTO `halls`(`id`,`name`,`cols`,`rows`) VALUES ( '1', 'Главный зал', '40', '20' );
INSERT INTO `halls`(`id`,`name`,`cols`,`rows`) VALUES ( '2', 'VIP зал', '22', '11' );
-- ---------------------------------------------------------


-- Dump data of "movies" -----------------------------------
INSERT INTO `movies`(`id`,`title`,`annotation`,`director`,`cast`,`genre`,`duration`,`age`,`start`,`end`,`placard_name`,`trailer_link`,`original_title`,`year`,`country`,`is_high`,`kinopoisk_name`) VALUES ( '1', 'Бегущий по лезвию 2049', 'В недалеком будущем мир населен людьми и репликантами, созданными выполнять самую тяжелую работу. Работа офицера полиции Кей — держать репликантов под контролем в условиях нарастающего напряжения… Пока он случайно не становится обладателем секретной информации, которая ставит под угрозу существование всего человечества. Желая найти ключ к разгадке, Кей решает разыскать Рика Декарда, бывшего офицера специального подразделения полиции Лос-Анджелеса, который бесследно исчез много лет назад.', 'Дени Вильнёв', 'Райан Гослинг, Харрисон Форд, Джаред Лето, Дэйв Батиста, Робин Райт, Марк Арнольд, Вильма Сечи, Ана де Армас, Вуд Харрис, Давид Дастмалчян', 'фантастика, триллер', '170', '18', '2017-10-25', '2017-11-05', 'bladerunner_2049', 'gCcx85zbxz4', 'Blade Runner 2049', '2017', 'США, Великобритания, Канада', '1', 'begushchiy-po-lezviyu-2049-2017-589290' );
INSERT INTO `movies`(`id`,`title`,`annotation`,`director`,`cast`,`genre`,`duration`,`age`,`start`,`end`,`placard_name`,`trailer_link`,`original_title`,`year`,`country`,`is_high`,`kinopoisk_name`) VALUES ( '2', 'Залечь на дно в Брюгге', 'После того, как наемные убийцы Рэй и Кен запороли в Лондоне важное задание, их злобный шеф Гарри приказывает им отправиться в Брюгге и не высовываться. Оказавшись в старинном бельгийском городке, Рэй от нечего делать флиртует с местной красоткой, пока Кен наслаждается жизнью и неожиданным отпуском. Кажется, ничто не предвещает беду в спокойном городе…', 'Мартин МакДона', 'Колин Фарелл, Брендан Глисон, Рэйф Файнс, Клеманс Поэзи, Джордан Прентис, Элизабет Беррингтон, Текла Рютен...', 'триллер, драма, комедия, криминал', '102', '18', '2017-10-24', '2017-10-31', 'in_bruges', 'p-gG2qo_l_A', 'In Bruges', '2007', 'Великобритания, США', '0', 'zalech-na-dno-v-bryugge-2007-276295' );
INSERT INTO `movies`(`id`,`title`,`annotation`,`director`,`cast`,`genre`,`duration`,`age`,`start`,`end`,`placard_name`,`trailer_link`,`original_title`,`year`,`country`,`is_high`,`kinopoisk_name`) VALUES ( '3', 'Омерзительная восьмерка', 'США после Гражданской войны. Легендарный охотник за головами Джон Рут по кличке Вешатель конвоирует заключенную. По пути к ним прибиваются еще несколько путешественников. Снежная буря вынуждает компанию искать укрытие в лавке на отшибе, где уже расположилось весьма пестрое общество: генерал конфедератов, мексиканец, ковбой… И один из них — не тот, за кого себя выдает.', 'Квентин Тарантино', 'Курт Расссел, Сэмюэл Л. Джексон, Тим Рот, Майкл Мэдсен, Дженнифер Джейсон Ли, Уолтон Гоггинс, Демиан Бишир, Брюс Дерн, Джеймс Паркс...', 'триллер, драма, криминал, детектив, вестерн', '187', '18', '2017-10-29', '2017-11-07', 'the_hateful_eight', '69UwVX6Riv8', 'The Hateful Eight', '2015', 'США', '1', 'omerzitelnaya-vosmerka-2015-819101' );
INSERT INTO `movies`(`id`,`title`,`annotation`,`director`,`cast`,`genre`,`duration`,`age`,`start`,`end`,`placard_name`,`trailer_link`,`original_title`,`year`,`country`,`is_high`,`kinopoisk_name`) VALUES ( '4', 'Бронсон', 'История жизни британского заключённого Чарльза Бронсона, урождённого Майкла Гордона Питерсона из благополучной британской семьи среднего класса. Бронсон провёл «за решёткой» в одиночной камере за различные нарушения почти 40 лет, и его характеризуют как самого опасного британского преступника.', 'Николас Вендинг Рефн', 'Том Харди, Мэтт Кинг, Джеймс Лэнс, Аманда Бертон, Джонатан Филлипс, Келли Адамс, Луинг Эндрюс, Кэти Баркер...', 'боевик, драма, криминал, биография', '92', '18', '2017-10-24', '2017-10-28', 'bronson', 'paa9knyJKrs', 'Bronson', '2008', 'Великобритания', '0', 'bronson-2008-438272' );
INSERT INTO `movies`(`id`,`title`,`annotation`,`director`,`cast`,`genre`,`duration`,`age`,`start`,`end`,`placard_name`,`trailer_link`,`original_title`,`year`,`country`,`is_high`,`kinopoisk_name`) VALUES ( '5', 'Леон', 'Профессиональный убийца Леон, не знающий пощады и жалости, знакомится со своей очаровательной соседкой Матильдой, семью которой расстреливают полицейские, замешанные в торговле наркотиками. Благодаря этому знакомству он впервые испытывает чувство любви, но…', 'Люк Бессон', 'Жан Рено, Гари Олдман, Натали Портман, Дэнни Айелло, Майкл Бадалукко, Эллен Грин...', 'триллер, драма, криминал', '133', '16', '2017-10-29', '2017-11-03', 'leon', 'DcsirofJrlM', 'Léon', '1994', 'Франция', '1', 'leon-1994-389' );
INSERT INTO `movies`(`id`,`title`,`annotation`,`director`,`cast`,`genre`,`duration`,`age`,`start`,`end`,`placard_name`,`trailer_link`,`original_title`,`year`,`country`,`is_high`,`kinopoisk_name`) VALUES ( '6', 'Metallica: сквозь невозможное', 'Участник технической команды группы Metallica получает задание — привезти сумку, содержимое которой необходимо группе для выступления. Сопровождая таинственную сумку, он попадает в невероятные передряги. Картина представляет собой смесь игрового фильма и концерта.', 'Нимрод Антал', 'Дэйн ДеХаан, Джеймс Хэтфилд, Ларс Ульрих, Кирк Хэммет, Роберт Трухильо...', 'музыка, приключения, концерт', '93', '16', '2017-11-04', '2017-11-07', 'through_the_never', 'VhrLSEG4gY8', 'Metallica Through the Never', '2013', 'США', '0', 'metallica-skvoz-nevozmozhnoe-2013-661625' );
INSERT INTO `movies`(`id`,`title`,`annotation`,`director`,`cast`,`genre`,`duration`,`age`,`start`,`end`,`placard_name`,`trailer_link`,`original_title`,`year`,`country`,`is_high`,`kinopoisk_name`) VALUES ( '7', 'Она', 'Теодор — одинокий писатель, покупает новую техническую разработку — операционную систему, призванную исполнять любое желание пользователя. К удивлению Теодора, вскоре между ним и операционной системой возникает роман.', 'Спайк Джонс', 'Хоакин Феникс, Скарлетт Йоханссон, Эми Адамс, Руни Мара, Крис Пратт, Оливия Уайлд, Мэтт Летчер, Кристен Уиг', 'мелодрама, драма, фантастика', '126', '16', '2017-10-24', '2017-10-28', 'her', '6QRvTv_tpw0', 'Her', '2013', 'США', '1', 'ona-2013-577488' );
INSERT INTO `movies`(`id`,`title`,`annotation`,`director`,`cast`,`genre`,`duration`,`age`,`start`,`end`,`placard_name`,`trailer_link`,`original_title`,`year`,`country`,`is_high`,`kinopoisk_name`) VALUES ( '8', 'Хранители', 'Действие картины разворачивается в параллельной реальности, в Америке 1985 года. В этом мире супергерои стали частью повседневной жизни общества, а Часы Судного Дня, застыв в пяти минутах от полуночи, отсчитывают время до столкновения ведущих мировых держав. После убийства одного из своих прежних коллег Роршах — супергерой, никогда не снимающий маски, — полон решимости свершить суд Линча. 
Он начинает расследование заговора, призванного уничтожить или дискредитировать всех супергероев прошлого и настоящего. Он собирает своих соратников — отставной легион борцов с преступностью, но лишь один из них обладает подлинной силой. Постепенно Роршах осознает пугающий масштаб заговора, связанного с общим прошлым героев и сулящего катастрофические последствия в будущем. Они хранят наш покой, но кто охранит нас от Хранителей?', 'Зак Снайдер', 'Патрик Уилсон, Маттью Гуд, Малин Акерман, Джеки Эрл Хейли, Билли Крудап, Джеффри Дин Морган, Карла Гуджино и др.', 'фантастика, боевик, драма, детектив', '162', '16', '2017-11-01', '2017-11-07', 'watchmen', 'NUjMO_k9IF8', 'Watchmen', '2009', 'США', '0', 'khraniteli-2009-252641' );
INSERT INTO `movies`(`id`,`title`,`annotation`,`director`,`cast`,`genre`,`duration`,`age`,`start`,`end`,`placard_name`,`trailer_link`,`original_title`,`year`,`country`,`is_high`,`kinopoisk_name`) VALUES ( '9', 'Интерстеллар', 'Когда засуха приводит человечество к продовольственному кризису, коллектив исследователей и учёных отправляется сквозь червоточину (которая предположительно соединяет области пространства-времени через большое расстояние) в путешествие, чтобы превзойти прежние ограничения для космических путешествий человека и переселить человечество на другую планету.', 'Кристофер Нолан', 'Мэттью МакКонахи, Энн Хэтэуэй, Джессика Честейн, Маккензи Фой, Майкл Кейн, Дэвид Гяси, Уэс Бентли, Кейси Аффлек, Джон Литгоу, Мэтт Дэймон и др.', 'фантастика, драма, приключения...', '169', '12', '2017-10-29', '2017-11-03', 'interstellar', 'zSWdZVtXT7E', 'Interstellar', '2014', 'США, Великобритания, Канада, Исландия', '1', 'interstellar-2014-258687' );
INSERT INTO `movies`(`id`,`title`,`annotation`,`director`,`cast`,`genre`,`duration`,`age`,`start`,`end`,`placard_name`,`trailer_link`,`original_title`,`year`,`country`,`is_high`,`kinopoisk_name`) VALUES ( '10', 'Безумный макс', 'Преследуемый призраками беспокойного прошлого, Макс уверен, что лучший способ выжить — скитаться в одиночестве. Несмотря на это, он присоединяется к бунтарям, бегущим через всю пустыню на боевой фуре, под предводительством военачальника Фуриосы.
Они пытаются сбежать из Цитадели, страдающей от тирании Несмертного Джо, у которого они забрали кое-что очень ценное. Разъярённый военачальник бросает все свои силы на погоню за мятежниками, ступая на дорогу войны — дорогу ярости.', 'Джордж Миллер', 'Том Харди, Шарлиз Терон, Николас Холт, Хью Кияс-Бёрн, Райли Кио, Роузи Хантингтон-Уайтли, Зои Кравиц, Эбби Ли и др.', 'боевик, фантастика, приключения...', '120', '16', '2017-10-24', '2017-10-31', 'mad_max_fury_road', 'hEJnMQG9ev8', 'Mad Max: Fury Road', '2015', 'Австралия, США', '1', 'bezumnyy-maks-doroga-yarosti-2015-453406' );
INSERT INTO `movies`(`id`,`title`,`annotation`,`director`,`cast`,`genre`,`duration`,`age`,`start`,`end`,`placard_name`,`trailer_link`,`original_title`,`year`,`country`,`is_high`,`kinopoisk_name`) VALUES ( '11', 'Роджер Уотерс: The Wall', 'Фильм представляет собой уникальный сплав реставрированных концертных съемок, документальной хроники, анимационных фрагментов и самых передовых технологий визуального изображения и спец-эффектов, Роджер Уотерс также включил кадры из своей автобиографии.', 'Шон Эванс, Роджер Уотерс', 'Роджер Уотерс, Дэйв Килминстер, Сноуи Уайт, Г.И. Смит, Джон Кэрин, Гарри Уотерс, Грэхэм Броад и др.', 'музыка, концерт, документальный', '170', '12', '2017-10-24', '2017-10-28', 'roger_waters_the_wall', 'ZuPyeCX7Fgg', 'Roger Waters: The Wall', '2014', 'Великобритания', '0', 'rodzher-uoters-the-wall-2014-847406' );
-- ---------------------------------------------------------


-- Dump data of "seats" ------------------------------------
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1', '1', '1', '1', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '2', '1', '1', '2', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '3', '1', '1', '3', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '4', '1', '1', '4', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '5', '1', '1', '5', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '6', '1', '1', '6', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '7', '1', '1', '7', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '8', '1', '1', '8', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '9', '1', '1', '9', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '10', '1', '1', '10', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '11', '1', '1', '11', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '12', '1', '1', '12', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '13', '1', '1', '13', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '14', '1', '1', '14', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '15', '1', '1', '15', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '16', '1', '1', '16', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '17', '1', '1', '17', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '18', '1', '1', '18', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '19', '1', '1', '19', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '20', '1', '1', '20', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '21', '1', '1', '21', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '22', '1', '1', '22', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '23', '1', '1', '23', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '24', '1', '1', '24', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '25', '1', '1', '25', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '26', '1', '1', '26', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '27', '1', '1', '27', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '28', '1', '1', '28', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '29', '1', '1', '29', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '30', '1', '1', '30', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '31', '1', '1', '31', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '32', '1', '1', '32', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '33', '1', '1', '33', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '34', '1', '1', '34', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '35', '1', '1', '35', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '36', '1', '1', '36', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '37', '1', '1', '37', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '38', '1', '1', '38', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '39', '1', '1', '39', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '40', '1', '1', '40', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '41', '1', '2', '1', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '42', '1', '2', '2', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '43', '1', '2', '3', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '44', '1', '2', '4', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '45', '1', '2', '5', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '46', '1', '2', '6', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '47', '1', '2', '7', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '48', '1', '2', '8', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '49', '1', '2', '9', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '50', '1', '2', '10', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '51', '1', '2', '11', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '52', '1', '2', '12', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '53', '1', '2', '13', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '54', '1', '2', '14', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '55', '1', '2', '15', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '56', '1', '2', '16', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '57', '1', '2', '17', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '58', '1', '2', '18', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '59', '1', '2', '19', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '60', '1', '2', '20', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '61', '1', '2', '21', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '62', '1', '2', '22', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '63', '1', '2', '23', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '64', '1', '2', '24', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '65', '1', '2', '25', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '66', '1', '2', '26', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '67', '1', '2', '27', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '68', '1', '2', '28', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '69', '1', '2', '29', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '70', '1', '2', '30', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '71', '1', '2', '31', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '72', '1', '2', '32', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '73', '1', '2', '33', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '74', '1', '2', '34', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '75', '1', '2', '35', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '76', '1', '2', '36', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '77', '1', '2', '37', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '78', '1', '2', '38', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '79', '1', '2', '39', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '80', '1', '2', '40', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '81', '1', '3', '1', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '82', '1', '3', '2', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '83', '1', '3', '3', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '84', '1', '3', '4', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '85', '1', '3', '5', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '86', '1', '3', '6', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '87', '1', '3', '7', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '88', '1', '3', '8', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '89', '1', '3', '9', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '90', '1', '3', '10', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '91', '1', '3', '11', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '92', '1', '3', '12', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '93', '1', '3', '13', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '94', '1', '3', '14', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '95', '1', '3', '15', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '96', '1', '3', '16', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '97', '1', '3', '17', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '98', '1', '3', '18', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '99', '1', '3', '19', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '100', '1', '3', '20', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '101', '1', '3', '21', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '102', '1', '3', '22', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '103', '1', '3', '23', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '104', '1', '3', '24', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '105', '1', '3', '25', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '106', '1', '3', '26', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '107', '1', '3', '27', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '108', '1', '3', '28', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '109', '1', '3', '29', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '110', '1', '3', '30', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '111', '1', '3', '31', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '112', '1', '3', '32', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '113', '1', '3', '33', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '114', '1', '3', '34', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '115', '1', '3', '35', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '116', '1', '3', '36', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '117', '1', '3', '37', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '118', '1', '3', '38', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '119', '1', '3', '39', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '120', '1', '3', '40', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '121', '1', '4', '1', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '122', '1', '4', '2', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '123', '1', '4', '3', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '124', '1', '4', '4', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '125', '1', '4', '5', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '126', '1', '4', '6', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '127', '1', '4', '7', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '128', '1', '4', '8', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '129', '1', '4', '9', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '130', '1', '4', '10', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '131', '1', '4', '11', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '132', '1', '4', '12', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '133', '1', '4', '13', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '134', '1', '4', '14', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '135', '1', '4', '15', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '136', '1', '4', '16', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '137', '1', '4', '17', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '138', '1', '4', '18', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '139', '1', '4', '19', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '140', '1', '4', '20', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '141', '1', '4', '21', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '142', '1', '4', '22', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '143', '1', '4', '23', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '144', '1', '4', '24', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '145', '1', '4', '25', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '146', '1', '4', '26', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '147', '1', '4', '27', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '148', '1', '4', '28', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '149', '1', '4', '29', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '150', '1', '4', '30', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '151', '1', '4', '31', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '152', '1', '4', '32', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '153', '1', '4', '33', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '154', '1', '4', '34', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '155', '1', '4', '35', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '156', '1', '4', '36', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '157', '1', '4', '37', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '158', '1', '4', '38', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '159', '1', '4', '39', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '160', '1', '4', '40', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '161', '1', '5', '1', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '162', '1', '5', '2', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '163', '1', '5', '3', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '164', '1', '5', '4', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '165', '1', '5', '5', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '166', '1', '5', '6', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '167', '1', '5', '7', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '168', '1', '5', '8', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '169', '1', '5', '9', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '170', '1', '5', '10', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '171', '1', '5', '11', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '172', '1', '5', '12', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '173', '1', '5', '13', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '174', '1', '5', '14', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '175', '1', '5', '15', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '176', '1', '5', '16', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '177', '1', '5', '17', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '178', '1', '5', '18', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '179', '1', '5', '19', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '180', '1', '5', '20', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '181', '1', '5', '21', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '182', '1', '5', '22', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '183', '1', '5', '23', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '184', '1', '5', '24', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '185', '1', '5', '25', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '186', '1', '5', '26', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '187', '1', '5', '27', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '188', '1', '5', '28', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '189', '1', '5', '29', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '190', '1', '5', '30', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '191', '1', '5', '31', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '192', '1', '5', '32', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '193', '1', '5', '33', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '194', '1', '5', '34', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '195', '1', '5', '35', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '196', '1', '5', '36', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '197', '1', '5', '37', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '198', '1', '5', '38', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '199', '1', '5', '39', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '200', '1', '5', '40', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '201', '1', '6', '1', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '202', '1', '6', '2', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '203', '1', '6', '3', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '204', '1', '6', '4', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '205', '1', '6', '5', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '206', '1', '6', '6', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '207', '1', '6', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '208', '1', '6', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '209', '1', '6', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '210', '1', '6', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '211', '1', '6', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '212', '1', '6', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '213', '1', '6', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '214', '1', '6', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '215', '1', '6', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '216', '1', '6', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '217', '1', '6', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '218', '1', '6', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '219', '1', '6', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '220', '1', '6', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '221', '1', '6', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '222', '1', '6', '22', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '223', '1', '6', '23', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '224', '1', '6', '24', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '225', '1', '6', '25', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '226', '1', '6', '26', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '227', '1', '6', '27', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '228', '1', '6', '28', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '229', '1', '6', '29', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '230', '1', '6', '30', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '231', '1', '6', '31', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '232', '1', '6', '32', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '233', '1', '6', '33', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '234', '1', '6', '34', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '235', '1', '6', '35', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '236', '1', '6', '36', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '237', '1', '6', '37', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '238', '1', '6', '38', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '239', '1', '6', '39', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '240', '1', '6', '40', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '241', '1', '7', '1', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '242', '1', '7', '2', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '243', '1', '7', '3', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '244', '1', '7', '4', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '245', '1', '7', '5', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '246', '1', '7', '6', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '247', '1', '7', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '248', '1', '7', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '249', '1', '7', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '250', '1', '7', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '251', '1', '7', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '252', '1', '7', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '253', '1', '7', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '254', '1', '7', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '255', '1', '7', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '256', '1', '7', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '257', '1', '7', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '258', '1', '7', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '259', '1', '7', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '260', '1', '7', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '261', '1', '7', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '262', '1', '7', '22', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '263', '1', '7', '23', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '264', '1', '7', '24', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '265', '1', '7', '25', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '266', '1', '7', '26', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '267', '1', '7', '27', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '268', '1', '7', '28', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '269', '1', '7', '29', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '270', '1', '7', '30', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '271', '1', '7', '31', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '272', '1', '7', '32', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '273', '1', '7', '33', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '274', '1', '7', '34', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '275', '1', '7', '35', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '276', '1', '7', '36', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '277', '1', '7', '37', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '278', '1', '7', '38', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '279', '1', '7', '39', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '280', '1', '7', '40', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '281', '1', '8', '1', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '282', '1', '8', '2', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '283', '1', '8', '3', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '284', '1', '8', '4', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '285', '1', '8', '5', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '286', '1', '8', '6', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '287', '1', '8', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '288', '1', '8', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '289', '1', '8', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '290', '1', '8', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '291', '1', '8', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '292', '1', '8', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '293', '1', '8', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '294', '1', '8', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '295', '1', '8', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '296', '1', '8', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '297', '1', '8', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '298', '1', '8', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '299', '1', '8', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '300', '1', '8', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '301', '1', '8', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '302', '1', '8', '22', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '303', '1', '8', '23', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '304', '1', '8', '24', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '305', '1', '8', '25', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '306', '1', '8', '26', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '307', '1', '8', '27', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '308', '1', '8', '28', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '309', '1', '8', '29', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '310', '1', '8', '30', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '311', '1', '8', '31', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '312', '1', '8', '32', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '313', '1', '8', '33', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '314', '1', '8', '34', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '315', '1', '8', '35', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '316', '1', '8', '36', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '317', '1', '8', '37', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '318', '1', '8', '38', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '319', '1', '8', '39', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '320', '1', '8', '40', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '321', '1', '9', '1', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '322', '1', '9', '2', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '323', '1', '9', '3', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '324', '1', '9', '4', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '325', '1', '9', '5', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '326', '1', '9', '6', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '327', '1', '9', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '328', '1', '9', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '329', '1', '9', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '330', '1', '9', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '331', '1', '9', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '332', '1', '9', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '333', '1', '9', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '334', '1', '9', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '335', '1', '9', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '336', '1', '9', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '337', '1', '9', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '338', '1', '9', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '339', '1', '9', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '340', '1', '9', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '341', '1', '9', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '342', '1', '9', '22', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '343', '1', '9', '23', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '344', '1', '9', '24', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '345', '1', '9', '25', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '346', '1', '9', '26', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '347', '1', '9', '27', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '348', '1', '9', '28', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '349', '1', '9', '29', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '350', '1', '9', '30', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '351', '1', '9', '31', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '352', '1', '9', '32', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '353', '1', '9', '33', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '354', '1', '9', '34', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '355', '1', '9', '35', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '356', '1', '9', '36', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '357', '1', '9', '37', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '358', '1', '9', '38', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '359', '1', '9', '39', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '360', '1', '9', '40', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '361', '1', '10', '1', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '362', '1', '10', '2', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '363', '1', '10', '3', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '364', '1', '10', '4', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '365', '1', '10', '5', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '366', '1', '10', '6', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '367', '1', '10', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '368', '1', '10', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '369', '1', '10', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '370', '1', '10', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '371', '1', '10', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '372', '1', '10', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '373', '1', '10', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '374', '1', '10', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '375', '1', '10', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '376', '1', '10', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '377', '1', '10', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '378', '1', '10', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '379', '1', '10', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '380', '1', '10', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '381', '1', '10', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '382', '1', '10', '22', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '383', '1', '10', '23', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '384', '1', '10', '24', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '385', '1', '10', '25', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '386', '1', '10', '26', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '387', '1', '10', '27', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '388', '1', '10', '28', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '389', '1', '10', '29', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '390', '1', '10', '30', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '391', '1', '10', '31', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '392', '1', '10', '32', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '393', '1', '10', '33', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '394', '1', '10', '34', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '395', '1', '10', '35', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '396', '1', '10', '36', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '397', '1', '10', '37', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '398', '1', '10', '38', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '399', '1', '10', '39', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '400', '1', '10', '40', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '401', '1', '11', '1', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '402', '1', '11', '2', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '403', '1', '11', '3', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '404', '1', '11', '4', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '405', '1', '11', '5', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '406', '1', '11', '6', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '407', '1', '11', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '408', '1', '11', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '409', '1', '11', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '410', '1', '11', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '411', '1', '11', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '412', '1', '11', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '413', '1', '11', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '414', '1', '11', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '415', '1', '11', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '416', '1', '11', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '417', '1', '11', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '418', '1', '11', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '419', '1', '11', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '420', '1', '11', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '421', '1', '11', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '422', '1', '11', '22', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '423', '1', '11', '23', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '424', '1', '11', '24', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '425', '1', '11', '25', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '426', '1', '11', '26', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '427', '1', '11', '27', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '428', '1', '11', '28', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '429', '1', '11', '29', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '430', '1', '11', '30', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '431', '1', '11', '31', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '432', '1', '11', '32', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '433', '1', '11', '33', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '434', '1', '11', '34', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '435', '1', '11', '35', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '436', '1', '11', '36', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '437', '1', '11', '37', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '438', '1', '11', '38', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '439', '1', '11', '39', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '440', '1', '11', '40', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '441', '1', '12', '1', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '442', '1', '12', '2', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '443', '1', '12', '3', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '444', '1', '12', '4', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '445', '1', '12', '5', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '446', '1', '12', '6', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '447', '1', '12', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '448', '1', '12', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '449', '1', '12', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '450', '1', '12', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '451', '1', '12', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '452', '1', '12', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '453', '1', '12', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '454', '1', '12', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '455', '1', '12', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '456', '1', '12', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '457', '1', '12', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '458', '1', '12', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '459', '1', '12', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '460', '1', '12', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '461', '1', '12', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '462', '1', '12', '22', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '463', '1', '12', '23', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '464', '1', '12', '24', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '465', '1', '12', '25', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '466', '1', '12', '26', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '467', '1', '12', '27', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '468', '1', '12', '28', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '469', '1', '12', '29', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '470', '1', '12', '30', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '471', '1', '12', '31', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '472', '1', '12', '32', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '473', '1', '12', '33', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '474', '1', '12', '34', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '475', '1', '12', '35', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '476', '1', '12', '36', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '477', '1', '12', '37', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '478', '1', '12', '38', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '479', '1', '12', '39', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '480', '1', '12', '40', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '481', '1', '13', '1', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '482', '1', '13', '2', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '483', '1', '13', '3', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '484', '1', '13', '4', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '485', '1', '13', '5', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '486', '1', '13', '6', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '487', '1', '13', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '488', '1', '13', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '489', '1', '13', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '490', '1', '13', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '491', '1', '13', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '492', '1', '13', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '493', '1', '13', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '494', '1', '13', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '495', '1', '13', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '496', '1', '13', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '497', '1', '13', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '498', '1', '13', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '499', '1', '13', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '500', '1', '13', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '501', '1', '13', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '502', '1', '13', '22', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '503', '1', '13', '23', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '504', '1', '13', '24', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '505', '1', '13', '25', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '506', '1', '13', '26', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '507', '1', '13', '27', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '508', '1', '13', '28', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '509', '1', '13', '29', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '510', '1', '13', '30', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '511', '1', '13', '31', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '512', '1', '13', '32', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '513', '1', '13', '33', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '514', '1', '13', '34', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '515', '1', '13', '35', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '516', '1', '13', '36', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '517', '1', '13', '37', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '518', '1', '13', '38', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '519', '1', '13', '39', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '520', '1', '13', '40', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '521', '1', '14', '1', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '522', '1', '14', '2', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '523', '1', '14', '3', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '524', '1', '14', '4', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '525', '1', '14', '5', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '526', '1', '14', '6', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '527', '1', '14', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '528', '1', '14', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '529', '1', '14', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '530', '1', '14', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '531', '1', '14', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '532', '1', '14', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '533', '1', '14', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '534', '1', '14', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '535', '1', '14', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '536', '1', '14', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '537', '1', '14', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '538', '1', '14', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '539', '1', '14', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '540', '1', '14', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '541', '1', '14', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '542', '1', '14', '22', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '543', '1', '14', '23', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '544', '1', '14', '24', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '545', '1', '14', '25', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '546', '1', '14', '26', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '547', '1', '14', '27', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '548', '1', '14', '28', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '549', '1', '14', '29', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '550', '1', '14', '30', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '551', '1', '14', '31', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '552', '1', '14', '32', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '553', '1', '14', '33', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '554', '1', '14', '34', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '555', '1', '14', '35', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '556', '1', '14', '36', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '557', '1', '14', '37', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '558', '1', '14', '38', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '559', '1', '14', '39', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '560', '1', '14', '40', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '561', '1', '15', '1', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '562', '1', '15', '2', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '563', '1', '15', '3', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '564', '1', '15', '4', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '565', '1', '15', '5', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '566', '1', '15', '6', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '567', '1', '15', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '568', '1', '15', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '569', '1', '15', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '570', '1', '15', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '571', '1', '15', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '572', '1', '15', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '573', '1', '15', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '574', '1', '15', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '575', '1', '15', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '576', '1', '15', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '577', '1', '15', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '578', '1', '15', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '579', '1', '15', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '580', '1', '15', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '581', '1', '15', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '582', '1', '15', '22', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '583', '1', '15', '23', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '584', '1', '15', '24', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '585', '1', '15', '25', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '586', '1', '15', '26', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '587', '1', '15', '27', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '588', '1', '15', '28', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '589', '1', '15', '29', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '590', '1', '15', '30', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '591', '1', '15', '31', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '592', '1', '15', '32', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '593', '1', '15', '33', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '594', '1', '15', '34', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '595', '1', '15', '35', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '596', '1', '15', '36', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '597', '1', '15', '37', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '598', '1', '15', '38', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '599', '1', '15', '39', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '600', '1', '15', '40', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '601', '1', '16', '1', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '602', '1', '16', '2', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '603', '1', '16', '3', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '604', '1', '16', '4', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '605', '1', '16', '5', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '606', '1', '16', '6', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '607', '1', '16', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '608', '1', '16', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '609', '1', '16', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '610', '1', '16', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '611', '1', '16', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '612', '1', '16', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '613', '1', '16', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '614', '1', '16', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '615', '1', '16', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '616', '1', '16', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '617', '1', '16', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '618', '1', '16', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '619', '1', '16', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '620', '1', '16', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '621', '1', '16', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '622', '1', '16', '22', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '623', '1', '16', '23', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '624', '1', '16', '24', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '625', '1', '16', '25', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '626', '1', '16', '26', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '627', '1', '16', '27', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '628', '1', '16', '28', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '629', '1', '16', '29', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '630', '1', '16', '30', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '631', '1', '16', '31', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '632', '1', '16', '32', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '633', '1', '16', '33', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '634', '1', '16', '34', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '635', '1', '16', '35', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '636', '1', '16', '36', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '637', '1', '16', '37', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '638', '1', '16', '38', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '639', '1', '16', '39', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '640', '1', '16', '40', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '641', '1', '17', '1', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '642', '1', '17', '2', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '643', '1', '17', '3', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '644', '1', '17', '4', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '645', '1', '17', '5', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '646', '1', '17', '6', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '647', '1', '17', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '648', '1', '17', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '649', '1', '17', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '650', '1', '17', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '651', '1', '17', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '652', '1', '17', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '653', '1', '17', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '654', '1', '17', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '655', '1', '17', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '656', '1', '17', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '657', '1', '17', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '658', '1', '17', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '659', '1', '17', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '660', '1', '17', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '661', '1', '17', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '662', '1', '17', '22', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '663', '1', '17', '23', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '664', '1', '17', '24', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '665', '1', '17', '25', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '666', '1', '17', '26', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '667', '1', '17', '27', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '668', '1', '17', '28', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '669', '1', '17', '29', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '670', '1', '17', '30', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '671', '1', '17', '31', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '672', '1', '17', '32', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '673', '1', '17', '33', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '674', '1', '17', '34', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '675', '1', '17', '35', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '676', '1', '17', '36', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '677', '1', '17', '37', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '678', '1', '17', '38', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '679', '1', '17', '39', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '680', '1', '17', '40', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '681', '1', '18', '1', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '682', '1', '18', '2', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '683', '1', '18', '3', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '684', '1', '18', '4', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '685', '1', '18', '5', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '686', '1', '18', '6', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '687', '1', '18', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '688', '1', '18', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '689', '1', '18', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '690', '1', '18', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '691', '1', '18', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '692', '1', '18', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '693', '1', '18', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '694', '1', '18', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '695', '1', '18', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '696', '1', '18', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '697', '1', '18', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '698', '1', '18', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '699', '1', '18', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '700', '1', '18', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '701', '1', '18', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '702', '1', '18', '22', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '703', '1', '18', '23', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '704', '1', '18', '24', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '705', '1', '18', '25', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '706', '1', '18', '26', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '707', '1', '18', '27', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '708', '1', '18', '28', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '709', '1', '18', '29', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '710', '1', '18', '30', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '711', '1', '18', '31', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '712', '1', '18', '32', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '713', '1', '18', '33', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '714', '1', '18', '34', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '715', '1', '18', '35', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '716', '1', '18', '36', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '717', '1', '18', '37', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '718', '1', '18', '38', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '719', '1', '18', '39', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '720', '1', '18', '40', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '721', '1', '19', '1', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '722', '1', '19', '2', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '723', '1', '19', '3', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '724', '1', '19', '4', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '725', '1', '19', '5', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '726', '1', '19', '6', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '727', '1', '19', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '728', '1', '19', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '729', '1', '19', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '730', '1', '19', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '731', '1', '19', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '732', '1', '19', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '733', '1', '19', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '734', '1', '19', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '735', '1', '19', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '736', '1', '19', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '737', '1', '19', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '738', '1', '19', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '739', '1', '19', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '740', '1', '19', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '741', '1', '19', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '742', '1', '19', '22', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '743', '1', '19', '23', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '744', '1', '19', '24', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '745', '1', '19', '25', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '746', '1', '19', '26', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '747', '1', '19', '27', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '748', '1', '19', '28', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '749', '1', '19', '29', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '750', '1', '19', '30', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '751', '1', '19', '31', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '752', '1', '19', '32', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '753', '1', '19', '33', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '754', '1', '19', '34', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '755', '1', '19', '35', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '756', '1', '19', '36', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '757', '1', '19', '37', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '758', '1', '19', '38', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '759', '1', '19', '39', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '760', '1', '19', '40', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '761', '1', '20', '1', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '762', '1', '20', '2', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '763', '1', '20', '3', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '764', '1', '20', '4', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '765', '1', '20', '5', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '766', '1', '20', '6', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '767', '1', '20', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '768', '1', '20', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '769', '1', '20', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '770', '1', '20', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '771', '1', '20', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '772', '1', '20', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '773', '1', '20', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '774', '1', '20', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '775', '1', '20', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '776', '1', '20', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '777', '1', '20', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '778', '1', '20', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '779', '1', '20', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '780', '1', '20', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '781', '1', '20', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '782', '1', '20', '22', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '783', '1', '20', '23', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '784', '1', '20', '24', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '785', '1', '20', '25', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '786', '1', '20', '26', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '787', '1', '20', '27', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '788', '1', '20', '28', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '789', '1', '20', '29', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '790', '1', '20', '30', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '791', '1', '20', '31', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '792', '1', '20', '32', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '793', '1', '20', '33', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '794', '1', '20', '34', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '795', '1', '20', '35', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '796', '1', '20', '36', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '797', '1', '20', '37', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '798', '1', '20', '38', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '799', '1', '20', '39', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '800', '1', '20', '40', '0' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '801', '2', '1', '1', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '802', '2', '1', '2', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '803', '2', '1', '3', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '804', '2', '1', '4', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '805', '2', '1', '5', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '806', '2', '1', '6', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '807', '2', '1', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '808', '2', '1', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '809', '2', '1', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '810', '2', '1', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '811', '2', '1', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '812', '2', '1', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '813', '2', '1', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '814', '2', '1', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '815', '2', '1', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '816', '2', '1', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '817', '2', '1', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '818', '2', '1', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '819', '2', '1', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '820', '2', '1', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '821', '2', '1', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '822', '2', '1', '22', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '823', '2', '2', '1', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '824', '2', '2', '2', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '825', '2', '2', '3', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '826', '2', '2', '4', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '827', '2', '2', '5', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '828', '2', '2', '6', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '829', '2', '2', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '830', '2', '2', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '831', '2', '2', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '832', '2', '2', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '833', '2', '2', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '834', '2', '2', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '835', '2', '2', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '836', '2', '2', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '837', '2', '2', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '838', '2', '2', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '839', '2', '2', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '840', '2', '2', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '841', '2', '2', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '842', '2', '2', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '843', '2', '2', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '844', '2', '2', '22', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '845', '2', '3', '1', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '846', '2', '3', '2', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '847', '2', '3', '3', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '848', '2', '3', '4', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '849', '2', '3', '5', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '850', '2', '3', '6', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '851', '2', '3', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '852', '2', '3', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '853', '2', '3', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '854', '2', '3', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '855', '2', '3', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '856', '2', '3', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '857', '2', '3', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '858', '2', '3', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '859', '2', '3', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '860', '2', '3', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '861', '2', '3', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '862', '2', '3', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '863', '2', '3', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '864', '2', '3', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '865', '2', '3', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '866', '2', '3', '22', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '867', '2', '4', '1', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '868', '2', '4', '2', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '869', '2', '4', '3', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '870', '2', '4', '4', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '871', '2', '4', '5', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '872', '2', '4', '6', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '873', '2', '4', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '874', '2', '4', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '875', '2', '4', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '876', '2', '4', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '877', '2', '4', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '878', '2', '4', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '879', '2', '4', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '880', '2', '4', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '881', '2', '4', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '882', '2', '4', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '883', '2', '4', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '884', '2', '4', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '885', '2', '4', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '886', '2', '4', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '887', '2', '4', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '888', '2', '4', '22', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '889', '2', '5', '1', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '890', '2', '5', '2', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '891', '2', '5', '3', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '892', '2', '5', '4', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '893', '2', '5', '5', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '894', '2', '5', '6', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '895', '2', '5', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '896', '2', '5', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '897', '2', '5', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '898', '2', '5', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '899', '2', '5', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '900', '2', '5', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '901', '2', '5', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '902', '2', '5', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '903', '2', '5', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '904', '2', '5', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '905', '2', '5', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '906', '2', '5', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '907', '2', '5', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '908', '2', '5', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '909', '2', '5', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '910', '2', '5', '22', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '911', '2', '6', '1', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '912', '2', '6', '2', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '913', '2', '6', '3', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '914', '2', '6', '4', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '915', '2', '6', '5', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '916', '2', '6', '6', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '917', '2', '6', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '918', '2', '6', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '919', '2', '6', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '920', '2', '6', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '921', '2', '6', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '922', '2', '6', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '923', '2', '6', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '924', '2', '6', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '925', '2', '6', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '926', '2', '6', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '927', '2', '6', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '928', '2', '6', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '929', '2', '6', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '930', '2', '6', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '931', '2', '6', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '932', '2', '6', '22', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '933', '2', '7', '1', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '934', '2', '7', '2', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '935', '2', '7', '3', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '936', '2', '7', '4', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '937', '2', '7', '5', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '938', '2', '7', '6', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '939', '2', '7', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '940', '2', '7', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '941', '2', '7', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '942', '2', '7', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '943', '2', '7', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '944', '2', '7', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '945', '2', '7', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '946', '2', '7', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '947', '2', '7', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '948', '2', '7', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '949', '2', '7', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '950', '2', '7', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '951', '2', '7', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '952', '2', '7', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '953', '2', '7', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '954', '2', '7', '22', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '955', '2', '8', '1', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '956', '2', '8', '2', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '957', '2', '8', '3', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '958', '2', '8', '4', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '959', '2', '8', '5', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '960', '2', '8', '6', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '961', '2', '8', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '962', '2', '8', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '963', '2', '8', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '964', '2', '8', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '965', '2', '8', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '966', '2', '8', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '967', '2', '8', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '968', '2', '8', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '969', '2', '8', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '970', '2', '8', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '971', '2', '8', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '972', '2', '8', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '973', '2', '8', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '974', '2', '8', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '975', '2', '8', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '976', '2', '8', '22', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '977', '2', '9', '1', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '978', '2', '9', '2', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '979', '2', '9', '3', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '980', '2', '9', '4', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '981', '2', '9', '5', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '982', '2', '9', '6', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '983', '2', '9', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '984', '2', '9', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '985', '2', '9', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '986', '2', '9', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '987', '2', '9', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '988', '2', '9', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '989', '2', '9', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '990', '2', '9', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '991', '2', '9', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '992', '2', '9', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '993', '2', '9', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '994', '2', '9', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '995', '2', '9', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '996', '2', '9', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '997', '2', '9', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '998', '2', '9', '22', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '999', '2', '10', '1', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1000', '2', '10', '2', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1001', '2', '10', '3', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1002', '2', '10', '4', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1003', '2', '10', '5', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1004', '2', '10', '6', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1005', '2', '10', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1006', '2', '10', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1007', '2', '10', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1008', '2', '10', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1009', '2', '10', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1010', '2', '10', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1011', '2', '10', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1012', '2', '10', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1013', '2', '10', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1014', '2', '10', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1015', '2', '10', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1016', '2', '10', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1017', '2', '10', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1018', '2', '10', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1019', '2', '10', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1020', '2', '10', '22', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1021', '2', '11', '1', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1022', '2', '11', '2', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1023', '2', '11', '3', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1024', '2', '11', '4', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1025', '2', '11', '5', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1026', '2', '11', '6', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1027', '2', '11', '7', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1028', '2', '11', '8', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1029', '2', '11', '9', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1030', '2', '11', '10', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1031', '2', '11', '11', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1032', '2', '11', '12', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1033', '2', '11', '13', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1034', '2', '11', '14', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1035', '2', '11', '15', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1036', '2', '11', '16', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1037', '2', '11', '17', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1038', '2', '11', '18', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1039', '2', '11', '19', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1040', '2', '11', '20', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1041', '2', '11', '21', '1' );
INSERT INTO `seats`(`id`,`hall_id`,`row_num`,`col_num`,`is_vip`) VALUES ( '1042', '2', '11', '22', '1' );
-- ---------------------------------------------------------


-- Dump data of "sessions" ---------------------------------
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '1', '1', '2017-10-25 16:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '2', '1', '2017-10-26 16:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '3', '1', '2017-10-27 16:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '4', '1', '2017-10-28 16:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '5', '1', '2017-10-29 16:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '6', '1', '2017-10-30 16:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '7', '1', '2017-10-31 16:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '8', '1', '2017-11-01 20:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '9', '1', '2017-11-02 20:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '10', '1', '2017-11-03 20:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '11', '1', '2017-10-25 20:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '12', '1', '2017-10-26 20:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '13', '1', '2017-10-27 20:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '14', '1', '2017-10-28 20:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '15', '1', '2017-10-29 20:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '16', '1', '2017-10-30 20:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '17', '1', '2017-10-31 20:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '18', '2', '2017-10-24 13:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '19', '2', '2017-10-25 13:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '20', '2', '2017-10-26 13:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '21', '2', '2017-10-27 13:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '22', '2', '2017-10-28 13:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '23', '3', '2017-10-29 00:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '24', '3', '2017-10-30 00:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '25', '3', '2017-10-31 00:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '26', '3', '2017-11-01 00:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '27', '3', '2017-11-02 00:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '28', '3', '2017-11-03 00:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '29', '3', '2017-11-04 00:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '30', '3', '2017-11-05 00:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '31', '3', '2017-11-06 00:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '32', '3', '2017-11-07 00:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '33', '4', '2017-10-24 08:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '34', '4', '2017-10-25 08:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '35', '4', '2017-10-26 08:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '36', '4', '2017-10-27 08:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '37', '4', '2017-10-28 08:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '38', '5', '2017-10-29 11:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '39', '5', '2017-10-30 11:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '40', '5', '2017-10-31 11:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '41', '5', '2017-11-01 12:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '42', '5', '2017-11-02 12:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '43', '5', '2017-11-03 12:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '44', '6', '2017-11-04 13:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '45', '6', '2017-11-05 13:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '46', '6', '2017-11-06 13:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '47', '6', '2017-11-07 13:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '48', '7', '2017-10-24 23:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '49', '7', '2017-10-25 23:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '50', '7', '2017-10-26 23:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '51', '7', '2017-10-27 23:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '52', '7', '2017-10-28 23:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '53', '8', '2017-11-01 08:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '54', '8', '2017-11-02 08:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '55', '8', '2017-11-03 08:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '56', '8', '2017-11-04 08:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '57', '8', '2017-11-05 08:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '58', '8', '2017-11-06 08:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '59', '8', '2017-11-07 08:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '60', '8', '2017-11-01 16:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '61', '8', '2017-11-02 16:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '62', '8', '2017-11-03 16:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '63', '8', '2017-11-04 16:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '64', '8', '2017-11-05 16:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '65', '8', '2017-11-06 16:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '66', '8', '2017-11-07 16:00:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '67', '9', '2017-10-29 08:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '68', '9', '2017-10-30 08:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '69', '9', '2017-10-31 08:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '70', '9', '2017-10-29 13:45:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '71', '9', '2017-10-30 13:45:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '72', '9', '2017-10-31 13:45:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '73', '10', '2017-10-24 10:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '74', '10', '2017-10-25 10:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '75', '10', '2017-10-26 10:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '76', '10', '2017-10-27 10:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '77', '10', '2017-10-28 10:30:00', '1', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '78', '1', '2017-10-25 12:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '79', '1', '2017-10-26 12:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '80', '1', '2017-10-27 12:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '81', '1', '2017-10-28 12:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '82', '1', '2017-10-29 12:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '83', '1', '2017-10-30 12:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '84', '1', '2017-10-31 12:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '85', '1', '2017-11-01 10:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '86', '1', '2017-11-02 10:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '87', '1', '2017-11-03 10:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '88', '1', '2017-11-04 10:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '89', '1', '2017-11-05 10:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '90', '2', '2017-10-24 17:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '91', '2', '2017-10-25 17:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '92', '2', '2017-10-26 17:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '93', '2', '2017-10-27 17:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '94', '2', '2017-10-28 17:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '95', '2', '2017-10-29 17:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '96', '2', '2017-10-30 17:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '97', '2', '2017-10-31 17:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '98', '3', '2017-10-29 19:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '99', '3', '2017-10-30 19:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '100', '3', '2017-10-31 19:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '101', '3', '2017-11-01 19:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '102', '3', '2017-11-02 19:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '103', '3', '2017-11-03 19:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '104', '4', '2017-10-24 19:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '105', '4', '2017-10-25 19:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '106', '4', '2017-10-26 19:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '107', '4', '2017-10-27 19:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '108', '4', '2017-10-28 19:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '109', '6', '2017-11-04 00:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '110', '6', '2017-11-05 00:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '111', '6', '2017-11-06 00:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '112', '6', '2017-11-07 00:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '113', '7', '2017-10-24 12:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '114', '7', '2017-10-25 08:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '115', '7', '2017-10-26 08:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '116', '7', '2017-10-27 08:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '117', '7', '2017-10-28 08:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '118', '8', '2017-11-01 13:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '119', '8', '2017-11-02 13:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '120', '8', '2017-11-03 13:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '121', '8', '2017-11-04 13:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '122', '8', '2017-11-05 13:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '123', '8', '2017-11-06 13:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '124', '8', '2017-11-07 13:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '125', '8', '2017-11-08 13:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '126', '9', '2017-10-29 22:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '127', '9', '2017-10-30 22:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '128', '9', '2017-10-31 22:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '129', '9', '2017-11-01 22:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '130', '9', '2017-11-02 22:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '131', '9', '2017-11-03 22:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '132', '10', '2017-10-29 09:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '133', '10', '2017-10-30 09:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '134', '10', '2017-10-31 09:30:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '135', '11', '2017-10-24 22:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '136', '11', '2017-10-25 22:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '137', '11', '2017-10-26 22:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '138', '11', '2017-10-27 22:00:00', '2', '200', '300' );
INSERT INTO `sessions`(`id`,`movie_id`,`datetime`,`hall_id`,`common_cost`,`vip_cost`) VALUES ( '139', '11', '2017-10-28 22:00:00', '2', '200', '300' );
-- ---------------------------------------------------------


-- Dump data of "tickets" ----------------------------------
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '124', '380', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '125', '379', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '126', '378', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '127', '422', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '128', '421', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '129', '341', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '130', '342', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '132', '501', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '133', '540', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '134', '539', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '135', '537', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '136', '538', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '140', '181', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '141', '182', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '142', '183', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '143', '435', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '144', '436', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '145', '461', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '146', '462', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '147', '463', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '148', '465', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '149', '466', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '150', '373', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '151', '333', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '152', '332', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '153', '372', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '154', '371', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '155', '331', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '156', '781', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '157', '782', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '158', '783', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '159', '784', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '160', '581', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '161', '582', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '162', '619', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '163', '620', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '164', '420', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '165', '419', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '166', '418', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '167', '779', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '168', '778', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '169', '777', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '170', '775', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '171', '776', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '172', '774', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '173', '543', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '174', '544', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '175', '545', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '176', '780', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '177', '661', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '178', '662', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '179', '663', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '180', '801', '112', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '181', '802', '112', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '182', '803', '112', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '183', '804', '112', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '184', '1042', '112', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '185', '1041', '112', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '186', '1040', '112', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '187', '1039', '112', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '188', '1038', '112', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '189', '1037', '112', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '190', '174', '37', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '191', '175', '37', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '192', '176', '37', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '193', '795', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '194', '796', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '195', '767', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '196', '768', '4', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '197', '379', '22', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '198', '380', '22', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '199', '420', '22', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '200', '418', '22', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '201', '419', '22', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '203', '378', '22', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '204', '377', '22', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '206', '878', '138', '0' );
INSERT INTO `tickets`(`id`,`seat_id`,`session_id`,`is_sold`) VALUES ( '207', '877', '138', '0' );
-- ---------------------------------------------------------


-- CREATE INDEX "title_trigger" ----------------------------
-- CREATE INDEX "title_trigger" --------------------------------
CREATE INDEX `title_trigger` USING BTREE ON `movies`( `title` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_halls_seats" --------------------------
-- CREATE INDEX "lnk_halls_seats" ------------------------------
CREATE INDEX `lnk_halls_seats` USING BTREE ON `seats`( `hall_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "index_movie_id" ---------------------------
-- CREATE INDEX "index_movie_id" -------------------------------
CREATE INDEX `index_movie_id` USING BTREE ON `sessions`( `movie_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_halls_sessions" -----------------------
-- CREATE INDEX "lnk_halls_sessions" ---------------------------
CREATE INDEX `lnk_halls_sessions` USING BTREE ON `sessions`( `hall_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_sessions_tickets" ---------------------
-- CREATE INDEX "lnk_sessions_tickets" -------------------------
CREATE INDEX `lnk_sessions_tickets` USING BTREE ON `tickets`( `session_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "lnk_halls_seats" ---------------------------
-- CREATE LINK "lnk_halls_seats" -------------------------------
ALTER TABLE `seats`
	ADD CONSTRAINT `lnk_halls_seats` FOREIGN KEY ( `hall_id` )
	REFERENCES `halls`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "lnk_halls_sessions" ------------------------
-- CREATE LINK "lnk_halls_sessions" ----------------------------
ALTER TABLE `sessions`
	ADD CONSTRAINT `lnk_halls_sessions` FOREIGN KEY ( `hall_id` )
	REFERENCES `halls`( `id` )
	ON DELETE Set NULL
	ON UPDATE Cascade;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "lnk_movies_sessions" -----------------------
-- CREATE LINK "lnk_movies_sessions" ---------------------------
ALTER TABLE `sessions`
	ADD CONSTRAINT `lnk_movies_sessions` FOREIGN KEY ( `movie_id` )
	REFERENCES `movies`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "lnk_seats_tickets" -------------------------
-- CREATE LINK "lnk_seats_tickets" -----------------------------
ALTER TABLE `tickets`
	ADD CONSTRAINT `lnk_seats_tickets` FOREIGN KEY ( `seat_id` )
	REFERENCES `seats`( `id` )
	ON DELETE Set NULL
	ON UPDATE Cascade;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "lnk_sessions_tickets" ----------------------
-- CREATE LINK "lnk_sessions_tickets" --------------------------
ALTER TABLE `tickets`
	ADD CONSTRAINT `lnk_sessions_tickets` FOREIGN KEY ( `session_id` )
	REFERENCES `sessions`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


