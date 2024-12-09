-- Table Programme
CREATE TABLE Programme (
    ID_Programme NUMBER  PRIMARY KEY,
    Nom_Programme VARCHAR2(30) NOT NULL,
    Description VARCHAR2(30) NOT NULL,
    Durée VARCHAR2(30) NOT NULL,
    Type VARCHAR2(30) NOT NULL,
    Date_Diffusion DATE NOT NULL,
    Heure_Diffusion TIMESTAMP NOT NULL,
    ID_Studio NUMBER NOT NULL,
    ID_Département NUMBER NOT NULL,
    CONSTRAINT FK_Programme_Studio FOREIGN KEY (ID_Studio) REFERENCES Studio (ID_Studio),
    CONSTRAINT FK_Programme_Departement FOREIGN KEY (ID_Département) REFERENCES Département (ID_Département)
);

-- Table Publicité
CREATE TABLE Publicité (
    ID_Publicité NUMBER PRIMARY KEY,
    ID_Programme NUMBER NOT NULL,
    Nom_Publicité VARCHAR2(25) NOT NULL,
    Client VARCHAR2(25) NOT NULL,
    Durée VARCHAR2(25) NOT NULL,
    Tarif NUMBER,
    CONSTRAINT FK_Publicité_Programme FOREIGN KEY (ID_Programme) REFERENCES Programme (ID_Programme)
);

-- Table Animateur
CREATE TABLE Animateur (
    ID_Animateur NUMBER PRIMARY KEY,
    ID_Programme NUMBER NOT NULL,
    Nom_Animateur VARCHAR2(25) NOT NULL,
    Prénom_Animateur VARCHAR2(25),
    Poste VARCHAR2(25),
    Salaire NUMBER,
    CONSTRAINT FK_Animateur_Programme FOREIGN KEY (ID_Programme) REFERENCES Programme (ID_Programme)
);

-- Table Studio
CREATE TABLE Studio (
    ID_Studio NUMBER PRIMARY KEY,
    Nom_Studio VARCHAR2(25) NOT NULL,
    Capacité NUMBER NOT NULL,
    Localisation VARCHAR2(25) NOT NULL
);

-- Table Équipement
CREATE TABLE Équipement (
    ID_Équipement NUMBER PRIMARY KEY,
    ID_Studio NUMBER NOT NULL,
    Nom_Équipement VARCHAR2(25) NOT NULL,
    Type VARCHAR2(25) NOT NULL,
    État VARCHAR2(25) NOT NULL,
    CONSTRAINT FK_Équipement_Studio FOREIGN KEY (ID_Studio) REFERENCES Studio (ID_Studio)
);

-- Table Employé
CREATE TABLE Employé (
    ID_Employé NUMBER PRIMARY KEY,
    ID_Département NUMBER NOT NULL,
    Nom_Employé VARCHAR2(25) NOT NULL,
    Prénom_Employé VARCHAR2(25) NOT NULL,
    Poste VARCHAR2(25) NOT NULL,
    Salaire NUMBER NOT NULL,
    Date_Embauche DATE NOT NULL,
    CONSTRAINT FK_Employé_Departement FOREIGN KEY (ID_Département) REFERENCES Département (ID_Département)
);

-- Table Département
CREATE TABLE Département (
    ID_Département NUMBER PRIMARY KEY,
    Nom_Département VARCHAR2(25) NOT NULL,
    Responsable VARCHAR2(25)
);

-- Table Audience
CREATE TABLE Audience (
    ID_Audience NUMBER PRIMARY KEY,
    ID_Programme NUMBER NOT NULL,
    Date DATE NOT NULL,
    Nombre_Vues NUMBER NOT NULL,
    Tranche_Age VARCHAR2(25) NOT NULL,
    CONSTRAINT FK_Audience_Programme FOREIGN KEY (ID_Programme) REFERENCES Programme (ID_Programme)
);

