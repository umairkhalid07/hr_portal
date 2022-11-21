class Position < ApplicationRecord
  has_many :candidates

  validates :name, :description, :deadline, :available, presence: true
  validates :available, numericality: true
  validates :name, uniqueness: true
end
