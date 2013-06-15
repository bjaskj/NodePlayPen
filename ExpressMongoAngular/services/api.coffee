User = require("../models/user")

exports.users = (req, res) ->
  User
    .find()
    .sort("name")
    .exec((err, users) ->
      res.send users
    )
