# Group By

El `GROUP BY` nos sirve para agrupar los resultados de las funciones de agregacion

Tabla utilizada [users](../db/04/user-table.sql)

## Ejemplo 1

Queremos saber el total de usuarios que tienen 4 seguidores y cuantos tienen 4999, para eso hacemos:

```sql
select
    count(*)
from
    users
where
    followers = 4
    or followers = 4999;
```

Resultado:

| count |
| :---- |
| 12    |

El resultado es `12`, pero ahora necesitamos saber cuantos corresponden a 4 seguidores y cuantos a 4999, es aqui que debemos usar `GROUP BY` de la siguiente manera:

```sql
select
    count(*),
    followers
from
    users
where
    followers = 4
    or followers = 4999
group by followers;
```

Donde el resultado es:

| count | followers |
| :---- | :-------- |
| 7     | 4         |
| 5     | 4999      |

## Ejemplo 2

`GROUP BY` con otras funciones

Se nos pide que de la tabla `users` tengamos el dominio de la columna `email` y ademas todos los que tengan mas de un usuario:

```sql
SELECT
    count(*) as total,
    substring(email, position('@' in email) + 1) as domain
FROM
    users
GROUP BY
    substring(email, position('@' in email) + 1)
HAVING
    count(*) > 1
ORDER BY
    count(*) desc
```

Donde el resultado es:

| total | domain       |
| :---- | :----------- |
| 5     | ahrer.iq     |
| 5     | google.com   |
| 4     | sawdadmuh.ga |

[Volver README](../README.md)
