class ProjectsController < ApplicationController

  expose(:project_string) { params[:projects] }
  expose(:taskdown_projects) do
    Taskdown.parse(project_string)
  end

  def create
    taskdown_projects.each do |p|
      current_user.projects.find_or_create_by_name(p.name)
    end
    redirect_to root_path
  end

end
