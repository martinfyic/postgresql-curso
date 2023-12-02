<h1 align="center"><strong>Curso de Bases de datos con PostgreSQL 🐘</strong></h1>

<p align="center">
  <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpfaTsKJk0YBH5qQr5bidb8wERTNwOr-jW_3JsEvCjktSav3eyBJGaNzzIKrdBE3DSeC4&usqp=CAU" />
</p>

Para correr la imagen:

```bash
docker compose up -d
```

## Ejemplo querys

```sql
create table users (name VARCHAR(10) UNIQUE);

-- insertar de a uno
INSERT INTO users (name) values ('Bruce');

-- insertar multipes
INSERT INTO users (name) values ('Robnaldo'), ('Figo'), ('Loki');

-- actualizar
UPDATE users SET name='Ronaldo' WHERE name='Robnaldo';

-- seleccionar
SELECT * FROM users;

-- seleccionar con **limite**
SELECT * FROM users LIMIT 3;

-- seleccionar con paginacion ejemplo
SELECT * FROM users LIMIT 3 OFFSET 3;

-- clausula WHERE
SELECT * FROM users WHERE name='Bruce';
SELECT * FROM users WHERE name LIKE 'J%'; --nombre que empiece con J
SELECT * FROM users WHERE name LIKE '%a%'; --nombre que contengan a

-- eliminar registros
DELETE FROM users WHERE name='Martin'; --elimino un registro
DELETE FROM users WHERE name LIKE '%a%'; -- elimino los registros que contengan a
DELETE FROM users; -- CUIDADO elimina todos los registros

-- eliminar tabla
DROP TABLE users;

-- borrar datos de una tabla
TRUNCATE TABLE users; -- elimina los datos pero la tabla se mantiene
```
