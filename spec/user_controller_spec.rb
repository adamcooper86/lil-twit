require_relative 'spec_helper'

describe 'User controller' do
  describe 'GET /users/:id' do
    it 'should render OK status' do
      user = User.create(username: 'new_user')
      get "/users/#{user.id}"
      expect(last_response.status).to eq(200)
    end
    it 'should display user\'s private page if user is logged in' do
      user = User.find(1)
      get 'users/1'
      expect(last_response.body).to include("#{user.username}")
    end
    it 'should display user\'s public page if user is not logged in' do
      user = User.find(1)
      get '/users/2'
      expect(last_response.body).to include("Hello World")
    end
  end
end
