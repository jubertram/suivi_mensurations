class Phase < ApplicationRecord
  belongs_to :user
  has_many :measurement
end
