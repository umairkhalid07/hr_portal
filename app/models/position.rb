class Position < ApplicationRecord
  has_many :candidates, dependent: :delete_all

  # has_one_attached :logo do |attachable|
  #   attachable.variant :thumb, resize_to_limit: [50, 50]
  # end
  has_one_attached :logo

  validates :name, :description, :deadline, :available, presence: true
  validates :available, numericality: true
  validates :name, uniqueness: true
end
