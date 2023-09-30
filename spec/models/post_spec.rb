# spec/models/post_spec.rb

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(5).is_at_most(250) }
    it { should validate_numericality_of(:comment_counter).is_greater_than_or_equal_to(0).only_integer }
    it { should validate_numericality_of(:like_counter).is_greater_than_or_equal_to(0).only_integer }
  end

  describe 'associations' do
    it { should belong_to(:author).class_name('User').with_foreign_key('author_id') }
    it { should have_many(:likes).with_foreign_key('post_id') }
    it { should have_many(:comments).with_foreign_key('post_id') }
  end

  describe 'callbacks' do
    it { should callback(:update_posts_counter).after(:save) }
  end

  describe '#recent_comments' do
    let(:post) { create(:post) }

    it 'returns the most recent comments' do
      comment1 = create(:comment, post: post, created_at: 1.hour.ago)
      comment2 = create(:comment, post: post, created_at: 2.hours.ago)

      expect(post.recent_comments(2)).to eq([comment1, comment2])
    end
  end

  describe '#update_posts_counter' do
    let(:author) { create(:user) }
    let(:post) { create(:post, author: author) }

    it 'increments the author\'s post_counter' do
      expect { post.save }.to change { author.reload.post_counter }.by(1)
    end
  end
end
