class PagesController < ApplicationController

  expose(:projects) { current_user.projects || [] }
  expose(:project) { projects.last }
  expose(:tasks) { project.present? ? project.tasks : [] }

  def dashboard
  end

end
