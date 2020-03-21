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

# == Store model
class Store < ApplicationRecord
  # Validations
  validates_presence_of :name, :address, :phone
  validates :phone, length: { is: 9,
                              wrong_length: 'Must have 9 digits,ej: 912345678' }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
