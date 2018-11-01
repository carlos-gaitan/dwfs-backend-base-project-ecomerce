var expect = require('chai').expect
var UserModel = require('../../app/models/usuario')
var utils = require('../utils')

describe('User Model', function() {
  before(function(done) {
    this.timeout(10000);
    utils.cleanDB(function(){
      done();
    })   
  })

  describe('#add',function(){
    it('Agrega un usuario con sus datos correctos', function(done) {
      var cantidad = null;
      UserModel.getAll(function (err,res) {
        if(!err) {
          cantidad = res.length;
        }
      });
      UserModel.add({name: "Pepe", email: "pepe@pepe.pep", password: "pepepepepe1"}, function(err, res){
        console.log(err,res);
        done();
      });

      }
    );
  });

  /*
  describe('#add', function () {
    it('Si el correo ya existe como usuario, no realiza accion de agregar', function(done) {
      this.timeout(10000);
      UserModel.add()

      UserModel.getAll(function(err, res) {
        expect(err).to.not.exist;
        expect(res.length).to.eq(2)
        expect(res[0].field1).to.eq('Example 1')
        expect(res[1].field1).to.eq('Example 2')
        done()
      })
    })
  })

  describe('#add', function () {
    it('adds a new example', function(done) {
      this.timeout(10000);
      UserModel.getAll(function(err, res) {
        var qty = res.length;

        UserModel.add({ field1: 'new example' }, function(err, res) {
          expect(err).to.not.exist;
          expect(res.insertId).to.exist;
        
          UserModel.getAll(function(err, res) {
            expect(res.length).to.equal(qty + 1);
            done()
          });
        })
      });      
    })
  })
  */
})
