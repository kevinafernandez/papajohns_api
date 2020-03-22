# frozen_string_literal: true

# == Schema Information
#
# Table name: stores
#
#  id         :bigint           not null, primary key
#  name       :string
#  address    :text
#  email      :string           default("francisco.abalan@pjchile.com")
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

# == Rspec for Store
RSpec.describe Store, type: :model do
  subject { described_class.new }

  describe 'relationship' do
    it { should have_and_belong_to_many(:products) }
    it { should have_many(:orders) }
  end

  describe 'validations' do
    let(:valid_attributes) do
      {
        name: 'Santa Isabel',
        address: 'San Francisco 242',
        phone: '912345678'
      }
    end

    let(:invalid_attributes) do
      {
        name: nil, address: nil, phone: nil
      }
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
