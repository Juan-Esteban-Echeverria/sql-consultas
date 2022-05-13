
-- 1 Crear una base de datos llamada películas.
CREATE DATABASE peliculas
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;
-------------------------------------------------------------------------------------------------------------------------


-- 2 Cargar ambos archivos a su tabla correspondiente.
CREATE TABLE public.peliculas(
    id integer,
    pelicula character varying(100),
    anio_estreno integer,
    director character varying(100),
    PRIMARY KEY (id));
ALTER TABLE IF EXISTS public.peliculas
OWNER to postgres;

CREATE TABLE public.reparto(
    id integer,
    nombre character varying(100),
    CONSTRAINT id FOREIGN KEY (id)
    REFERENCES public.peliculas (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID);
ALTER TABLE IF EXISTS public.reparto
OWNER to postgres;

COPY peliculas FROM 'C:\Program Files\PostgreSQL\ApoyoDesafío-Top100\peliculas.csv' csv header;

COPY reparto FROM 'C:\Program Files\PostgreSQL\ApoyoDesafío-Top100\reparto.csv' csv header;
-------------------------------------------------------------------------------------------------------------------------


-- 3 Obtener el ID de la película “Titanic”. 
SELECT
id as id_pelicula
FROM peliculas where pelicula='Titanic';
-------------------------------------------------------------------------------------------------------------------------


-- 4 Listar a todos los actores que aparecen en la película "Titanic". 
SELECT
nombre as nombre
FROM reparto where id='2';
-------------------------------------------------------------------------------------------------------------------------


-- 5 Consultar en cuántas películas del top 100 participa Harrison Ford.
SELECT COUNT (id) AS total
FROM reparto
WHERE nombre='Harrison Ford';
-------------------------------------------------------------------------------------------------------------------------


-- 6 Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
SELECT 
pelicula as pelicula,
anio_estreno as anio_estreno
FROM peliculas
WHERE anio_estreno BETWEEN 1990 AND 1999
ORDER BY anio_estreno ASC;
-------------------------------------------------------------------------------------------------------------------------


-- 7 Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”. 
SELECT pelicula,LENGTH(pelicula)
AS longitud_titulo
FROM peliculas;
-------------------------------------------------------------------------------------------------------------------------


-- 8 Consultar cual es la longitud más grande entre todos los títulos de las películas.
select pelicula,
length(pelicula)
from peliculas
where length(pelicula) = (select max(length(pelicula)) from peliculas);
-------------------------------------------------------------------------------------------------------------------------
