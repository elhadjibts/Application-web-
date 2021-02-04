-- -----------------------------------------------------------------------------
--             Generation d'une base de donnees pour
--                      Oracle Version 9i
--                        (3/1/2021 17:56:43)
-- -----------------------------------------------------------------------------
--      Nom de la base : projet-bdd
--      Projet : Espace de travail
--      Auteur : groupe p14
--      Date de derniere modification : 3/1/2021 17:56:16
-- -----------------------------------------------------------------------------

DROP TABLE Administrateur CASCADE CONSTRAINTS;

DROP TABLE Etudiant CASCADE CONSTRAINTS;

DROP TABLE Formation CASCADE CONSTRAINTS;

DROP TABLE FichePedagogique CASCADE CONSTRAINTS;

DROP TABLE Module CASCADE CONSTRAINTS;

DROP TABLE Secretaire CASCADE CONSTRAINTS;

DROP TABLE Enseignant CASCADE CONSTRAINTS;

DROP TABLE AssocEnseignantModule CASCADE CONSTRAINTS;

DROP TABLE AssocFicheModule CASCADE CONSTRAINTS;

-- -----------------------------------------------------------------------------
--       TABLE : Administrateur
-- -----------------------------------------------------------------------------

CREATE TABLE Administrateur
   (
    idAdmin NUMBER(4)  NOT NULL ,
    mdp VARCHAR2(32),  
    CONSTRAINT PK_Administrateur PRIMARY KEY (idAdmin)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : Etudiant
-- -----------------------------------------------------------------------------

CREATE TABLE Etudiant
   (
    idEtudiant NUMBER(4)  NOT NULL,
    idFormation NUMBER(4)  NOT NULL,
    nom VARCHAR2(32)  ,
    prenom VARCHAR2(32)  ,
    mdp VARCHAR2(32)  ,
    adresseMailPerso VARCHAR2(32)  , 
    CONSTRAINT PK_Etudiant PRIMARY KEY (idEtudiant)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : Formation
-- -----------------------------------------------------------------------------

CREATE TABLE Formation
   (
    idFormation NUMBER(4)  NOT NULL,
    idEnseignant NUMBER(4)  NOT NULL,
    mention VARCHAR2(32)  ,
    parcours VARCHAR2(32)  ,
    niveau VARCHAR2(32) ,
    CONSTRAINT PK_Formation PRIMARY KEY (idFormation)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : FichePedagogique
-- -----------------------------------------------------------------------------

CREATE TABLE FichePedagogique
   (
    idFiche NUMBER(4)  NOT NULL,
    idEtudiant NUMBER(4)  NOT NULL,
    semestre VARCHAR2(4)  ,
    dateNaisssance DATE  ,
    adressePostale VARCHAR2(32)  ,
    adresseParents VARCHAR2(32)  ,
    numTel VARCHAR2(10)  ,
    adresseMailPerso VARCHAR2(32)  ,
    redoublant NUMBER(1)  ,
    ajac NUMBER(1)  ,
    tiersTemps NUMBER(1)  ,
    rse NUMBER(1)  ,
    typeControle VARCHAR2(32)  ,
    dateModification DATE  ,
    statut VARCHAR2(12) ,  
    CONSTRAINT PK_FichePedagogique PRIMARY KEY (idFiche)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : Module
-- -----------------------------------------------------------------------------

CREATE TABLE Module
   (
    idModule NUMBER(4)  NOT NULL,
    idFormation NUMBER(4)  NOT NULL,
    codeApogee VARCHAR2(8),
    type VARCHAR2(32)  ,
    libelle VARCHAR2(32)  ,
    ects VARCHAR2(32)  ,
    semestre VARCHAR2(32) ,  
    CONSTRAINT PK_Module PRIMARY KEY (idModule)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : Secretaire
-- -----------------------------------------------------------------------------

CREATE TABLE Secretaire
   (
    idSecretaire NUMBER(4)  NOT NULL,
    nom VARCHAR2(32)  ,
    prenom VARCHAR2(32)  ,
    mdp VARCHAR2(32)  ,
    adresseMail VARCHAR2(32) ,
    CONSTRAINT PK_Secretaire PRIMARY KEY (idSecretaire)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : Enseignant
-- -----------------------------------------------------------------------------

CREATE TABLE Enseignant
   (
    idEnseignant NUMBER(4)  NOT NULL,
    nom VARCHAR2(32)  ,
    prenom VARCHAR2(32)  ,
    mdp VARCHAR2(32)  ,
    adresseMail VARCHAR2(32) ,
    CONSTRAINT PK_Enseignant PRIMARY KEY (idEnseignant)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : AssocEnseignantModule
-- -----------------------------------------------------------------------------

CREATE TABLE AssocEnseignantModule
   (
    idEnseignant NUMBER(4)  NOT NULL,
    idModule NUMBER(4)  NOT NULL,
    CONSTRAINT PK_AssocEnseignantModule PRIMARY KEY (idEnseignant, idModule)  
   ) ;
    
-- -----------------------------------------------------------------------------
--       TABLE : AssocFicheModule
-- -----------------------------------------------------------------------------

CREATE TABLE AssocFicheModule
   (
    idFiche NUMBER(4)  NOT NULL,
    idModule NUMBER(4)  NOT NULL,
    inscription NUMBER(1)  ,
    note VARCHAR2(32) ,  
    CONSTRAINT PK_AssocFicheModule PRIMARY KEY (idFiche, idModule)  
   ) ;


-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE Etudiant ADD (
     CONSTRAINT FK_Etudiant_Formation
          FOREIGN KEY (idFormation)
               REFERENCES Formation (idFormation))   ;

ALTER TABLE Formation ADD (
     CONSTRAINT FK_Formation_Enseignant
          FOREIGN KEY (idEnseignant)
               REFERENCES Enseignant (idEnseignant))   ;

ALTER TABLE FichePedagogique ADD (
     CONSTRAINT FK_FichePedagogique_Etudiant
          FOREIGN KEY (idEtudiant)
               REFERENCES Etudiant (idEtudiant))   ;

ALTER TABLE Module ADD (
     CONSTRAINT FK_Module_Formation
          FOREIGN KEY (idFormation)
               REFERENCES Formation (idFormation))   ;

ALTER TABLE AssocEnseignantModule ADD (
     CONSTRAINT FK_AssocEnseignantModule_Ensei
          FOREIGN KEY (idEnseignant)
               REFERENCES Enseignant (idEnseignant))   ;

ALTER TABLE AssocEnseignantModule ADD (
     CONSTRAINT FK_AssocEnseignantModule_Modul
          FOREIGN KEY (idModule)
               REFERENCES Module (idModule))   ;

ALTER TABLE AssocFicheModule ADD (
     CONSTRAINT FK_AssocFicheModule_FichePedag
          FOREIGN KEY (idFiche)
               REFERENCES FichePedagogique (idFiche))   ;

ALTER TABLE AssocFicheModule ADD (
     CONSTRAINT FK_AssocFicheModule_Module
          FOREIGN KEY (idModule)
               REFERENCES Module (idModule))   ;


-- -----------------------------------------------------------------------------
--       INSERTION 
-- -----------------------------------------------------------------------------
               

DELETE FROM Administrateur ;
DELETE FROM Secretaire ;
DELETE FROM AssocFicheModule ;
DELETE FROM AssocEnseignantModule ;
DELETE FROM FichePedagogique ;
DELETE FROM Etudiant ;
DELETE FROM Module ;
DELETE FROM Formation ;
DELETE FROM Enseignant ;
    
INSERT ALL -- (idEnseignant, nom, prenom, mdp, adresseMail)
    INTO Enseignant VALUES (5975, 'couvreur', 'jean-michel', 'mdp', 'jeanmichel.couvreur@gmail.com')
    INTO Enseignant VALUES (1667, 'delacourt', 'martin', 'mdp', 'martin.delacourt@gmail.com')
    INTO Enseignant VALUES (8425, 'moal', 'frederic', 'mdp', 'frederic.moal@gmail.com')
    INTO Enseignant VALUES (2495, 'boichut', 'yohan', 'mdp', 'yohan.boichut@gmail.com')
SELECT * FROM dual ;

INSERT ALL -- (idFormation, idEnseignant, mention, parcours, niveau)
    INTO Formation VALUES (0001, 5975, 'Licence informatique', 'MIAGE', 3)
    INTO Formation VALUES (0002, 8425, 'Master informatique', 'IMIS', 5)
SELECT * FROM dual ;

INSERT ALL -- (idModule, idFormation, codeApogee, type, libelle, ects, semestre)
    INTO Module VALUES (0001, 0001, 'SLA5IF04', 'OBL', 'Programmation avancee', '5', 'S5')
    INTO Module VALUES (0002, 0001, 'SLA5SE01', 'OBL', 'Rï¿½seaux', '3', 'S5')
    INTO Module VALUES (0003, 0001, 'SLA6IF03', 'OBL', 'Programmation N tiers', '5', 'S6')
    INTO Module VALUES (0004, 0002, 'SINBU03L', 'OBL', 'Intelligence artificielle', '4', 'S9')
    INTO Module VALUES (0005, 0002, 'SINBU04L', 'OBL', 'Programmation parallele', '5', 'S9')
    INTO Module VALUES (0006, 0002, 'SINBU08L', 'OBL', 'Big data', '4', 'S10')
SELECT * FROM dual ;

INSERT ALL -- (idEtudiant, idFormation, nom, prenom, mdp, adresseMailPerso)
    INTO Etudiant VALUES (8433, 0001, 'collet', 'gweltaz', 'mdp', 'gweltaz.collet@gmail.com')
    INTO Etudiant VALUES (4257, 0001, 'de sousa', 'yanis', 'mdp', 'yanis.desousa@gmail.com')
    INTO Etudiant VALUES (7957, 0002, 'goudjil', 'hamza', 'mdp', 'hamza.goudjil@gmail.com')
    INTO Etudiant VALUES (2104, 0002, 'lo', 'el hadji', 'mdp', 'elhadji.lo@gmail.com')
SELECT * FROM dual ;

INSERT ALL -- (idFiche, idEtudiant, semestre, dateNaissance, adressePostale, adresseParents, numTel, adresseMailPerso, redoublant, ajac, tiersTemps, rse, typeControle, dateModification, statut)
    INTO FichePedagogique VALUES (0001, 8433, 'S5', TO_DATE('20000506','YYYYMMDD'), '2 allï¿½e du truc', '2 allï¿½e du machin', 0605487635, 'gweltaz.collet@gmail.com', 0, 0, 0, 0, 'Terminal', TO_DATE('20200908','YYYYMMDD'), 'remplie')
    INTO FichePedagogique VALUES (0002, 8433, 'S6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'non remplie')
    INTO FichePedagogique VALUES (0003, 4257, 'S5', TO_DATE('20001113','YYYYMMDD'), '2 rue du truc', '2 rue du machin', 0647953134, 'yanis.desousa@gmail.com', 0, 0, 0, 0, 'Terminal', TO_DATE('20200907','YYYYMMDD'), 'remplie')
    INTO FichePedagogique VALUES (0004, 4257, 'S6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'non remplie')
    INTO FichePedagogique VALUES (0005, 7957, 'S9', TO_DATE('19981127','YYYYMMDD'), '2 avenue du truc', '2 avenue du machin', 0634848592, 'hamza.goudjil@gmail.com', 0, 0, 0, 0, 'Terminal', TO_DATE('20200909','YYYYMMDD'), 'remplie')
    INTO FichePedagogique VALUES (0006, 7957, 'S10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'non remplie')
    INTO FichePedagogique VALUES (0007, 2104, 'S9', TO_DATE('19980701','YYYYMMDD'), '2 boulevard du truc', '2 boulevard du machin', 0725241232, 'elhadji.lo@gmail.com', 0, 0, 0, 0, 'Terminal', TO_DATE('20200908','YYYYMMDD'), 'remplie')
    INTO FichePedagogique VALUES (0008, 2104, 'S10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'non remplie')
SELECT * FROM dual ;

INSERT ALL -- (idEnseignant, idModule)
    INTO AssocEnseignantModule VALUES (5975, 0004) 
    INTO AssocEnseignantModule VALUES (5975, 0003)
    INTO AssocEnseignantModule VALUES (1667, 0002)
    INTO AssocEnseignantModule VALUES (8425, 0001)
    INTO AssocEnseignantModule VALUES (8425, 0003)
    INTO AssocEnseignantModule VALUES (8425, 0005)
    INTO AssocEnseignantModule VALUES (2495, 0003)
    INTO AssocEnseignantModule VALUES (2495, 0006)
SELECT * FROM dual ;

INSERT ALL -- (idFiche, idModule, inscription, note)
    INTO AssocFicheModule VALUES (0001, 0001, 1, 12)
    INTO AssocFicheModule VALUES (0001, 0002, 1, 15)
    INTO AssocFicheModule VALUES (0002, 0003, 0, NULL)
    INTO AssocFicheModule VALUES (0003, 0001, 1, 13)
    INTO AssocFicheModule VALUES (0003, 0002, 1, 16)
    INTO AssocFicheModule VALUES (0004, 0003, 0, NULL)  
    INTO AssocFicheModule VALUES (0005, 0004, 1, 11)
    INTO AssocFicheModule VALUES (0005, 0005, 1, 14)
    INTO AssocFicheModule VALUES (0006, 0006, 0, NULL)
    INTO AssocFicheModule VALUES (0007, 0004, 1, 12)
    INTO AssocFicheModule VALUES (0007, 0005, 1, 18)
    INTO AssocFicheModule VALUES (0008, 0006, 0, NULL)
SELECT * FROM dual ;    

INSERT ALL -- (idSecretaire, nom, prenom, mdp, adresseMail)
    INTO Secretaire VALUES (7539, 'secret', 'aire', 'mdp', 'aire.secret@gmail.com')
SELECT * FROM dual ;

INSERT ALL -- (idAdmin, mdp)
    INTO Administrateur VALUES (1111, 'mdp')
SELECT * FROM dual ;


-- -----------------------------------------------------------------------------
--       REQUETES
-- -----------------------------------------------------------------------------

-- Enseignant : afficher la liste des etudiants de l'enseignant 5975
SELECT idEtudiant
FROM Etudiant 
WHERE idFormation = (
        SELECT idFormation 
        FROM Formation 
        WHERE idEnseignant = 5975
        )
;


-- Enseignant : afficher la liste des modules existants pour la formation de l'enseignant responsable 8425
SELECT idModule 
FROM Module 
WHERE idFormation = (
        SELECT idFormation 
        FROM Formation 
        WHERE idEnseignant = 8425
        )
;  

-- Secretariat : afficher la liste des etudiants de la formation L3 MIAGE
SELECT idEtudiant 
FROM Etudiant 
WHERE idFormation = (
        SELECT idFormation 
        FROM Formation 
        WHERE parcours = 'MIAGE' 
        AND niveau = '3'
    ) 
;

--Secretariat : afficher la liste des fiches remplies par les etudiants de M2 Informatique parcours IMIS
SELECT * 
FROM FichePedagogique 
WHERE statut = 'remplie' 
AND idEtudiant IN ( 
        SELECT idEtudiant 
        FROM Etudiant 
        WHERE idFormation = ( 
                SELECT idFormation 
                FROM Formation 
                WHERE mention = 'Master informatique' 
                AND parcours = 'IMIS' 
                AND niveau = 5
                )
        )
;   

-- Etudiant : afficher les informations de l'etudiant et de sa fiche
SELECT * FROM etudiant WHERE idEtudiant =  8433 ;
SELECT * FROM FichePedagogique WHERE idEtudiant = 8433 ;


-- Secretaire : afficher les enseignants et leurs modules associés de la formation L3 informatique MIAGE

SELECT * 
FROM AssocEnseignantModule 
WHERE idModule IN ( 
        SELECT idModule 
        FROM Module 
        WHERE idFormation = ( 
                SELECT idFormation 
                FROM Formation 
                WHERE mention = 'Licence informatique' 
                AND parcours = 'MIAGE' 
                AND niveau = 3
                )
        )
;   

--  Secretaire : afficher le nom et le prénom de l'enseignant responsable de la formation L3 informatique MIAGE

SELECT nom, prenom 
FROM Enseignant 
WHERE idEnseignant = ( 
        SELECT idEnseignant 
        FROM Formation 
        WHERE mention = 'Licence informatique' 
        AND parcours = 'MIAGE' 
        AND niveau = 3
        ) 
; 


-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------