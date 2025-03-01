class ProjectsController < ApplicationController
  def index
    @projects = Project.all.order(created_at: :desc)
  end

  def show
    @project = Project.find(params[:id])
    @project_events = @project.project_events.order(created_at: :desc)
    @project_event = @project.project_events.new
  end
end
