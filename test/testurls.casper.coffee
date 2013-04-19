
content = undefined
settings = require('./settings')
casper = require('casper').create()

casper.start settings.url+"/", ->
    @test.assertHttpStatus 200, "Home page ok / 200"
    
casper.thenOpen settings.url+"/land", ->
    @test.assertHttpStatus 200, "Landing Page ok / 200"

casper.run ->
    @echo content
    @echo('Calling Exit...').exit()