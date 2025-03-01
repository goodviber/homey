class Project < ApplicationRecord
  STATUS_OPTIONS = %w[open in_progress completed].freeze
  has_many :project_events, dependent: :destroy

  validates :name, presence: true
  validates :status, inclusion: { in: STATUS_OPTIONS }
end
