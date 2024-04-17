-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Ápr 17. 12:24
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `tagsag`
--
CREATE DATABASE IF NOT EXISTS `tagsag` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `tagsag`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalo`
--

DROP TABLE IF EXISTS `felhasznalo`;
CREATE TABLE IF NOT EXISTS `felhasznalo` (
  `felhAzon` int(32) NOT NULL AUTO_INCREMENT,
  `nev` varchar(250) NOT NULL,
  `jogsultsag` int(32) NOT NULL,
  `email` varchar(250) NOT NULL,
  PRIMARY KEY (`felhAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `felhasznalo`
--

INSERT INTO `felhasznalo` (`felhAzon`, `nev`, `jogsultsag`, `email`) VALUES
(1, 'Botos Csaba', 1, 'botoscsabi@freemail.com'),
(2, 'György Géza', 2, 'gyorgygeza@gmail.com'),
(4, 'Kovács Gyémi', 3, 'gyemiofficial@gmail.com');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `klub`
--

DROP TABLE IF EXISTS `klub`;
CREATE TABLE IF NOT EXISTS `klub` (
  `klubAzon` int(32) NOT NULL AUTO_INCREMENT,
  `nev` varchar(32) NOT NULL,
  `datum` date NOT NULL,
  `hely` int(32) NOT NULL,
  `maxMeret` int(32) NOT NULL,
  PRIMARY KEY (`klubAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `klub`
--

INSERT INTO `klub` (`klubAzon`, `nev`, `datum`, `hely`, `maxMeret`) VALUES
(1, 'Farkasok', '2024-04-02', 20, 20),
(2, 'Dáridó', '2024-04-09', 10, 11),
(4, 'Roma Vonósok', '2024-04-01', 20, 20);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `klubAzon` int(32) NOT NULL,
  `felhAzon` int(32) NOT NULL,
  `pozicio` varchar(32) NOT NULL,
  PRIMARY KEY (`klubAzon`,`felhAzon`),
  KEY `felhAzon` (`felhAzon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tag`
--

INSERT INTO `tag` (`klubAzon`, `felhAzon`, `pozicio`) VALUES
(2, 1, 'énekes'),
(2, 2, 'dobos'),
(4, 4, 'harmónikás');

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`felhAzon`) REFERENCES `felhasznalo` (`felhAzon`),
  ADD CONSTRAINT `tag_ibfk_2` FOREIGN KEY (`klubAzon`) REFERENCES `klub` (`klubAzon`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
