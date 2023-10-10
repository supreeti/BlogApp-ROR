require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    before do
      User.create(name: 'Test User')
      get users_path
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(200)
    end

    it 'renders the user index template' do
      expect(response).to render_template(:index)
    end

    it 'includes the list of users in the response body' do
      expect(response.body).to include('List of Users')
    end
  end

  describe 'GET /users/:id' do
    let(:user) { User.create(name: 'Test User') }

    before do
      get user_path(user)
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'includes the selected user name in the response body' do
      expect(response.body).to include('Selected User')
    end
  end
end
