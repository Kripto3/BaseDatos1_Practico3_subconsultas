/*
Ejercicio Nº 8
Mostrar los administradores que no están asignados a ningún consorcio (variante con 
combinaciones y con subconsulta)
*/

SELECT
	A.* -- Obtener todos los administradores
FROM [dbo].[administrador] A
LEFT JOIN [dbo].[consorcio] CON -- combina con consorcios aunque no tengan idadmin
	ON A.idadmin = CON.idadmin
WHERE CON.idadmin IS NULL -- Solo los consorcios sis idadmin