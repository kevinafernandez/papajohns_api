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
    it { should have_and_belong_to_many(:orders) }
  end

  describe 'validations' do
    let(:valid_attributes) do
      { name: 'THE WORKS',
        sku: 'T-WORKS',
        price: 5500,
        product_type: 'Pizza' }
    end

    let(:invalid_attributes) do
      { name: nil,
        sku: nil,
        price: -1,
        product_type: 'not_a_type' }
    end

    it 'should not be valid with invalid attributes' do
      subject.attributes = invalid_attributes
      expect(subject).to_not be_valid
    end

    it 'should be valid with valid attributes' do
      subject.attributes = valid_attributes
      expect(subject).to be_valid
    end
  end
end
