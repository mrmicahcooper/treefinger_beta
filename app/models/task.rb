class Task

  attr_accessor :task_string

  def initialize(task_string)
    self.task_string = task_string
  end

  def users
    @users ||= task_string.scan(/^\+.*$/).map do |user| 
      user[/[^+\s*]+/]
    end
  end

  def name
    @name ||= task_string[/^[\w\s]*\./]
  end

  def due_at
    @due_at ||= Time.parse(task_string[/\d.+$/])
  end

  def parents
    @parents ||= task_string.scan(/^@.+/).map do |parent|
      parent.gsub('@', '').strip
    end
  end

  def description
    @descrption ||= task_string.scan(/^[^!@#\+\n]+/)[1..-1].join("\n")
  end

  def tags
    @tags ||= description.scan(/__.*__/).map do |tag|
      tag.gsub("__", "").strip
    end
  end

end
