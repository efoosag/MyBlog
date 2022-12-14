require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /index' do
    before(:example) { get '/users' }

    it 'Response Status To Be 200' do
      expect(response).to have_http_status(200)
    end

    it 'Response Body To Include Correct placeholder' do
      expect(response.body).to include('Dispaly of All Users')
    end

    it 'Response To include Correct Template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/3' }

    it 'Response Status To Be 200' do
      expect(response).to have_http_status(200)
    end

    it 'Response Body To Include Correct placeholder' do
      expect(response.body).to include('Display Page For A Particular User')
    end

    it 'Response To include Correct Template' do
      expect(response).to render_template(:show)
    end
  end
end
