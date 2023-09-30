# spec/models/like_spec.rb

require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it { should belongs_to(:user).with_foreign_key('user_id') }
    it { should belongs_to(:post).with_foreign_key('post_id') }
  end

  describe 'callbacks' do
    it { should callback(:update_likes).after(:save) }
  end

  describe '#update_likes' do
    let(:user) { create(:user) }
    let(:post) { create(:post) }

    it 'increments the post\'s like_counter' do
      expect { like.save }.to change { post.reload.like_counter }.by(1)
    end
  end
end
