class Message
  # extend ActiveModel::Naming
  attr_accessor :head, :body, :image

  def self.from_redis
    redis = Redis.new
    new(
      head: redis.get(:head),
      body: redis.get(:body),
      image: redis.get(:image)
    )
  end

  def initialize(options = {})
    self.head = options[:head]
    self.body = options[:body]
    self.image = options[:image]
  end

  def store!
    redis = Redis.new
    redis.set :head, head
    redis.set :body, body
    redis.set :image, image
  end

  def image_path
    Rails.root.join('public', 'uploads', image)
  end

  def image_url
    "/uploads/#{image}"
  end
end
