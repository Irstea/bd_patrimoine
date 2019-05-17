CREATE TABLE ACTEURS
(
   ID_acteur       INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de l''acteur',
   nom_acteur      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Nom de l''acteur',
   prenom_acteur   VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Pr�nom de l''acteur',
   ID_cate_acteur  INT COMMENT 'Fait r�f�rence � CATE_ACTEUR(id_acte_acteur)',
   type_acteur     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Type d''acteur (individuel/collectif)',
   detail_acteur   LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations suppl�mentaires sur l''acteur',
   PRIMARY KEY (ID_acteur)
)
ENGINE=MyISAM
COMMENT='Table des acteurs'
COLLATE=utf8_general_ci;

CREATE TABLE ACTIONS
(
   ID_action  INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique du type d''action',
   action     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� du type d''action',
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
   Edition            VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT '�dition du journal',
   Rubrique           VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Rubrique de l''article',
   Page               VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Page de l''article dans le journal',
   EnTete             VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Ent�te de l''article',
   PieceJointeArt     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Nom de la pi�ce jointe',
   PersSaisieArticle  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Login de la personne ayant enregistr� l''article',
   DateSaisieArticle  DATETIME                                            NOT NULL COMMENT 'Date de saisie de l''article',
   NumArticleConflit  INT COMMENT 'Fait r�f�rence � usact.article(article_id)',
   PRIMARY KEY (NumArticle)
)
ENGINE=MyISAM
COMMENT='Table des articles de presse'
COLLATE=utf8_general_ci;

CREATE TABLE AUTEURS
(
   ID_auteur      INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de l''auteur',
   nom_auteur     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Nom de l''auteur',
   prenom_auteur  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Pr�nom de l''auteur',
   PRIMARY KEY (ID_auteur)
)
ENGINE=MyISAM
COMMENT='Table des auteurs'
COLLATE=utf8_general_ci;

CREATE TABLE A_ACTION
(
   ID_action      INT                                             NOT NULL COMMENT 'ID de l''action',
   ID_gestion     INT                                             NOT NULL COMMENT 'ID de la gestion. Fait r�f�rence � EST_GERE(ID_gestion)',
   detail_action  LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations suppl�mentaires sur l''action men�e',
   PRIMARY KEY (ID_action, ID_gestion)
)
ENGINE=MyISAM
COMMENT='Table des actions r�alis�es par les acteurs li�s � la gestion de l''�l�ment patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE A_OBJECTIF
(
   ID_objectif      INT                                             NOT NULL COMMENT 'ID de l''objectif',
   ID_gestion       INT                                             NOT NULL COMMENT 'ID de la gestion. Fait r�f�rence � EST_GERE(ID_gestion)',
   detail_objectif  LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations suppl�mentaires sur l''objectif du gestionnaire',
   PRIMARY KEY (ID_objectif, ID_gestion)
)
ENGINE=MyISAM
COMMENT='Table des objectifs des acteurs li�s � la gestion de l''�l�ment patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE CATE_ACTEUR
(
   ID_cate_acteur  INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de la cat�gorie d''acteur',
   ActeurNiv1      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� de premier niveau de la cat�gorie d''acteur',
   ActeurNiv2      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� de deuxi�me niveau de la cat�gorie d''acteur',
   ActeurNiv3      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� de troisi�me niveau de la cat�gorie d''acteur',
   PRIMARY KEY (ID_cate_acteur)
)
ENGINE=MyISAM
COMMENT='Table des cat�gories d''acteurs'
COLLATE=utf8_general_ci;

CREATE TABLE CATE_IMMO
(
   ID_cate_immo  INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de la cat�gorie Immobilier',
   cate1_immo    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� de premier niveau de la cat�gorie Immobilier (source : Base Architecture-M�rim�e)',
   cate2_immo    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� de deuxi�me niveau de la cat�gorie Immobilier (source : Base Architecture-M�rim�e)',
   denom_immo    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'D�signation de l''�l�ment Immobilier (source : Base Architecture-M�rim�e)',
   PRIMARY KEY (ID_cate_immo)
)
ENGINE=MyISAM
COMMENT='Table des cat�gories Immobilier'
COLLATE=utf8_general_ci;

CREATE TABLE CATE_MOB
(
   ID_cate_mob  INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de la cat�gorie Mobilier',
   cate1_mob    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� de premier niveau de la cat�gorie Mobilier (source : Base Mobilier-Palissy)',
   cate2_mob    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� de deuxi�me niveau de la cat�gorie Mobilier (source : Base Mobilier-Palissy)',
   denom_mob    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'D�signation de l''�l�ment Mobilier (source : Base Mobilier-Palissy)',
   PRIMARY KEY (ID_cate_mob)
)
ENGINE=MyISAM
COMMENT='Table des cat�gories Mobilier'
COLLATE=utf8_general_ci;

