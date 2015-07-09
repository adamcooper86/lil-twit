require_relative 'spec_helper'

describe 'User controller' do
  describe 'GET /users/:id' do
    it 'should render OK status' do
      user = User.create(id: 1, username: 'new_user', password: '12345', email: 'dbag@dbag.net')
      get "/users/#{user.id}"
      expect(last_response.status).to eq(200)
    end
    it 'should display user\'s private page if user is logged in' do
      user = User.find(1)
      p user
      get 'users/10'
      expect(last_response.body).to include("#{user.username}")
    end
    it 'should display user\'s public page if user is not logged in' do
      user = User.find(1)
      get '/users/2'
      expect(last_response.body).to include("Hello World")
    end
  end
end
