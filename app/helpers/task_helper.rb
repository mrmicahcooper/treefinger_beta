module TaskHelper
  def task_name(task)
    if task.completed?
      "#{task.name} <small> #{right_arrow} #{task.completed_at.strftime('%m/%d/%Y')}  </small>".html_safe
    else
      task.name
    end
  end
end
