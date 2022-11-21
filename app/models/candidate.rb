class Candidate < ApplicationRecord
  belongs_to :position

  validates :name, :email, :phone, :university, :gpa, :bio, presence: true
  validates :phone, :gpa, numericality: true
  validates :email, :phone, uniqueness: true
end
