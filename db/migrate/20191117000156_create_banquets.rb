class CreateBanquets < ActiveRecord::Migration
  def change
    create_table :banquets do |t|
      t.integer :hostID
      t.string :banquet_name
      t.integer :zip_code
      t.datetime :start
      t.datetime :end
      t.float :entryPrice
      t.integer :entryLimit
    end
  end
end