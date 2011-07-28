app = module.exports = require './config'

# yes this should be a static site (webscale)
#
# ..but I like to keep my options open
#
app.get '/', (req, res) -> 
	res.render 'index'

app.get '/about', (req, res) -> 
	res.render 'about'

app.get '/contact', (req, res) -> 
	res.render 'contact'

app.listen process.env.PORT || 3000
