app = module.exports = require './config'
Post = require './post'

app.get '/', (req, res) -> 
  res.render 'index'

app.get '/about', (req, res) -> 
  res.render 'about'

app.get '/contact', (req, res) -> 
  res.render 'contact'

app.get '/blog/:n?', (req, res) ->
  Post.page req.params.n, (posts) -> 
    res.render('blog', posts)

app.get '/blog/:y/:m/:d/:title', (req, res) ->
  res.render 'post', post: new Post(req.params)

app.get '/rss', (req, res) ->
  res.headers['Content-Type'] = 'text/xml; charset=utf-8'
  Post.rss res.send

app.listen process.env.PORT || 3000
