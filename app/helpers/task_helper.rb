module TaskHelper
  def task_name(task)
    if task.completed?
      " - #{adjusted_task_name(task.name)} <small> #{right_arrow} #{task.completed_at.strftime('%m/%d/%Y')}  </small>".html_safe
    else
      adjusted_task_name(task.name).html_safe
    end
  end

  def adjusted_task_name(name)
    name.length > 48 ? name[0..46] + "...." : name
  end
end
