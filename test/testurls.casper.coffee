
content = undefined
settings = require('./settings')
casper = require('casper').create()

casper.start settings.url+"/login/", ->
    @test.assertHttpStatus 200, "Home page ok / 200"
    loginParams = 
        username: settings.testUser
        password: settings.testPassword


casper.run ->
    @echo content
    @echo('Calling Exit...').exit()