-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mer 03 Janvier 2024 à 21:52
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
-- Structure de la table `magasins`
--

CREATE TABLE `magasins` (
  `id_magasin` int(11) NOT NULL,
  `nom_magasin` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `code_postal` varchar(10) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `magasins`
--

INSERT INTO `magasins` (`id_magasin`, `nom_magasin`, `adresse`, `ville`, `code_postal`, `telephone`, `latitude`, `longitude`) VALUES
(1, 'Magasin A', '123 Rue du Commerce', 'Ville A', '12345', '+123456789', '48.84833202', '2.28236090'),
(2, 'Magasin A', '123 Rue du Commerce', 'Ville A', '12345', '+123456789', '48.86190291', '2.34699804');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `id_produit` int(11) NOT NULL,
  `nom_produit` varchar(255) DEFAULT NULL,
  `prix` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `categorie` varchar(50) DEFAULT NULL,
  `description_produit` text,
  `date_ajout` date DEFAULT NULL,
  `chemin_image` varchar(255) DEFAULT NULL,
  `id_magasin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produits`
--

INSERT INTO `produits` (`id_produit`, `nom_produit`, `prix`, `stock`, `categorie`, `description_produit`, `date_ajout`, `chemin_image`, `id_magasin`) VALUES
(2, 'Cerise', '10.00', 100, 'fruits', '1kg', '2024-01-02', '\'../IMG/emojiCerice.svg\'', 1),
(3, 'Produit 1', '19.99', 25, 'Électronique', 'Description du produit 1', '2024-01-02', NULL, 2),
(4, 'Cerise', '10.00', 100, 'fruits', '1kg', '2024-01-02', '\'../IMG/emojiCerice.svg\'', 2);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `email`, `phone`, `password`) VALUES
(2, 'laksan', 'test', 'laksan@gmail.com', '0', '$2y$10$H8amSFVzi2B8gFTPBgEVO.EIUcK6xHRczL0Fp2Qu4wD1FVuqRKsEm'),
(3, 'christophe', 'tkt', 'christophe@gmail.com', '0', '$2y$10$LJWwBK6fZAAD2NEpJmxvxup09WeFDTEqs1gNNoEDV/93MT9zkhMp.'),
(4, 'test', 'test', 'test@gmail.com', '0', '$2y$10$5l5x2N61kYs4Wec.4Jjfyen1Q1XjS2liCP1FevDC5.G/6LYa9jgfW'),
(5, 'sdfsd', 'sdfsdf', 'sdfsdf@sdfds.com', '0', '$2y$10$5MGSRl/QawWw6pI4a/Lu7egJciHNV8vhlMde08NDYGgiI5V0//Yya'),
(6, 'dfgdf', 'dfgdfg', 'dfg@dfgdfg.com', '0', '$2y$10$FMmgtFGnkmWVp5p5heQGX.gjENQ6oD.zs1z84N1rfRnQKDo8sDzwu'),
(7, 'sdfsdfsdf', 'zerzerzer', 'etrertdf@gmail.com', '+33 2133245234', '$2y$10$1g5n0ZtZpDJ6R9NbpSrri.xwng0A8TreA4dOHN3Ju3wUurTp6PDFS'),
(8, '', 'drezrzer', 'sdfsdfds@gmail.com', '1233446543452', '$2y$10$tbsJA9dPyoB9Rn9Jq.st2uUFNCQ.l8eoYvffptsn4AXHpVjOFJu5y'),
(9, 'huang', 'christophe', 'huang@gmail.com', '0789675634', '$2y$10$kf8LJGs5oZvXpddlhxgENep910PNlaTgBj5dF1imYWiKT7UWx6mCi'),
(10, 'sdfsdfs', 'ezrzer', 'zerzesfdsdf@gmail.com', '+3307896545346', '$2y$10$IfPlzPcRDmyjZo0VoXAMgO6YuKQoLtDliT1kcK/KXH0K5Mdqutglq'),
(11, 'test', 'test', 'paris@gmail.com', '+330769631480', '$2y$10$ynDJhZvNRd6uaGHXc.LcQuwu0ewd2TwV/F1rQhm.p6CllVkQwPco.');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `magasins`
--
ALTER TABLE `magasins`
  ADD PRIMARY KEY (`id_magasin`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id_produit`),
  ADD KEY `fk_magasin` (`id_magasin`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `magasins`
--
ALTER TABLE `magasins`
  MODIFY `id_magasin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `fk_magasin` FOREIGN KEY (`id_magasin`) REFERENCES `magasins` (`id_magasin`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
