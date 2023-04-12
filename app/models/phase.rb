class Phase < ApplicationRecord
  belongs_to :user
  has_many :measurements, dependent: :destroy

  validates :phase_type, presence: true, inclusion: { in: ['prise de masse', 'perte de poids', 'stabilisation'] }
end
