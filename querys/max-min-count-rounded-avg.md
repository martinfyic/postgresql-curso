# Max, Min, Count, Rounded y Avg

Son funciones de agregacion

Tabla utilizada [users](../db/04/user-table.sql)

## Ejemplos

- Si queremos el registro de una tabla en base de datos:

  ```sql
  select
      count(*) as total_users,
  from
      users;
  ```

  Esto nos indica la cantidad de lineas de la tabla

- Minimo y Maximo

  ```sql
  select
    min(followers) as min_followers,
    max(followers) as max_followers
  from
    users;
  ```

- Promedio

  ```sql
  select
    avg(followers) as avg_followers,
    round(avg(followers)) as avg_followers_rounded,
    sum(followers) / count(*) as avg_followers_manual
  from
    users;
  ```

  Hay tres formas de hacerlo, lo mas recomendado o exacto es usar `AVG`, luego podemos redondearlo con `ROUND` si lo necesitamos.

  Adicional a esto podemos realizar el calculo manualmente.

  [Volver README](../README.md)
