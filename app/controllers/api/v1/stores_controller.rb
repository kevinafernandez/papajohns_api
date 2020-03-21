# frozen_string_literal: true

module Api
  module V1
    # == StoresController
    class StoresController < ApplicationController
      before_action :set_store, only: %i[show update destroy]

      # GET /stores
      def index
        @stores = Store.all
        render json: serializer.new(@stores)
      end

      # GET /stores/1
      def show
        render json: serializer.new(@store)
      end

      # POST /stores
      def create
        @store = Store.new(store_params)

        if @store.save
          render json: serializer.new(@store), status: :created
        else
          render json: error_message(@store), status: :unprocessable_entity
        end
      end

      # PATCH/PUT /stores/1
      def update
        if @store.update(store_params)
          render json: serializer.new(@store)
        else
          render json: error_message(@store), status: :unprocessable_entity
        end
      end

      # DELETE /stores/1
      def destroy
        @store.destroy
        head :no_content
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_store
        @store = Store.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def store_params
        params.require(:store).permit(:name, :address, :email, :phone)
      end

      # JSON Store serializer
      def serializer
        StoreSerializer
      end
    end
  end
end
