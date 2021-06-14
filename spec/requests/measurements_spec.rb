require 'rails_helper'

RSpec.describe 'Measurements', type: :request do
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
    it 'returns http success' do
      course = create(:course)
      post '/measurements', params: {
        measurement: {
          amount: 5,
          course_id: course.id
        }
      }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE /destroy' do
    it 'returns http success' do
      measurement = create(:measurement)
      delete "/measurements/#{measurement.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
