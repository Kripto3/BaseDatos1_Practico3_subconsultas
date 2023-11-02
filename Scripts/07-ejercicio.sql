/*
Ejercicio Nº 7
Mostrar en un solo registro, la cantidad de consorcios que realizaron al
menos un gasto (variante con combinaciones y con subconsulta)
*/


SELECT * 
FROM dbo.consorcio  CON
LEFT JOIN dbo.gasto G -- combina con los gastos aunque ningun consorcio haya gastado
	ON CON.idconsorcio = G.idconsorcio
	AND CON.idlocalidad = G.idlocalidad
	AND CON.idprovincia = G.idprovincia
where G.idgasto IS NULL -- solo los gastos nulos, o sea consorcios sin gastos




