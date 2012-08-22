
express = require('express')
routes  = require('./routes')
http    = require('http')
path    = require('path')

app = express()

app.configure ->
  app.set 'port', process.env.PORT || 3000
  app.set 'views', "#{__dirname}/views"
  app.set 'view engine', 'ejs'
  app.use express.favicon()
  app.use express.logger 'dev'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser 'Surface Gravity: 273.06 m/s^2 or 27.84G'
  app.use express.session()
  app.use app.router
  app.use require('less-middleware')( src: "#{__dirname}/public" )
  app.use express.static path.join __dirname, 'public'

app.configure 'development', ->
  app.use express.errorHandler()

app.get '/', routes.index
app.get '/craft', routes.craftIndex
app.post '/craft/create', routes.craftCreate

#app.post '/craft/create', routes.craft.create

http.createServer(app).listen app.get('port'), ->
  console.log "Express server listening on port " + app.get('port')
