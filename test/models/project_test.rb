require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  def setup
    @project = Project.new(name: "Test Project", status: "open")
  end

  test "should be valid with valid attributes" do
    assert @project.valid?
  end

  test "should require a name" do
    @project.name = ""
    assert_not @project.valid?
  end

  test "should only accept valid statuses" do
    @project.status = "invalid_status"
    assert_not @project.valid?
    @project.status = "open"
    assert @project.valid?
  end

  test "should have a default status of 'open'" do
    project = Project.new(name: "Default Status Project")
    assert_equal "open", project.status
  end
end
