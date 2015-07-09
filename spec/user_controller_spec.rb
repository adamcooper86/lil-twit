require_relative 'spec_helper'

describe 'User controller' do
  describe 'GET /users/:id' do
    it 'should render OK status' do
      user = User.create(id: 1, username: 'new_user', password: '12345', email: 'dbag@dbag.net')
      get "/users/#{user.id}"
      expect(last_response.status).to eq(200)
    end

    it 'should display user\'s private page' do
      user = User.find(1)
      get 'users/1'
      expect(last_response.body).to include("<h2>Private</h2>")
    end

    it 'should display user\'s public page' do
      second_user = User.create(username: 'fucker', password: '9873', email: 'bullshit@bullshit.net')
      user = User.find(1)
      get "/users/#{second_user.id}"
      expect(last_response.body).to include("<h2>Public</h2>")
    end
  end
end
