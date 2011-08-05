going webscale
==============

I recently decided to clean up my personal online act in a more modern and mobile friendly manner. I started with this newer, shorter, domain
which is pretty nice after 10 years of typing <a href="http://westcoastlogic.com">westcoastlogic.com</a>. Buidling a new personal site gave me the excuse I needed to author <a href="http://wtfjs.com">another</a> nodejs based blog library too. This time I opted for JavaScript's sexy little sister CoffeeScript. 

Check out this snippet of router logic:

    :::CoffeeScript
    app = module.exports = require './config'

    app.get '/', (req, res) -> 
        res.render 'index'

    app.get '/about', (req, res) -> 
        res.render 'about'

    app.get '/contact', (req, res) -> 
        res.render 'contact'

    app.listen process.env.PORT || 3000

You can <a href="http://github.com/brianleroux/brian.io">check out the source on github</a>.

CoffeeScript really does bring out the hidden beauty of JavaScript. Anyhow, expect sporatic info here including coverage on
that mobile project I tend to work on.
