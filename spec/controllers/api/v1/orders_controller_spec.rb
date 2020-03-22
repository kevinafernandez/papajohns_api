# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::OrdersController, type: :controller do
  # set relations && valid && invalid attributes
  let(:store) do
    Store.create(name: 'Bandera', address: 'Bandera 208', phone: 912_345_678)
  end

  let(:product) do
    Product.create(name: 'Doble Pepperoni', sku: 'DOB-PEPP',
                   price: 6500, product_type: 'Pizza')
  end

  let(:valid_attributes) do
    { store_id: store.id,
      product_ids: product.id }
  end

  let(:invalid_attributes) do
    { store_id: nil,
      total: -1 }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      order = Order.create! valid_attributes
      get :index, params: { order: order }
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      order = Order.create! valid_attributes
      get :show, params: { id: order.to_param, order: order }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Order' do
        expect do
          post :create, params: { order: valid_attributes }
        end.to change(Order, :count).by(1)
      end

      it 'renders a JSON response with the new order' do
        post :create, params: { order: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new order' do
        post :create, params: { order: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { total: 15_000 }
      end

      it 'updates the requested order' do
        order = Order.create! valid_attributes
        put :update, params: { id: order.to_param, order: new_attributes }
        order.reload
      end

      it 'renders a JSON response with the order' do
        order = Order.create! valid_attributes

        put :update, params: { id: order.to_param, order: valid_attributes }
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the order' do
        order = Order.create! valid_attributes

        put :update, params: { id: order.to_param, order: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested order' do
      order = Order.create! valid_attributes
      expect do
        delete :destroy, params: { id: order.to_param }
      end.to change(Order, :count).by(-1)
    end
  end
end
