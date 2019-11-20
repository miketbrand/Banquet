class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :fromID
      t.integer :toID
      t.integer :banquetID
      t.timestamp
      t.float :amount
    end
  end
end
