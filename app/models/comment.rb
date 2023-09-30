class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  belongs_to :post, foreign_key: :post_id
  belongs_to :author, class_name: 'User'

  after_save :update_comments_counter

  private

  def update_comments_counter
    post.update(comment_counter: post.comments.count)
  end
end
