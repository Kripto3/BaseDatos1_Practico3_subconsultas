/*
Ejercicio Nº 3
Mostrar todos los tipos de gastos, y sus respectivas descripciones, que no fueron registrados en 
toda la provincia de Buenos Aires para el mes de febrero del año 2015.
*/

--Obtenemos todos los tipos gastos que se encuentran registrados en febrero 2015 en Buenos Aires
SELECT G.idtipogasto
FROM [dbo].[gasto] G
WHERE idprovincia = 2 --buenos aires
AND YEAR(G.fechapago) = '2015'
AND MONTH(G.fechapago) = '02'
GROUP BY G.idtipogasto
--(FORMAT(g.fechapago, 'YYYY') = '2015'


--Obtener los tipos de gatos que NO fueron registrados en en febrero 2015 en Buenos Aires
SELECT TG.*
FROM [dbo].[tipogasto] TG
INNER JOIN [dbo].[gasto] G
	ON G.idtipogasto = TG.idtipogasto
WHERE NOT EXISTS (
	SELECT G2.idtipogasto
	FROM [dbo].[gasto] G2
	WHERE idprovincia = 2 --buenos aires
	AND YEAR(G.fechapago) = '2015'
	AND MONTH(G.fechapago) = '02'
	GROUP BY  G2.idtipogasto
)


