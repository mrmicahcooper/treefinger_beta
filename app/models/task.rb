class Task < ActiveRecord::Base

  attr_accessible :description, :due_at, :name, :task_string
  belongs_to :project
  validates_presence_of :name
  validates_uniqueness_of :name, scope: [:project_id]

end
