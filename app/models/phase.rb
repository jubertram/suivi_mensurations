class Phase < ApplicationRecord
  belongs_to :user
  has_many :measurements, dependent: :destroy

  # validates :phase_type, presence: true

  PHASE_TYPE = ['Prise de masse', 'Perte de poids', 'Stabilisation']
  PERIOD = [30, 60, 90, 120]
end
