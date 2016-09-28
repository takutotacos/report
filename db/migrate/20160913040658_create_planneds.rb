class CreatePlanneds < ActiveRecord::Migration
  def change
    create_table :planneds do |t|
      t.belongs_to :report
      t.string :planned_task_project
      t.string :planned_task
      t.string :task_no
      t.string :create_date
      t.string :user_id
      t.timestamps
    end
  end
end
