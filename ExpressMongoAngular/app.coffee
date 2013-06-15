# Module dependencies.
express = require 'express'
http = require 'http'
app = express()

app = express()
(require './config').config(app, express)
(require './routes').routes(app, express)

http.createServer(app).listen app.get("port"), ->
    console.log "Express server listening on port " + app.get("port")
    console.log "Coffee Script!"

(require './database').connect()