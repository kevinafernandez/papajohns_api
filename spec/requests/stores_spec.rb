# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Stores', type: :request do
  describe 'GET /stores request' do
    it 'response should be succesful' do
      get api_v1_stores_url
      expect(response).to have_http_status(200)
    end
  end
end
