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
  set :public_folder, Proc.new {File.join(root, 'public_folder')}

  # Set up the reloader
  configure :development do
    register Sinatra::Reloader
  end

  get "/pokemon" do
    @title = "Pokemon"
    @post = Post.all
    erb :'posts/index'
  end

  get "/pokemon/new" do
    @title = "New post"
    @post = Post.new
    erb :'posts/new'
  end

  post "/pokemon/" do
    post = Post.new
    post.image_link = params[:image_link]
    post.name = params[:name]
    post.type = params[:type]
    post.species = params[:species]
    post.abilities = params[:abilities]
    post.description = params[:description]

    post.save

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
    post.image_link = params[:image_link]
    post.name = params[:name]
    post.type = params[:type]
    post.species = params[:species]
    post.abilities = params[:abilities]
    post.description = params[:description]

    post.save

    redirect '/pokemon'
  end

  delete "/pokemon/:id" do
    id = params[:id].to_i

    Post.destroy(id)

    redirect "/pokemon"

  end
end
