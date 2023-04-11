class Phase < ApplicationRecord
  belongs_to :user
  has_many :measurement

  validates :type, presence: true, inclusion: { in: ['prise de masse', 'perte de poids', 'maintien'] }
end
