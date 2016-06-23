DROP TABLE Usuario_Conversacion;
DROP TABLE Mensaje;
DROP TABLE Conversacion;
DROP TABLE Publicacion;
DROP TABLE Usuario;





create table Usuario(
id_Usuario int NOT NULL AUTO_INCREMENT primary key,
borrado_Logico int NOT NULL,
cedula varchar(10) NOT NULL,
nombres varchar(50) NOT NULL,
apellidos varchar(50) NOT NULL,
contrasena varchar(30) NOT NULL,
email varchar(50) NOT NULL,
celular varchar(10) NOT NULL,
link_Facebook varchar(50) NOT NULL,
edad DATE NOT NULL,
calificacion int NOT NULL);

create table Publicacion(
id_Publicacion int NOT NULL AUTO_INCREMENT primary key,
tipo_Documento varchar(20) NOT NULL,
fecha_Publicacion DATE NOT NULL,
borrado_Logico int NOT NULL,
fecha_Encuentro DATE NOT NULL,
ubicacion_Encuentro varchar(30) NOT NULL,
lugar_Reside varchar(30) NOT NULL,
detalles varchar(70) NOT NULL,
foto varchar(50) NOT NULL,
fecha_Perdida DATE NOT NULL,
ubicacion_Perdida varchar(30) NOT NULL,
id_Usuario int NOT NULL,
FOREIGN KEY (id_Usuario) REFERENCES Usuario(id_Usuario) 
);

create table Conversacion(
id_Conversacion int NOT NULL AUTO_INCREMENT primary key,
borrado_Logico int NOT NULL,
fecha DATE NOT NULL
);

create table Mensaje(
id_Mensaje int NOT NULL AUTO_INCREMENT primary key,
hora TIME NOT NULL,
contenido varchar(100) NOT NULL,
id_Conversacion int NOT NULL,
FOREIGN KEY (id_Conversacion) REFERENCES Conversacion(id_Conversacion) 
);

create table Usuario_Conversacion(
borrado_Logico int NOT NULL,
id_Usuario int NOT NULL,
FOREIGN KEY (id_Usuario) REFERENCES Usuario(id_Usuario),
id_Conversacion int NOT NULL,
FOREIGN KEY (id_Conversacion) REFERENCES Conversacion(id_Conversacion) 
);

