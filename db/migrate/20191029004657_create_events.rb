class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :aggregate_id
      t.string :eventType
      t.text :eventData
    end
    
    add_foreign_key :events, :aggregates
  end
end
