class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :boards, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_many :offers, dependent: :destroy

  has_many :meetups, through: :offers
  has_many :meetups, through: :listings


  ####################### VALIDATION #####################################

  validates :first_name, presence: { message: "Please enter your first name"}

  validate :phone_number_entered

  def phone_number_entered
    unless phone.match(/\d{8,10}/)
      errors.add(:phone, "Please enter a number with 8-10 digits only eg 0400123456") 
    end
  end

end
