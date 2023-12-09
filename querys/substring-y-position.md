# Substring y Position

**Substring:** sirve para dividir el string en partes

**Position:** nos indica la posicion de lo que estamos buscando

Tabla utilizada [users](../db/04/user-table.sql)

## Ejemplo

Seleccionamos todo de la base de datos tabla `users` para ver que nos trae.

```sql
SELECT * FROM users;
```

| id  | name            |
| :-- | :-------------- |
| 1   | Clyde Frazier   |
| 2   | Elnora Allison  |
| 3   | Lydia Manning   |
| 4   | Patrick Elliott |
| 5   | Kenneth Goodwin |

Vemos que en la columna `name` se guardo el nombre completo, por lo que ahora vamos a generar dos columnas `first_name` y `last_name`, esto no modifica la DB ya que solo lo mostraremos.

```sql
select
    name,
    position(' ' in name),
    substring(name, 0, (position(' ' in name))) as first_name,
    substring(name, (position(' ' in name) + 1)) as last_name
from
    users;
```

El resultado es el siguiente:

| id  | name            | position | first_name | last_name |
| :-- | :-------------- | :------- | :--------- | :-------- |
| 1   | Clyde Frazier   | 6        | Clyde      | Frazier   |
| 2   | Elnora Allison  | 7        | Elnora     | Allison   |
| 3   | Lydia Manning   | 6        | Lydia      | Manning   |
| 4   | Patrick Elliott | 8        | Patrick    | Elliott   |
| 5   | Kenneth Goodwin | 8        | Kenneth    | Goodwin   |

Ahora podermos generar las columnas en DB `first_name` y `last_name` para completar la info.

Procedemos a actualizar la base de datos una vez generadas las columnas:

```sql
update
    users
SET
    first_name = substring(name, 0, (position(' ' in name))),
    last_name = substring(name, (position(' ' in name) + 1))
```

Si hacemos nuevamente un `SELECT ALL`

```sql
SELECT * FROM users;
```

El resultado es:

| id  | name            | first_name | last_name |
| :-- | :-------------- | :--------- | :-------- |
| 1   | Clyde Frazier   | Clyde      | Frazier   |
| 2   | Elnora Allison  | Elnora     | Allison   |
| 3   | Lydia Manning   | Lydia      | Manning   |
| 4   | Patrick Elliott | Patrick    | Elliott   |
| 5   | Kenneth Goodwin | Kenneth    | Goodwin   |

La base de datos fue modificada correcramente

## Conclucion

Antes de cualquier modificacion en base de datos, probar con un select y generar la info correspondiente, una vez que estemos seguros procedemos con el `UPDATE`.

[Volver README](../README.md)
