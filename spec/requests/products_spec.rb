# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe 'GET /products' do
    it 'response should be succesful' do
      get api_v1_products_url
      expect(response).to have_http_status(200)
    end
  end
end
