class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.references :user
      t.references :question
      t.datetime :start_at
      t.datetime :end_at
      t.integer :response_limit
      t.boolean :featured
      t.boolean :distribute
      t.boolean :vanity
      t.boolean :reveal_results

      t.timestamps
    end
    add_index :polls, :user_id
    add_index :polls, :question_id
  end
end
