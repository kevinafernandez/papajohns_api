# frozen_string_literal: true

class CreateJoinTableOrdersProducts < ActiveRecord::Migration[5.2]
  def change
    # Join table for has_and_belongs_to_many association
    create_join_table :orders, :products do |t|
      t.index :order_id
      t.index :product_id
    end
  end
end
