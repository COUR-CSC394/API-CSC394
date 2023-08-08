-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 29 juil. 2023 à 15:25
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add categorie', 7, 'add_categorie'),
(26, 'Can change categorie', 7, 'change_categorie'),
(27, 'Can delete categorie', 7, 'delete_categorie'),
(28, 'Can view categorie', 7, 'view_categorie'),
(29, 'Can add produit', 8, 'add_produit'),
(30, 'Can change produit', 8, 'change_produit'),
(31, 'Can delete produit', 8, 'delete_produit'),
(32, 'Can view produit', 8, 'view_produit'),
(33, 'Can add vente', 9, 'add_vente'),
(34, 'Can change vente', 9, 'change_vente'),
(35, 'Can delete vente', 9, 'delete_vente'),
(36, 'Can view vente', 9, 'view_vente'),
(37, 'Can add facture', 10, 'add_facture'),
(38, 'Can change facture', 10, 'change_facture'),
(39, 'Can delete facture', 10, 'delete_facture'),
(40, 'Can view facture', 10, 'view_facture');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'gestion', 'categorie'),
(10, 'gestion', 'facture'),
(8, 'gestion', 'produit'),
(9, 'gestion', 'vente'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-07-29 11:09:31.693736'),
(2, 'auth', '0001_initial', '2023-07-29 11:09:41.452495'),
(3, 'admin', '0001_initial', '2023-07-29 11:09:43.695241'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-07-29 11:09:43.748587'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-07-29 11:09:43.812969'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-07-29 11:09:44.671118'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-07-29 11:09:46.115966'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-07-29 11:09:46.333724'),
(9, 'auth', '0004_alter_user_username_opts', '2023-07-29 11:09:46.374664'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-07-29 11:09:47.476276'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-07-29 11:09:47.547922'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-07-29 11:09:47.616617'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-07-29 11:09:47.868508'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-07-29 11:09:48.051014'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-07-29 11:09:48.272461'),
(16, 'auth', '0011_update_proxy_permissions', '2023-07-29 11:09:48.353427'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-07-29 11:09:48.534452'),
(18, 'gestion', '0001_initial', '2023-07-29 11:09:54.123183'),
(19, 'sessions', '0001_initial', '2023-07-29 11:09:54.455991');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gestion_categorie`
--

CREATE TABLE `gestion_categorie` (
  `id` bigint(20) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `code` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gestion_categorie`
--

INSERT INTO `gestion_categorie` (`id`, `nom`, `code`) VALUES
(3, 'Category Name', 'cat001'),
(4, 'reg', '02'),
(5, 'etr', '02ge'),
(6, 'etr', '02ge'),
(7, 'eth', 'erh'),
(8, 'eth', 'erh'),
(9, 'etdyth', 'erh'),
(10, 'etrrtjftjdkjh', 'erh');

-- --------------------------------------------------------

--
-- Structure de la table `gestion_facture`
--

CREATE TABLE `gestion_facture` (
  `id` bigint(20) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `prix_total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gestion_facture_ventes`
--

CREATE TABLE `gestion_facture_ventes` (
  `id` bigint(20) NOT NULL,
  `facture_id` bigint(20) NOT NULL,
  `vente_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gestion_produit`
--

CREATE TABLE `gestion_produit` (
  `id` bigint(20) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `quantité` int(10) UNSIGNED NOT NULL CHECK (`quantité` >= 0),
  `description` longtext NOT NULL,
  `image` varchar(200) NOT NULL,
  `seuil` int(10) UNSIGNED NOT NULL CHECK (`seuil` >= 0),
  `prix_unitaire` decimal(10,2) NOT NULL,
  `code_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gestion_produit`
--

INSERT INTO `gestion_produit` (`id`, `nom`, `quantité`, `description`, `image`, `seuil`, `prix_unitaire`, `code_id`) VALUES
(1, 'Product Name', 50, 'Product description', 'https://example.com/product.jpg', 10, 19.99, 7);

-- --------------------------------------------------------

--
-- Structure de la table `gestion_vente`
--

CREATE TABLE `gestion_vente` (
  `id` bigint(20) NOT NULL,
  `quantité` int(10) UNSIGNED NOT NULL CHECK (`quantité` >= 0),
  `prix` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `code_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gestion_vente`
--

INSERT INTO `gestion_vente` (`id`, `quantité`, `prix`, `date`, `code_id`) VALUES
(1, 5, 100.50, '2023-07-29', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Index pour la table `gestion_categorie`
--
ALTER TABLE `gestion_categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gestion_facture`
--
ALTER TABLE `gestion_facture`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero` (`numero`);

--
-- Index pour la table `gestion_facture_ventes`
--
ALTER TABLE `gestion_facture_ventes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gestion_facture_ventes_facture_id_vente_id_824c30f5_uniq` (`facture_id`,`vente_id`),
  ADD KEY `gestion_facture_ventes_vente_id_db43a6c4_fk_gestion_vente_id` (`vente_id`);

--
-- Index pour la table `gestion_produit`
--
ALTER TABLE `gestion_produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gestion_produit_code_id_22490e6c_fk_gestion_categorie_id` (`code_id`);

--
-- Index pour la table `gestion_vente`
--
ALTER TABLE `gestion_vente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gestion_vente_code_id_b8cbd15f_fk_gestion_produit_id` (`code_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `gestion_categorie`
--
ALTER TABLE `gestion_categorie`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `gestion_facture`
--
ALTER TABLE `gestion_facture`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gestion_facture_ventes`
--
ALTER TABLE `gestion_facture_ventes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gestion_produit`
--
ALTER TABLE `gestion_produit`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `gestion_vente`
--
ALTER TABLE `gestion_vente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `gestion_facture_ventes`
--
ALTER TABLE `gestion_facture_ventes`
  ADD CONSTRAINT `gestion_facture_ventes_facture_id_ab6de2a2_fk_gestion_facture_id` FOREIGN KEY (`facture_id`) REFERENCES `gestion_facture` (`id`),
  ADD CONSTRAINT `gestion_facture_ventes_vente_id_db43a6c4_fk_gestion_vente_id` FOREIGN KEY (`vente_id`) REFERENCES `gestion_vente` (`id`);

--
-- Contraintes pour la table `gestion_produit`
--
ALTER TABLE `gestion_produit`
  ADD CONSTRAINT `gestion_produit_code_id_22490e6c_fk_gestion_categorie_id` FOREIGN KEY (`code_id`) REFERENCES `gestion_categorie` (`id`);

--
-- Contraintes pour la table `gestion_vente`
--
ALTER TABLE `gestion_vente`
  ADD CONSTRAINT `gestion_vente_code_id_b8cbd15f_fk_gestion_produit_id` FOREIGN KEY (`code_id`) REFERENCES `gestion_produit` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
