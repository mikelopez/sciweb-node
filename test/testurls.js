var express = require('express');
var request = require('superagent');
var assert = require('assert');

var chai = require('chai')
  , expect = chai.expect
  , should = chai.should();

var app = require('../app');

describe("Test the URLS", function() {
  describe("GET / page", function() {

    it('should return 200 response', function(done) {
      request.get('http://localhost:3000').end(function(res) {
        var status = res.status;
        console.log(status);
        expect(status).to.equal(200);
        done();

      });
    });
  });

});
