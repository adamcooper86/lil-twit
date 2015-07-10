require 'spec_helper'

describe 'tweet controller' do
  context 'GET /tweets' do
    it 'should return a 200 ok status' do
      expect(last_response).to be_ok
    end
  end

  context 'GET /tweets/new' do
    it 'should redirect you to the new tweet form' do
      expect(last_response.status).to eq(302)
    end
  end

  context 'GET /tweets' do
    it 'should return a 200 ok status' do
      expect(last_response).to be_ok
    end
  end

  context 'GET '
end
