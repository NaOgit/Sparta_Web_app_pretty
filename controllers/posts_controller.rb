class PostsController < Sinatra::Base
# Inherit everything from Sinatra to this class
# Able to use all the available code from there and here
# middleware sits between the server and the request

  # Set => a method
  # Set root as parent directory of the current File.read("path/to/file")
  # root => based folder - grab the file that you're in
  # '..' => join file and where we are to make this one above of where we are (back up the directory by one)
  # override the default root for this project
  # Must always check if the root and views are set correctly
  set :root, File.join(File.dirname(__FILE__), '..')

  # Set the view directory correctly
  # Look for views, look at the root of the project
  # Proc.new => set new default for the current location of 'views' => views object will now hav diff config (Overide default config)
  set :views, Proc.new {File.join(root, 'views')}

  # Set up the reloader
  configure :development do
    register Sinatra::Reloader
  end

  $posts = [{
      id:0,
      title: 'Post 0',
      type: 'This is the initial post'
    },
    {
      id:1,
      title: 'Post 1',
      type: 'This is the first post'
    },
    {
      id:2,
      title: 'Post 2',
      type: 'This is the second post'
    },
    {
      id:3,
      title: 'Post 3',
      type: 'This is the third post'
    }
  ]

  # Separation concerns
  # DOn't mixed html in here
  # Method from model can run here
  get "/pokemon" do
    @title = "Blog Posts"
    @post = Post.all
    # @post = $posts
    # # erb => go look for the layout field first
    # # Apply the template
    erb :'posts/index'


  end

  get "/pokemon/new" do
    @title = "New post"
    @post = Post.new

    erb :'posts/new'
  end

  post "/pokemon" do
    post = Post.new

    post.title = params[:title]
    post.post_body = params[:post_body]

    post.save

    # puts params
    # # Assign new posts
    # new_post = {
    #   id: $posts.length,
    #   title: params[:title],
    #   post_body: params[:post_body]
    # }
    #
    # $posts.push(new_post)
    #
    redirect "/pokemon"

  end

  get "/pokemon/:id" do
    id = params[:id].to_i
    @post = Post.find(id)
    # erb => go look for the layout field first
    # Apply the template
    erb :'posts/show'
  end

  get "/pokemon/:id/edit" do
    id = params[:id].to_i
    @post = Post.find(id)
    @title = "Edit Post"
    erb :'posts/edit'
  end

  put "/pokemon/:id" do
    id = params[:id].to_i

    post = Post.find(id)

    post.title = params[:title]
    post.post_body = params[:post_body]

    post.save

    redirect '/pokemon'
  end

  delete "/pokemon/:id" do
    id = params[:id].to_i

    Post.destroy(id)


    redirect "/pokemon"

  end






end
