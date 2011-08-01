fs = require 'fs'
path = require('path').join __dirname, 'posts'

class Post

Post.all = (cb) ->
  fs.readdir path, (err, data) -> cb(data) unless err

module.exports = Post
