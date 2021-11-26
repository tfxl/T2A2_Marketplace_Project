class Postcode < ApplicationRecord
  has_many :addresses, dependent: :destroy

  validates :number, presence: { message: "Please provide the postcode number (eg 4000)"}
  validates :state, presence: { message: "Please provide the state of this postcode (eg QLD"}
  validates :country, presence: { message: "Please provide country (eg Australia)"}

 
end
