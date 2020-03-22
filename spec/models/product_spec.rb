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

require 'rails_helper'

# == Rspec for Product
RSpec.describe Product, type: :model do
  describe 'relationship' do
    it { should have_and_belong_to_many(:stores) }
  end
end
