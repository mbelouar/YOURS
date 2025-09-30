-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 30 sep. 2025 à 12:49
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `yours`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `idAdmin` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `motDepasse` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `idCategorie` int(11) NOT NULL,
  `nomCategorie` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `idClient` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `adresse` varchar(150) DEFAULT NULL,
  `numTelephone` varchar(20) DEFAULT NULL,
  `cinRECTO` varchar(50) DEFAULT NULL,
  `cinVERSO` varchar(50) DEFAULT NULL,
  `motDepasse` varchar(100) NOT NULL,
  `dateNaissance` date DEFAULT NULL,
  `photoPerso` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `idFacture` int(11) NOT NULL,
  `montant` float NOT NULL,
  `dateEmission` date NOT NULL,
  `idReservation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ia`
--

CREATE TABLE `ia` (
  `idIA` int(11) NOT NULL,
  `modeleIA` varchar(100) DEFAULT NULL,
  `seuilDetection` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `materiel`
--

CREATE TABLE `materiel` (
  `idMateriel` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `disponibilite` tinyint(1) DEFAULT 1,
  `prix` float NOT NULL,
  `idPartenaire` int(11) DEFAULT NULL,
  `idCategorie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `partenaire`
--

CREATE TABLE `partenaire` (
  `idPartenaire` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `adresse` varchar(150) DEFAULT NULL,
  `numTelephone` varchar(20) DEFAULT NULL,
  `cinRECTO` varchar(50) DEFAULT NULL,
  `cinVERSO` varchar(50) DEFAULT NULL,
  `motDepasse` varchar(100) NOT NULL,
  `photoPerso` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

CREATE TABLE `photo` (
  `idPhoto` int(11) NOT NULL,
  `datePrise` date NOT NULL,
  `type` enum('avantLocation','apresLocation') DEFAULT NULL,
  `urlPhoto` varchar(255) DEFAULT NULL,
  `idMateriel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `idReservation` int(11) NOT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL,
  `reserve` tinyint(1) DEFAULT 0,
  `idClient` int(11) DEFAULT NULL,
  `idMateriel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idAdmin`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`idCategorie`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idClient`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`idFacture`),
  ADD KEY `idReservation` (`idReservation`);

--
-- Index pour la table `ia`
--
ALTER TABLE `ia`
  ADD PRIMARY KEY (`idIA`);

--
-- Index pour la table `materiel`
--
ALTER TABLE `materiel`
  ADD PRIMARY KEY (`idMateriel`),
  ADD KEY `idPartenaire` (`idPartenaire`),
  ADD KEY `fk_materiel_categorie` (`idCategorie`);

--
-- Index pour la table `partenaire`
--
ALTER TABLE `partenaire`
  ADD PRIMARY KEY (`idPartenaire`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- Index pour la table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`idPhoto`),
  ADD KEY `idMateriel` (`idMateriel`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`idReservation`),
  ADD KEY `idClient` (`idClient`),
  ADD KEY `idMateriel` (`idMateriel`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `idCategorie` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `idClient` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `facture`
--
ALTER TABLE `facture`
  MODIFY `idFacture` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ia`
--
ALTER TABLE `ia`
  MODIFY `idIA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `materiel`
--
ALTER TABLE `materiel`
  MODIFY `idMateriel` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `partenaire`
--
ALTER TABLE `partenaire`
  MODIFY `idPartenaire` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `photo`
--
ALTER TABLE `photo`
  MODIFY `idPhoto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `idReservation` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `facture_ibfk_1` FOREIGN KEY (`idReservation`) REFERENCES `reservation` (`idReservation`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `materiel`
--
ALTER TABLE `materiel`
  ADD CONSTRAINT `fk_materiel_categorie` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`idCategorie`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `materiel_ibfk_1` FOREIGN KEY (`idPartenaire`) REFERENCES `partenaire` (`idPartenaire`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`idMateriel`) REFERENCES `materiel` (`idMateriel`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`idMateriel`) REFERENCES `materiel` (`idMateriel`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
