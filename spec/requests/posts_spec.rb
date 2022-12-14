require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET /index' do
    before(:example) { get '/users/3/posts' }

    it 'Response Status To Be 200' do
      expect(response).to have_http_status(200)
    end
    it 'Response To include Correct Template' do
      expect(response).to render_template(:index)
    end

    it 'Response Body To Include Correct placeholder' do
      expect(response.body).to include('Display of All Posts of A Particular')
    end
  end
  describe 'GET /show' do
    before(:example) { get '/users/1/posts/1' }

    it 'Response Status To Be 200' do
      expect(response).to have_http_status(200)
    end
    it 'Response To include Correct Template' do
      expect(response).to render_template(:show)
    end

    it 'Response Body To Include Correct placeholder' do
      expect(response.body).to include('Details of A Specific Post For A Particular User')
    end
  end
end
