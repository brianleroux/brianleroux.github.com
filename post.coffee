fs = require 'fs'
path = require 'path'
postsPath = path.join __dirname, 'posts'

# represents a file in ./posts
class Post
  constructor: (@filename) ->
    p = if typeof @filename is 'string' 
          @filename.split('-') 
        else 
          [@filename.y, @filename.m, @filename.d, @filename.title.replace('-','')]
    # working arr of the post metadata
    # p = @filename.split('-')
    # grab the date parts
    [y, m, d] = p[0..3]
    # fudge for js date month
    m = m - 1
    # grab the title
    @title = p[3..].join(' ').replace(/.html/g, '')
    # construct the created date
    @created = new Date(y, m, d)
    # hmm. could make this async eh
    @html = fs.readFileSync(path.join(postsPath, @filename)).toString('utf8')

# get all the posts
Post.all = (cb) ->
  fs.readdir postsPath, (err, data) ->
    posts = (new Post(post) for post in data when path.extname(post) is '.html')
    cb.call(@, posts)

# get a post for a specified page
Post.page = (page = 1, cb) ->
  Post.all (posts) ->
    count = 5
    max   = Math.ceil(posts.length/count)
    cur   = ~~page || 1
    next  = cur + 1
    prev  = cur - 1
    start = if cur is 1 then 0 else prev*count
    end   = if start >= count then start+count else count
    cb { posts: posts[start..end]
       , page:  cur
       , max:   max
       , next:  (next > max ? max : next)
       , prev:  (prev == 0 ? 1 : prev)
       }

module.exports = Post
