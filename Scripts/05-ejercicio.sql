/*
Ejercicio Nº 5
Mostrar los nombres, en el caso que existan, de las provincias que no tengan localidades 
cargadas. Verificar el resultado por medio de otras consultas. 
*/

--Obtener todas las provincias por LEFT JOIN 
--(Si existe una provincia sin localidad, tendremos los datos de Localidad con valores NULL)
SELECT * 
FROM provincia P
LEFT JOIN localidad C
	ON P.idprovincia = C.idprovincia

-- Obtener solo los nombres de provincia que no tengan localidades
SELECT Provincia =  P.descripcion 
FROM provincia P
WHERE NOT EXISTS ( -- Solo los que no existan en la sud consulta
	SELECT *
	FROM localidad C
	WHERE P.idprovincia = C.idprovincia
)
