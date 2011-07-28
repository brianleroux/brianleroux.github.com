express = require('express')
app = module.exports = express.createServer()

### give nodeunit a cgi method to call...
    ...but I don't know (yet) how to translate this to valid cs
express.HTTPServer.prototype.cgi = ->
  self = this
  -> (req, resp) self.handle(req, resp)
###

app.configure ->
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'ejs'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser()
  app.use express.session(secret:'this matters not')
  app.use app.router
  app.use express.static(__dirname + '/public')


app.configure 'development', ->
  app.use express.errorHandler(dumpExceptions:true, showStack:true) 


app.configure 'production', ->
  app.use express.errorHandler()
