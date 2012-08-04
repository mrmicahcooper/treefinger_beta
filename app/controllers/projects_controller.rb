class ProjectsController < PagesController

  expose(:project_string) { params[:projects] }
  expose(:lists) { Taskdown.parse(project_string) }
  expose(:first_project) { current_user.projects.create(name: "First Project") }

  def create
    lists.each do |list|
      @current_project = current_user.current_project(list.name, project)  || first_project
      @current_project.tap do |project|
        list.items.each do |item|
          task = project.tasks.find_or_initialize_by_name_and_project_id(item.name, project.id)
          task.update_attributes(item.attributes)
        end
      end
    end
    redirect_to project_path(@current_project || project)
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

