class ProjectEventsController < ApplicationController
  before_action :set_project

  def create
    @project_event = @project.project_events.build(project_event_params)
    @project_event.user = current_user

    if @project_event.status_change?
      # Capture the current project status as a string
      @project_event.old_status = @project.status
      # Update the project's status using the new status provided (string)
      @project.update(status: @project_event.new_status)
    end

    if @project_event.save
      redirect_to project_path(@project), notice: "Event created successfully."
    else
      render "projects/show"
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def project_event_params
    params.require(:project_event).permit(:event_type, :content, :new_status)
  end
end
