require "test_helper"

class ProjectEventTest < ActiveSupport::TestCase
  def setup
    @user = User.create!(name: "Test User", email: "test@example.com")
    @project = Project.create!(name: "Test Project", status: "open")
  end

  test "comment event is valid with content" do
    event = @project.project_events.build(user: @user, event_type: "comment", content: "This is a comment")
    assert event.valid?
  end

  test "comment event is invalid without content" do
    event = @project.project_events.build(user: @user, event_type: "comment", content: "")
    assert_not event.valid?
  end

  test "status change event is valid with new_status" do
    event = @project.project_events.build(
      user: @user,
      event_type: "status_change",
      new_status: "in_progress",
      old_status: @project.status
    )
    assert event.valid?
  end

  test "status change event updates project status" do
    event = @project.project_events.build(
      user: @user,
      event_type: "status_change",
      new_status: "in_progress",
      old_status: @project.status
    )
    event.save!
    @project.reload
    assert_equal "in_progress", @project.status
  end
end
