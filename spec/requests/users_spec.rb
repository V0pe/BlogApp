require 'rails_helper'

RSpec.describe 'Users Controllers', type: :request do
  describe 'Users/user and User' do
    it 'returns 200 success, accurate content html , Template' do
      get '/users/index'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('User picked')
      expect(response).to render_template(:show)
    end
    it "renders 'index' template" do
      get '/users'
      expect(response).to render_template('index')
    end
    it 'renders the User text' do
      get '/users'
      expect(response.body).to include('number of posts')
    end
  end

  describe 'GET /users/:id' do
    it 'returns http success' do
      get '/users/2/'
      expect(response).to have_http_status(:success)
    end
    it 'renders the show template' do
      get '/users/2/'
      expect(response).to render_template('show')
    end
    it 'renders the Post text' do
      get '/users/2/'
      expect(response.body).to include('number of posts')
    end
  end
end
