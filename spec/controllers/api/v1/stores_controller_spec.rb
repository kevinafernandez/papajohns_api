# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::StoresController, type: :controller do
  describe 'GET #index' do
  end

  describe 'POST #create' do
    let(:valid_attributes) do
      {
        name: 'Bandera',
        address: 'Bandera 208',
        phone: '912345678'
      }
    end

    let(:invalid_attributes) do
      {
        name: nil,
        address: nil,
        email: nil,
        phone: 123
      }
    end

    context 'HTTP request' do
      it 'response should be succesful' do
        post :create, params: valid_attributes, as: :json
        expect(response).to have_http_status(:created)
      end
    end

    context 'with valid_attributes' do
      it 'create a new store' do
        expect do
          post :create, params: valid_attributes, as: :json
        end
      end
    end

    describe 'GET #index' do
      it 'returns a success response' do
        store = Store.create! valid_attributes
        get :index, params: { store: store }
        expect(response).to be_successful
      end
    end

    describe 'GET #show' do
      it 'returns a success response' do
        store = Store.create! valid_attributes
        get :show, params: { id: store.to_param, store: store }
        expect(response).to be_successful
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new Store' do
          expect do
            post :create, params: { store: valid_attributes }
          end.to change(Store, :count).by(1)
        end

        it 'renders a JSON response with the new store' do
          post :create, params: { store: valid_attributes }
          expect(response).to have_http_status(:created)
          expect(response.content_type).to eq('application/json')
        end
      end

      context 'with invalid params' do
        it 'renders a JSON response with errors for the new store' do
          post :create, params: { store: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.content_type).to eq('application/json')
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        let(:new_attributes) do
          { name: 'Plaza Brasil', address: 'Compañía 1909', phone: '228637700' }
        end

        it 'updates the requested store' do
          store = Store.create! valid_attributes
          put :update, params: { id: store.to_param, store: new_attributes }
          store.reload
        end

        it 'renders a JSON response with the store' do
          store = Store.create! valid_attributes

          put :update, params: { id: store.to_param, store: valid_attributes }
          expect(response).to have_http_status(:ok)
          expect(response.content_type).to eq('application/json')
        end
      end

      context 'with invalid params' do
        it 'renders a JSON response with errors for the store' do
          store = Store.create! valid_attributes

          put :update, params: { id: store.to_param, store: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.content_type).to eq('application/json')
        end
      end
    end
  end
end
