mongoose = require("mongoose")
Schema = mongoose.Schema
ObjectId = Schema.ObjectId

userSchema = new Schema(
  name: String
)

module.exports = mongoose.model("User", userSchema)