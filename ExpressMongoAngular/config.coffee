coffeeScript = require 'coffee-script'
coffeeScriptConnect = require 'connect-coffee-script'
lessConnect = require 'less-middleware'
path = require 'path'

exports.config = (app, express) ->
    app.configure(() ->
        # all environments
        app.set "port", process.env.PORT or 3000
        app.set "views", __dirname + "/views"
        app.set "view engine", "jade"

        app.use express.favicon()
        app.use express.logger("dev")
        app.use express.bodyParser()
        app.use express.methodOverride()
        app.use express.cookieParser("tVXjqSi4diXFW08KkDKaUD8YRwuGuWEV")
        app.use express.session()

        app.use app.router
        app.use express.static(path.join(__dirname, "public"))

        app.use lessConnect({
            dest: __dirname + '/public'
            src: __dirname + '/src'
            compress: true
        })
        app.use coffeeScriptConnect({
            dest: __dirname + '/public'
            src: __dirname + '/src'
            bare: true
        })
    )

    app.configure 'development', () ->
        console.log 'Starting in development mode'

        app.use express.errorHandler({
            dumpExceptions: true
            showStack     : true
        })

    app.configure 'production', () ->
        console.log 'Starting in production mode'
        app.use express.errorHandler()