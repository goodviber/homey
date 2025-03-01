class ProjectEvent < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :event_type, presence: true, inclusion: { in: %w[comment status_change] }

  validate :comment_requires_content

  def comment_requires_content
    if event_type == 'comment' && content.blank?
      errors.add(:content, "can't be blank for a comment")
    end
  end

  def status_change?
    event_type == 'status_change'
  end

  def comment?
    event_type == 'comment'
  end
end
