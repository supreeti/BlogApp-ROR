# spec/models/comment_spec.rb

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user, name: 'Supreeti') }
  let(:post) { create(:post, title: 'Test user') }

  describe 'associations' do
    it { should belongs_to(:post).with_foreign_key(:post_id) }
    it { should belongs_to(:user).with_foreign_key(:user_id) }
  end

  describe 'callbacks' do
    it 'updates the comments_counter after save' do
      comment = build(:comment, post: 'Test user', user: 'Supreeti')
      expect { comment.save }.to change { post.reload.comment_counter }.by(1)
    end
  end
end
