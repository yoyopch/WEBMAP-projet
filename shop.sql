CREATE DATABASE IF NOT EXISTS `shop` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `shop`;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
                            `id_client` int(11) DEFAULT NULL,
                            `id_commande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`id_client`, `id_commande`) VALUES
                                                        (11, 15),
                                                        (11, 18),
                                                        (13, 14),
                                                        (13, 16),
                                                        (13, 17),
                                                        (29, 19),
                                                        (30, 20),
                                                        (30, 21);

-- --------------------------------------------------------

--
-- Structure de la table `lignecommande`
--

CREATE TABLE `lignecommande` (
                                 `id_ligne_commande` int(11) NOT NULL,
                                 `id_commande` int(11) DEFAULT NULL,
                                 `id_produit` int(11) DEFAULT NULL,
                                 `id_magasin` int(11) DEFAULT NULL,
                                 `quantite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `lignecommande`
--

INSERT INTO `lignecommande` (`id_ligne_commande`, `id_commande`, `id_produit`, `id_magasin`, `quantite`) VALUES
                                                                                                             (14, 14, 33, 5, 3),
                                                                                                             (15, 15, 19, 3, 2),
                                                                                                             (16, 16, 28, 4, 2),
                                                                                                             (17, 17, 25, 4, 2),
                                                                                                             (18, 18, 23, 4, 2),
                                                                                                             (19, 19, 32, 5, 3),
                                                                                                             (20, 20, 31, 5, 2),
                                                                                                             (21, 21, 3, 1, 10);

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
                                                                                                                                  (1, 'BioLife Center Commercial Beaugrenelle', '12 Rue Linois, 75015 Paris', 'Paris', '75015', '0153952400', '48.84832333', '2.28236130'),
                                                                                                                                  (2, 'BioLife Champs Élysées', '101 Av. des Champs-Élysées, 75008 Paris', 'Paris', '75008', '0977404077', '48.87166621', '2.30062390'),
                                                                                                                                  (3, 'BioLife Forum des Halles', '101 Porte Berger, 75001 Paris', 'Paris', '75001', '0144768708', '48.86201622', '2.34709313'),
                                                                                                                                  (4, 'BioLife Montparnasse Rive Gauche', '10 Rue du Départ, 75015 Paris', 'Paris', '75015', '0140477429', '48.84299261', '2.32307330'),
                                                                                                                                  (5, 'BioLife Paris République', '13 Pl. de la République, 75003 Paris', 'Paris', '75003', '0149964780', '48.86698063', '2.36351565');

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
                                                                                                                                                          (1, 'Carotte', '0.60', 25, 'fruits', '1 piece', '2024-01-11', '../IMG/IMG_fruits/Carrot.svg', 1),
                                                                                                                                                          (2, 'Fraise', '0.55', 20, 'fruits', '1 piece', '2024-01-11', '../IMG/IMG_fruits/fraise.svg', 1),
                                                                                                                                                          (3, 'Chips', '4.00', 0, 'fruits', '1 pack', '2024-01-11', '../IMG/IMG_fruits/chips.svg', 1),
                                                                                                                                                          (4, 'Miel', '3.25', 0, 'fruits', '250g', '2024-01-11', '../IMG/IMG_fruits/Honey.svg', 1),
                                                                                                                                                          (5, 'Jus', '2.50', 12, 'fruits', '1L', '2024-01-11', '../IMG/IMG_fruits/Juice.svg', 1),
                                                                                                                                                          (6, 'Poire', '0.75', 8, 'fruits', '1 piece', '2024-01-11', '../IMG/IMG_fruits/poire.svg', 1),
                                                                                                                                                          (7, 'Pastèque', '2.00', 18, 'fruits', '1 piece', '2024-01-11', '../IMG/IMG_fruits/pasteque.svg', 1),
                                                                                                                                                          (8, 'Carotte', '0.60', 5, 'fruits', '1 piece', '2024-01-11', '../IMG/IMG_fruits/Carrot.svg', 2),
                                                                                                                                                          (9, 'Fraise', '0.55', 25, 'fruits', '1 piece', '2024-01-11', '../IMG/IMG_fruits/fraise.svg', 2),
                                                                                                                                                          (10, 'Chips', '4.00', 15, 'fruits', '1 pack', '2024-01-11', '../IMG/IMG_fruits/chips.svg', 2),
                                                                                                                                                          (11, 'Miel', '3.25', 15, 'fruits', '250g', '2024-01-11', '../IMG/IMG_fruits/Honey.svg', 2),
                                                                                                                                                          (12, 'Jus', '2.50', 19, 'fruits', '1L', '2024-01-11', '../IMG/IMG_fruits/Juice.svg', 2),
                                                                                                                                                          (13, 'Poire', '0.75', 30, 'fruits', '1 piece', '2024-01-11', '../IMG/IMG_fruits/poire.svg', 2),
                                                                                                                                                          (14, 'Pastèque', '2.00', 22, 'fruits', '1 piece', '2024-01-11', '../IMG/IMG_fruits/pasteque.svg', 2),
                                                                                                                                                          (15, 'Carotte', '0.60', 16, 'fruits', '1 piece', '2024-01-11', '../IMG/IMG_fruits/Carrot.svg', 3),
                                                                                                                                                          (16, 'Fraise', '0.55', 4, 'fruits', '1 piece', '2024-01-11', '../IMG/IMG_fruits/fraise.svg', 3),
                                                                                                                                                          (17, 'Chips', '4.00', 11, 'fruits', '1 pack', '2024-01-11', '../IMG/IMG_fruits/chips.svg', 3),
                                                                                                                                                          (18, 'Miel', '3.25', 3, 'fruits', '250g', '2024-01-11', '../IMG/IMG_fruits/Honey.svg', 3),
                                                                                                                                                          (19, 'Jus', '2.50', 10, 'fruits', '1L', '2024-01-11', '../IMG/IMG_fruits/Juice.svg', 3),
                                                                                                                                                          (20, 'Poire', '0.75', 0, 'fruits', '1 piece', '2024-01-11', '../IMG/IMG_fruits/poire.svg', 3),
                                                                                                                                                          (21, 'Pastèque', '2.00', 22, 'fruits', '1 piece', '2024-01-11', '../IMG/IMG_fruits/pasteque.svg', 3),
                                                                                                                                                          (22, 'Carotte', '0.60', 18, 'fruits', '1 piece', '2024-01-11', '../IMG/IMG_fruits/Carrot.svg', 4),
                                                                                                                                                          (23, 'Fraise', '0.55', 5, 'fruits', '1 piece', '2024-01-11', '../IMG/IMG_fruits/fraise.svg', 4),
                                                                                                                                                          (24, 'Chips', '4.00', 15, 'fruits', '1 pack', '2024-01-11', '../IMG/IMG_fruits/chips.svg', 4),
                                                                                                                                                          (25, 'Miel', '3.25', 16, 'fruits', '250g', '2024-01-11', '../IMG/IMG_fruits/Honey.svg', 4),
                                                                                                                                                          (26, 'Jus', '2.50', 0, 'fruits', '1L', '2024-01-11', '../IMG/IMG_fruits/Juice.svg', 4),
                                                                                                                                                          (27, 'Poire', '0.75', 30, 'fruits', '1 piece', '2024-01-11', '../IMG/IMG_fruits/poire.svg', 4),
                                                                                                                                                          (28, 'Pastèque', '2.00', 20, 'fruits', '1 piece', '2024-01-11', '../IMG/IMG_fruits/pasteque.svg', 4),
                                                                                                                                                          (29, 'Carotte', '0.60', 30, 'fruits', '1 piece', '2024-01-11', '../IMG/IMG_fruits/Carrot.svg', 5),
                                                                                                                                                          (30, 'Fraise', '0.55', 0, 'fruits', '1 piece', '2024-01-11', '../IMG/IMG_fruits/fraise.svg', 5),
                                                                                                                                                          (31, 'Chips', '4.00', 0, 'fruits', '1 pack', '2024-01-11', '../IMG/IMG_fruits/chips.svg', 5),
                                                                                                                                                          (32, 'Miel', '3.25', 15, 'fruits', '250g', '2024-01-11', '../IMG/IMG_fruits/Honey.svg', 5),
                                                                                                                                                          (33, 'Jus', '2.50', 55, 'fruits', '1L', '2024-01-11', '../IMG/IMG_fruits/Juice.svg', 5),
                                                                                                                                                          (34, 'Poire', '0.75', 30, 'fruits', '1 piece', '2024-01-11', '../IMG/IMG_fruits/poire.svg', 5),
                                                                                                                                                          (35, 'Pastèque', '2.00', 22, 'fruits', '1 piece', '2024-01-11', '../IMG/IMG_fruits/pasteque.svg', 5);

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
                                                                                    (11, 'test', 'test', 'paris@gmail.com', '+330769631480', '$2y$10$ynDJhZvNRd6uaGHXc.LcQuwu0ewd2TwV/F1rQhm.p6CllVkQwPco.'),
                                                                                    (12, 'Karl', 'christophe', 'paris123@gmail.com', '+330769631480', '$2y$10$9I3tVf0/b2eqGFYhUtRD.uoT0bBgg.q6wEcRBQMIyWw9dpTg7kqgS'),
                                                                                    (13, 'Karl', 'christophe', 'paris12345@gmail.com', '+330769631480', '$2y$10$Pe5X9uM7b5L5NUDNIuu7QuqiRq9TrexwcTYzUDgXF6GW0jpDRPrlS'),
                                                                                    (14, 'dsfsdfsdf', 'qdqsdqs', 'aerazazez@gmail.com', '+330769631480', '$2y$10$xPbvkgIAa187jR9b.btmzOjQCqfGUruE58bl6LyXMfnMB2uaXPHM.'),
                                                                                    (15, 'qsddfsdsf', 'azeaze', 'azexxcvxcv@gmail.com', '+330769631480', '$2y$10$5vwWURpX5zqmC//ZWYG9XuNQomnB9.4nJPmtKr514PR5Xcal30YPy'),
                                                                                    (16, 'sdfsdfsdf', 'ddsfzearez', 'azeazeeeeeeesdqqsd@gmail.com', '+330769631480', '$2y$10$maaQFMDwaLdqNkqgKpXYO.w51hzvtgmpYG8z/dm9Y5hkpeqsn0im6'),
                                                                                    (17, 'fhgfghg', 'zerzefsdf', 'poopopzeopopzoerp@gmail.com', '+330769631480', '$2y$10$7huKJumygpogLWKLqwnI.ukGDS7HVr/zPHlI46yIjXjxx8G5BMAzm'),
                                                                                    (18, 'fhgfghgzer', 'zerzefsdfzersdfdsf', 'f@gmail.sdfsdfcom', '+330769631480', '$2y$10$JKMJzH9nvNi67SbaSa7Mf.qOJCfY.4Nphx0xp/XY0xWn6XVRwv.1a'),
                                                                                    (19, 'sdfsdfd', 'azsdfsdfsdf', 'erzzerezrzeparis@gmail.com', '+330769631480', '$2y$10$P03VbDwL3K6tzIdfQ1MQwen5qYIhfLwgfwwWWFrBzqmpChHdiqHeq'),
                                                                                    (20, 'azeazeasqdqsd', 'zerfsdsdfsd', 'sdfezrdffdgdfg@gmail.com', '+330769631480', '$2y$10$b6irgy6WsLN1fkjej0ArKOaxHZHZsq4ptywxBqj2/PDAB.ex0kD5y'),
                                                                                    (21, 'azeaze', 'ezrsdf', 'xcvxcbsdf@gmail.com', '+330769631480', '$2y$10$FjnDHj27H0/YxL9jEXjAneO8kg4lvedjNwm9nvGz3K9jKis/KZFbK'),
                                                                                    (22, 'azeaze', 'ezrsdf', 'xcvxcbsdsdff@gmail.com', '+330769631480', '$2y$10$FNEz/C6BxxRAIVRr2fpocee1VXWbVOrTXnGJDh9vwFMXfCrba7lga'),
                                                                                    (23, 'qsdsqdqsd', '0769631480', 'dsgertercvv@gmail.com', '+330769631480', '$2y$10$X1VuA3cfT7t17agzmmFg4uQpgssrdKyn/zMqWfmf6fDnF.Tvbpagi'),
                                                                                    (24, 'zerzerzer', '0769631480', 'dsfsdfvxcxcvxcv@gmail.com', '+330769631480', '$2y$10$aBTUxqt7QjnzQ6OMdpHwzO7XaCU.TEhnj8MaEiXIZiRKUJgndx7Ky'),
                                                                                    (25, 'zerzerzer', '0769631480', 'dsfsqsdqsdqsdfvxcxcvxcv@gmail.com', '+330769631480', '$2y$10$rKb.QjE7bmp9QXxFGilOQeEwfXc.358j0fBU1kwGyDPRKf4RW.1KO'),
                                                                                    (26, 'sdcwxqsdqsd', '0769631480', 'xcwqsqsdqsd@gmail.com', '+330769631480', '$2y$10$1.4opzH7IgnxjQlrJ1rSwOXWcRfNlhyM1Deigqgs2yKwEs7gyRw9W'),
                                                                                    (27, 'xcvxcvxcv', '0769631480', 'dqzeazqsdsq@gmail.com', '+330769631480', '$2y$10$EI7vxDNNAwNrRqnIPUjWF.laE9UziesfktcWHV5WDITrx/zWGX9mm'),
                                                                                    (28, 'zaeazeqsd', 'erssdf', 'qsdqxwcwxc@gmail.com', '+330769631480', '$2y$10$Xvju5TCfiJzXba5Els.Y6OweexDKtUOlJDxFOYZWKTKhP8uSKnt9a'),
                                                                                    (29, 'testt', 'yohann', 'yoyo2387784@gmail.com', '+330769631480', '$2y$10$7ZoerVX17h7vQpWFaLuBy.gvA/usW.GSviSgkFYHSYVA4RSoiXQb2'),
                                                                                    (30, 'Paul', 'Jean', 'sdfdszerze@gmail.com', '+330769631480', '$2y$10$aOy7NWZcc/PayJiSiWUM6uWRIBrRUBZEAQq.RiVQqFqDm6UEFkpd2');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
    ADD PRIMARY KEY (`id_commande`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `lignecommande`
--
ALTER TABLE `lignecommande`
    ADD PRIMARY KEY (`id_ligne_commande`),
  ADD KEY `id_commande` (`id_commande`),
  ADD KEY `id_produit` (`id_produit`),
  ADD KEY `id_magasin` (`id_magasin`);

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
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
    MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT pour la table `lignecommande`
--
ALTER TABLE `lignecommande`
    MODIFY `id_ligne_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT pour la table `magasins`
--
ALTER TABLE `magasins`
    MODIFY `id_magasin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
    MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
    ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `lignecommande`
--
ALTER TABLE `lignecommande`
    ADD CONSTRAINT `lignecommande_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`),
  ADD CONSTRAINT `lignecommande_ibfk_2` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`),
  ADD CONSTRAINT `lignecommande_ibfk_3` FOREIGN KEY (`id_magasin`) REFERENCES `magasins` (`id_magasin`);

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
    ADD CONSTRAINT `fk_magasin` FOREIGN KEY (`id_magasin`) REFERENCES `magasins` (`id_magasin`);