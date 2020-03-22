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

require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'relationship' do
    it { should have_and_belong_to_many(:products) }
    it { should belong_to(:store) }
  end

  describe 'validations' do
    let(:store) do
      Store.create(name: 'Bandera', address: 'Bandera 208', phone: 912_345_678)
    end

    let(:product) do
      Product.create(name: 'Doble Pepperoni', sku: 'DOB-PEPP',
                     price: 6500, product_type: 'Pizza')
    end

    let(:valid_attributes) do
      { total: 1000,
        store_id: store.id,
        product_ids: product.id }
    end

    let(:invalid_attributes) do
      { store_id: nil,
        total: -1,
        product_ids: [nil] }
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
