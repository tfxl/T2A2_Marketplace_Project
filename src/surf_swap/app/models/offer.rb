class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  has_one :meetup 
  # in this case, I would prefer not to do a dependent: :destroy as there are alternative ways to avoid orphaning record

  has_many :board_offers, dependent: :destroy 
  has_many :boards, through: :board_offers


  ####################### VALIDATION #####################################

  validates :boards, presence: { message: "Please select any surfboards you want to offer to trade"}
  validates :comment, presence: { message: "Please write a short comment to go with your offer"}

end

