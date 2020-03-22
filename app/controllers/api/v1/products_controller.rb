# frozen_string_literal: true

module Api
  module V1
    # == ProductsController
    class ProductsController < ApplicationController
      before_action :set_product, only: %i[show update destroy]

      # GET /products
      def index
        @products = Product.all

        render json: serializer.new(@products)
      end

      # GET /products/1
      def show
        render json: serializer.new(@product)
      end

      # POST /products
      def create
        @product = Product.new(product_params)

        if @product.save
          render json: serializer.new(@product), status: :created
        else
          render json: error_message(@product), status: :unprocessable_entity
        end
      end

      # PATCH/PUT /products/1
      def update
        if @product.update(product_params)
          render json: serializer.new(@product)
        else
          render json: error_message(@product), status: :unprocessable_entity
        end
      end

      # DELETE /products/1
      def destroy
        @product.destroy
        head :no_content
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def product_params
        params.require(:product).permit(:name, :sku, :product_type, :price, store_ids: [])
      end

      # Serializer for Product
      def serializer
        ProductSerializer
      end
    end
  end
end
