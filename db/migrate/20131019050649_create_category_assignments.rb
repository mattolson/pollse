class CreateCategoryAssignments < ActiveRecord::Migration
  def change
    create_table :category_assignments do |t|
      t.references :question
      t.references :category

      t.timestamps
    end
    add_index :category_assignments, :question_id
    add_index :category_assignments, :category_id
  end
end
