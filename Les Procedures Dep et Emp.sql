CREATE TABLE Departement (
    num_dep NUMBER(10) PRIMARY KEY,
    design_d VARCHAR(30)
);

CREATE TABLE Employe (
    Matricule NUMBER(10) PRIMARY KEY,
    Nom VARCHAR(50) ,
    Prenom VARCHAR(50) ,
    Salaire DECIMAL(10, 2) ,
    Num_D NUMBER(10),
    CONSTRAINT fk_num_d FOREIGN KEY (Num_D) REFERENCES Departement(num_dep)
);

CREATE OR REPLACE PROCEDURE Inserer_Departement ( a IN NUMBER, b IN VARCHAR2   ) IS
BEGIN
    INSERT INTO Departement (num_dep, design_d)
    VALUES (a, b);
END;


CREATE OR REPLACE PROCEDURE Nombre_Employes (X IN NUMBER, R OUT NUMBER ) IS
BEGIN
    SELECT COUNT(*)
    INTO R
    FROM Employe
    WHERE Num_D = X;  
END;

CREATE OR REPLACE PROCEDURE Augmenter_Salaire ( Matrcl IN NUMBER, v IN NUMBER, R OUT VARCHAR2)IS
BEGIN
    UPDATE Employe
    SET Salaire = Salaire + v
    WHERE Matricule = Matrcl ;

    IF SQL%ROWCOUNT > 0 THEN
        R := 'Salaire mis à jour avec succès.';
    ELSE
        R := 'Aucun employé trouvé avec ce matricule.';
    END IF;
END;

set serveroutput on;
declare 
nb number;

begin
 updatesalaire(1,5000);
 
end;



