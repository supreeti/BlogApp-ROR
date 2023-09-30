class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  attribute :name, :string
  attribute :photo, :string
  attribute :bio, :text
  attribute :posts_counter, :integer, default: 0

  def recent_post
    posts.order('created_at Desc').limit(3)
  end
end
