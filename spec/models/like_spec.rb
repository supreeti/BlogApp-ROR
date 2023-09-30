require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'Alice') }
  let(:post) { user.posts.create(title: 'Sample Post') }

  describe 'validations' do
    it 'should be valid with valid attributes' do
      like = Like.create(user:, post_id: post.id)
      expect(like).to be_valid
    end
  end

  describe 'callbacks' do
    it 'increments the post\'s like_counter after save' do
      user = create(:user)
      post = create(:post)
      expect {
        Like.create(user: user, post_id: post.id)
        post.reload
      }.to change { post.like_counter }.by(1)
    end
  end
end
