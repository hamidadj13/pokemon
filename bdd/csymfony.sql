-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 26 avr. 2023 à 12:54
-- Version du serveur : 5.7.36
-- Version de PHP : 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `csymfony`
--

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20230221110256', '2023-02-21 11:06:12'),
('20230221214620', '2023-02-21 21:47:34'),
('20230221224646', '2023-02-21 22:48:07'),
('20230222091356', '2023-02-22 09:15:57'),
('20230222091523', '2023-02-22 09:15:58'),
('20230222102406', '2023-02-22 10:28:06'),
('20230223100425', '2023-02-23 10:41:37');

-- --------------------------------------------------------

--
-- Structure de la table `pokemon`
--

DROP TABLE IF EXISTS `pokemon`;
CREATE TABLE IF NOT EXISTS `pokemon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` smallint(6) NOT NULL,
  `level` int(11) NOT NULL,
  `types_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_62DC90F38EB23357` (`types_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pokemon`
--

INSERT INTO `pokemon` (`id`, `nom`, `numero`, `level`, `types_id`) VALUES
(11, 'Pikachu', 25, 50, 26),
(12, 'Salamèche', 4, 80, 25),
(13, 'Carapuce', 7, 60, 27),
(14, 'Tortank', 9, 40, 27),
(15, 'Dracaufeu', 6, 80, 25),
(16, 'Feunard', 38, 80, 25),
(17, 'Miaouss', 52, 8, 30),
(18, 'Lamantine', 87, 50, 32),
(19, 'Élektek', 125, 80, 26),
(20, 'Magmar', 126, 100, 25),
(21, 'Ronflex', 143, 70, 30),
(22, 'Draco', 148, 70, 29);

-- --------------------------------------------------------

--
-- Structure de la table `types`
--

DROP TABLE IF EXISTS `types`;
CREATE TABLE IF NOT EXISTS `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `types`
--

INSERT INTO `types` (`id`, `nom`) VALUES
(25, 'fire'),
(26, 'electric'),
(27, 'water'),
(28, 'grass'),
(29, 'dragon'),
(30, 'normal'),
(31, 'flying'),
(32, 'ice');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `created_at`, `updated_at`) VALUES
(14, 'fgarnier@hebert.org', '[\"ROLE_ADMIN\"]', '$2y$13$Ngoz3C5vmHihLcCoe0I8puA/e1695ba5jS5Pxn5MT5uB2daSUZ/wi', NULL, NULL),
(15, 'rguillet@normand.net', '[\"ROLE_USER\"]', '$2y$13$5Ct7B9FfyQfzuyroOj1ypOJQzbGTPRAsZqz5moF8.L1yfTGdVYQny', NULL, NULL),
(16, 'marcel.dias@orange.fr', '[\"ROLE_USER\"]', '$2y$13$y.krJ8krhs4CjhxP2AgRTeOHfFkZNNfyrpTIgIIPvDaygGaPuPiiC', NULL, NULL),
(17, 'gerard.pauline@renault.fr', '[\"ROLE_USER\", \"ROLE_ADMIN\"]', '$2y$13$pm6p64WDe0XGt//W/YinNuEJqOl3j3/1xTiv/7SUZwuzPkNi2RAwW', NULL, NULL),
(18, 'robert.moreno@gallet.com', '[\"ROLE_USER\"]', '$2y$13$dd0WUEneFmeC8.cabxzFCOZaR8vROJi92FJvZIb6SHOP0wo5sg7iS', NULL, NULL),
(19, 'audrey.toussaint@voila.fr', '[\"ROLE_USER\"]', '$2y$13$vWJp9t0YrI4xa/9o5aeFhOubbPEcLXDeOxASPKP9Eekhk/GhBaYRK', NULL, NULL),
(20, 'marcel58@ifrance.com', '[\"ROLE_USER\"]', '$2y$13$cEtIrCuc6FKCsTaxRAKpwuFMR4x1FpJ9MdR0uaxcgEslx1E9FQQMW', NULL, NULL),
(21, 'michel.guichard@fernandez.org', '[\"ROLE_USER\"]', '$2y$13$kxt0PM.bZWrM.7kPX72R2egWg7aIiNuegYdGbGIMSRqs5dnDHbawW', NULL, NULL),
(22, 'henriette.allard@free.fr', '[\"ROLE_USER\"]', '$2y$13$EYlinIMf8S2Dxi4cRotlX.5rEfJzzSOw6YPmRUs7xwkpu4FhBF./C', NULL, NULL),
(23, 'clemence43@klein.net', '[\"ROLE_USER\"]', '$2y$13$7QDozKvqzPojCwhKRYvkD.wm2b8E59gjpTvLEaScWULSr4JWG0S96', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_pokemon`
--

DROP TABLE IF EXISTS `user_pokemon`;
CREATE TABLE IF NOT EXISTS `user_pokemon` (
  `user_id` int(11) NOT NULL,
  `pokemon_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`pokemon_id`),
  KEY `IDX_3AD18EF9A76ED395` (`user_id`),
  KEY `IDX_3AD18EF92FE71C3E` (`pokemon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_pokemon`
--

INSERT INTO `user_pokemon` (`user_id`, `pokemon_id`) VALUES
(14, 11),
(14, 12),
(14, 13),
(15, 20),
(15, 22),
(16, 14),
(16, 15),
(16, 16),
(16, 17),
(17, 12),
(17, 13),
(17, 18),
(18, 13),
(18, 14),
(18, 15),
(18, 16),
(19, 11),
(19, 12),
(19, 13),
(22, 13),
(22, 18),
(22, 22);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `pokemon`
--
ALTER TABLE `pokemon`
  ADD CONSTRAINT `FK_62DC90F38EB23357` FOREIGN KEY (`types_id`) REFERENCES `types` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `user_pokemon`
--
ALTER TABLE `user_pokemon`
  ADD CONSTRAINT `FK_3AD18EF92FE71C3E` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_3AD18EF9A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
