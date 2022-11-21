class Position < ApplicationRecord
  has_many :candidates
  has_one_attached :logo
  default_scope { order(deadline: :asc) }

  validates :name, :description, :deadline, :available, presence: true
  validates :available, numericality: true
  validates :name, uniqueness: true
end
