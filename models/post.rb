class Post
  attr_accessor(:id, :image_link, :name, :type, :species, :abilities, :description)
  # A method to connect to database
  def self.open_connection
    # Tell it to go to the correct database
    conn = PG.connect(dbname: "pokemon")
  end

  def save
    conn = Post.open_connection

    if (!self.id)
      sql = "INSERT INTO post (image_link, name, type, species, abilities, description) VALUES ('#{image_link}', '#{self.name}', '#{self.type}', '#{self.species}', '#{self.abilities}', '#{self.description}')"
    else
      sql = "UPDATE post SET image_link='#{self.image_link}', name='#{self.name}', type='#{self.type}', species='#{self.species}', abilities='#{self.abilities}', description='#{self.description}' WHERE id = #{self.id}"
    end

    conn.exec(sql)
  end

  # Get all posts and return them back
  def self.all
    conn = self.open_connection

    sql = "SELECT id, image_link, name, type, species, abilities, description FROM post ORDER BY id"

    results = conn.exec(sql)
    # loop through return data
    posts = results.map do |result|
      self.hydrate(result)
    end
    posts
  end

  # GET POST BY ID
  def self.find(id)
    conn = self.open_connection

    sql = "SELECT * FROM post WHERE id = #{id} LIMIT 1"

    posts_result = conn.exec(sql)

    post = self.hydrate(posts_result[0])



  end

  # Delete post by id
  def self.destroy(id)
    conn = self.open_connection

    sql = "DELETE FROM post WHERE id = #{id}"

    posts_result = conn.exec(sql)
  end

  # Change the object to fit in with the current database, format wise
  # Sort data out; making sure all data are stored correctly
  def self.hydrate(post_data)
    post = Post.new

    post.id = post_data['id']
    post.image_link = post_data['image_link']
    post.name = post_data['name']
    post.type = post_data['type']
    post.species = post_data['species']
    post.abilities = post_data['abilities']
    post.description = post_data['description']

    post
  end
end


Post.all
