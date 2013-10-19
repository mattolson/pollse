class CreateQuestionOptions < ActiveRecord::Migration
  def change
    create_table :question_options do |t|
      t.references :question
      t.string :response_value

      t.timestamps
    end
    add_index :question_options, :question_id
  end
end
