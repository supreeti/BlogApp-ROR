class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 250 }
  validates :comment_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :like_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :comment, foreign_key: 'post_id'
  has_many :like, foreign_key: 'post_id'

  attribute :title, :string
  attribute :text, :text
  attribute :comments_counter, :integer, default: 0
  attribute :likes_counter, :integer, default: 0

  def recent_comments
    comments.order('created_at Desc').limit(5)
  end

  after_save :update_posts_counter

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
