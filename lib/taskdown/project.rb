class Taskdown::Project

  attr_accessor :name, :task_string

  def initialize(string)
    self.name, self.task_string = string.split("\n",2)
  end

  def tasks
    task_string.split(/^\n*-{3,}\n*|\n*i{3,}\n*/).select { |n| n.length > 0 }.map do |task|
      Task.new(task)
    end
  end

end
