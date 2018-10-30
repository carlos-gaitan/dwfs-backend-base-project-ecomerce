var connection = require('../../database')

var User = function(name,email,password,active) {
  this.name = name;
  this.email = email;
  this.password = password;
  this.active = active;  
}

User.getAll = function (cb) {
  connection.query('SELECT * FROM user', cb)
}

User.add = function (data, cb) {
  var sqlQuery = `INSERT INTO user (name, email, password, active)
    VALUES ('${data.name}','${data.email}','${data.password}',1)`;
  connection.query(sqlQuery, cb)
}

module.exports = User
