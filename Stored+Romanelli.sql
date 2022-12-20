CREATE DATABASE IF NOT EXISTS cinemapy;

USE cinemapy;

 CREATE TABLE IF NOT EXISTS personas (
	id_persona INT NOT NULL UNIQUE auto_increment PRIMARY KEY,
    nombre VARCHAR(15) NOT NULL, 
    apellido VARCHAR(15) NOT NULL,
    nacionalidad VARCHAR(20) NOT NULL,
    fecha_nac DATE NOT NULL
);

 CREATE TABLE IF NOT EXISTS actores (
	id_actor INT NOT NULL UNIQUE auto_increment PRIMARY KEY,
    id_persona INT NOT NULL, 
	fecha_debut DATE NOT NULL,
    CONSTRAINT FK_Actores_Personas
    FOREIGN KEY (id_persona)
		REFERENCES personas(id_persona)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

 CREATE TABLE IF NOT EXISTS directores (
	id_director INT NOT NULL UNIQUE auto_increment PRIMARY KEY,
    id_persona INT NOT NULL, 
	fecha_debut DATE NOT NULL,
    CONSTRAINT FK_Directores_Personas
    FOREIGN KEY (id_persona)
		REFERENCES personas(id_persona)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

 CREATE TABLE IF NOT EXISTS generos (
	id_genero INT NOT NULL UNIQUE auto_increment PRIMARY KEY,
    nombre_genero VARCHAR(15) NOT NULL
);

CREATE TABLE IF NOT EXISTS	peliculas (
	id_pelicula INT NOT NULL UNIQUE auto_increment PRIMARY KEY,
    título VARCHAR(30) NOT NULL, 
    fecha DATE NOT NULL,
    duracion INT NOT NULL,
    id_genero INT NOT NULL,
    link_video VARCHAR(60),
           
	CONSTRAINT FK_Películas_Generos
	FOREIGN KEY (id_genero)
		REFERENCES generos(id_genero)
        ON DELETE CASCADE
        ON UPDATE CASCADE
 );
 
 CREATE TABLE IF NOT EXISTS	peliculas_actores (
	id_pel_act INT NOT NULL UNIQUE auto_increment PRIMARY KEY,
	id_actor INT NOT NULL,
    id_pelicula INT NOT NULL,
    rol VARCHAR(30),
	CONSTRAINT FK_Películas_Actores
	FOREIGN KEY (id_actor)
		REFERENCES actores(id_actor)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (id_pelicula)
		REFERENCES peliculas(id_pelicula)
        ON DELETE CASCADE
        ON UPDATE CASCADE
	);
    
CREATE TABLE IF NOT EXISTS	peliculas_directores (
	id_pel_dir INT NOT NULL UNIQUE auto_increment PRIMARY KEY,
	id_director INT NOT NULL,
    id_pelicula INT NOT NULL,
    descripcion VARCHAR(30),
	CONSTRAINT FK_Películas_Directores 
	FOREIGN KEY (id_director)
		REFERENCES directores(id_director)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (id_pelicula)
		REFERENCES peliculas(id_pelicula)
        ON DELETE CASCADE
        ON UPDATE CASCADE
	);
    
CREATE TABLE IF NOT EXISTS	usuarios (
	id_user INT NOT NULL UNIQUE auto_increment PRIMARY KEY,
	nombre VARCHAR(15) NOT NULL,
    apellido VARCHAR(15) NOT NULL,
    mail VARCHAR(30) NOT NULL UNIQUE,
    contraseña VARCHAR(8) NOT NULL
);

CREATE TABLE IF NOT EXISTS	calificaciones (
	id_calificacion INT NOT NULL UNIQUE auto_increment PRIMARY KEY,
	id_user INT NOT NULL,
    id_pelicula INT NOT NULL,
    comentario VARCHAR(180) NOT NULL,
    fecha_vista timestamp DEFAULT current_timestamp,
    calificacion INT NOT NULL,
	CONSTRAINT FK_Calificaciones_Peliculas
	FOREIGN KEY (id_pelicula)
		REFERENCES peliculas(id_pelicula)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
        
	CONSTRAINT FK_Calificaciones_Usuarios
	FOREIGN KEY (id_user)
		REFERENCES usuarios(id_user)
        ON DELETE CASCADE
        ON UPDATE CASCADE
	);
    
# INSERT DE DATOS    
    
INSERT INTO generos (id_genero, nombre_genero)
	VALUES (1, "TERROR"),
			(2, "COMEDIA"),
            (3, "ACCION"),
            (4, "SUSPENSO"),
            (5, "INFANTIL"),
            (6, "THRILLER"),
            (7, "FAMILIAR");
            
    
INSERT INTO peliculas (id_pelicula, título, fecha, duracion, id_genero)
	VALUES (1 ,'Titanic', "1997-01-01", 195, 6),
			(2 ,'El hombre de la máscara', "1998-01-01", 132, 3),
			(3 ,'Django desencadenado', "2012-01-01", 165, 3),
			(4 ,'Atrapame si Puedes', "2002-01-01", 141, 4),
			(5 ,'Once Upon a Time', "2019-01-01", 160, 4),
			(6 ,'The Post', "2017-01-01", 115, 6);
            
INSERT INTO personas (id_persona, nombre, apellido, nacionalidad, fecha_nac)
	VALUES (1 ,'Leonardo', 'DiCaprio', 'USA', '1974-11-11'),
(2 ,'Kate ', 'Winslet', 'USA', '1975-10-5'),
(3 ,'James', 'Cameron', 'Canada', '1954-8-16'),
(4 ,'Jamie ', 'Fox', 'USA', '1967-12-13'),
(5 ,'Quentin', 'Tarantino', 'USA', '1963-3-27'),
(6 ,'Steven ', 'Spielberg', 'USA', '1946-12-8'),
(7 ,'Tom', 'Hanks', 'USA', '1956-7-9'),
(8 ,'Randall ', 'Wallace', 'USA', '1950-7-28'),
(9 ,'Brad ', 'Pitt', 'USA', '1963-12-18'),
(10 ,'Meryl', 'Streep', 'USA', '1949-6-22');

INSERT INTO actores (id_actor, fecha_debut, id_persona)
	VALUES (1 ,'1995-01-01', 1),
(2 ,'1995-01-01', 2),
(3 ,'1995-01-01', 4),
(4 ,'1995-01-01', 7),
(5 ,'1995-01-01', 9),
(6 ,'1995-01-01', 10);


INSERT INTO directores (id_director, fecha_debut, id_persona)
	VALUES (1 ,'1995-01-01', 3),
(2 ,'1995-01-01', 5),
(3 ,'1995-01-01', 6),
(4 ,'1995-01-01', 8);

-- Ingreso de Actores que trabajan en peliculas

INSERT INTO peliculas_actores (id_pelicula, id_actor)
	VALUE (1,1),
    (1,2),
    (2,1),
    (3,1),
	(3,3),
    (4,1),
    (4,4),
    (5,1),
    (5,5),
    (6,4),
    (6,6);
    
-- Ingreso de Directores que trabajan en peliculas

INSERT INTO peliculas_directores (id_pelicula, id_director)
	VALUE (1,1),
    (2,4),
    (3,2),
    (4,3),
    (5,2),
    (6,4);
    
# VISTAS

CREATE OR REPLACE VIEW lista_peliculas AS
	( SELECT título, fecha, duracion, g.nombre_genero
		FROM peliculas p 
        JOIN generos g ON p.id_genero = g.id_genero
        ORDER BY título ASC);
    
CREATE OR REPLACE VIEW lista_actores AS
	( SELECT p.nombre, p.apellido, p.nacionalidad, a.fecha_debut
		FROM actores a 
        JOIN personas p ON a.id_persona = p.id_persona
        ORDER BY p.apellido ASC);

CREATE OR REPLACE VIEW lista_directores AS
	( SELECT p.nombre, p.apellido, p.nacionalidad, d.fecha_debut
		FROM directores d 
        JOIN personas p ON d.id_persona = p.id_persona
        ORDER BY p.apellido ASC);
        
# ESTA VISTA SERIA UN LISTADO DE ACTORES, DONDE SALGAN LAS PELICULAS DONDE TRABAJARON
CREATE OR REPLACE VIEW lista_trabajos AS
	( SELECT p.nombre, p.apellido, p.nacionalidad, a.fecha_debut, pel.título
		FROM actores a 
        JOIN personas p ON a.id_persona = p.id_persona
        LEFT JOIN peliculas_actores pa ON a.id_actor = pa.id_actor
        LEFT JOIN peliculas pel ON pel.id_pelicula = pa.id_pelicula
        );
     
CREATE OR REPLACE VIEW lista_peliculas AS
	( SELECT p.título, a.id_actor, pe.nombre, pe.apellido
		FROM peliculas p 
		LEFT JOIN peliculas_actores pa ON pa.id_pelicula = p.id_genero
        LEFT JOIN actores a ON a.id_actor = pa.id_actor
        LEFT JOIN personas pe ON a.id_persona = pe.id_persona
        ORDER BY título ASC);

#FUNCIONES

-- devuelve peliculas con duraccion máxima declarada
DELIMITER //
CREATE FUNCTION pel_duracion (maxdur INT)
RETURNS VARCHAR(300)
NO SQL
BEGIN
	DECLARE peliculas VARCHAR(300);
    SET peliculas = (SELECT pel.título FROM peliculas pel WHERE pel.duracion < maxdur LIMIT 1);
	RETURN peliculas;
END//
DELIMITER ;

# SELECT pel_duracion(150)

-- es un buscador de peliculas ¿como hago para que me permita devolver una lista?
DELIMITER //
CREATE FUNCTION pel_actor (peli VARCHAR(300))
RETURNS VARCHAR(300)
NO SQL
BEGIN
	DECLARE peliculas VARCHAR(300);
    SET peliculas = (SELECT pel.título FROM peliculas pel WHERE pel.título LIKE peli LIMIT 1);
	RETURN peliculas;
END//
DELIMITER ;

#SELECT pel_actor("%ti%")

#STORED PROCEDURE

DELIMITER // 
#con este SP se modifica el comentario de un registro de la tabla calificaciones
CREATE PROCEDURE `sp_modifica_comentario` (IN id INT, IN n_comentario VARCHAR(180))
BEGIN
	UPDATE calificaciones
	SET comentario = n_comentario
	WHERE id_calificacion = id;
END//
DELIMITER ;

/* #PRUEBA DE UPADATE
UPDATE calificaciones
SET comentario = "la mejor de la historia"
WHERE id_calificacion = 1;
*/

DELIMITER $$
CREATE PROCEDURE `sp_orden` (IN criterio VARCHAR(30), IN orden BOOLEAN)
BEGIN
# Verdadero para mayor a menor, y falso de menor a mayor
	IF orden = 1 THEN
		SET @ordenar = 'asc';
	ELSE
		SET @ordenar = 'desc'; 
		END IF;
	SET @clausula = CONCAT('SELECT * FROM peliculas ORDER BY',' ',criterio,' ',@ordenar);

PREPARE runSQL FROM @clausula;
EXECUTE runSQL;
DEALLOCATE PREPARE runSQL;

END $$


CALL sp_modifica_comentario (2,"ME ENCANTO")
CALL sp_orden ("Título",0)
