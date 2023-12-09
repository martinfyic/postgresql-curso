# Index

Se emplea un índice SQL para poder recuperar datos de una base de datos de una manera más rápida. El indexar una tabla o la vista es sin lugar a dudas, una de las mejores opciones de poder mejorar el rendimiento de las consultas y aplicaciones.

Un índice SQL es una tabla de búsqueda rápida para poder encontrar los registros que los usuarios necesitan buscar con mayor frecuencia. Ya que un índice es pequeño, rápido y optimizado para búsquedas rápidas. Además, que son muy útiles para conectar las tablas relacionales y la búsqueda de tablas grandes.

Tabla usada [country](../db/05/1-country.sql)

**Un ejemplo para crear indices**:

```sql
create UNIQUE index "unique_country_name" on country (
	name
);
```

Donde el indice se genera unico, tal como una llave primaria, no vamos a tener 2 paises con el mismo nombre.

**Otro ejemplo**:

```sql
create index "country_continent" on country (
	continent
);
```

En este caso no es unico, ya que podemos tener mas de un pais en un continente.

> _[!IMPORTANT]_
> Los indices ocupan espacio en la base de datos

Se debe crear un indice para las columnas de las tablas que sabemos que van a ser altamente transaccionales, es decir que se van a consultar mucho.

[Volver](../README.md)
