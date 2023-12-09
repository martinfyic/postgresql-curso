# Check

Nos sirve para generar constrains en la tabla y evitar basura

Tabla usada [country](../db/05/1-country.sql)

## Ejemplo 1:

Generar un `CHECK` en la tabla `country` de la columna `surfacearea` donde solo acepte numeros positivos o cero

```sql
alter table country add check (
	surfacearea >= 0
);
```

De esta manera no se podran ingresar datos negativos a la base de datos en la tabla `country` columna `surfacearea`

## Ejemplo 2

Generar una restriccion en la tabla `country` de la columna `continent` para que solo se puedan ingresar los siguientes strings:

- South America
- North America
- Central America
- Oceania
- Antarctica
- Africa
- Europe

```sql
alter table
    country
add
    check (
        (continent = 'Asia')
        or (continent = 'South America')
        or (continent = 'North America')
        or (continent = 'Central America')
        or (continent = 'Oceania')
        or (continent = 'Antarctica')
        or (continent = 'Africa')
        or (continent = 'Europe')
    )
```

Esto nos permite tener un control en la base de datos para ingresar solamente la informacion que necesitamos

Si queremos actualizar el `CONSTRAINT` primero debemos eliminarlo

```sql
alter table
    country DROP CONSTRAINT "country_continent_check";
```

Y luego volver a ejecutar el `CHECK` con la nueva informacion

## Ejemplo 3

Tambien podemos usar los constrains cuando creamos una tabla directamente

```sql
CREATE TABLE IF NOT EXISTS country
(
    code character(3) COLLATE pg_catalog."default" NOT NULL,
    name text COLLATE pg_catalog."default" NOT NULL,
    continent text COLLATE pg_catalog."default" NOT NULL,
    region text COLLATE pg_catalog."default" NOT NULL,
    surfacearea real NOT NULL,
    indepyear smallint,
    population integer NOT NULL,
    lifeexpectancy real,
    gnp numeric(10,2),
    gnpold numeric(10,2),
    localname text COLLATE pg_catalog."default" NOT NULL,
    governmentform text COLLATE pg_catalog."default" NOT NULL,
    headofstate text COLLATE pg_catalog."default",
    capital integer,
    code2 character(2) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT country_pkey PRIMARY KEY (code),
    CONSTRAINT country_surfacearea_check CHECK (surfacearea >= 0::double precision),
    CONSTRAINT country_continent_check CHECK (continent = 'Asia'::text OR continent = 'South America'::text OR continent = 'North America'::text OR continent = 'Central America'::text OR continent = 'Oceania'::text OR continent = 'Antarctica'::text OR continent = 'Africa'::text OR continent = 'Europe'::text)
)
```

[Volver al inicio](../README.md)
