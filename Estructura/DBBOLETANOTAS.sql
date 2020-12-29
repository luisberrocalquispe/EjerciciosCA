-- Crear base de datos dbBOLETANOTAS
CREATE DATABASE dbBOLETANOTA
DEFAULT CHARACTER SET utf8;

-- Eliminar base de datos
DROP DATABASE dbBOLETANOTA;

-- Poner en uso dbboletanotas
USE dbboletanotas;

-- Ver cual es la base de datos en uso
SELECT DATABASE();

-- Crear tabla FACULTAD
CREATE TABLE FACULTAD
(
    CODFAC CHAR(3),
    NOMFAC VARCHAR(60),
    CONSTRAINT CODFAC_PK PRIMARY KEY(CODFAC)
);

-- Listar las tablas de una base de datos
SHOW TABLES;

-- Listar columnas de una tabla;
DESCRIBE FACULTAD;
SHOW COLUMNS IN FACULTAD;

-- Agregar una columna para la descripcion de la FACULTAD
ALTER TABLE FACULTAD
ADD DESCFAC VARCHAR(70);

-- Eliminar la columna DESCFAC de la tabla FACULTAD
ALTER TABLE FACULTAD
DROP COLUMN DESCFAC;

-- Modificar el tipo de dato y/o tamaño respectivo
ALTER TABLE FACULTAD
CHANGE NOMFAC FACNOM VARCHAR(40);

ALTER TABLE FACULTAD
CHANGE FACNOM NOMFAC VARCHAR(70);

-- Cambiar de nombre de tabla FACULTAD por MIFACULTAD
ALTER TABLE FACULTAD
RENAME MIFACULTAD;

ALTER TABLE MIFACULTAD
RENAME FACULTAD

-- Insertar un registro en la tabla FACULTAD
INSERT INTO FACULTAD
    (CODFAC, NOMFAC)
VALUES
    ("F01", "Producción Agraria");

-- Listar registros de la tabla FACULTAD
SELECT * 
FROM FACULTAD;

-- Insertar dos registros en la tabla FACULTAD
INSERT INTO FACULTAD
    (CODFAC, NOMFAC)
VALUES
    ("F02", "Análisis de Sistemas"),
    ("F03", "Administración de Empresas");

-- Listar registros de la tabla FACULTAD
SELECT * 
FROM FACULTAD;

-- Listar los códigos de las facultades
SELECT CODFAC
FROM FACULTAD;


-- Listar los nombres de las facultades
SELECT NOMFAC
FROM FACULTAD;

-- Cambiar Produccion Agraria por Produccion Agropecuario
UPDATE FACULTAD 
    SET 
    NOMFAC = "Produccion Agropecuaria"
    WHERE 
    CODFAC = "F01";
    
SELECT * FROM FACULTAD;

-- Eliminar la facultad Administración de Empresas
DELETE FROM FACULTAD
WHERE NOMFAC - "Administración de Empresas";

SELECT * FROM FACULTAD;

-- Eliminar todos los registros de la tabla FACULTAD
DELETE FROM FACULTAD;

SELECT * FROM FACULTAD;

-- Crear la tabla ESTUDIANTE
CREATE TABLE ESTUDIANTE;
(
    CODEST CHAR(3),
    NOMEST VARCHAR(50),
    APEEST VARCHAR(80),
    FACTEST CHAR(3),
    CONSTRAINT CODEST_PK PRIMARY KEY (CODEST)
);   

SHOW TABLES;

-- Relacionar  la tabla ESTUDIANTE - FACULTAD
ALTER TABLE ESTUDIANTE
ADD CONSTRAINT FACULTAD_ESTUDIANTE_CODFAC
FOREIGN KEY (FACTEST) REFERENCES FACULTAD (CODFAC);

-- Listar relaciones entre tablas
SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE table_schema="dbBoletaNota" 
    AND constraint_type="FOREIGN KEY";

-- Insertar registros en la tabla ESTUDIANTE
INSERT INTO ESTUDIANTE
    (CODEST, NOMEST, APEPEST, FACTEST)
VALUES
	 ("E01", "Jesús", "Canales", "F01"),
    ("E02", "Pablo", "Campos", "F01"),
    ("E03", "María", "Solano", "F02");

SELECT * FROM ESTUDIANTE;
SELECT * FROM FACULTAD;

-- Insertar registro con una FK que no está registrada
INSERT INTO ESTUDIANTE
    (CODEST, NOMEST, APEPEST, FACTEST)
VALUES
    ("E04", "Lourdes", "Guerra", "F05");