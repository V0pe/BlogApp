require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Users' do
    it 'returns 200 success, accurate content html , Template' do
      get '/users/index'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('User picked')
      expect(response).to render_template(:show)
    end

    it 'returns 200 success, accurate html content , Template' do
      get '/users'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Users lists')
      expect(response).to render_template(:index)
    end
  end
end
