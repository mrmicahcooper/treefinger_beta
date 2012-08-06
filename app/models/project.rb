class Project < ActiveRecord::Base

  attr_accessible :name, :tasks
  belongs_to :user
  has_many :tasks, dependent: :destroy

  SAMPLE = {
    name: "Sample Project",
    tasks: [
      Task.new(name: "How to create a new project", description: "  When a line starts with a  \"!\"\n  All lines under it will be for that project"),
      Task.new(name: "How to create tasks", description: "  Simply start typing\n  Every (unindented) line is a task"),
      Task.new(name: "How to create task descriptions", description: "  See how these lines are indented?\n  These are the task descriptions \n  Simple right?\n  Yeah. I know."),
      Task.new(name: "Sample item 1"),
      Task.new(name: "Sample item 2"),
      Task.new(name: "Sample item 3")
    ]
  }

end
