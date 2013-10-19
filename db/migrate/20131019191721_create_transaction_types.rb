class CreateTransactionTypes < ActiveRecord::Migration
  def change
    create_table :transaction_types do |t|
      t.string :name
      t.integer :points
      t.boolean :repeatable

      t.timestamps
    end
  end
end