CREATE TABLE COMPOSITIONS
(
   ID_compo   INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique des types de milieux',
   nom_compo  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� des types de milieux (source : Natura 2000)',
   PRIMARY KEY (ID_compo)
)
ENGINE=MyISAM
COMMENT='Table des cat�gories de milieux'
COLLATE=utf8_general_ci;

CREATE TABLE COORDONNEES
(
   ID_coordonnees   INT                                                 NOT NULL COMMENT 'ID des coordonn�es',
   num_insee        INT                                                 NOT NULL COMMENT 'Code INSEE de la commune. Fait r�f�rence � LOCALISATIONS(num_insee)',
   adresse          VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Adresse',
   geolocalisation  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Coordonn�es pour g�olocalisation',
   PRIMARY KEY (ID_coordonnees)
)
ENGINE=MyISAM
COMMENT='Table des coordonn�es g�ographiques'
COLLATE=utf8_general_ci;

CREATE TABLE ELEMENT_PATRIMONIAL
(
   ID_ep           INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de l''�l�ment patrimonial',
   nom_ep          VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Nom de l''�l�ment patrimonial',
   categorie       VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Cat�gorie de l''�l�ment patrimonial (culturel/naturel)',
   sous_categorie  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Sous-cat�gorie de l''�l�ment patrimonial, si culturel',
   productif       BIT                                                 DEFAULT b'0' COMMENT 'El�ment productif (true/1 : oui, false/0 : non)',
   ouverture       BIT                                                 DEFAULT b'0' COMMENT 'El�ment ouvert au public (true/1 : oui, false/0 : non)',
   description     LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Description de l''�l�ment patrimonial',
   historique      LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Bref descriptif historique de l''�l�ment patrimonial',
   detail_ep       LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations suppl�mentaires sur l''�l�ment patrimonial',
   nom_saisie      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Nom de la personne qui saisit les donn�es',
   prenom_saisie   VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Pr�nom de la personne qui saisit les donn�es',
   date_saisie     DATETIME                                            NOT NULL COMMENT 'Date de la saisie des donn�es',
   PRIMARY KEY (ID_ep)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives � l''�l�ment patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EMPLOIS
(
   ID_emploi      INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de l''emploi',
   ID_ep          INT COMMENT 'ID de l''�l�ment patrimonial. Fait r�f�rence � ELEMENT_PATRIMONIAL(ID_ep)',
   cate_emploi    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Cat�gorie de l''emploi',
   salaries       BIT                                                 DEFAULT b'0' COMMENT 'Indique s''il y a des emplois salari�s (true/1 : oui, false/0 : non)',
   non_salaries   BIT                                                 DEFAULT b'0' COMMENT 'Indique s''il y a des emplois non salari�s (true/1 : oui, false/0 : non)',
   permanents     BIT                                                 DEFAULT b'0' COMMENT 'Indique s''il y a des emplois permanents (true/1 : oui, false/0 : non)',
   saisonniers    BIT                                                 DEFAULT b'0' COMMENT 'Indique s''il y a des emplois saisonniers (true/1 : oui, false/0 : non)',
   directs        BIT                                                 DEFAULT b'0' COMMENT 'Indique s''il y a des emplois directs (true/1 : oui, false/0 : non)',
   indirects      BIT                                                 DEFAULT b'0' COMMENT 'Indique s''il y a des emplois indirects (true/1 : oui, false/0 : non)',
   detail_emploi  LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations suppl�mentaires sur l''emploi pr�sent',
   PRIMARY KEY (ID_emploi)
)
ENGINE=MyISAM
COMMENT='Table concernant les emplois li�s � l''�l�ment patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE ENTRETIENS
(
   NumEntretien         INT                                                 NOT NULL COMMENT 'ID unique de l''entretien',
   NumExpert            INT                                                 NOT NULL COMMENT 'ID de l''expert. Fait r�f�rence � EXPERTS(NumExpert)',
   DateEntretien        DATETIME                                            NOT NULL COMMENT 'Date de r�alisation de l''entretien',
   Institution          VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Institution � laquelle appartient l''expert interrog�',
   Statut               VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Statut de l''expert interrog�',
   Localisation         VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Localisation de l''institution de l''expert interrog�',
   Binome               VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Nom des personnes ayant r�alis� l''entretien aupr�s de l''expert',
   PersSaisieEntre      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Nom de la personne qui a saisi l''information dans la base de donn�es',
   DateSaisieEntre      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Date de saisie de l''information dans la base de donn�es',
   NumEntretienConflit  INT COMMENT 'Fait r�f�rence � usact.entretien(entretien_id)',
   PRIMARY KEY (NumEntretien)
)
ENGINE=MyISAM
COMMENT='Table des entretiens aupr�s d''experts'
COLLATE=utf8_general_ci;

CREATE TABLE ESPECES
(
   ID_espece    INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de l''esp�ce',
   cate_espece  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� de l''esp�ce - Groupe taxonomique (source : Natura 2000)',
   PRIMARY KEY (ID_espece)
)
ENGINE=MyISAM
COMMENT='Table des cat�gories d''esp�ces d''int�r�t communautaire'
COLLATE=utf8_general_ci;

CREATE TABLE ESPECES_PRESENTES
(
   ID_naturel  INT   NOT NULL COMMENT 'ID de l''�l�ment du patrimoine naturel. Fait r�f�rence � NATUREL(ID_naturel)',
   ID_espece   INT   NOT NULL COMMENT 'ID de l''esp�ce. Fait r�f�rence � ESPECES(ID_espece)',
   PRIMARY KEY (ID_naturel, ID_espece)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux esp�ces pr�sentes sur l''�l�ment patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EST_ABORDE
(
   NumArticle  INT   NOT NULL COMMENT 'ID de l''article qui fait r�f�rence � l''�l�ment patrimonial. Fait r�f�rence � ARTICLES(NumArticle)',
   ID_ep       INT   NOT NULL COMMENT 'ID de l''�l�ment patrimonial cit� dans l''article. Fait r�f�rence � ELEMENT_PATRIMONIAL(ID_ep)',
   PRIMARY KEY (NumArticle, ID_ep)
)
ENGINE=MyISAM
COMMENT='Table des �l�ments patrimoniaux abord�s dans un article'
COLLATE=utf8_general_ci;

CREATE TABLE EST_COMPOSE
(
   ID_compo    INT             NOT NULL COMMENT 'ID des types de milieux. Fait r�f�rence � COMPOSITIONS(ID_compo)',
   ID_naturel  INT             NOT NULL COMMENT 'ID de l''�l�ment du patrimoine naturel. Fait r�f�rence � NATUREL(ID_naturel)',
   couv_compo  DECIMAL(11,2) COMMENT 'Pourcentage de couverture du milieu',
   PRIMARY KEY (ID_compo, ID_naturel)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux milieux composant l''�l�ment patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EST_GERE
(
   ID_gestion    INT   NOT NULL AUTO_INCREMENT COMMENT 'ID unique de la gestion de l''�l�ment patrimonial par l''acteur',
   ID_acteur     INT COMMENT 'ID de l''acteur',
   ID_ep         INT COMMENT 'ID de l''�l�ment patrimonial. Fait r�f�rence � ELEMENT_PATRIMONIAL(ID_ep)',
   proprietaire  BIT   DEFAULT b'0' COMMENT 'Indique si l''acteur est propri�taire (true/1 : oui, false/0 : non)',
   gestionnaire  BIT   DEFAULT b'0' COMMENT 'Indique si l''acteur est gestionnaire (true/1 : oui, false/0 : non)',
   PRIMARY KEY (ID_gestion)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux acteurs g�rant l''�l�ment patrimonial'
COLLATE=utf8_general_ci;

CREATE INDEX ID_acteur
   ON EST_GERE (ID_acteur ASC);


CREATE TABLE EST_INTERESSANT
(
   ID_ep           INT                                             NOT NULL COMMENT 'ID de l''�l�ment patrimonial. Fait r�f�rence � ELEMENT_PATRIMONIAL(ID_ep)',
   ID_interet      INT                                             NOT NULL COMMENT 'ID de l''int�r�t. Fait r�f�rence � INTERETS(ID_interet)',
   detail_interet  LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations suppl�mentaires sur l''int�r�t de l''�l�ment patrimonial',
   PRIMARY KEY (ID_ep, ID_interet)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux int�r�ts de l''�l�ment patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EST_LABELLISE
(
   ID_label      INT                                                 NOT NULL COMMENT 'ID du label. Fait r�f�rence � LABELS(ID_label)',
   ID_ep         INT                                                 NOT NULL COMMENT 'ID de l''�l�ment patrimonial. Fait r�f�rence � ELEMENT_PATRIMONIAL(ID_ep)',
   date_depot    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Date de d�p�t du dossier de demande de label',
   date_label    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Date d''attribution du label',
   cout_label    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Co�t du label',
   detail_label  LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations suppl�mentaires sur le label de l''�l�ment patrimonial',
   PRIMARY KEY (ID_label, ID_ep)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux labels de l''�l�ment patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EST_LIE
(
   ID_ep_1          INT                                             NOT NULL COMMENT 'ID du premier �l�ment patrimonial',
   ID_ep_2          INT                                             NOT NULL COMMENT 'ID du second �l�ment patrimonial',
   detail_relation  LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations suppl�mentaires sur la relation entre les deux �l�ments patrimoniaux',
   PRIMARY KEY (ID_ep_1, ID_ep_2)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux liens entre deux �l�ments patrimoniaux'
COLLATE=utf8_general_ci;

CREATE TABLE EST_LOCALISE
(
   ID_ep           INT   NOT NULL COMMENT 'ID de l''�l�ment patrimonial. Fait r�f�rence � ELEMENT_PATRIMONIAL(ID_ep)',
   ID_coordonnees  INT   NOT NULL COMMENT 'ID des coordonn�es. Fait r�f�rence � COORDONNEES(ID_coordonnees)',
   PRIMARY KEY (ID_ep, ID_coordonnees)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives � la localisation de l''�l�ment patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EST_MENACE
(
   ID_ep           INT                                                 NOT NULL COMMENT 'ID de l''�l�ment patrimonial. Fait r�f�rence � ELEMENT_PATRIMONIAL(ID_ep)',
   ID_menace       INT                                                 NOT NULL COMMENT 'ID de la cat�gorie de menace',
   src_menace      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Source identifiant la menace',
   origine_menace  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Origine de la menace',
   detail_menace   LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations suppl�mentaires sur la menace pesant sur l''�l�ment patrimonial',
   PRIMARY KEY (ID_ep, ID_menace)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux menaces pesant sur l''�l�ment patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EST_OUVERT
(
   ID_periode  INT   NOT NULL COMMENT 'ID de la p�riode. Fait r�f�rence � PERIODES(ID_periode)',
   ID_ep       INT   NOT NULL COMMENT 'ID de l''�l�ment patrimonial. Fait r�f�rence � ELEMENT_PATRIMONIAL(ID_ep)',
   ID_jour     INT   NOT NULL COMMENT 'ID du jour. Fait r�f�rence � JOURS(ID_jour)',
   PRIMARY KEY (ID_periode, ID_ep, ID_jour)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives � l''ouverture de l''�l�ment patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EST_PAYANT
(
   ID_tarif    INT                                                 NOT NULL COMMENT 'ID du tarif. Fait r�f�rence � TARIFS(ID_tarif)',
   ID_ep       INT                                                 NOT NULL COMMENT 'ID de l''�l�ment patrimonial. Fait r�f�rence � ELEMENT_PATRIMONIAL(ID_ep)',
   tarif       DECIMAL(19,4) COMMENT 'Montant en euros de la visite de l''�l�ment patrimonial',
   date_tarif  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Date de r�f�rence des informations sur la tarification saisies dans la base',
   PRIMARY KEY (ID_tarif, ID_ep)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux tarifs li�s � l''�l�ment patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EST_PROTEGE
(
   ID_protect       INT                                                 NOT NULL COMMENT 'ID de la cat�gorie de protection. Fait r�f�rence � PROTECTIONS(ID_protect)',
   ID_ep            INT                                                 NOT NULL COMMENT 'ID de l''�l�ment patrimonial. Fait r�f�rence � ELEMENT_PATRIMONIAL(ID_ep)',
   date_dde         VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Date de demande de protection',
   date_protect     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Date du d�but de la protection',
   duree_effective  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Dur�e de la protection',
   ref_protect      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'R�f�rence de la protection',
   detail_protect   LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations suppl�mentaires sur la protection de l''�l�ment patrimonial',
   PRIMARY KEY (ID_protect, ID_ep)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux protections dont b�n�ficie l''�l�ment patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EST_REALISE
(
   ID_auteur      INT                                                 NOT NULL COMMENT 'ID de l''auteur. Fait r�f�rence � AUTEURS(ID_auteur)',
   ID_ep          INT                                                 NOT NULL COMMENT 'ID de l''�l�ment patrimonial. Fait r�f�rence � ELEMENT_PATRIMONIAL(ID_ep)',
   metier_auteur  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'M�tier de l''auteur',
   detail_auteur  LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations suppl�mentaires sur l''auteur de l''�l�ment patrimonial',
   PRIMARY KEY (ID_auteur, ID_ep)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux auteurs de l''�l�ment patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EST_REFERENCE
(
   ID_source      INT                                                 NOT NULL COMMENT 'ID de la source de donn�es. Fait r�f�rence � SOURCES(ID_source)',
   ID_ep          INT                                                 NOT NULL COMMENT 'ID de l''�l�ment patrimonial. Fait r�f�rence � ELEMENT_PATRIMONIAL(ID_ep)',
   date_source    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Date de r�f�rence des informations dans la source de donn�es',
   detail_source  LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations suppl�mentaires sur la source de donn�es citant l''�l�ment patrimonial',
   PRIMARY KEY (ID_source, ID_ep)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux sources de donn�es citant l''�l�ment patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EST_RELATE
(
   NumEntretien  INT   NOT NULL COMMENT 'ID de l''entretien citant l''�l�ment patrimonial. Fait r�f�rence � ENTRETIENS(NumEntretien)',
   ID_ep         INT   NOT NULL COMMENT 'ID de l''�l�ment patrimonial cit� lors de l''entretien. Fait r�f�rence � ELEMENT_PATRIMONIAL(ID_ep)',
   PRIMARY KEY (NumEntretien, ID_ep)
)
ENGINE=MyISAM
COMMENT='Table des �l�ments patrimoniaux abord�s lors d''un entretien'
COLLATE=utf8_general_ci;

CREATE TABLE EST_UTILISE
(
   ID_usage            INT                                             NOT NULL COMMENT 'ID de l''usage. Fait r�f�rence � USAGES(ID_usage)',
   ID_ep               INT                                             NOT NULL COMMENT 'ID de l''�l�ment patrimonial. Fait r�f�rence � ELEMENT_PATRIMONIAL(ID_ep)',
   detail_utilisation  LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations suppl�mentaires sur l''usage li� � l''�l�ment patrimonial',
   PRIMARY KEY (ID_usage, ID_ep)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux usages li�s � l''�l�ment patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE EXPERTS
(
   NumExpert         INT                                                 NOT NULL COMMENT 'ID unique de l''expert',
   NomExpert         VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Nom de l''expert',
   PrenomExpert      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Pr�nom de l''expert',
   Sexe              VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Genre de l''expert',
   AnneeNaissance    INT COMMENT 'Ann�e de naissance de l''expert',
   CommuneResid      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Commune de r�sidence de l''expert',
   LienTerritoire    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Lien de l''expert avec le territoire',
   ActiviteAssoc     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Activit� associative de l''expert',
   ActiviteProf      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Activit� professionnelle de l''expert',
   NumActeur         INT COMMENT 'Fait r�f�rence � usact.acteur(acteur_id)',
   NumExpertConflit  INT COMMENT 'Fait r�f�rence � usact.expert(expert_id)',
   PRIMARY KEY (NumExpert)
)
ENGINE=MyISAM
COMMENT='Table des experts'
COLLATE=utf8_general_ci;

CREATE TABLE FREQUENTATION
(
   ID_frequentation  INT                                                 NOT NULL COMMENT 'ID unique des informations sur la fr�quentation',
   indic_freq        VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Niveau de fr�quentation',
   date_ouverture    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Date d''ouverture au public',
   date_fermeture    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Date de fermeture au public',
   ind_libre         BIT                                                 DEFAULT b'0' COMMENT 'Visite individuelle et libre (true/1 : oui, false/0 : non)',
   ind_org           BIT                                                 DEFAULT b'0' COMMENT 'Visite individuelle et organis�e (true/1 : oui, false/0 : non)',
   gp_libre          BIT                                                 DEFAULT b'0' COMMENT 'Visite en groupe et libre (true/1 : oui, false/0 : non)',
   gp_org            BIT                                                 DEFAULT b'0' COMMENT 'Visite en groupe et organis�e (true/1 : oui, false/0 : non)',
   date_freq         VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Date de r�f�rence des informations de fr�quentation saisies dans la base',
   PRIMARY KEY (ID_frequentation)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives � la fr�quentation de l''�l�ment patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE HABITATS
(
   ID_habitat   INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de l''habitat',
   nom_habitat  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� de l''habitat (source : Natura 2000)',
   PRIMARY KEY (ID_habitat)
)
ENGINE=MyISAM
COMMENT='Table des cat�gories d''habitats d''int�r�t communautaire'
COLLATE=utf8_general_ci;

CREATE TABLE HABITATS_PRESENTS
(
   ID_naturel    INT             NOT NULL COMMENT 'ID de l''�l�ment du patrimoine naturel. Fait r�f�rence � NATUREL(ID_naturel)',
   ID_habitat    INT             NOT NULL COMMENT 'ID de l''habitat. Fait r�f�rence � HABITATS(ID_habitat)',
   couv_habitat  DECIMAL(11,2) COMMENT 'Pourcentage de couverture de l''habitat',
   PRIMARY KEY (ID_naturel, ID_habitat)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux habitats pr�sents sur l''�l�ment patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE IMMOBILIER
(
   ID_immo          INT                                                 NOT NULL COMMENT 'ID de l''�l�ment du patrimoine immobilier',
   ID_cate_immo     INT                                                 NOT NULL COMMENT 'ID de la cat�gorie Immobilier. Fait r�f�rence � CATE_IMMO(ID_cate_immo)',
   periode          VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'P�riode de construction de l''�l�ment patrimonial',
   an_construction  SMALLINT COMMENT 'Date de construction',
   caract_edifice   VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Caract�res essentiels de l''�difice',
   elt_edifice      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'El�ments remarquables',
   decor            VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Techniques de d�cor port�es par l''�difice',
   elt_proteges     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'El�ments prot�g�s',
   etat_edifice     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Etat de conservation',
   detail_immo      LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations suppl�mentaires sur l''�l�ment du patrimoine immobilier',
   PRIMARY KEY (ID_immo)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives � un �l�ment du patrimoine immobilier'
COLLATE=utf8_general_ci;

CREATE TABLE INTERETS
(
   ID_interet  INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de l''int�r�t',
   interet     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� de l''int�r�t',
   PRIMARY KEY (ID_interet)
)
ENGINE=MyISAM
COMMENT='Table des cat�gories d''int�r�t'
COLLATE=utf8_general_ci;

CREATE TABLE JOURS
(
   ID_jour  INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique du jour',
   jour     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� du jour',
   PRIMARY KEY (ID_jour)
)
ENGINE=MyISAM
COMMENT='Table des cat�gories de jours d''ouverture'
COLLATE=utf8_general_ci;

CREATE TABLE LABELS
(
   ID_label     INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique du label',
   nom_label    VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� du label',
   duree_label  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Dur�e du label',
   asso_envi    BIT                                                 DEFAULT b'0' COMMENT 'Label d�cern� par une association environnementale (true/1 : oui, false/0 : non)',
   asso_cult    BIT                                                 DEFAULT b'0' COMMENT 'Label d�cern� par une association culturelle (true/1 : oui, false/0 : non)',
   asso_autre   BIT                                                 DEFAULT b'0' COMMENT 'Label d�cern� par un autre type d''association (true/1 : oui, false/0 : non)',
   DRAC         BIT                                                 DEFAULT b'0' COMMENT 'Label d�cern� par la DRAC (true/1 : oui, false/0 : non)',
   entreprise   BIT                                                 DEFAULT b'0' COMMENT 'Label d�cern� par une entretprise (true/1 : oui, false/0 : non)',
   fondation    BIT                                                 DEFAULT b'0' COMMENT 'Label d�cern� par une fondation (true/1 : oui, false/0 : non)',
   minis_agri   BIT                                                 DEFAULT b'0' COMMENT 'Label d�cern� par le minist�re en charge de l''agriculture (true/1 : oui, false/0 : non)',
   minis_cult   BIT                                                 DEFAULT b'0' COMMENT 'Label d�cern� par le minist�re en charge de la culture (true/1 : oui, false/0 : non)',
   minis_envi   BIT                                                 DEFAULT b'0' COMMENT 'Label d�cern� par le minist�re en charge de l''environnement (true/1 : oui, false/0 : non)',
   minis_autre  BIT                                                 DEFAULT b'0' COMMENT 'Label d�cern� par un autre minist�re (true/1 : oui, false/0 : non)',
   PRIMARY KEY (ID_label)
)
ENGINE=MyISAM
COMMENT='Table des cat�gories de labels'
COLLATE=utf8_general_ci;

CREATE TABLE LOCALISATIONS
(
   num_insee    INT                                                 NOT NULL COMMENT 'Code INSEE de la commune',
   region       VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� de la r�gion',
   departement  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� du d�partement',
   commune      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� de la commune',
   PRIMARY KEY (num_insee)
)
ENGINE=MyISAM
COMMENT='Table des communes fran�aises'
COLLATE=utf8_general_ci;

CREATE TABLE MENACES
(
   ID_menace  INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de la cat�gorie de menace',
   menace     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� de la menace',
   PRIMARY KEY (ID_menace)
)
ENGINE=MyISAM
COMMENT='Table des cat�gories de menaces'
COLLATE=utf8_general_ci;

CREATE TABLE MOBILIER
(
   ID_mob             INT                                                 NOT NULL COMMENT 'ID de l''�l�ment du patrimoine mobilier',
   ID_cate_mob        INT                                                 NOT NULL COMMENT 'ID de la cat�gorie Mobilier. Fait r�f�rence � CATE_MOB(ID_cate_mob)',
   cate_technique     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Technique de r�alisation de l''�l�ment patrimonial',
   an_creation        VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Ann�e de cr�ation',
   lieu_conservation  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Lieu de conservation',
   etat_mob           VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Etat de conservation',
   detail_mob         LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations suppl�mentaires sur l''�l�ment du patrimoine mobilier',
   PRIMARY KEY (ID_mob)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives � un �l�ment du patrimoine mobilier'
COLLATE=utf8_general_ci;

CREATE INDEX ID_cate_mob
   ON MOBILIER (ID_cate_mob ASC);


CREATE TABLE MODALITES
(
   ID_modalite  INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de la modalit�',
   `table`      VARCHAR(255) COMMENT 'Table concern�e',
   variable     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Champ concern�',
   modalite     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� de la modalit�',
   PRIMARY KEY (ID_modalite)
)
ENGINE=MyISAM
COMMENT='Table des valeurs de champs pour diverses tables (IMMOBILIER, MOBILIER, TRADITION, PRODUCTIF, EST_REALISE)'
COLLATE=utf8_general_ci;

CREATE TABLE NATUREL
(
   ID_naturel      INT                                             NOT NULL COMMENT 'ID de l''�l�ment du patrimoine naturel',
   surf_terrestre  DECIMAL(11,2) COMMENT 'Superficie terrestre de l''�l�ment patrimonial (en km2)',
   surf_marine     DECIMAL(11,2) COMMENT 'Superficie maritime de l''�l�ment patrimonial (en km2)',
   detail_naturel  LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations suppl�mentaires sur le caract�re naturel de l''�l�ment patrimonial',
   PRIMARY KEY (ID_naturel)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives au caract�re naturel de l''�l�ment patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE OBJECTIFS
(
   ID_objectif  INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de la cat�gorie d''objectif',
   objectif     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� de l''objectif',
   PRIMARY KEY (ID_objectif)
)
ENGINE=MyISAM
COMMENT='Table des cat�gories d''objectifs'
COLLATE=utf8_general_ci;

CREATE TABLE PERIODES
(
   ID_periode  INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de la p�riode',
   periode     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� de la p�riode',
   PRIMARY KEY (ID_periode)
)
ENGINE=MyISAM
COMMENT='Table des cat�gories de p�riodes d''ouverture'
COLLATE=utf8_general_ci;

CREATE TABLE PRODUCTIF
(
   ID_productif  INT                                                 NOT NULL COMMENT 'ID unique du type de production',
   en_activite   BIT                                                 DEFAULT b'0' COMMENT 'El�ment an activit� (true/1 : oui, false/0 : non)',
   activite      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Secteur d''activit�',
   debut         VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'D�but de l''activit�',
   fin           VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Fin de l''activit�',
   detail_indus  LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations suppl�mentaires sur le caract�re productif',
   PRIMARY KEY (ID_productif)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives au caract�re productif de l''�l�ment patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE PROPOSE
(
   ID_sup     INT             NOT NULL COMMENT 'ID du suppl�ment propos�. Fait r�f�rence � SUPPLEMENTS(ID_sup)',
   ID_ep      INT             NOT NULL COMMENT 'ID de l''�l�ment patricmonial. Fait r�f�rence � ELEMENT_PATRIMONIAL(ID_ep)',
   tarif_sup  DECIMAL(11,2) COMMENT 'Tarif (en euros) du suppl�ment propos�',
   PRIMARY KEY (ID_sup, ID_ep)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives aux suppl�ments propos�s'
COLLATE=utf8_general_ci;

CREATE TABLE PROTECTIONS
(
   ID_protect      INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de la cat�gorie de protection',
   denom_protect   VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� de la protection',
   duree_protect   VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Dur�e de la protection',
   protect_reglem  BIT                                                 DEFAULT b'0' COMMENT 'Protection r�glementaire (true/1 : oui, false/0 : non)',
   protect_conven  BIT                                                 DEFAULT b'0' COMMENT 'Protection conventionnelle (true/1 : oui, false/0 : non)',
   protect_fonc    BIT                                                 DEFAULT b'0' COMMENT 'Protection fonci�re (true/1 : oui, false/0 : non)',
   protect_txt     BIT                                                 DEFAULT b'0' COMMENT 'Protection par un texte (true/1 : oui, false/0 : non)',
   protect_invent  BIT                                                 DEFAULT b'0' COMMENT 'Protection par un inventaire (true/1 : oui, false/0 : non)',
   protect_legisl  BIT                                                 DEFAULT b'0' COMMENT 'Protection l�gislative (true/1 : oui, false/0 : non)',
   cate_UICN_I     BIT                                                 DEFAULT b'0' COMMENT 'Cat�gorie I des aires prot�g�es de l''UICN (source : Comit� fran�ais de l''UICN)',
   cate_UICN_II    BIT                                                 DEFAULT b'0' COMMENT 'Cat�gorie II des aires prot�g�es de l''UICN (source : Comit� fran�ais de l''UICN)',
   cate_UICN_III   BIT                                                 DEFAULT b'0' COMMENT 'Cat�gorie III des aires prot�g�es de l''UICN (source : Comit� fran�ais de l''UICN)',
   cate_UICN_IV    BIT                                                 DEFAULT b'0' COMMENT 'Cat�gorie IV des aires prot�g�es de l''UICN (source : Comit� fran�ais de l''UICN)',
   cate_UICN_V     BIT                                                 DEFAULT b'0' COMMENT 'Cat�gorie V des aires prot�g�es de l''UICN (source : Comit� fran�ais de l''UICN)',
   cate_UICN_VI    BIT                                                 DEFAULT b'0' COMMENT 'Cat�gorie VI des aires prot�g�es de l''UICN (source : Comit� fran�ais de l''UICN)',
   acte_creation   VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� de l''acte juridique de cr�ation',
   PRIMARY KEY (ID_protect)
)
ENGINE=MyISAM
COMMENT='Table des cat�gories de protections'
COLLATE=utf8_general_ci;

CREATE TABLE SOURCES
(
   ID_source   INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de la source de donn�es',
   nom_source  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� de la source',
   PRIMARY KEY (ID_source)
)
ENGINE=MyISAM
COMMENT='Table des cat�gories de sources de donn�es'
COLLATE=utf8_general_ci;

CREATE TABLE SUPPLEMENTS
(
   ID_sup      INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique du suppl�ment',
   supplement  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� du suppl�ment',
   PRIMARY KEY (ID_sup)
)
ENGINE=MyISAM
COMMENT='Table des cat�gories de suppl�ments propos�s'
COLLATE=utf8_general_ci;

CREATE TABLE TARIFS
(
   ID_tarif    INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique du tarif',
   cate_tarif  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� du tarif',
   PRIMARY KEY (ID_tarif)
)
ENGINE=MyISAM
COMMENT='Table des cat�gories de tarifs'
COLLATE=utf8_general_ci;

CREATE TABLE TRADITION
(
   ID_tradi      INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de la tradition',
   artistique    BIT                                                 DEFAULT b'0' COMMENT 'Tradition artistique (true/1 : oui, false/0 : non)',
   productif     BIT                                                 DEFAULT b'0' COMMENT 'Tradition productive (true/1 : oui, false/0 : non)',
   concernes     VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Cat�gories concern�es (individus, groupes, communaut�s, etc.)',
   etendue       VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Etendue (limite naturelle, nationale, etc.)',
   detail_tradi  LONGTEXT CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Informations suppl�mentaires sur la tradition',
   PRIMARY KEY (ID_tradi)
)
ENGINE=MyISAM
COMMENT='Table des informations relatives au caract�re traditionnel de l''�l�ment patrimonial'
COLLATE=utf8_general_ci;

CREATE TABLE USAGES
(
   ID_usage               INT                                                 NOT NULL AUTO_INCREMENT COMMENT 'ID unique de la cat�gorie d''usage',
   PositionUsageActivite  VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'Type d''usage (productif, non productif)',
   UsageActiviteNiv1      VARCHAR(50) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� de premier niveau de la cat�gorie d''usage',
   UsageActiviteNiv2      VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci COMMENT 'Libell� de deuxi�me niveau de la cat�gorie d''usage',
   PRIMARY KEY (ID_usage)
)
ENGINE=MyISAM
COMMENT='Table des cat�gories d''usages'
COLLATE=utf8_general_ci;


