/*
Ejercicio Nº 2
Seleccionar los consorcios que pertenezcan a la provincia con mayor número de habitantes, y 
mostrar los datos de los conserjes mayores a 50 años (ordenados de mayor a menor por edad) 
que no estén asignados a estos consorcios
*/


-- Obtener la provincia con mayor poblacion 
SELECT TOP 1 idprovincia
FROM [dbo].[provincia]
order by poblacion desc


SELECT CON.*,	-- Solo los datos del conserje
	Edad = DATEDIFF(YEAR,CON.fechnac, GETDATE())	-- Obtenemos la edad (para ver que haga bien)
FROM [dbo].[consorcio] C
INNER JOIN [dbo].[conserje] CON
	ON C.idconserje = CON.idconserje
	AND DATEDIFF(YEAR,CON.fechnac, GETDATE()) > 50	 -- Filtro, solo mayores a 50 años
WHERE C.idprovincia !=	-- Aquellos Consorcios distintos a la provincia con mayor poblacion			
	(
		SELECT TOP 1
			P.idprovincia
		FROM  [dbo].[provincia] P
		ORDER BY P.poblacion DESC
	)
ORDER BY DATEDIFF(YEAR,CON.fechnac, GETDATE()) DESC -- Ordenar por la edad descendiente (mayor a menor)
