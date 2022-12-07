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

/*

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
    
INSERT INTO peliculas_directores (id_pel_dir, id_pelicula, id_director)
	VALUE (11,1,1),
    (24,2,4),
    (32,3,2),
    (43,4,3),
    (52,5,2),
    (64,6,4);
    
    */
    