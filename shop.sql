-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 15 Décembre 2023 à 10:46
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `shop`
--

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` int(10) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `email`, `phone`, `password`) VALUES
(2, 'laksan', 'test', 'laksan@gmail.com', 0, '$2y$10$H8amSFVzi2B8gFTPBgEVO.EIUcK6xHRczL0Fp2Qu4wD1FVuqRKsEm'),
(3, 'christophe', 'tkt', 'christophe@gmail.com', 0, '$2y$10$LJWwBK6fZAAD2NEpJmxvxup09WeFDTEqs1gNNoEDV/93MT9zkhMp.'),
(4, 'test', 'test', 'test@gmail.com', 0, '$2y$10$5l5x2N61kYs4Wec.4Jjfyen1Q1XjS2liCP1FevDC5.G/6LYa9jgfW'),
(5, 'sdfsd', 'sdfsdf', 'sdfsdf@sdfds.com', 0, '$2y$10$5MGSRl/QawWw6pI4a/Lu7egJciHNV8vhlMde08NDYGgiI5V0//Yya'),
(6, 'dfgdf', 'dfgdfg', 'dfg@dfgdfg.com', 0, '$2y$10$FMmgtFGnkmWVp5p5heQGX.gjENQ6oD.zs1z84N1rfRnQKDo8sDzwu');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
