[Volver al inicio](../../README.md)

```sql
select
	a.name as country,
	b.name as continent
from
	country a
inner join continent b on
	a.continent = b.code
order by
	a.name asc;
```

```sql
select
	count(*),
	b.name
from
	country a
inner join continent b on a.continent = b.code
group by
	b.name
order by
	count(*) asc
```
