CREATE TABLE ACTEURS
(
   ID_acteur       INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de l''acteur',
   nom_acteur      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Nom de l''acteur',
   prenom_acteur   VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Prénom de l''acteur',
   ID_cate_acteur  INT COMMENT 'Fait référence à CATE_ACTEUR(id_acte_acteur)',
   type_acteur     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Type d''acteur (individuel/collectif)',
   detail_acteur   LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations supplémentaires sur l''acteur',
   PRIMARY KEY (ID_acteur)
)
ENGINE=MyISAM
COMMENT='Table des acteurs'
COLLATE=utf8_general_ci;

CREATE TABLE ACTIONS
(
   ID_action  INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique du type d''action',
   action     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé du type d''action',
   PRIMARY KEY (ID_action)
)
ENGINE=MyISAM
COMMENT='Table des types d''actions'
COLLATE=utf8_general_ci;

CREATE TABLE ARTICLES
(
   NumArticle         INT                                                 NOT NULL COMMENT 'ID unique de l''article',
   TitreArticle       VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Titre de l''article',
   AuteurArticle      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Auteur de l''article',
   DateParution       DATETIME                                            NOT NULL COMMENT 'Date de parution de l''article',
   NomJournal         VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Nom du journal',
   Edition            VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Édition du journal',
   Rubrique           VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Rubrique de l''article',
   Page               VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Page de l''article dans le journal',
   EnTete             VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Entête de l''article',
   PieceJointeArt     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Nom de la pièce jointe',
   PersSaisieArticle  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Login de la personne ayant enregistré l''article',
   DateSaisieArticle  DATETIME                                            NOT NULL COMMENT 'Date de saisie de l''article',
   NumArticleConflit  INT COMMENT 'Fait référence à usact.article(article_id)',
   PRIMARY KEY (NumArticle)
)
ENGINE=MyISAM
COMMENT='Table des articles de presse'
COLLATE=utf8_general_ci;

CREATE TABLE AUTEURS
(
   ID_auteur      INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de l''auteur',
   nom_auteur     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Nom de l''auteur',
   prenom_auteur  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Prénom de l''auteur',
   PRIMARY KEY (ID_auteur)
)
ENGINE=MyISAM
COMMENT='Table des auteurs'
COLLATE=utf8_general_ci;

CREATE TABLE A_ACTION
(
   ID_action      INT                                             NOT NULL COMMENT 'ID de l''action',
   ID_gestion     INT                                             NOT NULL COMMENT 'ID de la gestion. Fait référence à EST_GERE(ID_gestion)',
   detail_action  LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations supplémentaires sur l''action menée',
   PRIMARY KEY (ID_action, ID_gestion)
)
ENGINE=MyISAM
COMMENT='Table des actions réalisées par les acteurs liés à la gestion de l''élément patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE A_OBJECTIF
(
   ID_objectif      INT                                             NOT NULL COMMENT 'ID de l''objectif',
   ID_gestion       INT                                             NOT NULL COMMENT 'ID de la gestion. Fait référence à EST_GERE(ID_gestion)',
   detail_objectif  LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations supplémentaires sur l''objectif du gestionnaire',
   PRIMARY KEY (ID_objectif, ID_gestion)
)
ENGINE=MyISAM
COMMENT='Table des objectifs des acteurs liés à la gestion de l''élément patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE CATE_ACTEUR
(
   ID_cate_acteur  INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de la catégorie d''acteur',
   ActeurNiv1      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé de premier niveau de la catégorie d''acteur',
   ActeurNiv2      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé de deuxième niveau de la catégorie d''acteur',
   ActeurNiv3      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé de troisième niveau de la catégorie d''acteur',
   PRIMARY KEY (ID_cate_acteur)
)
ENGINE=MyISAM
COMMENT='Table des catégories d''acteurs'
COLLATE=utf8_general_ci;

CREATE TABLE CATE_IMMO
(
   ID_cate_immo  INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de la catégorie Immobilier',
   cate1_immo    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé de premier niveau de la catégorie Immobilier (source : Base Architecture-Mérimée)',
   cate2_immo    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé de deuxième niveau de la catégorie Immobilier (source : Base Architecture-Mérimée)',
   denom_immo    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Désignation de l''élément Immobilier (source : Base Architecture-Mérimée)',
   PRIMARY KEY (ID_cate_immo)
)
ENGINE=MyISAM
COMMENT='Table des catégories Immobilier'
COLLATE=utf8_general_ci;

