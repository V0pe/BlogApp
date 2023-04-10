require 'rails_helper'

RSpec.describe 'Posts Controller', type: :request do
  describe 'Posts' do
    it 'returns http success, html content Body ,  Template' do
      get '/users/id/posts'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Posts')
      expect(response).to render_template(:index)
    end

    it 'returns http success, html Body ,  Template' do
      get '/users/id/posts/id'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Post')
      expect(response).to render_template(:show)
    end
  end
end
