class RemoveUserFromQuestion < ActiveRecord::Migration
  def up
    remove_column :questions, :user_id
  end

  def down
    add_column :questions, :user_id, :int
  end
end
