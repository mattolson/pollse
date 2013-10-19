class RemoveTitleFromQuestions < ActiveRecord::Migration
  def up
    remove_column :questions, :title
  end

  def down
    add_column :questions, :title, :string
  end
end
