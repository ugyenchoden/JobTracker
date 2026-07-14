class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :company

  validates :position, presence: true
  validates :url, presence: true
  validates :applied_on, presence: true
  validates :status, presence: true, inclusion: { in: %w[applied interviewing offered rejected] }
end
