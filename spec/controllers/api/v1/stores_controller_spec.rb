# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::StoresController, type: :controller do
  describe 'GET #index' do
  end

  describe 'POST #create' do
    let(:store_params) do
      {
        name: 'Bandera',
        address: 'Bandera 208',
        email: 'francisco.abalan@pjchile.com',
        phone: '912345678'
      }
    end

    context 'HTTP request' do
      it 'response should be succesful' do
        post :create, params: store_params, as: :json
        expect(response).to have_http_status(:created)
      end
    end

    context 'with valid_attributes' do
      it 'create a new store' do
        expect do
          post :create, params: store_params, as: :json
        end
      end
    end
  end
end
