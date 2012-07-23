class PagesController < ApplicationController

  expose(:projects) { current_user.projects || [] }
  expose(:project) do
    if params[:id]
      current_user.projects.where(id: params[:id]).first
    else
      current_user.projects.last
    end
  end
  expose(:tasks) do
    project.present? ? project.tasks.incomplete : []
  end

end
