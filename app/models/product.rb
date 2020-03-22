# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id           :bigint           not null, primary key
#  name         :string
#  sku          :string
#  product_type :string
#  price        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

# == Product model
class Product < ApplicationRecord
  # Relations
  has_and_belongs_to_many :stores

  # Validations
  validates_presence_of :name, :sku, :product_type, :price
  validates :price, numericality: { only_integer: true, greater_than: 0 }
  validates :product_type, inclusion: { in: %w[Pizza Complement],
                                        message: '%<value>s not a valid type' }
end
