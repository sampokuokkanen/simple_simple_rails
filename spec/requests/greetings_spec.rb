# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Greetings', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('The PV count goes up using')
    end
  end

  describe 'POST /greet' do
    it 'sends a reminder mail and returns' do
      @user = User.create!(first_name: 'MyString', last_name: 'Me', email: 'MyString@mystring.com',
                           password: 'password1')
      sign_in @user
      expect {
        post '/greet'
      }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
