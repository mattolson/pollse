class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :user
      t.references :poll
      t.text :value

      t.timestamps
    end
    add_index :responses, :user_id
    add_index :responses, :poll_id
  end
end
