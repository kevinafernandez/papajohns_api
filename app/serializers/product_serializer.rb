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

# == Seriealizer for Product
class ProductSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :sku, :product_type, :price
end
