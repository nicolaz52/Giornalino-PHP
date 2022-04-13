-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Apr 13, 2022 alle 13:03
-- Versione del server: 10.4.8-MariaDB
-- Versione PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `giornalino`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `account`
--

CREATE TABLE `account` (
  `id_account` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `account`
--

INSERT INTO `account` (`id_account`, `username`, `password`) VALUES
(1, 'root', 'root'),
(8, 'Maggio', '123'),
(11, 'ScattiBol', 'asd123'),
(12, 'GioGio', 'dsa321'),
(15, 'wasd', 'asdsa'),
(16, 'Nigula', '1234asa');

-- --------------------------------------------------------

--
-- Struttura della tabella `articoli`
--

CREATE TABLE `articoli` (
  `id_articolo` int(11) NOT NULL,
  `autore` int(11) NOT NULL,
  `validatore` int(11) DEFAULT NULL,
  `titolo` varchar(60) NOT NULL,
  `riassunto_articolo` varchar(150) NOT NULL,
  `testo_articolo` longtext NOT NULL,
  `data_pubblicazione` date DEFAULT NULL,
  `hotwords` varchar(60) NOT NULL,
  `categoria_articolo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `articoli`
--

INSERT INTO `articoli` (`id_articolo`, `autore`, `validatore`, `titolo`, `riassunto_articolo`, `testo_articolo`, `data_pubblicazione`, `hotwords`, `categoria_articolo`) VALUES
(2, 1, 11, 'Prova 1', 'Riassunto ', 'Succo', '2022-03-23', 'BELLO', 1),
(3, 1, 11, 'Prova 2', 'Riassunto 2', 'Succo 2', '2022-03-23', 'BEL', 1),
(4, 6, 8, 'SE LO VEDI HAI SBAGLIATO', 'succo', 'susia\'cahv\'\'hsf<fggfs', '2022-03-08', 'SUCCO', 1),
(5, 12, NULL, 'SE LO VEDI È GIUSTO', 'SPERA', 'FUMO NAMECC SCUSAMI DENDE', '2022-04-06', 'BELLO', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `categoriaarticolo`
--

CREATE TABLE `categoriaarticolo` (
  `id_categoria_articolo` int(11) NOT NULL,
  `nome` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `categoriaarticolo`
--

INSERT INTO `categoriaarticolo` (`id_categoria_articolo`, `nome`) VALUES
(1, 'Cronaca Nera');

-- --------------------------------------------------------

--
-- Struttura della tabella `categoriautente`
--

CREATE TABLE `categoriautente` (
  `id_categoria_utente` int(11) NOT NULL,
  `nome` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `categoriautente`
--

INSERT INTO `categoriautente` (`id_categoria_utente`, `nome`) VALUES
(1, 'writer'),
(2, 'verifier'),
(3, 'Account Manager');

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `id_utente` int(11) NOT NULL,
  `nome` text NOT NULL,
  `cognome` text NOT NULL,
  `email` varchar(20) NOT NULL,
  `categoria_Utente` int(11) NOT NULL,
  `id_account` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`id_utente`, `nome`, `cognome`, `email`, `categoria_Utente`, `id_account`) VALUES
(1, 'Mario', 'Giordano', 'mariojordan@art.it', 3, 1),
(6, 'Mario', 'Giro', 'aa@aa.eu', 1, 8),
(7, 'Mario', 'Scatti', 'a@aaa.it', 1, 11),
(8, 'Giorno', 'Giovanna', 'aa@aa.it', 2, 12),
(11, 'asd', 'dsa', 'lol@lpo.io', 1, 15),
(12, 'Nicola', 'Zaia', 'ciao@gmail.com', 2, 16);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id_account`);

--
-- Indici per le tabelle `articoli`
--
ALTER TABLE `articoli`
  ADD PRIMARY KEY (`id_articolo`),
  ADD KEY `autore` (`autore`),
  ADD KEY `validatore` (`validatore`),
  ADD KEY `categoria_articolo` (`categoria_articolo`);

--
-- Indici per le tabelle `categoriaarticolo`
--
ALTER TABLE `categoriaarticolo`
  ADD PRIMARY KEY (`id_categoria_articolo`);

--
-- Indici per le tabelle `categoriautente`
--
ALTER TABLE `categoriautente`
  ADD PRIMARY KEY (`id_categoria_utente`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id_utente`),
  ADD KEY `id_account` (`id_account`),
  ADD KEY `categoria_Utente` (`categoria_Utente`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `account`
--
ALTER TABLE `account`
  MODIFY `id_account` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT per la tabella `articoli`
--
ALTER TABLE `articoli`
  MODIFY `id_articolo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `categoriaarticolo`
--
ALTER TABLE `categoriaarticolo`
  MODIFY `id_categoria_articolo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `categoriautente`
--
ALTER TABLE `categoriautente`
  MODIFY `id_categoria_utente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id_utente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `articoli`
--
ALTER TABLE `articoli`
  ADD CONSTRAINT `articoli_ibfk_1` FOREIGN KEY (`autore`) REFERENCES `utenti` (`id_utente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `articoli_ibfk_2` FOREIGN KEY (`validatore`) REFERENCES `utenti` (`id_utente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `articoli_ibfk_3` FOREIGN KEY (`categoria_articolo`) REFERENCES `categoriaarticolo` (`id_categoria_articolo`);

--
-- Limiti per la tabella `utenti`
--
ALTER TABLE `utenti`
  ADD CONSTRAINT `utenti_ibfk_1` FOREIGN KEY (`id_account`) REFERENCES `account` (`id_account`) ON UPDATE CASCADE,
  ADD CONSTRAINT `utenti_ibfk_2` FOREIGN KEY (`categoria_Utente`) REFERENCES `categoriautente` (`id_categoria_utente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
