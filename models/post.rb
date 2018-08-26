class Post
  attr_accessor(:id, :name, :type)
  # A method to connect to database
  def self.open_connection
    # Tell it to go to the correct database
    conn = PG.connect(dbname: "pokemon")
  end
  # Save information
  # Only the model can deal with the storage; get things saved correctly
  def save
    # Run from an instance method
    # Refer back to the whole class
    conn = Post.open_connection

    if (!self.id)
      sql = "INSERT INTO post (name, type) VALUES ('#{self.name}', '#{self.type}')"
    else
      sql = "UPDATE post SET name='#{self.name}', type='#{self.type}' WHERE id = #{self.id}"
    end

    conn.exec(sql)
  end

  # Get all posts and return them back
  def self.all
    # Run method and go to database
    # create a connection
    # Run from class method from an object
    conn = self.open_connection

    sql = "SELECT id, name, type FROM post ORDER BY id"

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
    post.title = post_data['name']
    post.post_body = post_data['type']

    post
  end
end


Post.all
