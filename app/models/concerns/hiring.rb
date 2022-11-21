module Hiring
  extend ActiveSupport::Concern

  VALID_STATUSES = ['applied', 'test', 'interview1', 'interview2', 'interview3', 'hired']
  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end
end