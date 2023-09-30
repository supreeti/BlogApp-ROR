# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#recent_posts' do
    it 'returns the 3 most recent posts' do
      # Create a sample user
      user = User.create(name: 'John Doe', post_counter: 5)  # Adjust attributes as needed

      # Create sample posts associated with the user
      post1 = user.posts.create(title: 'Post 1 Title', content: 'Post 1 Content')  # Adjust attributes as needed
      post2 = user.posts.create(title: 'Post 2 Title', content: 'Post 2 Content')  # Adjust attributes as needed
      post3 = user.posts.create(title: 'Post 3 Title', content: 'Post 3 Content')  # Adjust attributes as needed
      post4 = user.posts.create(title: 'Post 4 Title', content: 'Post 4 Content')  # Adjust attributes as needed

      recent_posts = user.recent_posts

      expect(recent_posts.length).to eq(3)
      expect(recent_posts).to eq([post4, post3, post2])  # Adjust the order based on your expected ordering
    end
  end
end
