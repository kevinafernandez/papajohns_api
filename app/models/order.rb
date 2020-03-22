# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  total      :integer
#  store_id   :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# == Order model
class Order < ApplicationRecord
  # Relations
  belongs_to :store
  has_and_belongs_to_many :products

  # Callbacks
  after_save :total_price

  # Methods
  def total_price
    total_price_products = products.sum(:price)

    return if total == total_price_products

    update_column(:total, total_price_products)
  end
end
