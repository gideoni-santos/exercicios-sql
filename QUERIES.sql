-- 1. selecione o nome dos artistas associados com o título dos seus albuns
SELECT 
	ARTIST.NAME, ALBUM.TITLE 
FROM 
	ARTIST
LEFT JOIN 
	ALBUM ON ARTIST.ARTISTID = ALBUM.ARTISTID;


-- 2. selecione o nome dos artistas associados com o nome das músicas
SELECT 
	ARTIST.NAME, TRACK.NAME 
FROM 
	TRACK
LEFT JOIN 
	ALBUM ON TRACK.ALBUMID = ALBUM.ALBUMID
LEFT JOIN 
	ARTIST ON ALBUM.ARTISTID = ARTIST.ARTISTID;


-- 3. exiba o nome do gênero e a média de tempo das músicas em milisegundos agrupadas por gênero
SELECT 
	GENRE.NAME AS GENERO, 
	ROUND(AVG(TRACK.MILLISECONDS)) AS MEDIA 
FROM 
	GENRE
LEFT JOIN 
	TRACK ON GENRE.GENREID = TRACK.GENREID
GROUP BY 
	GENRE.NAME
ORDER BY 
	MEDIA DESC;
	

-- 4. exiba o nome do álbum que possui a maior média de tempo em milisegundos cujo o genero musical é ROCK.
SELECT 
	ALBUM.TITLE AS ALBUM, 
	AVG(TRACK.MILLISECONDS) AS MEDIA
FROM 
	TRACK
LEFT JOIN 
	ALBUM ON TRACK.ALBUMID = ALBUM.ALBUMID
LEFT JOIN 
	GENRE ON TRACK.GENREID = GENRE.GENREID
WHERE
	GENRE.NAME LIKE 'Rock'
GROUP BY 
	ALBUM.TITLE
ORDER BY 
	MEDIA DESC LIMIT 1;


-- 5. selecione o nome e a soma dos valores das contas dos usuarios filtrando pelos usuarios que tiveram a soma das contas maiores que 40 e ordenados em ordem descrescente
SELECT 
	CUSTOMER.FIRSTNAME, 
	SUM(INVOICE.TOTAL) AS TOTAL
FROM 
	CUSTOMER
INNER JOIN 
	INVOICE ON CUSTOMER.CUSTOMERID = INVOICE.CUSTOMERID
GROUP BY 
	CUSTOMER.FIRSTNAME
HAVING
	SUM(INVOICE.TOTAL) > 40
ORDER BY 
	TOTAL DESC;
	

-- 6. exiba a soma de tempo das musicas em milisegundos agrupados pelos nomes dos países de origem dos usuarios
SELECT 
	SUM(TRACK.MILLISECONDS) AS SOMA,
	CUSTOMER.COUNTRY AS PAÍS
FROM
	CUSTOMER
INNER JOIN 
	INVOICE ON CUSTOMER.CUSTOMERID = INVOICE.CUSTOMERID
INNER JOIN 
	INVOICELINE ON INVOICE.INVOICEID = INVOICELINE.INVOICEID
INNER JOIN 
	TRACK ON INVOICELINE.TRACKID = TRACK.TRACKID
GROUP BY 
	CUSTOMER.COUNTRY
ORDER BY
	SOMA;


-- 7. selecione os albuns do artista que possui a maior quantidade de albuns lançados
/*SELECT 
	ARTIST.NAME AS ARTISTA,
	ALBUM.TITLE AS ALBUM
FROM
	ALBUM
INNER JOIN 
	ARTIST ON ALBUM.ARTISTID = ARTIST.ARTISTID*/
	

-- 8. selecione o nome da playlist que possui a maior quantidade de musicas
SELECT 
	PLAYLIST.NAME,
	COUNT(PLAYLISTTRACK.TRACKID) AS "Quantidade de Músicas"
FROM
	PLAYLIST
INNER JOIN
	PLAYLISTTRACK ON PLAYLIST.PLAYLISTID = PLAYLISTTRACK.PLAYLISTID
GROUP BY
	PLAYLIST.NAME
ORDER BY
	"Quantidade de Músicas" DESC LIMIT 1;
	

-- 9. selecione o nome de todos os funcionários associados com o nome de todos os consumidores que eles tiveram suporte
SELECT 
	EMPLOYEE.FIRSTNAME AS "Nome Funcionário",
	CUSTOMER.FIRSTNAME AS "Nome Cliente"
FROM
	EMPLOYEE
INNER JOIN
	CUSTOMER ON EMPLOYEE.EMPLOYEEID = CUSTOMER.SUPPORTREPID




	
	





