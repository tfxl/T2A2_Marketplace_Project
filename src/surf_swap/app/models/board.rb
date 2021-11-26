class Board < ApplicationRecord
  attr_accessor :owner_id_array

  belongs_to :user

  has_many :board_listings, dependent: :destroy
  has_many :listings, through: :board_listings, dependent: :destroy

  has_many :board_offers, dependent: :destroy
  has_many :offers, through: :board_offers, dependent: :destroy

  has_one_attached :board_image
  # this configuration should have a dependent destroy by Rails 6 default


####################### VALIDATION #####################################
validates :board_image, presence: { message: "Please upload a photo of your board"}
  

validates :board_image, attached: true, size: { less_than: 1.megabytes , message: 'Photo/Image needs to be under 5mb size' }
validates :board_image, attached: true, content_type: [:png, :jpg, :jpeg, :webp]


validates :designer, presence: { message: "Please give this listing a heading"}
validates :designer, uniqueness: { message: "If two boards share shaper/designer name, please use nickname for other board"} 

validates :length, presence: { message: "Please give measurements of board. A length is the minimum required."}
validates :condition, presence: { message: "Please provide the condition of your surfboard"}

validates :description, presence: { message: "Please write a short description of your board"}


end
