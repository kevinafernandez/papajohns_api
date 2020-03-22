# frozen_string_literal: true

class CreateJoinTableStoresProducts < ActiveRecord::Migration[5.2]
  def change
    # Join table for has_and_belongs_to_many association
    create_join_table :stores, :products do |t|
      t.index :store_id
      t.index :product_id
    end
  end
end
