-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 30 2021 г., 13:59
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
(3, 'Dish one', 'url', 'desc', 500, 3),
(4, 'Name two', 'url', 'description', 1111, 3),
(5, 'Test dish', 'url', 'd', 123, 3);

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
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `menu category`
--

INSERT INTO `menu category` (`category_ID`, `name`) VALUES
(3, 'Test Category'),
(4, 'Category Two');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `order_ID` bigint UNSIGNED NOT NULL,
  `sum` int NOT NULL,
  `phone` varchar(13) NOT NULL,
  `name` varchar(100) NOT NULL,
  `institutionOrdersID` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`order_ID`, `sum`, `phone`, `name`, `institutionOrdersID`) VALUES
(4, 1234, '+380688888888', 'Test Order One', 1),
(5, 12111, '+380688888881', 'Test Order Two', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `storecategory`
--

CREATE TABLE `storecategory` (
  `storeID` bigint UNSIGNED NOT NULL,
  `categoryStoreID` bigint UNSIGNED NOT NULL,
  `institurionStoreID` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `storecategory`
--

INSERT INTO `storecategory` (`storeID`, `categoryStoreID`, `institurionStoreID`) VALUES
(1, 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `storedish`
--

CREATE TABLE `storedish` (
  `storeDishID` bigint UNSIGNED NOT NULL,
  `orderStoreID` bigint UNSIGNED NOT NULL,
  `dishStoreID` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `storedish`
--

INSERT INTO `storedish` (`storeDishID`, `orderStoreID`, `dishStoreID`) VALUES
(2, 4, 4),
(1, 4, 5);

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
  ADD UNIQUE KEY `category_ID` (`category_ID`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_ID`),
  ADD UNIQUE KEY `order_ID` (`order_ID`),
  ADD KEY `institutionOrdersID` (`institutionOrdersID`);

--
-- Индексы таблицы `storecategory`
--
ALTER TABLE `storecategory`
  ADD UNIQUE KEY `storeID` (`storeID`),
  ADD KEY `categoryStoreID` (`categoryStoreID`),
  ADD KEY `institurionStoreID` (`institurionStoreID`);

--
-- Индексы таблицы `storedish`
--
ALTER TABLE `storedish`
  ADD PRIMARY KEY (`storeDishID`),
  ADD UNIQUE KEY `storeDishID` (`storeDishID`),
  ADD KEY `orderStoreID` (`orderStoreID`,`dishStoreID`),
  ADD KEY `dishStoreID` (`dishStoreID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `dish`
--
ALTER TABLE `dish`
  MODIFY `dish_ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `institution`
--
ALTER TABLE `institution`
  MODIFY `institution_ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `menu category`
--
ALTER TABLE `menu category`
  MODIFY `category_ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `order_ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `storecategory`
--
ALTER TABLE `storecategory`
  MODIFY `storeID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `storedish`
--
ALTER TABLE `storedish`
  MODIFY `storeDishID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `dish`
--
ALTER TABLE `dish`
  ADD CONSTRAINT `dish_ibfk_1` FOREIGN KEY (`categoryID_D`) REFERENCES `menu category` (`category_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`institutionOrdersID`) REFERENCES `institution` (`institution_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `storecategory`
--
ALTER TABLE `storecategory`
  ADD CONSTRAINT `storecategory_ibfk_1` FOREIGN KEY (`categoryStoreID`) REFERENCES `menu category` (`category_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `storecategory_ibfk_2` FOREIGN KEY (`institurionStoreID`) REFERENCES `institution` (`institution_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `storedish`
--
ALTER TABLE `storedish`
  ADD CONSTRAINT `storedish_ibfk_1` FOREIGN KEY (`dishStoreID`) REFERENCES `dish` (`dish_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `storedish_ibfk_2` FOREIGN KEY (`orderStoreID`) REFERENCES `orders` (`order_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
