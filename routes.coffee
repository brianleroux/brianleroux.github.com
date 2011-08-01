app = module.exports = require './config'

app.get '/', (req, res) -> 
	res.render 'index'

app.get '/about', (req, res) -> 
	res.render 'about'

app.get '/contact', (req, res) -> 
	res.render 'contact'

app.get '/blog/?', (req, res) ->
    res.render 'blog'

app.listen process.env.PORT || 3000
