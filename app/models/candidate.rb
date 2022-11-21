class Candidate < ApplicationRecord
  include Hiring

  belongs_to :position

  has_one_attached :picture
  has_one_attached :cv
  has_many_attached :docs

  validates :name, :email, :phone, :university, :gpa, :bio, presence: true
  validates :phone, :gpa, numericality: true
  validates :email, :phone, uniqueness: true
end
