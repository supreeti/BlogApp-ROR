class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :post_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :post, foreign_key: :author_id
  has_many :comment, foreign_key: :author_id
  has_many :like, foreign_key: :author_id

  attribute :name, :string
  attribute :photo, :string
  attribute :bio, :text
  attribute :posts_counter, :integer, default: 0

  def recent_post
    posts.order('created_at Desc').limit(3)
  end
end
