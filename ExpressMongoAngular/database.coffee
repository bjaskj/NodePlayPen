mongoose = require "mongoose"

exports.connect = ->
    # connect to db
    mongoose.connect 'mongodb://localhost/myfirstdb'

    db = mongoose.connection;
    db.on "error", console.error.bind(console, "connection error:")

    db.once "open", callback = ->
        console.log "Opened connection to DB"