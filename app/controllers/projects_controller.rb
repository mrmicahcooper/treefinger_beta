class ProjectsController < PagesController
  #pages controller has all the project goodies needed here

  expose(:project_string) { params[:projects] }
  expose(:lists) { Taskdown.parse(project_string) }

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

  def show
    render 'pages/dashboard'
  end

end

