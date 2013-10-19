class AddEnabledToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :enabled, :boolean
  end
end
