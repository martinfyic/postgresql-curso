<h1 align="center"><strong>Curso de Bases de datos con PostgreSQL 🐘</strong></h1>

<p align="center">
  <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpfaTsKJk0YBH5qQr5bidb8wERTNwOr-jW_3JsEvCjktSav3eyBJGaNzzIKrdBE3DSeC4&usqp=CAU" />
</p>

Para correr la imagen:

```bash
docker compose up -d
```

## Querys

- [**Comandos basicos**](./querys/comandos-basicos.md)
- [**SUBSTRING & POSITION**](./querys/substring-y-position.md)
- [**BETWEEN**](./querys/operador-between.md)
- [**COUNT, MAX, MIN, AVG, ROUND**](./querys/max-min-count-rounded-avg.md)
- [**GROUP BY**](./querys/group-by.md)
- [**HAVING**](./querys/having.md)
- [**INNER JOIN**](./doc/joins/inner-join.md)
- [**UNION**]()

## Terminologia

- **`DDL`**: Data Definition Language

  Create, Alter, Drop, Truncate.

- **`DML`**: Data Manipulation Language

  Insert, Delete, Update.

- **`TCL`**: Transaction Control Language

  Commit, Rollback.

- **`DQL`**: Data Query Language

  Select.

## Agregate functions

- Count
- Sum
- Max
- Min
- Group By
- Having
- Order By

## Filtrando Data

- Like
- In
- Is Null
- Is Not Null
- Where
- And
- Or
- Between

## Constrains

La cláusula `CONSTRAINT` se usa en las instrucciones `ALTER TABLE` y `CREATE TABLE` para crear o eliminar restricciones. Hay dos tipos de cláusulas `CONSTRAINT`: uno para crear una restricción en un único campo y otro para crear una restricción en varios campos.

### Primary Key

La restricción PRIMARY KEY en SQL identifica de forma única cada registro en una tabla. Las claves primarias deben contener valores únicos y no pueden contener valores NULL . Una tabla solo puede tener una clave principal, que puede consistir en campos simples o múltiples.

Ejemplo en codigo [Primary Key](./doc/primary-key.md)

### Check

La restricción `CHECK` en SQL se usa para limitar el rango de valores que se puede colocar en una columna, por ejemplo, Si define una restricción `CHECK` en una sola columna, solo se permiten ciertos valores para esta columna. De esta manera se pueden evitar errores al no introducir valores erróneos.

Ejemplo en codigo [Check](./doc/check.md)

### Index - Indices

Un índice es una estructura de disco asociada con una tabla o una vista que acelera la recuperación de filas de la tabla o de la vista. Un índice contiene claves generadas a partir de una o varias columnas de la tabla o la vista. Dichas claves están almacenadas en una estructura (árbol b) que permite que SQL Server busque de forma rápida y eficiente la fila o filas asociadas a los valores de cada clave.

Ejemplo en codigo [Index](./doc/index-indices.md)

### Foreign Kys

La clave foránea identifica una columna o grupo de columnas en una tabla (tabla hija o referendo) que se refiere a una columna o grupo de columnas en otra tabla (tabla maestra o referenciada). Las columnas en la tabla referendo deben ser la clave primaria u otra clave candidata en la tabla referenciada.

Ejemplo:

```sql
alter table city
	add constraint fk_country_code
	foreign key ( countrycode )
	references country( code );
```

### Eliminacion en cascada

Cuando creamos una clave foránea utilizando esta opción, elimina las filas de referencia en la tabla secundaria cuando la fila referenciada se elimina en la tabla primaria que tiene una clave primaria.

Es decir que si eliminamos un dato que tenga relaciones con otras tablas, elimina ese dato mas todos los demas datos relacionados en las demas tablas.

## JOINS

Un join es una operación que combina dos filas juntas en una fila. Estas filas usualmente pertenecen a dos tablas diferentes —pero no necesariamente tiene que ser así.

### INNER JOIN

Devuelve solo filas que coinciden en ambas tablas. Lo que significa que si tiene un producto sin ID de categoría, o con un ID de categoría que no está presente en la tabla Categorías, ese registro no se devolverá en el resultado.
