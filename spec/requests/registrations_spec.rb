require 'rails_helper'

RSpec.describe 'Registrations', type: :request do
  before do
    post '/registrations', params: {
      user: {
        email: 'testuser@gmail.com',
        password: '123456',
        password_confirmation: '123456'
      }
    }
  end
  describe 'POST /create' do
    it { expect(response).to have_http_status(:success) }
  end

  describe 'DELETE /destroy' do
    it 'expect current_user to be nill' do
      delete '/logout'
      expect(@current_user).to be_nil
    end
  end
end
