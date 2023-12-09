select * from users;
-- 1. Cuantos usuarios tenemos con cuentas @google.com
-- Tip: count, like

-- Opcion 1
select
    count(*) as usuarios,
    substring(email, position('@' in email)) as domain
from
    users
group by
    substring(email, position('@' in email))
having substring(email, position('@' in email)) like '@google.com'
order by count(*) desc;

-- Opcion 2
select
    count(*)
from
    users
where
    email like '%@google.com';
    
---------------------------------------------------------------
-- 2. De qué países son los usuarios con cuentas de @google.com
-- Tip: distinct

-- Opcion 1
select
    DISTINCT country,
    substring(email, position('@' in email)) as domain
from
    users
group by
    country, substring(email, position('@' in email))
having substring(email, position('@' in email)) like '@google.com';

-- Opcion 2
select
    DISTINCT country
from
    users
where
    email like '%@google.com';
    
---------------------------------------------
-- 3. Cuantos usuarios hay por país (country)
-- Tip: Group by

select
    count(*) as total,
    country
from
    users
group by
    country
order by
    count(*) desc;
    
--------------------------------------------------------------------
-- 4. Listado de direcciones IP de todos los usuarios de Iceland
-- Campos requeridos first_name, last_name, country, last_connection

SELECT
	first_name,
	last_name,
	country,
	last_connection
FROM
	users
WHERE
	country = 'Iceland';

------------------------------------------------------------------
-- 5. Cuantos de esos usuarios (query anterior) tiene dirección IP
-- que incia en 112.XXX.XXX.XXX

SELECT
	count(*)
FROM
	users
WHERE
	country = 'Iceland' AND last_connection LIKE '112.%';

-----------------------------------------------------------
-- 6. Listado de usuarios de Iceland, tienen dirección IP
-- que inicia en 112 ó 28 ó 188
-- Tip: Agrupar condiciones entre paréntesis 

SELECT
    first_name,
    last_name,
    country,
    last_connection
FROM
    users
WHERE
    country = 'Iceland'
    AND (
        last_connection LIKE '112.%'
        OR last_connection LIKE '28.%'
        OR last_connection LIKE '188.%'
    );

-----------------------------------------------------------------------
-- 7. Ordene el resultado anterior, por apellido (last_name) ascendente
-- y luego el first_name ascendentemente también

SELECT
first_name,
last_name,
country,
last_connection
FROM
    users
WHERE
    country = 'Iceland'
    AND (
        last_connection LIKE '112.%'
        OR last_connection LIKE '28.%'
        OR last_connection LIKE '188.%'
    )
ORDER BY
    last_name asc,
    first_name asc;

--------------------------------------------------------------------------
-- 8. Listado de personas cuyo país está en este listado
-- ('Mexico', 'Honduras', 'Costa Rica')
-- Ordenar los resultados de por País asc, Primer nombre asc, apellido asc
-- Tip: Investigar IN
-- Tip2: Ver Operadores de Comparación en la hoja de atajos (primera página)

SELECT
    country,
    first_name,
    last_name
FROM
    users
WHERE
    country in ('Mexico', 'Honduras', 'Costa Rica')
ORDER BY
    country asc,
    first_name asc,
    last_name asc;

------------------------------------------------------------------
-- 9. Del query anterior, cuente cuántas personas hay por país
-- Ordene los resultados por País asc

SELECT
	count(*),
	country
FROM
	users
WHERE
	country in ('Mexico', 'Honduras', 'Costa Rica')
GROUP BY
	country
ORDER BY country asc;
