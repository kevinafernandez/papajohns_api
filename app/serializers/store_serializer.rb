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

# == Seriealizer for Store
class StoreSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :address, :email, :phone
end
