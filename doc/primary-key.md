# Primary Key

Es el identificador unico de una tabla, no pueden haber duplicados.

Tabla usada [country](../db/05/1-country.sql)

Tabla usada [countrylanguage](../db/05/3-countrylanguage.sqll)

Para agregar mediante codigo se debe hacer de la siguiente manera:

```sql
alter table
    country
add
    PRIMARY KEY (code);
```

De esta manera la columna `code` contendra las primary key

Tambien podemos generar `Primary Key` en base a dos columnas:

```sql
alter table
    countrylanguage
add
    primary key (countrycode, language);
```

Esto quiere decir que sera unica la combinacion de `countrycode` y `language`

[Volver inicio](../README.md)
