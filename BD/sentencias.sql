/*crear usuario
modificar usuario
mostrar usuario
recuperar contraseña
emitir calificacion
ingresar a la cuenta

ver publicacion
lista de publicacion
buscar publicacion
modificar publicaicon
crear publicaicon
eliminar publicacion

ver lista de conversaciones
ver conversaciones
crear conversacion 
eliminar

enviar mensaje
ver mensaje
crearmensaje
*/

/* crear usuario*/
INSERT INTO Usuario (cedula,nombres,apellidos,contrasena,email,celular,link_Facebook,borrado_Logico,edad,calificacion)
    VALUES ('1105679664','Doris Katherine','Guamán Barragán', 'doris','dkguamanb@unl.edu.ec','0991661884','https://www.facebook.com/kary.guaman','0','1992-12-10','0');

 INSERT INTO Usuario (cedula,nombres,apellidos,contrasena,email,celular,link_Facebook,borrado_Logico, edad,calificacion)
    VALUES ('1105679667','Victor Francisco','Jumbo Sinchire', 'victor','vfjumbos@unl.edu.ec','0991661884','https://www.facebook.com/kary.guaman','0','1994-09-14','0');
/* modificar*/
Update Usuario Set contrasena='doris', email='karitodoris11@hotmail.com' Where cedula='1';
/*
Mostrar Usuario
*/
select *from Usuario Where id_Usuario='1';
/*Recuperar Contraseña*/
Update Usuario Set contrasena='dios' Where (cedula='1105679664' && email='dkguamanb@unl.edu.ec');

/*calificacion*/
Update Usuario Set calificacion='3' Where cedula='1';
/*ELIMINAR USUARIO*/
delete from Usuario Where id='1';

/*CREAR PUBLICACION*/
INSERT INTO Publicacion(tipo_Documento,fecha_Publicacion, fecha_Encuentro,ubicacion_Encuentro,lugar_Reside,detalles,foto,fecha_Perdida,ubicacion_Perdida,borrado_Logico,id_Usuario)
    VALUES ('CEDULA','2016-06-22','2016-06-01','Daniel Alvarez','Argelia','Esta un poco deterioorara', 'foto','2015-10-12','Esteban Godoy','0','1');

/*VER LISTA DE PUBLICAICONES*/
select *from Publicacion;
/*Ver publicacion*/
select *from Publicacion Where id='1';
/*BUSCAR PUBLICACION*/
select *from Publicacion Where cedula='1105679664';
/*Modificar Publicaicon*/
Update Publicacion Set tipo_Documento='Pasaporte', fecha_Publicacion='2016-12-01',fecha_Encuentro='2016-11-12', ubicacion_Encuentro='Sauces', lugar_Reside='Policia', detalles='Hola',foto='jdiaji',fecha_Perdida='2015-10-12',ubicacion_Perdida='Punzara',id_Usuario='1',borrado_Logico='1' Where cedula='1';
/*delete Publicaicon*/

delete from Publicacion Where id='1';

