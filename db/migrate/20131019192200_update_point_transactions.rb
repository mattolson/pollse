class UpdatePointTransactions < ActiveRecord::Migration
  def up
    add_column    :point_transactions, :transaction_type_id, :integer
    remove_column :point_transactions, :transaction_type
  end

  def down
    add_column    :point_transactions, :transaction_type, :string
    remove_column :point_transactions, :transaction_type_id
  end
end