CREATE TABLE CATE_MOB
(
   ID_cate_mob  INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de la catégorie Mobilier',
   cate1_mob    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé de premier niveau de la catégorie Mobilier (source : Base Mobilier-Palissy)',
   cate2_mob    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé de deuxième niveau de la catégorie Mobilier (source : Base Mobilier-Palissy)',
   denom_mob    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Désignation de l''élément Mobilier (source : Base Mobilier-Palissy)',
   PRIMARY KEY (ID_cate_mob)
)
ENGINE=MyISAM
COMMENT='Table des catégories Mobilier'
COLLATE=utf8_general_ci;

CREATE TABLE COMPOSITIONS
(
   ID_compo   INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique des types de milieux',
   nom_compo  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé des types de milieux (source : Natura 2000)',
   PRIMARY KEY (ID_compo)
)
ENGINE=MyISAM
COMMENT='Table des catégories de milieux'
COLLATE=utf8_general_ci;

CREATE TABLE COORDONNEES
(
   ID_coordonnees   INT                                                 NOT NULL COMMENT 'ID des coordonnées',
   num_insee        INT                                                 NOT NULL COMMENT 'Code INSEE de la commune. Fait référence à LOCALISATIONS(num_insee)',
   adresse          VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Adresse',
   geolocalisation  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Coordonnées pour géolocalisation',
   PRIMARY KEY (ID_coordonnees)
)
ENGINE=MyISAM
COMMENT='Table des coordonnées géographiques'
COLLATE=utf8_general_ci;

