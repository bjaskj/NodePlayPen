index = require './routes/index'
apiService = require("./services/api")

exports.routes = (app) ->
    app.get "/", index.index
    app.get "/users", apiService.users