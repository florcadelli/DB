/*13. Generar un reporte que muestre por tipo de usuario la cantidad 
 de usuarios que posee.*/
 /*
 select tipousuario.tipousuario, count(tipousuario.tipousuario), usuario.nombreusuario from tipousuario
 inner join usuario on tipousuario.idTipoUsuario = usuario.IdTipoUsuario
 group by tipousuario.tipousuario; */
 
 /*
14. Listar la suma total obtenida por cada tipo de suscripción, en el 
periodo del 01-01-2020 al 31-12-2020.*/
  -- select * from pagos
  
  -- select * from suscripcion
   /*
  select suscripcion.idSuscripcion, sum(pagos.importe), pagos.fechaPago from pagos
  inner join suscripcion on suscripcion.idpagos = pagos.idPagos
  where pagos.fechaPago between '2020-01-01 00:00:00'and '2020-12-31 00:00:00'
  group by suscripcion.idSuscripcion
  */
  
/*
15. Listar el álbum y la discográfica que posea la canción con más 
 reproducciones.*/
 
 /*
 select album.titulo as album , discografica.nombre as discografica , sum(cancion.cantreproduccion) as "cantidad de reproducciones" from discografica
 inner join album on album.iddiscografica = discografica.idDiscografica
 inner join cancion on album.idAlbum = cancion.IdAlbum
 group by album.titulo
 order by  sum(cancion.cantreproduccion) desc
 limit 1
 */


 
 /*
16. Listar todas las playlist y canciones que tienen los usuarios de 
Argentina.*/

select * from playlist 
inner join usuario on playlist.idusuario
