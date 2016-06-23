var express = require('express');
var router = express.Router();
var mysql=require('mysql');//(importar)para acceder a la libreria de mysql desde node
/* GET users listing. */
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

//creo la ruta

router.get('/mostraUsuario', function(solicitud, respuesta, next) {
  var mostraUsuario=conecccion.query('SELECT *FROM Usuario',function(error,columnas,filas){
    if(error){
      console.log("esta mal la sentencia");
  }else{
      respuesta.json(columnas);
      
  }  
 
});
});
//exporto la ruta
module.exports = router;
