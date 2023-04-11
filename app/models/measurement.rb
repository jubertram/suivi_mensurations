class Measurement < ApplicationRecord
  belongs_to :phase

  validates :date, presence: true
end
