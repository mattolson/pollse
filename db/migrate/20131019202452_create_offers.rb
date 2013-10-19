class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.references :transaction_type
      t.string :name
      t.float :price
      t.boolean :display
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
    add_index :offers, :transaction_type_id
  end
end
