require 'rails_helper'

RSpec.describe 'Courses', type: :request do
  let!(:course) { create(:course) }
  before do
    post '/registrations', params: {
      user: {
        email: 'testuser@gmail.com',
        password: '123456',
        password_confirmation: '123456'
      }
    }
  end

  describe 'GET /index' do
    it 'returns http success' do
      get "/courses/#{course.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get "/courses/#{course.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
