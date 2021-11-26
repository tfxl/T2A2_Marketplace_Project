class Address < ApplicationRecord
  belongs_to :postcode
  has_many :listings, dependent: :destroy

  has_one_attached :address_image


end
