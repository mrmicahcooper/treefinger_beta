class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_string
      t.string :name
      t.date :due_at
      t.date :completed_at
      t.string :description

      t.references :project

      t.timestamps
    end
  end
end
