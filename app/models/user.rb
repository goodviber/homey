class User < ApplicationRecord
  has_many :project_events, dependent: :destroy
   # Optional: if you want to easily retrieve all projects a user has contributed to.
   has_many :projects, through: :project_events
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }
end
