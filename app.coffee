
require "coffee-script"
express = require("express")
user = require("./routes/user")
routes = require("./routes")
http = require("http")
path = require("path")
errs = require("./lib/errorhandler")
app = express()

app.configure ->
  app.set "port", 9420
  app.set "views", __dirname + "/views"
  app.set "view engine", "ejs"
  app.use express.favicon()
  app.use express.logger("dev")
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser("4550rgy")
  app.use express.session()
  app.use require("stylus").middleware(__dirname + "/public")
  app.use express["static"](path.join(__dirname + "/public"))
  app.use errs.logErrors
  app.use errs.clientErrorHandler
  app.use errs.errorHandler
  app.use app.router

app.configure "development", ->
  app.use express.errorHandler()

app.get "/", routes.index
app.get "/users", user.list

http.createServer(app).listen app.get("port"), ->
  console.log "Express running port " + app.get("port")
