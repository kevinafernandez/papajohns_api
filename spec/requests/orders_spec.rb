# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  describe 'GET /orders' do
    it 'response should be succesful' do
      get api_v1_orders_url
      expect(response).to have_http_status(200)
    end
  end
end
