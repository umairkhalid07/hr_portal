class Candidate < ApplicationRecord
  include Hiring

  belongs_to :position
  has_one_attached :picture
  has_one_attached :cv
  has_many_attached :docs
  enum status: %w[applied test interview1 interview2 interview3 hired], _default: :applied

  validates :name, :email, :phone_number, :university, :gpa, :bio, :status, presence: true
  validates :phone_number, :gpa, numericality: true
  validates :email, :phone_number, uniqueness: true
end
