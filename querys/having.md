# Having

La cláusula `HAVING` en Access especifica qué registros agrupados se muestran en una instrucción `SELECT` con una cláusula `GROUP BY`. Después de que `GROUP BY` combine los registros, `HAVING` muestra cualquier registro agrupado por la cláusula `GROUP BY` que satisfaga las condiciones de la cláusula `HAVING`.

Tabla utilizada [users](../db/04/user-table.sql)

## Ejemplo

En nuestra base de datos tenemos usuarios de diferentes paises y queremos que nos muestre, los paises que contengan mas de 6 usuarios:

```sql
select
    count(*) as total,
    country
from
    users
group by
    country
having
    count(*) > 5
order by
    count(*) desc;
```

Resultado:

| total | country             |
| :---- | :------------------ |
| 9     | Anguilla            |
| 9     | Chad                |
| 8     | Suriname            |
| 8     | Hong Kong SAR China |
| 8     | Luxembourg          |
| 8     | Serbia              |
| 7     | Kiribati            |
| 7     | Côte d-Ivoire       |
| 7     | Micronesia          |
| 7     | Kosovo              |
| 6     | Falkland Islands    |
| 6     | Latvia              |
| 6     | Greenland           |

[Volver README](../README.md)
