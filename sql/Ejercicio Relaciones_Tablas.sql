
-- Ejercicio  1: Encuentra el nombre de las pistas y los títulos de los álbumes a los que pertenecen.
select t."Name" as "Nombre_Pista", ar."Name" as "Nombre_Artista"
from  "Track" t
join "Album" a  on t."AlbumId" = a."AlbumId" 
join  "Artist"ar on a."ArtistId" = ar."ArtistId" 
order by ar."Name", t."Name" ;

-- Ejercicio 2: Lista los nombres de los artistas y los títulos de sus álbumes. Ordena los resultados por artista.
select ar."Name" as Nombre_Artista, a."Title" as Titulo_Album
from "Artist" ar
join "Album" a on ar."ArtistId" = a."ArtistId" 
order by ar."Name" , a."Title" ;

-- Ejercicio 3: Encuentra los nombres de los clientes y los totales de sus facturas. Extrae solo los 5 clientes con mayor total. 
select c."FirstName" as "Nombre_Cliente", sum(i."Total") as "Total_Facturas"
from "Customer" c 
join "Invoice"i on c."CustomerId" = i."CustomerId" 
group by c."CustomerId" , c."FirstName"
order  by "Total_Facturas" desc 
limit 5 ;

-- Ejercicio 4: Lista los nombres de los empleados y los nombres de los clientes que les han sido asignados.
select e."FirstName" as "Nombre_empleado",c."FirstName" as "Nombre_cliente"
from "Employee" e 
join "Customer" c ON e."EmployeeId" = c."SupportRepId" 
order by "Nombre_empleado", "Nombre_cliente" ;

-- Ejercicio 5: Muestra los ID de las facturas y los nombres de las pistas incluidas en esas facturas.
select i."InvoiceId" as "Id_Factura", t."Name" as "Nombre_pista"
from "Invoice" i 
join "InvoiceLine" il on i."InvoiceId" = il."InvoiceId" 
join "Track" t on il."TrackId" = t."TrackId" 
order by i."InvoiceId", t."Name" ;

-- Ejercicio 6: Encuentra los nombres de los artistas y los géneros de sus pistas.
select ar."Name" as "Nombre_artista", g."Name" as "Nombre_genero"
from "Artist" ar 
join "Album" a on ar."ArtistId" = a."ArtistId" 
join "Track" t on a."AlbumId" = t."AlbumId" 
join "Genre" g on t."GenreId" = g."GenreId"
group by ar."Name", g."Name" 
order by ar."Name" ,g."Name" ;

--  Ejercicio 7: Muestra los nombres de las pistas y el tipo de medio en el que están disponibles.
select t."Name" as "Nombre_pista" , t."MediaTypeId" as "Tipo_medio" 
from "Track" t 
join "MediaType" mt on t."MediaTypeId" = mt."MediaTypeId" 
order by t."Name" , mt."MediaTypeId" ;

-- Ejercicio 8: Encuentra todas las pistas y, si existen, muestra los nombres de los géneros a los que pertenecen. Incluye también las pistas que no tienen un género asignado.**
select  t."Name" as "Nombre_pista", g."Name" as "Nombre_genero"
from "Track" t
left join  "Genre" g on t."GenreId" = g."GenreId" 
order by t."Name" ;

-- Ejercicio 9: Muestra todos los clientes y, si existen, muestra las facturas que han realizado. Incluye también los clientes que no tienen ninguna factura.
select 
    c."CustomerId" as "ID_Cliente",
    c."FirstName" as "Nombre_Cliente",
    i."InvoiceId" as "ID_Factura",
    i."InvoiceDate" as "Fecha_Factura",
    i."Total" as "Total_Factura"	
from  "Customer" c 
left join "Invoice" i on c."CustomerId" = i."CustomerId" 
order by  c."CustomerId", i."InvoiceId" ;

-- Ejercico 10: Encuentra todos los álbumes y, si existen, muestra los nombres de los artistas que los crearon. Incluye también los álbumes que no tienen un artista asignado (aunque en este caso en la base de datos de Chinook, todos los álbumes tienen un artista asignado).
select 
    a."AlbumId" as "ID_Album",
    a."Title" as "Titulo_Album",
    ar."Name" as "Nombre_Artista"
from  "Album" a
left join "Artist" ar ON a."ArtistId" = ar."ArtistId" 
order by  a."AlbumId" ;

-- Ejercicio 11: Cuenta cuántas pistas hay en cada género. Ordena los generos en función del número de canciones de mayor a menor. 
select g."Name" as "Nombre_Genero",COUNT(t."TrackId") as "Numero_Pistas"
from "Genre" g 
left join "Track" t on g."GenreId" = t."GenreId" 
group by g."Name" 
order by  "Numero_Pistas" desc ;

--  Ejercicio 12: Muestra los títulos de los álbumes y la duración total de todas las pistas en cada álbum.
select  a."Title" as "Titulo_Album",sum(t."Milliseconds") as "Duracion_Total"
from "Album" a 
join "Track" t on a."AlbumId" = t."AlbumId" 
group by a."Title" 
order by "Duracion_Total" desc ;

-- Ejercicio 13: Encuentra los nombres de los clientes y el total gastado por cada uno.
select "FirstName" as "Nombre_cliente", sum(i."Total") as "Total_gastado" 
from "Customer" c 
join "Invoice" i on c."CustomerId" = i."CustomerId" 
group by "FirstName" 
order by "Total_gastado" desc ;

-- Ejercicio 14: Encuentra todos los empleados y, si existen, muestra los nombres de los clientes que tienen asignados. Incluye también los empleados que no tienen clientes asignados.
select 
e."EmployeeId" as "ID_Empleado",
e."FirstName" as "Nombre_Empleado",
c."FirstName" as "Nombre_Cliente"
from "Employee" e 
left  join  "Customer" c on e."EmployeeId" = c."SupportRepId" 
order by e."EmployeeId" , c."FirstName" , c."LastName" ;


