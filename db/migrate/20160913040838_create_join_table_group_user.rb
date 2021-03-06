class CreateJoinTableGroupUser < ActiveRecord::Migration
  def change
    create_table :groups_users, id: false do |t|
      t.string :user_id
      t.string :group_id
    end

    create_table :users do |t|
      t.string :user_id
      t.string :user_name

      t.timestamps
    end

    create_table :groups do |t|
         t.string :group_id
         t.string :group_name

         t.timestamps
     end
  end
end
