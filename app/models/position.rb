class Position < ApplicationRecord
  has_many :candidates

  validates :name, :description, :deadline, presence: true
end
