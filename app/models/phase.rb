class Phase < ApplicationRecord
  belongs_to :user
  has_many :measurements, dependent: :destroy

  validates :started_date, presence: true

  PHASE_TYPE = ['Prise de masse', 'Perte de poids', 'Stabilisation', 'Prise de mensurations simple']
  PERIOD = [30, 60, 90]
end
