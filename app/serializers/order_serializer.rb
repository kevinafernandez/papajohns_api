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

# == Seriealizer for Order
class OrderSerializer
  include FastJsonapi::ObjectSerializer

  attributes :total

  has_many :products
  belongs_to :store
end
