class Meetup < ApplicationRecord
  belongs_to :listing
  belongs_to :offer
end