CREATE TABLE ELEMENT_PATRIMONIAL
(
   ID_ep           INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de l''élément patrimonial',
   nom_ep          VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Nom de l''élément patrimonial',
   categorie       VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Catégorie de l''élément patrimonial (culturel/naturel)',
   sous_categorie  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Sous-catégorie de l''élément patrimonial, si culturel',
   productif       BIT                                                 DEFAULT b'0' COMMENT 'Elément productif (true/1 : oui, false/0 : non)',
   ouverture       BIT                                                 DEFAULT b'0' COMMENT 'Elément ouvert au public (true/1 : oui, false/0 : non)',
   description     LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Description de l''élément patrimonial',
   historique      LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Bref descriptif historique de l''élément patrimonial',
   detail_ep       LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations supplémentaires sur l''élément patrimonial',
   nom_saisie      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Nom de la personne qui saisit les données',
   prenom_saisie   VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Prénom de la personne qui saisit les données',
   date_saisie     DATETIME                                            NOT NULL COMMENT 'Date de la saisie des données',
   PRIMARY KEY (ID_ep)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives à l''élément patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EMPLOIS
(
   ID_emploi      INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de l''emploi',
   ID_ep          INT COMMENT 'ID de l''élément patrimonial. Fait référence à ELEMENT_PATRIMONIAL(ID_ep)',
   cate_emploi    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Catégorie de l''emploi',
   salaries       BIT                                                 DEFAULT b'0' COMMENT 'Indique s''il y a des emplois salariés (true/1 : oui, false/0 : non)',
   non_salaries   BIT                                                 DEFAULT b'0' COMMENT 'Indique s''il y a des emplois non salariés (true/1 : oui, false/0 : non)',
   permanents     BIT                                                 DEFAULT b'0' COMMENT 'Indique s''il y a des emplois permanents (true/1 : oui, false/0 : non)',
   saisonniers    BIT                                                 DEFAULT b'0' COMMENT 'Indique s''il y a des emplois saisonniers (true/1 : oui, false/0 : non)',
   directs        BIT                                                 DEFAULT b'0' COMMENT 'Indique s''il y a des emplois directs (true/1 : oui, false/0 : non)',
   indirects      BIT                                                 DEFAULT b'0' COMMENT 'Indique s''il y a des emplois indirects (true/1 : oui, false/0 : non)',
   detail_emploi  LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations supplémentaires sur l''emploi présent',
   PRIMARY KEY (ID_emploi)
)
ENGINE=MyISAM
COMMENT='Table concernant les emplois liés à l''élément patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE ENTRETIENS
(
   NumEntretien         INT                                                 NOT NULL COMMENT 'ID unique de l''entretien',
   NumExpert            INT                                                 NOT NULL COMMENT 'ID de l''expert. Fait référence à EXPERTS(NumExpert)',
   DateEntretien        DATETIME                                            NOT NULL COMMENT 'Date de réalisation de l''entretien',
   Institution          VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Institution à laquelle appartient l''expert interrogé',
   Statut               VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Statut de l''expert interrogé',
   Localisation         VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Localisation de l''institution de l''expert interrogé',
   Binome               VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Nom des personnes ayant réalisé l''entretien auprès de l''expert',
   PersSaisieEntre      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Nom de la personne qui a saisi l''information dans la base de données',
   DateSaisieEntre      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Date de saisie de l''information dans la base de données',
   NumEntretienConflit  INT COMMENT 'Fait référence à usact.entretien(entretien_id)',
   PRIMARY KEY (NumEntretien)
)
ENGINE=MyISAM
COMMENT='Table des entretiens auprès d''experts'
COLLATE=utf8_general_ci;

CREATE TABLE ESPECES
(
   ID_espece    INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de l''espèce',
   cate_espece  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé de l''espèce - Groupe taxonomique (source : Natura 2000)',
   PRIMARY KEY (ID_espece)
)
ENGINE=MyISAM
COMMENT='Table des catégories d''espèces d''intérêt communautaire'
COLLATE=utf8_general_ci;

CREATE TABLE ESPECES_PRESENTES
(
   ID_naturel  INT   NOT NULL COMMENT 'ID de l''élément du patrimoine naturel. Fait référence à NATUREL(ID_naturel)',
   ID_espece   INT   NOT NULL COMMENT 'ID de l''espèce. Fait référence à ESPECES(ID_espece)',
   PRIMARY KEY (ID_naturel, ID_espece)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux espèces présentes sur l''élément patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EST_ABORDE
(
   NumArticle  INT   NOT NULL COMMENT 'ID de l''article qui fait référence à l''élément patrimonial. Fait référence à ARTICLES(NumArticle)',
   ID_ep       INT   NOT NULL COMMENT 'ID de l''élément patrimonial cité dans l''article. Fait référence à ELEMENT_PATRIMONIAL(ID_ep)',
   PRIMARY KEY (NumArticle, ID_ep)
)
ENGINE=MyISAM
COMMENT='Table des éléments patrimoniaux abordés dans un article'
COLLATE=utf8_general_ci;

CREATE TABLE EST_COMPOSE
(
   ID_compo    INT             NOT NULL COMMENT 'ID des types de milieux. Fait référence à COMPOSITIONS(ID_compo)',
   ID_naturel  INT             NOT NULL COMMENT 'ID de l''élément du patrimoine naturel. Fait référence à NATUREL(ID_naturel)',
   couv_compo  DECIMAL(11,2) COMMENT 'Pourcentage de couverture du milieu',
   PRIMARY KEY (ID_compo, ID_naturel)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux milieux composant l''élément patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EST_GERE
(
   ID_gestion    INT   NOT NULL AUTO_INCREMENT COMMENT 'ID unique de la gestion de l''élément patrimonial par l''acteur',
   ID_acteur     INT COMMENT 'ID de l''acteur',
   ID_ep         INT COMMENT 'ID de l''élément patrimonial. Fait référence à ELEMENT_PATRIMONIAL(ID_ep)',
   proprietaire  BIT   DEFAULT b'0' COMMENT 'Indique si l''acteur est propriétaire (true/1 : oui, false/0 : non)',
   gestionnaire  BIT   DEFAULT b'0' COMMENT 'Indique si l''acteur est gestionnaire (true/1 : oui, false/0 : non)',
   PRIMARY KEY (ID_gestion)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux acteurs gérant l''élément patrimonial'
COLLATE=utf8_general_ci;

CREATE INDEX ID_acteur
   ON EST_GERE (ID_acteur ASC);


CREATE TABLE EST_INTERESSANT
(
   ID_ep           INT                                             NOT NULL COMMENT 'ID de l''élément patrimonial. Fait référence à ELEMENT_PATRIMONIAL(ID_ep)',
   ID_interet      INT                                             NOT NULL COMMENT 'ID de l''intérêt. Fait référence à INTERETS(ID_interet)',
   detail_interet  LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations supplémentaires sur l''intérêt de l''élément patrimonial',
   PRIMARY KEY (ID_ep, ID_interet)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux intérêts de l''élément patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EST_LABELLISE
(
   ID_label      INT                                                 NOT NULL COMMENT 'ID du label. Fait référence à LABELS(ID_label)',
   ID_ep         INT                                                 NOT NULL COMMENT 'ID de l''élément patrimonial. Fait référence à ELEMENT_PATRIMONIAL(ID_ep)',
   date_depot    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Date de dépôt du dossier de demande de label',
   date_label    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Date d''attribution du label',
   cout_label    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Coût du label',
   detail_label  LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations supplémentaires sur le label de l''élément patrimonial',
   PRIMARY KEY (ID_label, ID_ep)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux labels de l''élément patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EST_LIE
(
   ID_ep_1          INT                                             NOT NULL COMMENT 'ID du premier élément patrimonial',
   ID_ep_2          INT                                             NOT NULL COMMENT 'ID du second élément patrimonial',
   detail_relation  LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations supplémentaires sur la relation entre les deux éléments patrimoniaux',
   PRIMARY KEY (ID_ep_1, ID_ep_2)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux liens entre deux éléments patrimoniaux'
COLLATE=utf8_general_ci;

CREATE TABLE EST_LOCALISE
(
   ID_ep           INT   NOT NULL COMMENT 'ID de l''élément patrimonial. Fait référence à ELEMENT_PATRIMONIAL(ID_ep)',
   ID_coordonnees  INT   NOT NULL COMMENT 'ID des coordonnées. Fait référence à COORDONNEES(ID_coordonnees)',
   PRIMARY KEY (ID_ep, ID_coordonnees)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives à la localisation de l''élément patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EST_MENACE
(
   ID_ep           INT                                                 NOT NULL COMMENT 'ID de l''élément patrimonial. Fait référence à ELEMENT_PATRIMONIAL(ID_ep)',
   ID_menace       INT                                                 NOT NULL COMMENT 'ID de la catégorie de menace',
   src_menace      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Source identifiant la menace',
   origine_menace  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Origine de la menace',
   detail_menace   LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations supplémentaires sur la menace pesant sur l''élément patrimonial',
   PRIMARY KEY (ID_ep, ID_menace)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux menaces pesant sur l''élément patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EST_OUVERT
(
   ID_periode  INT   NOT NULL COMMENT 'ID de la période. Fait référence à PERIODES(ID_periode)',
   ID_ep       INT   NOT NULL COMMENT 'ID de l''élément patrimonial. Fait référence à ELEMENT_PATRIMONIAL(ID_ep)',
   ID_jour     INT   NOT NULL COMMENT 'ID du jour. Fait référence à JOURS(ID_jour)',
   PRIMARY KEY (ID_periode, ID_ep, ID_jour)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives à l''ouverture de l''élément patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EST_PAYANT
(
   ID_tarif    INT                                                 NOT NULL COMMENT 'ID du tarif. Fait référence à TARIFS(ID_tarif)',
   ID_ep       INT                                                 NOT NULL COMMENT 'ID de l''élément patrimonial. Fait référence à ELEMENT_PATRIMONIAL(ID_ep)',
   tarif       DECIMAL(19,4) COMMENT 'Montant en euros de la visite de l''élément patrimonial',
   date_tarif  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Date de référence des informations sur la tarification saisies dans la base',
   PRIMARY KEY (ID_tarif, ID_ep)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux tarifs liés à l''élément patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EST_PROTEGE
(
   ID_protect       INT                                                 NOT NULL COMMENT 'ID de la catégorie de protection. Fait référence à PROTECTIONS(ID_protect)',
   ID_ep            INT                                                 NOT NULL COMMENT 'ID de l''élément patrimonial. Fait référence à ELEMENT_PATRIMONIAL(ID_ep)',
   date_dde         VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Date de demande de protection',
   date_protect     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Date du début de la protection',
   duree_effective  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Durée de la protection',
   ref_protect      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Référence de la protection',
   detail_protect   LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations supplémentaires sur la protection de l''élément patrimonial',
   PRIMARY KEY (ID_protect, ID_ep)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux protections dont bénéficie l''élément patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EST_REALISE
(
   ID_auteur      INT                                                 NOT NULL COMMENT 'ID de l''auteur. Fait référence à AUTEURS(ID_auteur)',
   ID_ep          INT                                                 NOT NULL COMMENT 'ID de l''élément patrimonial. Fait référence à ELEMENT_PATRIMONIAL(ID_ep)',
   metier_auteur  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Métier de l''auteur',
   detail_auteur  LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations supplémentaires sur l''auteur de l''élément patrimonial',
   PRIMARY KEY (ID_auteur, ID_ep)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux auteurs de l''élément patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EST_REFERENCE
(
   ID_source      INT                                                 NOT NULL COMMENT 'ID de la source de données. Fait référence à SOURCES(ID_source)',
   ID_ep          INT                                                 NOT NULL COMMENT 'ID de l''élément patrimonial. Fait référence à ELEMENT_PATRIMONIAL(ID_ep)',
   date_source    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Date de référence des informations dans la source de données',
   detail_source  LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations supplémentaires sur la source de données citant l''élément patrimonial',
   PRIMARY KEY (ID_source, ID_ep)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux sources de données citant l''élément patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EST_RELATE
(
   NumEntretien  INT   NOT NULL COMMENT 'ID de l''entretien citant l''élément patrimonial. Fait référence à ENTRETIENS(NumEntretien)',
   ID_ep         INT   NOT NULL COMMENT 'ID de l''élément patrimonial cité lors de l''entretien. Fait référence à ELEMENT_PATRIMONIAL(ID_ep)',
   PRIMARY KEY (NumEntretien, ID_ep)
)
ENGINE=MyISAM
COMMENT='Table des éléments patrimoniaux abordés lors d''un entretien'
COLLATE=utf8_general_ci;

CREATE TABLE EST_UTILISE
(
   ID_usage            INT                                             NOT NULL COMMENT 'ID de l''usage. Fait référence à USAGES(ID_usage)',
   ID_ep               INT                                             NOT NULL COMMENT 'ID de l''élément patrimonial. Fait référence à ELEMENT_PATRIMONIAL(ID_ep)',
   detail_utilisation  LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations supplémentaires sur l''usage lié à l''élément patrimonial',
   PRIMARY KEY (ID_usage, ID_ep)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux usages liés à l''élément patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EXPERTS
(
   NumExpert         INT                                                 NOT NULL COMMENT 'ID unique de l''expert',
   NomExpert         VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Nom de l''expert',
   PrenomExpert      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Prénom de l''expert',
   Sexe              VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Genre de l''expert',
   AnneeNaissance    INT COMMENT 'Année de naissance de l''expert',
   CommuneResid      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Commune de résidence de l''expert',
   LienTerritoire    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Lien de l''expert avec le territoire',
   ActiviteAssoc     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Activité associative de l''expert',
   ActiviteProf      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Activité professionnelle de l''expert',
   NumActeur         INT COMMENT 'Fait référence à usact.acteur(acteur_id)',
   NumExpertConflit  INT COMMENT 'Fait référence à usact.expert(expert_id)',
   PRIMARY KEY (NumExpert)
)
ENGINE=MyISAM
COMMENT='Table des experts'
COLLATE=utf8_general_ci;

CREATE TABLE FREQUENTATION
(
   ID_frequentation  INT                                                 NOT NULL COMMENT 'ID unique des informations sur la fréquentation',
   indic_freq        VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Niveau de fréquentation',
   date_ouverture    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Date d''ouverture au public',
   date_fermeture    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Date de fermeture au public',
   ind_libre         BIT                                                 DEFAULT b'0' COMMENT 'Visite individuelle et libre (true/1 : oui, false/0 : non)',
   ind_org           BIT                                                 DEFAULT b'0' COMMENT 'Visite individuelle et organisée (true/1 : oui, false/0 : non)',
   gp_libre          BIT                                                 DEFAULT b'0' COMMENT 'Visite en groupe et libre (true/1 : oui, false/0 : non)',
   gp_org            BIT                                                 DEFAULT b'0' COMMENT 'Visite en groupe et organisée (true/1 : oui, false/0 : non)',
   date_freq         VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Date de référence des informations de fréquentation saisies dans la base',
   PRIMARY KEY (ID_frequentation)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives à la fréquentation de l''élément patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE HABITATS
(
   ID_habitat   INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de l''habitat',
   nom_habitat  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé de l''habitat (source : Natura 2000)',
   PRIMARY KEY (ID_habitat)
)
ENGINE=MyISAM
COMMENT='Table des catégories d''habitats d''intérêt communautaire'
COLLATE=utf8_general_ci;

CREATE TABLE HABITATS_PRESENTS
(
   ID_naturel    INT             NOT NULL COMMENT 'ID de l''élément du patrimoine naturel. Fait référence à NATUREL(ID_naturel)',
   ID_habitat    INT             NOT NULL COMMENT 'ID de l''habitat. Fait référence à HABITATS(ID_habitat)',
   couv_habitat  DECIMAL(11,2) COMMENT 'Pourcentage de couverture de l''habitat',
   PRIMARY KEY (ID_naturel, ID_habitat)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux habitats présents sur l''élément patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE IMMOBILIER
(
   ID_immo          INT                                                 NOT NULL COMMENT 'ID de l''élément du patrimoine immobilier',
   ID_cate_immo     INT                                                 NOT NULL COMMENT 'ID de la catégorie Immobilier. Fait référence à CATE_IMMO(ID_cate_immo)',
   periode          VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Période de construction de l''élément patrimonial',
   an_construction  SMALLINT COMMENT 'Date de construction',
   caract_edifice   VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Caractères essentiels de l''édifice',
   elt_edifice      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Eléments remarquables',
   decor            VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Techniques de décor portées par l''édifice',
   elt_proteges     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Eléments protégés',
   etat_edifice     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Etat de conservation',
   detail_immo      LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations supplémentaires sur l''élément du patrimoine immobilier',
   PRIMARY KEY (ID_immo)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives à un élément du patrimoine immobilier'
COLLATE=utf8_general_ci;

CREATE TABLE INTERETS
(
   ID_interet  INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de l''intérêt',
   interet     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé de l''intérêt',
   PRIMARY KEY (ID_interet)
)
ENGINE=MyISAM
COMMENT='Table des catégories d''intérêt'
COLLATE=utf8_general_ci;

CREATE TABLE JOURS
(
   ID_jour  INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique du jour',
   jour     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé du jour',
   PRIMARY KEY (ID_jour)
)
ENGINE=MyISAM
COMMENT='Table des catégories de jours d''ouverture'
COLLATE=utf8_general_ci;

CREATE TABLE LABELS
(
   ID_label     INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique du label',
   nom_label    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé du label',
   duree_label  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Durée du label',
   asso_envi    BIT                                                 DEFAULT b'0' COMMENT 'Label décerné par une association environnementale (true/1 : oui, false/0 : non)',
   asso_cult    BIT                                                 DEFAULT b'0' COMMENT 'Label décerné par une association culturelle (true/1 : oui, false/0 : non)',
   asso_autre   BIT                                                 DEFAULT b'0' COMMENT 'Label décerné par un autre type d''association (true/1 : oui, false/0 : non)',
   DRAC         BIT                                                 DEFAULT b'0' COMMENT 'Label décerné par la DRAC (true/1 : oui, false/0 : non)',
   entreprise   BIT                                                 DEFAULT b'0' COMMENT 'Label décerné par une entretprise (true/1 : oui, false/0 : non)',
   fondation    BIT                                                 DEFAULT b'0' COMMENT 'Label décerné par une fondation (true/1 : oui, false/0 : non)',
   minis_agri   BIT                                                 DEFAULT b'0' COMMENT 'Label décerné par le ministère en charge de l''agriculture (true/1 : oui, false/0 : non)',
   minis_cult   BIT                                                 DEFAULT b'0' COMMENT 'Label décerné par le ministère en charge de la culture (true/1 : oui, false/0 : non)',
   minis_envi   BIT                                                 DEFAULT b'0' COMMENT 'Label décerné par le ministère en charge de l''environnement (true/1 : oui, false/0 : non)',
   minis_autre  BIT                                                 DEFAULT b'0' COMMENT 'Label décerné par un autre ministère (true/1 : oui, false/0 : non)',
   PRIMARY KEY (ID_label)
)
ENGINE=MyISAM
COMMENT='Table des catégories de labels'
COLLATE=utf8_general_ci;

CREATE TABLE LOCALISATIONS
(
   num_insee    INT                                                 NOT NULL COMMENT 'Code INSEE de la commune',
   region       VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé de la région',
   departement  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé du département',
   commune      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé de la commune',
   PRIMARY KEY (num_insee)
)
ENGINE=MyISAM
COMMENT='Table des communes françaises'
COLLATE=utf8_general_ci;

CREATE TABLE MENACES
(
   ID_menace  INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de la catégorie de menace',
   menace     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé de la menace',
   PRIMARY KEY (ID_menace)
)
ENGINE=MyISAM
COMMENT='Table des catégories de menaces'
COLLATE=utf8_general_ci;

CREATE TABLE MOBILIER
(
   ID_mob             INT                                                 NOT NULL COMMENT 'ID de l''élément du patrimoine mobilier',
   ID_cate_mob        INT                                                 NOT NULL COMMENT 'ID de la catégorie Mobilier. Fait référence à CATE_MOB(ID_cate_mob)',
   cate_technique     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Technique de réalisation de l''élément patrimonial',
   an_creation        VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Année de création',
   lieu_conservation  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Lieu de conservation',
   etat_mob           VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Etat de conservation',
   detail_mob         LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations supplémentaires sur l''élément du patrimoine mobilier',
   PRIMARY KEY (ID_mob)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives à un élément du patrimoine mobilier'
COLLATE=utf8_general_ci;

CREATE INDEX ID_cate_mob
   ON MOBILIER (ID_cate_mob ASC);


CREATE TABLE MODALITES
(
   ID_modalite  INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de la modalité',
   `table`      VARCHAR(255) COMMENT 'Table concernée',
   variable     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Champ concerné',
   modalite     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé de la modalité',
   PRIMARY KEY (ID_modalite)
)
ENGINE=MyISAM
COMMENT='Table des valeurs de champs pour diverses tables (IMMOBILIER, MOBILIER, TRADITION, PRODUCTIF, EST_REALISE)'
COLLATE=utf8_general_ci;

CREATE TABLE NATUREL
(
   ID_naturel      INT                                             NOT NULL COMMENT 'ID de l''élément du patrimoine naturel',
   surf_terrestre  DECIMAL(11,2) COMMENT 'Superficie terrestre de l''élément patrimonial (en km2)',
   surf_marine     DECIMAL(11,2) COMMENT 'Superficie maritime de l''élément patrimonial (en km2)',
   detail_naturel  LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations supplémentaires sur le caractère naturel de l''élément patrimonial',
   PRIMARY KEY (ID_naturel)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives au caractère naturel de l''élément patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE OBJECTIFS
(
   ID_objectif  INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de la catégorie d''objectif',
   objectif     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé de l''objectif',
   PRIMARY KEY (ID_objectif)
)
ENGINE=MyISAM
COMMENT='Table des catégories d''objectifs'
COLLATE=utf8_general_ci;

CREATE TABLE PERIODES
(
   ID_periode  INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de la période',
   periode     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé de la période',
   PRIMARY KEY (ID_periode)
)
ENGINE=MyISAM
COMMENT='Table des catégories de périodes d''ouverture'
COLLATE=utf8_general_ci;

CREATE TABLE PRODUCTIF
(
   ID_productif  INT                                                 NOT NULL COMMENT 'ID unique du type de production',
   en_activite   BIT                                                 DEFAULT b'0' COMMENT 'Elément an activité (true/1 : oui, false/0 : non)',
   activite      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Secteur d''activité',
   debut         VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Début de l''activité',
   fin           VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Fin de l''activité',
   detail_indus  LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations supplémentaires sur le caractère productif',
   PRIMARY KEY (ID_productif)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives au caractère productif de l''élément patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE PROPOSE
(
   ID_sup     INT             NOT NULL COMMENT 'ID du supplément proposé. Fait référence à SUPPLEMENTS(ID_sup)',
   ID_ep      INT             NOT NULL COMMENT 'ID de l''élément patricmonial. Fait référence à ELEMENT_PATRIMONIAL(ID_ep)',
   tarif_sup  DECIMAL(11,2) COMMENT 'Tarif (en euros) du supplément proposé',
   PRIMARY KEY (ID_sup, ID_ep)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux suppléments proposés'
COLLATE=utf8_general_ci;

CREATE TABLE PROTECTIONS
(
   ID_protect      INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de la catégorie de protection',
   denom_protect   VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé de la protection',
   duree_protect   VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Durée de la protection',
   protect_reglem  BIT                                                 DEFAULT b'0' COMMENT 'Protection réglementaire (true/1 : oui, false/0 : non)',
   protect_conven  BIT                                                 DEFAULT b'0' COMMENT 'Protection conventionnelle (true/1 : oui, false/0 : non)',
   protect_fonc    BIT                                                 DEFAULT b'0' COMMENT 'Protection foncière (true/1 : oui, false/0 : non)',
   protect_txt     BIT                                                 DEFAULT b'0' COMMENT 'Protection par un texte (true/1 : oui, false/0 : non)',
   protect_invent  BIT                                                 DEFAULT b'0' COMMENT 'Protection par un inventaire (true/1 : oui, false/0 : non)',
   protect_legisl  BIT                                                 DEFAULT b'0' COMMENT 'Protection législative (true/1 : oui, false/0 : non)',
   cate_UICN_I     BIT                                                 DEFAULT b'0' COMMENT 'Catégorie I des aires protégées de l''UICN (source : Comité français de l''UICN)',
   cate_UICN_II    BIT                                                 DEFAULT b'0' COMMENT 'Catégorie II des aires protégées de l''UICN (source : Comité français de l''UICN)',
   cate_UICN_III   BIT                                                 DEFAULT b'0' COMMENT 'Catégorie III des aires protégées de l''UICN (source : Comité français de l''UICN)',
   cate_UICN_IV    BIT                                                 DEFAULT b'0' COMMENT 'Catégorie IV des aires protégées de l''UICN (source : Comité français de l''UICN)',
   cate_UICN_V     BIT                                                 DEFAULT b'0' COMMENT 'Catégorie V des aires protégées de l''UICN (source : Comité français de l''UICN)',
   cate_UICN_VI    BIT                                                 DEFAULT b'0' COMMENT 'Catégorie VI des aires protégées de l''UICN (source : Comité français de l''UICN)',
   acte_creation   VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé de l''acte juridique de création',
   PRIMARY KEY (ID_protect)
)
ENGINE=MyISAM
COMMENT='Table des catégories de protections'
COLLATE=utf8_general_ci;

CREATE TABLE SOURCES
(
   ID_source   INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de la source de données',
   nom_source  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé de la source',
   PRIMARY KEY (ID_source)
)
ENGINE=MyISAM
COMMENT='Table des catégories de sources de données'
COLLATE=utf8_general_ci;

CREATE TABLE SUPPLEMENTS
(
   ID_sup      INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique du supplément',
   supplement  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé du supplément',
   PRIMARY KEY (ID_sup)
)
ENGINE=MyISAM
COMMENT='Table des catégories de suppléments proposés'
COLLATE=utf8_general_ci;

CREATE TABLE TARIFS
(
   ID_tarif    INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique du tarif',
   cate_tarif  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé du tarif',
   PRIMARY KEY (ID_tarif)
)
ENGINE=MyISAM
COMMENT='Table des catégories de tarifs'
COLLATE=utf8_general_ci;

CREATE TABLE TRADITION
(
   ID_tradi      INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de la tradition',
   artistique    BIT                                                 DEFAULT b'0' COMMENT 'Tradition artistique (true/1 : oui, false/0 : non)',
   productif     BIT                                                 DEFAULT b'0' COMMENT 'Tradition productive (true/1 : oui, false/0 : non)',
   concernes     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Catégories concernées (individus, groupes, communautés, etc.)',
   etendue       VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Etendue (limite naturelle, nationale, etc.)',
   detail_tradi  LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations supplémentaires sur la tradition',
   PRIMARY KEY (ID_tradi)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives au caractère traditionnel de l''élément patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE USAGES
(
   ID_usage               INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de la catégorie d''usage',
   PositionUsageActivite  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Type d''usage (productif, non productif)',
   UsageActiviteNiv1      VARCHAR(50) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé de premier niveau de la catégorie d''usage',
   UsageActiviteNiv2      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libellé de deuxième niveau de la catégorie d''usage',
   PRIMARY KEY (ID_usage)
)
ENGINE=MyISAM
COMMENT='Table des catégories d''usages'
COLLATE=utf8_general_ci;


