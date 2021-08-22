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
end
