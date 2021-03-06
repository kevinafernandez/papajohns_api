# frozen_string_literal: true

class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.text :address
      t.string :email, default: 'francisco.abalan@pjchile.com'
      t.string :phone

      t.timestamps
    end
  end
end
