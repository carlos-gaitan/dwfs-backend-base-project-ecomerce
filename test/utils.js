const execSQL = require('exec-sql');
const path = require('path');
require('dotenv').config({path: `${__dirname}/../.env.test`});

before(function(done) {
  //console.log("clean DB")
  cleanDB(function(){
    done();
  })   
});

beforeEach(function(done) {
  //console.log("trunc tables")
  truncTables(function(){
    done();
  })   
});

function cleanDB(done) {
  execSQL.connect({
    database: process.env.DB_NAME,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    host: process.env.DB_HOST
  });
  console.log(" Clean DB - Database selected: ",process.env.DB_NAME);
  execSQL.executeFile(path.join(__dirname, '../dbscripts/create-test-db.sql'), function(err) {
    execSQL.disconnect();
    if (err) {
      console.log('************ ATENCION ************');
      console.log(' Error while cleaning test DB:', err)
    }
    done();
  });
};

function truncTables(done) {
  execSQL.connect({
    database: process.env.DB_NAME,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    host: process.env.DB_HOST
  });
  console.log(" Trunc Tables on : ",process.env.DB_NAME);
  execSQL.executeFile(path.join(__dirname, '../dbscripts/truncate-all-tables.sql'), function(err) {
    execSQL.disconnect();
    if (err) {
      console.log('************ ATENCION ************');
      console.log(' Error while truncating all tables: ', err)
    }
    done();
  });
};

//module.exports.cleanDB = cleanDB;
//module.exports.truncTables = truncTables;

module.exports.insertSampleData = function (done) {
  execSQL.connect({
    database: process.env.DB_NAME,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    host: process.env.DB_HOST
  });
  console.log(" Insert Sample Data on: ",process.env.DB_NAME);
  execSQL.executeFile(path.join(__dirname, '../dbscripts/insert-sample-data.sql'), function(err) {
    execSQL.disconnect();
    if (err) {
      console.log('************ ATENCION ************');
      console.log(' Error while inserting Sample Data: ', err)
    }
    done();
  });
};
