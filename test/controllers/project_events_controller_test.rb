require "test_helper"

class ProjectEventsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @project = Project.create!(name: "Project For Events", status: "open")
    @user = User.create!(name: "Event User", email: "eventuser@example.com")
  end

  test "should create a comment event" do
    assert_difference "ProjectEvent.count", 1 do
      post project_project_events_url(@project), params: {
        project_event: {
          event_type: "comment",
          content: "This is a comment"
        }
      }
    end
    assert_redirected_to project_url(@project)
  end

  test "should create a status change event and update project status" do
    assert_difference "ProjectEvent.count", 1 do
      post project_project_events_url(@project), params: {
        project_event: {
          event_type: "status_change",
          new_status: "in_progress"
        }
      }
    end
    @project.reload
    assert_equal "in_progress", @project.status
    assert_redirected_to project_url(@project)
  end
end
