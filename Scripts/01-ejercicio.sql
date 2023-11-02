SELECT 
	Provincia = P.descripcion,
	Localidad = L.descripcion,
	ConsorcioNombre = C.nombre,
	direccion = C.direccion,
	zona = Z.descripcion
FROM dbo.consorcio C
	INNER JOIN dbo.localidad L
		ON C.idlocalidad = L.idlocalidad
		AND C.idprovincia = L.idprovincia
	INNER JOIN dbo.provincia P
		ON L.idprovincia = P.idprovincia
	INNER JOIN dbo.zona Z
		ON C.idzona = Z.idzona
WHERE C.idzona IN ( -- se usa IN porque retorna los 2 id de zona (6,5)
    SELECT TOP 2 idzona
    FROM consorcio
    GROUP BY idzona
    ORDER BY COUNT(*) DESC
) 
ORDER BY Z.descripcion, P.descripcion, L.descripcion, C.nombre;
