-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 30 2021 г., 11:57
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `olympiad`
--

-- --------------------------------------------------------

--
-- Структура таблицы `dish`
--

CREATE TABLE `dish` (
  `dish_ID` bigint UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `price` float UNSIGNED NOT NULL,
  `categoryID_D` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `dish`
--

INSERT INTO `dish` (`dish_ID`, `name`, `image`, `description`, `price`, `categoryID_D`) VALUES
(1, 'test name', 'url', 'chto?', 1000, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `institution`
--

CREATE TABLE `institution` (
  `institution_ID` bigint UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `institution`
--

INSERT INTO `institution` (`institution_ID`, `name`, `description`) VALUES
(1, 'test Name ind', 'qwerty');

-- --------------------------------------------------------

--
-- Структура таблицы `menu category`
--

CREATE TABLE `menu category` (
  `category_ID` bigint UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `dishID_M` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `menu category`
--

INSERT INTO `menu category` (`category_ID`, `name`, `dishID_M`) VALUES
(1, 'Category', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `order_ID` bigint UNSIGNED NOT NULL,
  `sum` int NOT NULL,
  `phone` varchar(13) NOT NULL,
  `name` varchar(100) NOT NULL,
  `dishID_O` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`order_ID`, `sum`, `phone`, `name`, `dishID_O`) VALUES
(1, 123, '+380688888888', 'Test Name User', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `dish`
--
ALTER TABLE `dish`
  ADD PRIMARY KEY (`dish_ID`),
  ADD UNIQUE KEY `dish_ID` (`dish_ID`),
  ADD KEY `categoryID_D` (`categoryID_D`);

--
-- Индексы таблицы `institution`
--
ALTER TABLE `institution`
  ADD PRIMARY KEY (`institution_ID`),
  ADD UNIQUE KEY `institution_ID` (`institution_ID`);

--
-- Индексы таблицы `menu category`
--
ALTER TABLE `menu category`
  ADD PRIMARY KEY (`category_ID`),
  ADD UNIQUE KEY `category_ID` (`category_ID`),
  ADD KEY `dishID` (`dishID_M`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_ID`),
  ADD UNIQUE KEY `order_ID` (`order_ID`),
  ADD KEY `dishID` (`dishID_O`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `dish`
--
ALTER TABLE `dish`
  MODIFY `dish_ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `institution`
--
ALTER TABLE `institution`
  MODIFY `institution_ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `menu category`
--
ALTER TABLE `menu category`
  MODIFY `category_ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `order_ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `dish`
--
ALTER TABLE `dish`
  ADD CONSTRAINT `dish_ibfk_1` FOREIGN KEY (`categoryID_D`) REFERENCES `menu category` (`category_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `menu category`
--
ALTER TABLE `menu category`
  ADD CONSTRAINT `menu category_ibfk_1` FOREIGN KEY (`dishID_M`) REFERENCES `dish` (`dish_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`dishID_O`) REFERENCES `dish` (`dish_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
