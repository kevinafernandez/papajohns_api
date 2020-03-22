# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :controller do
  # set valid && invalid attributes
  let(:valid_attributes) do
    { name: 'SUPER-PEPPERONI',
      sku: 'SUP-PEPP',
      price: 7500,
      product_type: 'Pizza' }
  end

  let(:invalid_attributes) do
    { name: nil,
      sku: nil,
      price: -1,
      product_type: 'not_a_type' }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      product = Product.create! valid_attributes
      get :index, params: { product: product }
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      product = Product.create! valid_attributes
      get :show, params: { id: product.to_param, product: product }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Product' do
        expect do
          post :create, params: { product: valid_attributes }
        end.to change(Product, :count).by(1)
      end

      it 'renders a JSON response with the new product' do
        post :create, params: { product: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new product' do
        post :create, params: { product: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { name: 'POLLO-BBQ', sku: 'POL-BBQ', price: 1250, product_type: 'Pizza' }
      end

      it 'updates the requested product' do
        product = Product.create! valid_attributes
        put :update, params: { id: product.to_param, product: new_attributes }
        product.reload
      end

      it 'renders a JSON response with the product' do
        product = Product.create! valid_attributes

        put :update, params: { id: product.to_param, product: valid_attributes }
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the product' do
        product = Product.create! valid_attributes

        put :update, params: { id: product.to_param, product: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested product' do
      product = Product.create! valid_attributes
      expect do
        delete :destroy, params: { id: product.to_param }
      end.to change(Product, :count).by(-1)
    end
  end
end
