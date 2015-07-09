require 'spec_helper'

describe 'sessions controller' do
  context 'GET /sessions/new' do
    before(:each){ get '/sessions/new' }
    it 'should return a 200 ok status' do
      expect(last_response).to be_ok
    end
    it 'should return a form to log in' do
      expect(last_response.body).to include '<form id="new-session" action="/sessions" method="get"'
    end
    it 'the form should include an input for the username' do
      expect(last_response.body).to include '<input name="username"'
    end
    it 'the form should include an input for the username' do
      expect(last_response.body).to include '<input name="password"'
    end
  end
  context 'POST /sessions' do
    it 'should redirect the user to the user timeline' do
      user = User.create(username: testguy, email: 'testguy@testguy.com', password: 'abc123')
      post '/sessions', username: user.username, password: 'abc123'
      expect(last_response.status).to eq 302
      follow_redirect!
      expect(last_request.path).to eq("/users/#{user.id}/timeline")
    end
  end
  context 'GET /sessions/delete' do
    before(:each){ get '/sessions/delete' }
    it 'should return a 200 ok status' do
      expect(last_response).to be_ok
    end
    it 'should return a form to log out user' do
      expect(last_response.body).to include '<form id="delete-session" action="/sessions" method="post"'
    end
    it 'the form should include a hidden input for the delete method' do
      expect(last_response.body).to include '<input type="hidden" name="_method" value="delete"'
    end
    it 'the form should include an input for the username' do
      expect(last_response.body).to include '<input type="submit" value="Yes"'
    end
  end
  context 'DELETE /sessions' do
    it 'should redirect the user to the homepage' do
      delete '/sessions'
      expect(last_response.status).to eq 302
      follow_redirect!
      expect(last_request.path).to eq("/")
    end
  end
end
