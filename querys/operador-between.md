# Between

El operador Between nos permite mostrar informacion dentro de un rango

Tabla utilizada [users](../db/04/user-table.sql)

## Ejemplo

Buscar todos los usuarios comprendidos entre mayotes a 4600 folowers y menos de 4700.

Sin operador `BETWEEN`:

```sql
SELECT
    first_name as nombre,
    last_name as apellido,
    followers as seguidores
FROM
    users
WHERE
    followers > 4600 AND followers < 4700
ORDER BY
	followers ASC;
```

Con operador `BETWEEN`

```sql
SELECT
    first_name as nombre,
    last_name as apellido,
    followers as seguidores
FROM
    users
WHERE
    followers BETWEEN 4601 AND 4699
ORDER BY
	followers ASC;
```

Tener en cuenta que el operador `BETWEEN` no contempla `<=` o `>=`

[Volver README](../README.md)
