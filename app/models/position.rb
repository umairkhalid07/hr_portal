class Position < ApplicationRecord
  has_many :candidates, dependent: :destroy
  has_one_attached :logo
  default_scope { order(deadline: :asc) }

  validates :name, :description, :date_starts_at, :date_ends_at, :number_of_positions, presence: true
  validates :number_of_positions, numericality: true
  validates :name, uniqueness: true
end
