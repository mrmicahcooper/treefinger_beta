class TasksController < ApplicationController

  expose(:project) { current_user.projects.find_by_id(params[:project_id]) }
  expose(:task) { project.tasks.find_by_id(params[:id]) }

  def destroy
    if task.present?
      task.destroy
      render nothing: true, status: 204
    else
      render nothing: true, status: 404
    end
  end

end
