class Position < ApplicationRecord
  has_many :candidates, dependent: :destroy
  has_one_attached :logo
  default_scope { order(deadline: :asc) }

  validates :name, :description, :started_at, :ends_at, :vacancies, presence: true
  validates :vacancies, numericality: true
  validates :name, uniqueness: true
end
