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
    id_actor INT NOT NULL,
    id_director INT NOT NULL, 
    fecha timestamp NOT NULL DEFAULT current_timestamp,
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
    calificacion INT(1) NOT NULL,
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
