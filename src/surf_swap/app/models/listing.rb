class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :address

  has_one :meetup, dependent: :destroy

  has_many :offers, dependent: :destroy

  has_many :board_listings, dependent: :destroy
  has_many :boards, through: :board_listings


  ################### VALIDATIONS ###########################

  validates :header, presence: {message: "Please provide a title for this listing"}
  
  validates :address, presence: { message: "Please provide an address for a proposed meetup"}
  validates :meetup_date, presence: { message: "Please provide a date for a proposed meetup"}
  validates :meetup_time, presence: { message: "Please provide a time for a proposed meetup"}

  validates :boards, presence: { message: "You must select a board to create a listing"}
  validates :comment, presence: {message: "Please provide a short message about this listing"}

  validate :check_if_past_date

def check_if_past_date
  unless meetup_date.nil?
    if meetup_date < Date.today
      errors.add(:meetup_date, "Cannot set date before today") 
    end
  end
end


end

