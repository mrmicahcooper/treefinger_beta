class Task < ActiveRecord::Base

  attr_accessible :description, :due_at, :name, :task_string
  belongs_to :project
  validates_presence_of :name
  validates_uniqueness_of :name, scope: [:project_id]

  scope :incomplete, where(completed_at: nil)

  scope :complete, where('completed_at IS NOT NULL')

  def complete
    update_attribute(:completed_at, Time.now)
  end

end
