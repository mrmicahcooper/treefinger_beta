class ProjectsController < ApplicationController

  expose(:project) { current_user.projects.last }
  expose(:project_string) { params[:projects] }

  expose(:lists) do
    Taskdown.parse(project_string)
  end

  def create

    lists.each do |list|
      current_user.projects.find_or_create_by_name(list.name).tap do |project|
        list.items.each do |item|
          project.tasks << (Task.new(item.attr_hash))
        end
      end
    end

    redirect_to root_path

  end

end

