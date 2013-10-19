class CreatePointTransactions < ActiveRecord::Migration
  def change
    create_table :point_transactions do |t|
      t.references :user
      t.integer :points
      t.string :transaction_type

      t.timestamps
    end
    add_index :point_transactions, :user_id
  end
end
