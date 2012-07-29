class ProjectsController < ApplicationController

  expose(:project_string) { params[:projects] }
  expose(:lists) { Taskdown.parse(project_string) }
  expose(:project) do
    if params[:id]
      current_user.projects.where(id: params[:id]).first
    else
      current_user.projects.last
    end
  end
  expose(:tasks) do
    if project.present?
      case action_name
      when 'complete'
        project.tasks.complete
      when 'incomplete'
        project.tasks.incomplete
      when 'all'
        project.tasks
      else
        project.tasks.incomplete
      end
    else
      []
    end
  end

  def create
    lists.each do |list|
      @current_project = current_user.current_project(list.name, project)
      @current_project.tap do |project|
        list.items.each do |item|
          task = project.tasks.find_or_initialize_by_name_and_project_id(item.name, project.id)
          task.update_attributes(item.attributes)
        end
      end
    end
    redirect_to project_path(@current_project)
  end

  def show
    render 'pages/dashboard'
  end

  def complete
    render 'pages/dashboard'
  end

  def incomplete
    render 'pages/dashboard'
  end

  def all
    render 'pages/dashboard'
  end

end

