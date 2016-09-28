class CreateActuals < ActiveRecord::Migration
  def change
    create_table :actuals do |t|
      t.belongs_to :report
      t.string :actual_task_time_spent
      t.string :actual_task_project
      t.string :actual_task
      t.string :task_no
      t.string :create_date
      t.string :user_id
      t.timestamps
    end
  end
end
