var expect = require('chai').expect
var ProductModel = require('../../app/models/product')
var utils = require('../utils')

describe('Product Model', function() {
  before(function(done) {
    utils.cleanDB(function(){
      done();
    })   
  });
  beforeEach(function(done){
    utils.truncTables(function(){
      done();
    })
  });

  describe('#add',function(){
    
    it('add debe ser una funcion',function(done){
      expect(ProductModel.add).to.be.a('function');
      done();
    });
    it('Agrega un producto con sus datos correctos', function(done) {
      var cantidad = null;
      ProductModel.getAll(function (err,res) {
        if(!err) {
          cantidad = res.length;
        }
      });
      ProductModel.add({name: "TV 14", description: "Super tv de 14 pulgadas alta definicion", price: 1000, oldPrice: 1500, image: "none"}, function(err, res){
        expect(err).not.to.exist;
        expect(res.succes).to.be.true;
        expect(res.msg).to.be.a('string');
        expect(res.id).to.be.a('number');
        ProductModel.getAll(function (err,res) {
          if(!err) {
            expect(res.length).to.be.equal(cantidad + 1);
            done();
          }
        });
      });
    });
    // it begin
    it('No debe agregar si "name" es nulo',function(done){
      var cantidad = null;
      ProductModel.getAll(function (err,res) {
        if(!err) {
          cantidad = res.length;
        }
      });
      ProductModel.add({name: null, description: "Super tv de 14", price: 1000, oldPrice: 1500, image: "none"}, function(err, res){
        expect(err).to.exist;
        expect(err.succes).to.be.false;
        //expect(res).not.to.be.exist;
        ProductModel.getAll(function (err,res) {
          if(!err) {
            expect(res.length).to.be.equal(cantidad);
            done();
          }
        });
      });
    });
    // end it

    it('No debe agregar si "description" es nulo',function(done){
      var cantidad = null;
      ProductModel.getAll(function (err,res) {
        if(!err) {
          cantidad = res.length;
        }
      });
      ProductModel.add({name: "TV 14 Pulgadas", description: null, price: 1000, oldPrice: 1500, image: "none"}, function(err, res){
        expect(err).to.exist;
        expect(err.succes).to.be.false;
        expect(res).not.to.be.exist;
        ProductModel.getAll(function (err,res) {
          if(!err) {
            expect(res.length).to.be.equal(cantidad);
            done();
          }
        });
      });
    });

    it('No debe agregar si "price" es nulo',function(done){
      var cantidad = null;
      ProductModel.getAll(function (err,res) {
        if(!err) {
          cantidad = res.length;
        }
      });
      ProductModel.add({name: "TV 14 pulgadas", description: "Super tv de 14", price: null, oldPrice: 1500, image: "none"}, function(err, res){
        expect(err).to.exist;
        expect(err.succes).to.be.false;
        expect(res).not.to.be.exist;
        ProductModel.getAll(function (err,res) {
          if(!err) {
            expect(res.length).to.be.equal(cantidad);
            done();
          }
        });
      });
    });

    it('No debe agregar si "oldPrice" es nulo',function(done){
      var cantidad = null;
      ProductModel.getAll(function (err,res) {
        if(!err) {
          cantidad = res.length;
        }
      });
      ProductModel.add({name: "TV 14 Pulgadas", description: "Super tv de 14 high def", price: 1000, oldPrice: null, image: "none"}, function(err, res){
        expect(err).to.exist;
        expect(err.succes).to.be.false;
        expect(res).not.to.be.exist;
        ProductModel.getAll(function (err,res) {
          if(!err) {
            expect(res.length).to.be.equal(cantidad);
            done();
          }
        });
      });
    });

    it('No debe agregar si "imgage" es nulo',function(done){
      var cantidad = null;
      ProductModel.getAll(function (err,res) {
        if(!err) {
          cantidad = res.length;
        }
      });
      ProductModel.add({name: "TV 14 Pulgadas", description: "Super tv de 14", price: 1000, oldPrice: 1500, image: null}, function(err, res){
        expect(err).to.exist;
        expect(err.succes).to.be.false;
        expect(res).not.to.be.exist;
        ProductModel.getAll(function (err,res) {
          if(!err) {
            expect(res.length).to.be.equal(cantidad);
            done();
          }
        });
      });
    });
  });

  describe("#update Model Products", function(){
    beforeEach(function(done){
      utils.insertSampleData(function(){
        done();
      }) 
    });
    it('Update - should be a function',function(done){
      expect(ProductModel.update).to.be.a('function');
      done();
    });
    it("Update when all data is correct", function(done){
      //done();
    });
    it("Do not update when :productId is missing", function(done){
      //done()
    });
    it("update when :productId and :name have correct values", function(done){
      //done();
    });
    it("update when :productId and :description have correct values", function(done){
      //done();
    });
    it("update when :productId and :price have correct values", function(done){
      //done();
    });
    it("update when :productId and :oldPrice have correct values", function(done){
      //done();
    });
    it("update when :productId and :image have correct values", function(done){
      //done();
    });

  });






});