class PagesController < ApplicationController

  layout 'session', only: [:home]

  skip_before_filter :authenticate_user!, only: [:home]

  expose(:user)

  expose(:projects) { current_user.projects || [] }
  expose(:project) do
    if params[:id].present?
      current_user.projects.where(id: params[:id]).first
    else
      current_user.projects.last
    end
  end
  expose(:project_id) { project.present? ? project.id : nil }
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

end
