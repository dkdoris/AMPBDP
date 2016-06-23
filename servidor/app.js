var express = require('express'); //Framewook
//Entorno de Desarrollo
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var mysql=require('mysql');//(importar)para acceder a la libreria de mysql desde node
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');

var routes = require('./routes/index');
var users = require('./routes/users');
//llamando a al archivo
var usuario = require('./routes/usuario');
//node_modules contiene todas las librerias que estubieron en el package.json

var app = express(); //Instancia expres para utilizar sus metodos
//datos para crear la conecccion entre la base de datos 
var conecccion =mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'doris',
    database:'AMPBDP'
});
//se lanza la coneccion o inicia la coneccion
conecccion.connect(function(error){
  if(error){
      console.log("ERROR EN LA CONECCION");
  }else{
      console.log("CONECCION CORRECTA");
  }
});
//query consulta a la base de datos
var mostraUsuario=conecccion.query('SELECT *FROM Usuario',function(error,columnas,filas){
    if(error){
      console.log("esta mal la sentencia");
  }else{
      console.log("Esta bien la sentencia");
  }  
 
});
var crearUsuario=conecccion.query('INSERT INTO Usuario(cedula,nombres,apellidos,contrasena,email,celular,link_Facebook,borrado_Logico,edad,calificacion) VALUES(?,?,?,?,?,?,?,?,?,?)', ['1105679664','Doris Katherine','Guamán Barragán', 'doris','dkguamanb@unl.edu.ec','0991661884','https://www.facebook.com/kary.guaman',0,'1992-12-10',0],function(error,columnas,filas){
    if(error){
      console.log(error);
  }else{
      console.log("Esta bien la sentencia");
  } 
} );

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade'); //plantilla jade

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
//ruteo es el cambio de URL
app.use('/', routes);
app.use('/users', users);
app.use('/usuario', usuario);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
  app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
      message: err.message,
      error: err
    });
  });
}

// production error handler
// no stacktraces leaked to user
app.use(function(err, req, res, next) {
  res.status(err.status || 500);
  res.render('error', {
    message: err.message,
    error: {}
  });
});


module.exports = app;
