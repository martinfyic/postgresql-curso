[Volver al inicio](../README.md)

# UNION

En este ejemplo vemos dos query separadas por '()', en la primer parte realiza el recuento de todos los registros que están en la tabla country y ademas en la tabla continent.
La segunda quey busca todos los registros que están en country pero que no estén en continent, la cual indicamos con el 0 en el select.

De esta forma mediante el **UNION** unimos ambas queries

```sql
(
select
	count(*) as total,
	b.name
from
	country a
inner join continent b on
	a.continent = b.code
group by
	b.name)
union
(
select
	0 as total,
	b.name
from
	country a
right join continent b on
a.continent = b.code
where
a.continent is null
group by
	b.name)
order by
	total asc
```

### OUTPUT

| total | name            |
| ----- | --------------- |
| 0     | North Asia      |
| 2     | Central America |
| 5     | Antarctica      |
| 14    | South America   |
| 28    | Oceania         |
| 35    | North America   |
| 46    | Europe          |
| 51    | Asia            |
| 58    | Africa          |

Vemos como North Asia no tiene registros en la tabla **country**
