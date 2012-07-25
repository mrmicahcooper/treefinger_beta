class Taskdown::Item

  attr_accessor :attributes, :task_string, :name, :description

  def initialize(item_string)
    self.task_string = item_string
    self.name, self.description = item_string.slice!(/^.+\n/).strip, item_string
  end

  def attributes
    {
      name: name,
      task_string: task_string,
      description: description
    }
  end

end
