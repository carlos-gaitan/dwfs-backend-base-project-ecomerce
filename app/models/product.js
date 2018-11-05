var connection = require('../../database')

var Product = function(id ,name ,description ,price ,oldPrice ,image ,active) {
  this.id = id;
  this.name = name;
  this.description = description;
  this.price = price;
  this.oldPrice = oldPrice;
  this.image = image;
  this.active = active;  
}

Product.getAll = function (cb) {
  connection.query('SELECT * FROM products', cb)
}

Product.add = function(data ,cb){
  if (data != null && data.name != null && data.description != null && data.image != null) {
    var sqlQuery = `INSERT INTO products (name,description,price,oldPrice,image,active)
      VALUES ('${data.name}','${data.description}',${data.price},${data.oldPrice},'${data.image}',1)`;
    connection.query(sqlQuery, function(err,res){
      var resultado;
      var error;
      if(!err){
        //console.log(res)
        resultado = { succes: true, msg: "Producto agregado OK", id: res.insertId};
      }
      else {
        error = { succes: false, msg: "Error al insertar un producto"};
      }
      cb(error,resultado);
    });
  }
  else {
    var error = { succes: false, msg: "Error al insertar un producto"};
    cb(error,null);
  }
}

Product.update = function(data, cb){

}

/*
User.add = function (data, cb) {
  var sqlQuery = `INSERT INTO products (name, email, password, active)
    VALUES ('${data.name}','${data.email}','${data.password}',1)`;
  connection.query(sqlQuery, cb)
}
*/
module.exports = Product
