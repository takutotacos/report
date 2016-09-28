class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.belongs_to :group
      t.belongs_to :user
      t.string :comment
      t.string :create_date
      t.string :user_id
      t.string :group_id
      t.timestamps
    end
  end
end
