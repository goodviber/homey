require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @project1 = Project.create!(name: "Project One", status: "open")
    @project2 = Project.create!(name: "Project Two", status: "in_progress")
  end

  test "should get index" do
    get projects_url
    assert_response :success
    assert_select "h1", "Projects"  # Assuming your index view has an <h1>Projects</h1>
  end

  test "should show project" do
    get project_url(@project1)
    assert_response :success
    assert_select "h1", @project1.name
  end
end
