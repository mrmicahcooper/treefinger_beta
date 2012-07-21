class ProjectsController < PagesController
  #pages controller has all the project goodies needed here

  expose(:project_string) { params[:projects] }
  expose(:lists) { Taskdown.parse(project_string) }
  expose(:project) do
    if params[:id]
      current_user.projects.where(id: params[:id]).first
    else
      current_user.projects.last
    end
  end

  def create
    lists.each do |list|
      current_user.current_project(list.name, project).tap do |project|
        list.items.each do |item|
          task = project.tasks.find_or_initialize_by_name_and_project_id(item.name, project.id)
          task.update_attributes(item.attributes)
        end
      end
    end
    redirect_to root_path
  end

  def show
    render 'pages/dashboard'
  end

end

